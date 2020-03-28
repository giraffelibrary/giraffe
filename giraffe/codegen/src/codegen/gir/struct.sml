(* --------------------------------------------------------------------------
 * Struct
 * -------------------------------------------------------------------------- *)

(* Record signature *)

local
in
  fun makeStructRecordSig
    (_               : 'a RepositoryClass.class)
    (structNamespace : string)
    (structInfo      : 'b StructInfoClass.class)
    : id * program * interfaceref list * interfaceref list =
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
            ValueRecord _ => valueStrId ^ recordStrId
          | _             => recordStrId
        )
      val recordInclSpec = SpecIncl (SigName recordSigId, [])
      val specs'2 = recordInclSpec :: specs'1

      val sig1 = mkSigSpec specs'2
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(structRecordSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigIRefs = []
      val extIRefs = []
    in
      (mkSigFile structRecordSigId, Portable program, sigIRefs, extIRefs)
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

  val cPtrTy = makeLowLevelTy false [] (PTR {optDir = NONE, isOpt = false})
  val gsizeTy = makeLowLevelTy false ["GSize", ffiStrId] VAL

  (* `callStrDecLowLevelMLton (name, symbol, parTys, retTy)` constructs
   * a MLton low-level function call expression as follows:
   *
   *     val <name> =
   *       fn x1 & ... & x<N> =>
   *         (_import "<symbol>" : <parTys[1]> * ... * <parTys[N]> -> <retTy>;)
   *         (x1, ..., x<N>)
   *
   *       if N > 1
   *
   *     val <name> =
   *       _import "<symbol>" : <parTys[1]> -> <retTy>;
   *
   *       if N = 1
   *
   *     val <name> =
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
      mkIdValDec (name, callMLtonFFIExp symbol (parTys, retTy))
    )

  (*
   *     val memcpy_ =
   *       fn x1 & x2 & x3 =>
   *         (_import "memcpy"
   *           : notnull p * notnull p * GSize.FFI.val_ -> unit;)
   *         (x1, x2, x3)
   *)
  val memcpyStrDecMLton =
    callStrDecLowLevelMLton (memcpyUId, memcpyId, [cPtrTy, cPtrTy, gsizeTy], unitTy)

  (*
   *     val copy_ =
   *       fn src & dest =>
   *         memcpy_ (dest & src & size_ ())
   *)
  val defaultCopyStrDec =
    let
      val srcId = "src"
      val destId = "dest"
      val pat = mkAPat (mkIdVarPat srcId, mkIdVarPat destId)
      val sizeExp = ExpApp (mkIdLNameExp sizeUId, ExpConst ConstUnit)
      val exp =
        ExpApp (
          mkIdLNameExp memcpyUId,
          mkParenExp (
            foldl mkAExp sizeExp (map mkIdLNameExp [srcId, destId])
          )
        )
    in
      StrDecDec (mkIdValDec (copyUId, ExpFn (toList1 [(pat, exp)])))
    end

  (*
   *     val clear_ = Fn.ignore
   *)
  val defaultClearStrDec =
    StrDecDec (mkIdValDec (clearUId, mkLIdLNameExp [fnStrId, ignoreId]))

  fun addStrDecsLowLevelMLton
    _
    structNamespace
    structName
    structType
    strDecs
  =
    let
      val strDecs' =
        case structType of
          ValueRecord funcs =>
            let
              val sizeSymbolId = mkSymbolId structNamespace structName sizeId
            in
              (*
               *     val size_ =
               *       _import "giraffe_<struct_namespace>_<struct_name>_size"
               *         : unit -> GSize.FFI.val_;
               *)
              callStrDecLowLevelMLton (sizeUId, sizeSymbolId, [], gsizeTy) :: (
                case funcs of
                  SOME {copy, clear} =>
                    (*
                     *     val copy_ =
                     *       fn x1 & x2 =>
                     *         (_import "<copy>" : notnull p * notnull p -> unit;)
                     *         (x1, x2)
                     *
                     *     val clear_ =
                     *       _import "<clear>" : notnull p -> unit;
                     *) 
                    callStrDecLowLevelMLton (copyUId,  copy,  [cPtrTy, cPtrTy], unitTy) ::
                    callStrDecLowLevelMLton (clearUId, clear, [cPtrTy],         unitTy) ::
                    strDecs
                | NONE               =>
                    (*
                     *     val memcpy_ =
                     *       fn x1 & x2 & x3 =>
                     *         (_import "memcpy"
                     *           : notnull p * notnull p * GSize.FFI.val_ -> unit;)
                     *         (x1, x2, x3)
                     *
                     *     val copy_ =
                     *       fn src & dest =>
                     *         memcpy_ (dest & src & size_ ())
                     *
                     *     val clear_ = Fn.ignore
                     *) 
                    memcpyStrDecMLton ::
                    defaultCopyStrDec ::
                    defaultClearStrDec ::
                    strDecs
              )
            end
        | Record {dup, free} =>
            (* 
             *     val dup_ = _import "<dup>" : notnull p -> notnull p;
             * 
             *     val free_ = _import "<free>" : notnull p -> unit;
             *)
            callStrDecLowLevelMLton (dupUId,  dup,  [cPtrTy], cPtrTy) ::
            callStrDecLowLevelMLton (freeUId, free, [cPtrTy], unitTy) ::
            strDecs
        | DisguisedRecord =>
            raise Fail "disguised record has no low-level FFI"
    in
      strDecs'
    end

  (* `callStrDecLowLevelPolyML (name, symbol, parConvs, retConv)`
   * constructs a Poly/ML low-level function call expression as follows:
   *
   *     val <name> =
   *       call
   *         (getSymbol "<symbol>")
   *         (<parConvs[1]> &&> ... &&> <parConvs[N]> --> <retConv>)
   *
   *       if N > 0
   *
   *     val <name> =
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
        mkIdValDec (name, callPolyMLFFIExp symbol (parConv, retConv))
      )
    end

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
  val gsizeConv = makeConv ["GSize", polyMLStrId] VAL

  (*
   *     val memcpy_ =
   *       call
   *         (getSymbol "memcpy")
   *         (cPtr &&> cPtr &&> GSize.FFI.cVal --> cVoid)
   *)
  val memcpyStrDecPolyML =
    callStrDecLowLevelPolyML (memcpyUId, memcpyId, [cPtrConv, cPtrConv, gsizeConv], cVoidConv)

  fun addStrDecsLowLevelPolyML
    _
    structNamespace
    structName
    structType
    strDecs
  =
    let
      val localStrDecs =
        case structType of
          ValueRecord funcs =>
            let
              val sizeSymbolId = mkSymbolId structNamespace structName sizeId
            in
              (*
               *     val size_ =
               *       call
               *         (getSymbol "giraffe_<struct_namespace>_<struct_name>_size")
               *         (cVoid --> GSize.PolyML.cVal)
               *)
              callStrDecLowLevelPolyML (sizeUId, sizeSymbolId, [], gsizeConv) :: (
                case funcs of
                  SOME {copy, clear} =>
                    (*
                     *     val copy_ =
                     *       call
                     *         (getSymbol "<copy>")
                     *         (cPtr &&> cPtr --> cVoid)
                     *
                     *     val clear_ =
                     *       call
                     *         (getSymbol "<clear>")
                     *         (cPtr --> cVoid)
                     *) 
                    callStrDecLowLevelPolyML (copyUId,  copy,  [cPtrConv, cPtrConv], cVoidConv) ::
                    callStrDecLowLevelPolyML (clearUId, clear, [cPtrConv],           cVoidConv) ::
                    []
                | NONE               =>
                    (*
                     *     val memcpy_ =
                     *       call
                     *         (getSymbol "memcpy")
                     *         (cPtr &&> cPtr &&> GSize.FFI.cVal --> cVoid)
                     *
                     *     val copy_ =
                     *       fn src & dest =>
                     *         memcpy_ (dest & src & size_ ())
                     *
                     *     val clear_ = Fn.ignore
                     *) 
                    memcpyStrDecPolyML ::
                    defaultCopyStrDec ::
                    defaultClearStrDec ::
                    []
              )
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
              callStrDecLowLevelPolyML (dupUId,  dup,  [cPtrConv], cPtrConv),
              callStrDecLowLevelPolyML (freeUId, free, [cPtrConv], cVoidConv)
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
   *         val copy_ = copy_
   *         val clear_ = clear_
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
          StrDecDec (mkIdValDec (copyUId, mkIdLNameExp copyUId)),
          StrDecDec (mkIdValDec (clearUId, mkIdLNameExp clearUId)),
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
      val iRefs'0 = []

      val getValueType =
        fn
          ("GLib", "Variant") => "variant"
        | _                   => "boxed"

      val (addAccessorStrDecs, addAccessorIRefs, revAccessorLocalTypes) =
        addAccessorRootStrDecs (structNamespace, structName) getValueType structInfo

      val iRefs'1 = addAccessorIRefs iRefs'0

(*
      val strDecs'1 = structTypeStrDec :: openTypeStrDec :: strDecs'0
*)

      fun mkModule isPolyML =
        let
          val strDecs'1 = addAccessorStrDecs true isPolyML strDecs'0
          val strDecs'2 = (
            case structType of
              ValueRecord _   => structValueRecordStrDec
            | Record _        => structRecordStrDec
            | DisguisedRecord =>
                structDisguisedRecordStrDec (structNamespace, structName)
          ) :: openRecordStrDec :: strDecs'1

          val strDecs'3 =
            case structType of
              DisguisedRecord => strDecs'2
            | _               =>
                addPointerStrDecs (
                  addStrDecsLowLevel isPolyML
                    structInfo
                    structNamespace
                    structName
                    structType
                    strDecs'2
                )

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
        mkStrFile structRecordStrId,
        (structRecordSpecs, structRecordStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'1
      )
    end
end


(* Struct signature *)

fun addStructMethodSpecs repo vers structIRef =
  revFoldMapInfosWithExcls
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionSpec repo vers (SOME structIRef))

