(* --------------------------------------------------------------------------
 * Struct - record modules stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Struct types *)
	
datatype struct_type =
  ValueRecord
| Record of {dup : string, free : string}
| DisguisedRecord

val structTypes : ((string * string) * struct_type) list ref = ref []

fun getStructType structFullName =
  case List.find (fn (x, _) => x = structFullName) (!structTypes) of
    SOME (_, y) => y 
  | NONE        => infoError "configuration does not specify type for struct"


(* Record signature *)

local
in
  fun makeStructRecordSig
    (_               : 'a RepositoryClass.class)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
    : id * program * id list =
    let
      val () = checkDeprecated structInfo
      val () = checkNonClassStruct structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structType = getStructType (structNamespace, structName)

      val tTy = mkIdTy tId

      val specs'0 = []
      val specs'1 =
        addAccessorSpecs
          structNamespace
          structInfo
          (tTy, tTy)
          true
          specs'0

      val recordSigId =
        toUCU (
          case structType of
            ValueRecord => valueStrId ^ recordStrId
          | _           => recordStrId
        )
      val recordInclSpec = SpecIncl (SigName recordSigId, [])
      val specs'2 = recordInclSpec :: specs'1

      val sig1 = mkSigSpec specs'2
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(structRecordSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigDeps = []
    in
      (structRecordSigId, Portable program, sigDeps)
    end
end


(* Record structure *)

local
  (*
   *     structure Pointer = CPointerInternal
   *     type notnull = Pointer.notnull
   *     type 'a p = 'a Pointer.p
   *)
  fun addPointerStrDecs strDecs =
    mkStructStrDec (pointerStrId, mkNameStruct ["CPointerInternal"])
     :: StrDecDec (mkTypeDec (notnullTyName, mkNotnullTy [pointerStrId]))
     :: StrDecDec (mkTypeDec (ptrTyName aTyVar, mkPtrTy [pointerStrId] aVarTy))
     :: strDecs

  fun mkSymbolId structNamespace structName =
    let
      val prefix =
        String.concatWith "_" [
          giraffeId,
          toLCU structNamespace,
          toLCU structName
        ]
    in
      fn name => prefix ^ "_" ^ name
    end

  fun addStrDecsLowLevelMLton
    structNamespace
    structName
    structType
    strDecs
  =
    let
      val cPtrTy = makeLowLevelTy false [] (PTR {optDir = NONE, isOpt = false})
      val guintTy = makeLowLevelTy false ["GUInt", ffiStrId] VAL

      (* `callStrDecLowLevelMLton (name, symbol, parTys, retTy)` constructs
       * a MLton low-level function call expression as follows:
       *
       *     val <name>_ =
       *       fn x1 & ... & x<N> =>
       *         (_import "<symbol>" : <parTys[1]> * ... * <parTys[N]> -> <retTy>;)
       *         (x1, ..., x<N>)
       *
       *       if N > 1
       *
       *     val <name>_ =
       *       _import "<symbol>" : <parTys[1]> -> <retTy>;
       *
       *       if N = 1
       *
       *     val <name>_ =
       *       _import "<symbol>" : unit -> <retTy>;
       *
       *       if N = 0
       *
       *   where
       *
       *     N = length parTys
       *)
      fun callStrDecLowLevelMLton (name, symbol, parTys, retTy) =
        StrDecDec (
          mkIdValDec (name ^ "_", callMLtonFFIExp symbol (parTys, retTy))
        )

      val strDecs' =
        case  structType of
          ValueRecord =>
            (*
             *     val new_ =
             *       _import "giraffe_<struct_namespace>_<struct_name>_new"
             *         : unit -> notnull p;
             *
             *     val copy_ =
             *       fn x1 & x2 =>
             *         (_import "giraffe_<struct_namespace>_<struct_name>_copy"
             *            : notnull p * notnull p -> unit;)
             *         (x1, x2)
             *
             *     val free_ =
             *       _import "giraffe_<struct_namespace>_<struct_name>_free"
             *         : notnull p -> unit;
             *
             *     val size_ =
             *       _import "giraffe_<struct_namespace>_<struct_name>_size"
             *         : unit -> GUInt.FFI.val_;
             *)
            let
              fun call (name, parConvs, retConv) =
                callStrDecLowLevelMLton
                  (
                    name,
                    mkSymbolId structNamespace structName name,
                    parConvs,
                    retConv
                  )
            in
              call (newId,  [], cPtrTy) ::
              call (copyId, [cPtrTy, cPtrTy], unitTy) ::
              call (freeId, [cPtrTy], unitTy) ::
              call (sizeId, [], guintTy) ::
              strDecs
            end
        | Record {dup, free} =>
            (* 
             *     val dup_ = _import "<dup>" : notnull p -> notnull p;
             * 
             *     val free_ = _import "<free>" : notnull p -> unit;
             *)
            callStrDecLowLevelMLton (dupId,  dup,  [cPtrTy], cPtrTy) ::
            callStrDecLowLevelMLton (freeId, free, [cPtrTy], unitTy) ::
            strDecs
        | DisguisedRecord =>
            raise Fail "disguised record has no low-level FFI"
    in
      strDecs'
    end

  fun addStrDecsLowLevelPolyML
    structNamespace
    structName
    structType
    strDecs
  =
    let
      val cPtrLowLevelSpec = PTR {optDir = NONE, isOpt = false}

      (*
       *     val cPtr = Pointer.PolyML.cVal
       *)
      val cPtrStrDec =
        StrDecDec (
          mkIdValDec (
            makeConvId cPtrLowLevelSpec,
            makeConv [pointerStrId, polyMLStrId] VAL
          )
        )

      val cPtrConv = makeConv [] cPtrLowLevelSpec
      val guintConv = makeConv ["GUInt", polyMLStrId] VAL

      (* `callStrDecLowLevelPolyML (name, symbol, parConvs, retConv)`
       * constructs a Poly/ML low-level function call expression as follows:
       *
       *     val <name>_ =
       *       call
       *         (getSymbol "<symbol>")
       *         (<parConvs[1]> &&> ... &&> <parConvs[N]> --> <retConv>)
       *
       *       if N > 0
       *
       *     val <name>_ =
       *       call
       *         (getSymbol "<symbol>")
       *         (cVoidConv --> <retConv>)
       *
       *       if N = 0
       *
       *   where
       *
       *     N = length parConvs
       *)
      fun callStrDecLowLevelPolyML (name, symbol, parConvs, retConv) =
        let
          val parConv =
            case rev parConvs of
              []      => cVoidConv
            | c :: cs => foldl mkAARExp c cs
        in
          StrDecDec (
            mkIdValDec (name ^ "_", callPolyMLFFIExp symbol (parConv, retConv))
          )
        end

      val localStrDecs =
        case  structType of
          ValueRecord =>
            (*
             *     val new_ =
             *       call
             *         (getSymbol "giraffe_<struct_namespace>_<struct_name>_new")
             *         (cVoid --> cPtr)
             *
             *     val copy_ =
             *       call
             *         (getSymbol "giraffe_<struct_namespace>_<struct_name>_copy")
             *         (cPtr &&> cPtr --> cVoid)
             *
             *     val free_ =
             *       call
             *         (getSymbol "giraffe_<struct_namespace>_<struct_name>_free")
             *         (cPtr --> cVoid)
             *
             *     val size_ =
             *       call
             *         (getSymbol "giraffe_<struct_namespace>_<struct_name>_size")
             *         (cVoid --> GUInt.PolyML.cVal)
             *)
            let
              fun call (name, parConvs, retConv) =
                callStrDecLowLevelPolyML
                  (
                    name,
                    mkSymbolId structNamespace structName name,
                    parConvs,
                    retConv
                  )
            in
              [
                call (newId,  [], cPtrConv),
                call (copyId, [cPtrConv, cPtrConv], cVoidConv),
                call (freeId, [cPtrConv], cVoidConv),
                call (sizeId, [], guintConv)
              ]
            end
        | Record {dup, free} =>
            (*
             *     val dup_ =
             *       call
             *         (getSymbol "<dup>")
             *         (cPtr --> cPtr)
             *
             *     val free_ =
             *       call
             *         (getSymbol "<free>")
             *         (cPtr --> cVoid)
             *)
            [
              callStrDecLowLevelPolyML (dupId,  dup,  [cPtrConv], cPtrConv),
              callStrDecLowLevelPolyML (freeId, free, [cPtrConv], cVoidConv)
            ]
        | DisguisedRecord =>
            raise Fail "disguised record has no low-level FFI"
    in
      cPtrStrDec :: mkPolyMLFFILocalStrDec localStrDecs :: strDecs
    end

  fun addStrDecsLowLevel isPolyML =
    if isPolyML
    then addStrDecsLowLevelPolyML
    else addStrDecsLowLevelMLton

  (*
   *     structure Record =
   *       BoxedValueRecord(
   *         structure Pointer = Pointer
   *         type notnull = notnull
   *         type 'a p = 'a p
   *         val new_ = new_
   *         val copy_ = copy_
   *         val take_ = ignore
   *         val clear_ = ignore
   *         val free_ = free_
   *         val size_ = size_
   *       )
   *)
  val structValueRecordStrDec =
    mkStructStrDec (
      recordStrId,
      StructInst (
        "BoxedValueRecord",
        mkStrDecsFunArg [
          mkStructStrDec (pointerStrId, mkNameStruct [pointerStrId]),
          StrDecDec (mkTypeDec (notnullTyName, notnullTy)),
          StrDecDec (mkTypeDec (ptrTyName aTyVar, ptrTy aVarTy)),
          StrDecDec (mkIdValDec (newUId, mkIdLNameExp newUId)),
          StrDecDec (mkIdValDec (copyUId, mkIdLNameExp copyUId)),
          StrDecDec (mkIdValDec (takeUId, mkIdLNameExp ignoreId)),
          StrDecDec (mkIdValDec (clearUId, mkIdLNameExp ignoreId)),
          StrDecDec (mkIdValDec (freeUId, mkIdLNameExp freeUId)),
          StrDecDec (mkIdValDec (sizeUId, mkIdLNameExp sizeUId))
        ]
      )
    )

  (*
   *     structure Record =
   *       BoxedRecord(
   *         structure Pointer = Pointer
   *         type notnull = notnull
   *         type 'a p = 'a p
   *         val dup_ = dup_
   *         val take_ = ignore
   *         val free_ = free_
   *       )
   *)
  val structRecordStrDec =
    mkStructStrDec (
      recordStrId,
      StructInst (
        "BoxedRecord",
        mkStrDecsFunArg [
          mkStructStrDec (pointerStrId, mkNameStruct [pointerStrId]),
          StrDecDec (mkTypeDec (notnullTyName, notnullTy)),
          StrDecDec (mkTypeDec (ptrTyName aTyVar, ptrTy aVarTy)),
          StrDecDec (mkIdValDec (dupUId, mkIdLNameExp dupUId)),
          StrDecDec (mkIdValDec (takeUId, mkIdLNameExp ignoreId)),
          StrDecDec (mkIdValDec (freeUId, mkIdLNameExp freeUId))
        ]
      )
    )

  (*
   *     structure Record =
   *       PointerRecord(
   *         val name = "<StructNamespace>.<StructName>"
   *       )
   *)
  fun structDisguisedRecordStrDec (structNamespaceStrId, structNameStrId) =
    let
      val s = String.concat [structNamespaceStrId, ".", structNameStrId]
    in
      mkStructStrDec (
        recordStrId,
        StructInst (
          "PointerRecord",
          mkStrDecsFunArg [
            StrDecDec (mkIdValDec ("name", ExpConst (ConstString s))
            )
          ]
        )
      )
    end    

  (*
   *     open Record
   *)
  val openRecordStrDec =
    StrDecDec (DecOpen (toList1 [toList1 [recordStrId]]))
in
  fun makeStructRecordStr
    (_               : 'a RepositoryClass.class)
    (_               : Repository.typelibvers_t)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated structInfo
      val () = checkNonClassStruct structInfo

      val structName = getName structInfo

      val structRecordStrId = mkRecordStrId structNamespace structName
      val structRecordSigId = toUCU structRecordStrId

      val structRecordStrNameId = mkRecordStrNameId structName

      val structType = getStructType (structNamespace, structName)

      (* module *)
      val strDecs'0 = []
      val (addAccessorStrDecs, revAccessorLocalTypes) =
        addAccessorRootStrDecs structNamespace structInfo

(*
      val strDecs'1 = structTypeStrDec :: openTypeStrDec :: strDecs'0
*)

      fun mkModule isPolyML =
        let
          val strDecs'1 = addAccessorStrDecs ("boxed", true) isPolyML strDecs'0
          val strDecs'2 = (
            case structType of
              ValueRecord     => structValueRecordStrDec
            | Record _        => structRecordStrDec
            | DisguisedRecord =>
                structDisguisedRecordStrDec (structNamespace, structName)
          ) :: openRecordStrDec :: strDecs'1

          val strDecs'3 =
            case structType of
              DisguisedRecord => strDecs'2
            | _               =>
                addPointerStrDecs
                  (addStrDecsLowLevel isPolyML
                    structNamespace structName structType strDecs'2)

          val struct1 = mkBodyStruct strDecs'3

          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 = revMap makeLocalTypeStrModuleQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)

          (* strdec *)
          val structDec = toList1 [(structRecordStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          [ModuleDecStr strDec]
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val structRecordSpec =
        let
          (* sig *)
          val sig1 = SigName structRecordSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(structRecordStrNameId, qSig)])
        end
      val structRecordSpecs = [structRecordSpec]

      (* namespace strdec *)
      val structRecordStrDec =
        StrDecStruct (
          toList1 [
            (
              structRecordStrNameId,
              NONE,
              StructName (toList1 [structRecordStrId])
            )
          ]
        )
      val structRecordStrDecs = [structRecordStrDec]
    in
      (
        structRecordStrId,
        (structRecordSpecs, structRecordStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end
end


(* Struct signature *)

fun addStructMethodSpecs repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionSpec repo (SOME structIRef))

fun makeStructSig
  (repo            : 'a RepositoryClass.class)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (errs'0          : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addStructMethodSpecs repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionSpec typeIRef acc'1
      | NONE   => acc'1
    val (specs'2, iRefs'2, errs'2) = acc'2

    val sigIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t
     *
     *     type <varlist[1]> <local_name[1]>
     *
     *     ...
     *
     *     type <varlist[N]> <local_name[N]>
     *)
    val specs'3 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'2)

    val sig1 = mkSigSpec specs'3
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(structSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (structSigId, Portable program, sigDeps, errs'2)
  end


(* Struct structure *)

fun addStructMethodStrDecsLowLevel
  isPolyML
  repo
  addInitStrDecs
  structIRef =
  addFunctionStrDecsLowLevel
    (StructInfo.getNMethods, StructInfo.getMethod)
    isPolyML
    repo
    addInitStrDecs
    (SOME (structIRef, structIRef))

fun addStructMethodStrDecsHighLevel repo structIRef =
  revFoldMapInfosWithErrs
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (structIRef, structIRef)))

fun makeStructStr
  (repo            : 'a RepositoryClass.class)
  (_               : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structStrNameId = mkStrNameId structName

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionStrDecLowLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionStrDecLowLevel getTypeSymbol
      | NONE               => K I

    (* module *)
    val acc'0
      : strdec list
         * (interfaceref list * struct1 ListDict.t)
         * infoerrorhier list =
      ([], ([], ListDict.empty), errs'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel repo structIRef (structInfo, acc'0)
    val acc'2 =
      case optGetTypeSymbol of
        SOME _ => addGetTypeFunctionStrDecHighLevel typeIRef acc'1
      | NONE   => acc'1
    val (strDecs'2, (iRefs'2, structDeps'2), errs'2) = acc'2

    val strIRefs =
      structIRef :: iRefs'2  (* `structIRef` for record structure dependence *)

    (*
     *     type t = <StructNamespace><StructName>Record.t
     * 
     *     type <varlist[1]> <local_name[1]> =
     *       <varlist[1]> <StructNamespace><TypeName[1]>.<t[1]>
     * 
     *     ...
     * 
     *     type <varlist[N]> <local_name[N]> =
     *       <varlist[N]> <StructNamespace><TypeName[N]>.<t[N]>
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'3 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'2)

    fun mkModule isPolyML =
      let
        val (strDecs'4, _) =
          addStructMethodStrDecsLowLevel
            isPolyML
            repo
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            (structInfo, (strDecs'3, errs'2))

        val strDecs'5 =
          revMapAppend mkStructStrDec (ListDict.toList structDeps'2, strDecs'4)

        val struct1 = mkBodyStruct strDecs'5

        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrModuleQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)

        (* strdec *)
        val structDec = toList1 [(structStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val structSpec =
      let
        (* sig *)
        val sig1 = SigName structSigId
        val sigQual = revMap makeLocalTypeStrSpecQual revLocalTypes
        val qSig : qsig = (sig1, sigQual)
      in
        (* spec *)
        SpecStruct (toList1 [(structStrNameId, qSig)])
      end

    (* namespace strdec *)
    val structStrDec =
      StrDecStruct (
        toList1 [
          (structStrNameId, NONE, StructName (toList1 [structStrId]))
        ]
      )
  in
    (
      structStrId,
      ([structSpec], [structStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'2
    )
  end