fun makeStructSig
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (excls'0         : info_excl_hier list)
  : id * program * interfaceref list * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD,
      container = NONE
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionSpec =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionSpec getTypeSymbol
      | NONE               => K I

    val acc'0
      : spec list
         * (interfaceref list * interfaceref list)
         * info_excl_hier list =
      ([], ([], []), excls'0)
    val acc'1 = addStructMethodSpecs repo vers structIRef (structInfo, acc'0)
    val acc'2 = addStructGetTypeFunctionSpec typeIRef acc'1
    val (specs'2, (sigIRefs'2, extIRefs'2), excls'2) = acc'2

    val sigIRefs =
      structIRef :: sigIRefs'2  (* `structIRef` for record structure dependence *)

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
    val sigIRefs = []
  in
    (mkSigFile structSigId, Portable program, sigIRefs, extIRefs'2, excls'2)
  end


(* Struct structure *)

fun addStructMethodStrDecsLowLevel
  isPolyML
  repo
  vers
  addInitStrDecs
  structIRef =
  addFunctionStrDecsLowLevel
    (StructInfo.getNMethods, StructInfo.getMethod)
    isPolyML
    repo
    vers
    addInitStrDecs
    (SOME (structIRef, structIRef))

fun addStructMethodStrDecsHighLevel repo vers structIRef =
  revFoldMapInfosWithExcls
    StructInfo.getNMethods
    StructInfo.getMethod
    (makeFunctionStrDecHighLevel repo vers (SOME (structIRef, structIRef)))

fun makeStructStr
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (excls'0         : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated structInfo

    val optGetTypeSymbol = RegisteredTypeInfo.getTypeInit structInfo

    val structName = getName structInfo
    val structIRef = {
      namespace = structNamespace,
      name      = structName,
      scope     = LOCALINTERFACESELF,
      ty        = RECORD,
      container = NONE
    }

    val structStrId = mkStrId structNamespace structName
    val structSigId = toUCU structStrId

    val structStrNameId = mkStrNameId structName

    val typeIRef = makeTypeIRef structNamespace (SOME structName)

    val addStructGetTypeFunctionStrDecLowLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionStrDecLowLevel getTypeSymbol
      | NONE               => K I

    val addStructGetTypeFunctionStrDecHighLevel =
      case optGetTypeSymbol of
        SOME getTypeSymbol => addGetTypeFunctionStrDecHighLevel getTypeSymbol
      | NONE               => K I

    (* module *)
    val acc'0
      : strdec list
         * (interfaceref list * struct1 ListDict.t)
         * info_excl_hier list =
      ([], ([], ListDict.empty), excls'0)
    val acc'1 =
      addStructMethodStrDecsHighLevel repo vers structIRef (structInfo, acc'0)
    val acc'2 = addStructGetTypeFunctionStrDecHighLevel typeIRef acc'1
    val (strDecs'2, (iRefs'2, structDeps'2), excls'2) = acc'2

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
            vers
            addStructGetTypeFunctionStrDecLowLevel
            structIRef
            (structInfo, (strDecs'3, excls'2))

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
      mkStrFile structStrId,
      ([structSpec], [structStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      excls'2
    )
  end


(* Struct C Interface - GIR only *)

val cDeclareValueRecordId = "GIRAFFE_DECLARE_VALUE_RECORD"

fun addStructCInterfaceDecl
  (_               : 'a RepositoryClass.class)
  (_               : Repository.typelibvers_t)
  (structNamespace : string)
  (structInfo      : 'b StructInfoClass.class)
  (cInterfaceDecls : c_interface_decl list)
  : c_interface_decl list =
  let
    val () = checkDeprecated structInfo

    val structName = getName structInfo
    val structType = getStructType (structNamespace, structName)
  in
    case structType of
      ValueRecord _ =>
        let
          val structSize = StructInfo.getCName structInfo
          val structVersion = BaseInfo.getVersion structInfo

          val decl =
            CMacroCall {
              name = cDeclareValueRecordId,
              args = [
                structSize,
                String.concatWith "_" [toLCU structNamespace, toLCU structName]
              ]
            }
          val structCVersionDecl =
            case structVersion of
              SOME version => CCheckVersion {decl = decl, version = version}
            | NONE         => decl
        in
          structCVersionDecl :: cInterfaceDecls
        end
    | _             => cInterfaceDecls
  end
