(* --------------------------------------------------------------------------
 * Interface
 * -------------------------------------------------------------------------- *)

(* Class signature *)

local
  (*
   *     type t = base class
   *)
  val tTySpec = mkTypeSpec (tTyName, SOME (classTy baseTy))

  (*
   *     val toBase : 'a class -> base class
   *)
  val toBaseValSpec = mkValSpec (toBaseId, TyFun (classTy aVarTy, classTy baseTy))

  (*
   *     structure C :
   *       sig
   *         type notnull
   *         type 'a p
   *         val fromPtr : bool -> notnull p -> 'a class
   *         val fromOptPtr : bool -> unit p -> 'a class option
   *       end
   *)
  val structCSpecs = [
    mkTypeSpec (notnullTyName, NONE),
    mkTypeSpec (ptrTyName aTyVar, NONE),
    mkValSpec (
      fromPtrId,
      TyFun (boolTy, TyFun (ptrTy notnullTy, classTy aVarTy))
    ),
    mkValSpec (
      fromOptPtrId,
      TyFun (boolTy, TyFun (ptrTy unitTy, optionTy (classTy aVarTy)))
    )
  ]
  val structCSpec = mkCStructSpec structCSpecs

  val specs'1 = [structCSpec]
in
  fun makeInterfaceClassSig
    (_                  : 'a RepositoryClass.class)
    (interfaceNamespace : string)
    (interfaceInfo      : 'b InterfaceInfoClass.class)
    : id * program * id list =
    let
      val () = checkDeprecated interfaceInfo

      val interfaceName = getName interfaceInfo
      val interfaceNameTypeId = toLCU interfaceName

      val parentObjectIRef =
        makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

      val interfaceClassStrId = mkClassStrId interfaceNamespace interfaceName
      val interfaceClassSigId = toUCU interfaceClassStrId

      val specs'2 =
        addAccessorSpecs
          interfaceNamespace
          interfaceInfo
          (classTy baseTy, classTy aVarTy)
          true
          specs'1
      val specs'3 = tTySpec :: toBaseValSpec :: specs'2

      (*
       *     type 'a <interface_name>
       *                                           -.
       *     type 'a object_class                   | isGObject
       *     type 'a class = 'a <interface_name> object_class
       *                                           -'
       *                                           -.
       *     type 'a class =                        | not isGObject
       *       'a <interface_name> GObject.ObjectClass.class
       *                                           -'
       *)
      val parentClassTypeLId = makeInterfaceRefTyLongId parentObjectIRef
      val classTySpec =
        mkTypeSpec (
          classTyName aTyVar,
          SOME (
            TyRef (
              [TyRef ([aVarTy], toList1 [interfaceNameTypeId])],
              parentClassTypeLId
            )
          )
        )
      (* parentClassTypeLId is (_, [])
       *  <=> parentObjectNamespace = objectNamespace
       *  <=> isParentNamespace *)
      val specs'4 =
        case parentClassTypeLId of
          (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: classTySpec :: specs'3
        | _        => classTySpec :: specs'3
      val specs'5 = mkTypeSpec (([aTyVar], interfaceNameTypeId), NONE) :: specs'4

      val sig1 = mkSigSpec specs'5
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(interfaceClassSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigDeps = []
    in
      (interfaceClassSigId, Portable program, sigDeps)
    end
end


(* Class structure *)

local
  (*
   *     type t = base class
   *)
  val tTypeDec = mkTypeDec (tTyName, classTy baseTy)

  (*
   *     fun toBase obj = obj
   *)
  val toBaseFunDec =
    DecFun (
      [],
      toList1 [
        toList1 [
          (
            FunHeadPrefix (NameId toBaseId, toList1 [mkIdVarAPat objId]),
            NONE,
            mkIdLNameExp objId
          )
        ]
      ]
    )
in
  fun makeInterfaceClassStr
    (_                  : 'a RepositoryClass.class)
    (interfaceNamespace : string)
    (interfaceInfo      : 'b InterfaceInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated interfaceInfo

      val interfaceName = getName interfaceInfo
      val interfaceNameTypeId = toLCU interfaceName

      val parentObjectIRef as {scope = parentObjectScope, ...} =
        makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

      (* <ParentObjectNamespace><ParentObjectName>Class *)
      val parentClassStrId = makeIRefInterfaceOtherStrId parentObjectIRef

      val interfaceClassStrId = mkClassStrId interfaceNamespace interfaceName
      val interfaceClassSigId = toUCU interfaceClassStrId

      val interfaceClassStrNameId = mkClassStrNameId interfaceName

      val iRefs'1 =
        case parentObjectScope of
          GLOBAL             => []
     (* | LOCALINTERFACESELF => [] *) (* unreachable *)
        | _                  => [parentObjectIRef]

      val isParentNamespace = parentObjectScope <> GLOBAL
      val isGObject = interfaceNamespace = "GObject"
      val () =
        if isParentNamespace = isGObject
        then ()
        else raise Fail "makeInterfaceClassStr: assertion failed"

      (* module *)
      (*
       *     structure C = <ParentObjectNamespace><ParentObjectName>Class.C
       *)
      val cStrDec =
        StrDecStruct (
          toList1 [
            (
              "C",
              NONE,
              StructName (toList1 [parentClassStrId, "C"])
            )
          ]
        )
      val strDecs'1 = [cStrDec]

      (*
       *                                                 -.
       *     type ('a, 'b) value_accessor =               | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     val t = <ParentObjectNamespace><ParentObjectName>Class.t
       *     val tOpt = <ParentObjectNamespace><ParentObjectName>Class.tOpt
       *)
      val tValDec = mkIdValDec (tId, mkLIdLNameExp [parentClassStrId, tId])
      val tOptValDec =
        mkIdValDec (tOptId, mkLIdLNameExp [parentClassStrId, tOptId])
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val strDecs'2 =
        revMapAppend makeLocalTypeStrDec
          (
            revAccessorLocalTypes,
            StrDecDec tValDec :: StrDecDec tOptValDec :: strDecs'1
          )
      val strDecs'3 = StrDecDec tTypeDec :: StrDecDec toBaseFunDec :: strDecs'2

      (*
       *     type 'a <interface_name> = unit
       *                                           -.
       *     type 'a object_class =                 | isParentNamespace
       *       'a GObjectObjecClass.class           |
       *     type 'a class = 'a <interface_name> object_class
       *                                           -'
       *                                           -.
       *     type 'a class =                        | not isParentNamespace
       *       'a <interface_name> GObjectObjectClass.class
       *                                           -'
       *)
      val parentClassTypeLId =
        toList1 (
          if isParentNamespace
          then [makeLocalInterfaceOtherId parentObjectIRef]
          else [parentClassStrId, classId]
        )
      val classTyStrDec =
        StrDecDec (
          mkTypeDec (
            classTyName aTyVar,
            I (
              TyRef (
                [TyRef ([aVarTy], toList1 [interfaceNameTypeId])],
                parentClassTypeLId
              )
            )
          )
        )
      val (strDecs'4, revParentClassLocalTypes) =
        if isParentNamespace
        then
          let
            val localType = makeIRefLocalType parentObjectIRef
          in
            (
              makeLocalTypeStrDec localType :: classTyStrDec :: strDecs'3,
              [localType]
            )
          end
        else (classTyStrDec :: strDecs'3, [])
      val strDecs'5 =
        StrDecDec (mkTypeDec (([aTyVar], interfaceNameTypeId), unitTy))
         :: strDecs'4

      val struct1 = mkStructBody strDecs'5

      (* sig *)
      val sig1 = SigName interfaceClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a object_class =                     | isParentNamespace
       *         'a GObjectObjectClass.class              |
       *                                                 -'
       *                                                 -.
       *     where type ('a, 'b) value_accessor =         | isGObject
       *       ('a, 'b) GObjectValue.accessor             |
       *                                                 -'
       *     where type C.notnull =
       *       <ParentObjectNamespace><ParentObjectName>Class.C.notnull
       *     where type 'a C.p =
       *       'a <ParentObjectNamespace><ParentObjectName>Class.C.p
       *)
      val cNotnullQual =
        toList1 [
          (([], cNotnullLId), TyRef ([], cons1 (parentClassStrId, cNotnullLId)))
        ]
      val cPtrQual =
        toList1 [
          (
            ([aTyVar], cPtrLId),
            TyRef ([aVarTy], cons1 (parentClassStrId, cPtrLId))
          )
        ]

      val sigQual'1 : qual list = [cNotnullQual, cPtrQual]
      val sigQual'2 =
        revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'1)
      val sigQual'3 =
        revMapAppend makeLocalTypeStrModuleQual
          (revParentClassLocalTypes, sigQual'2)
      val qSig : qsig = (sig1, sigQual'3)

      (* strdec *)
      val structDec =
        toList1 [(interfaceClassStrId, SOME (true, qSig), struct1)]
      val strDec = StrDecStruct structDec

      val program = [ModuleDecStr strDec]

      (* namespace spec *)
      val interfaceClassSpec =
        let
          (* sig *)
          val sig1 = SigName interfaceClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentClassLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(interfaceClassStrNameId, qSig)])
        end
      val interfaceClassSpecs = [interfaceClassSpec]

      (* namespace strdec *)
      val interfaceClassStrDec =
        StrDecStruct (
          toList1 [
            (
              interfaceClassStrNameId,
              NONE,
              StructName (toList1 [interfaceClassStrId])
            )
          ]
        )
      val interfaceClassStrDecs = [interfaceClassStrDec]
    in
      (
        interfaceClassStrId,
        (interfaceClassSpecs, interfaceClassStrDecs),
        Specific {mlton = program, polyml = program},
        iRefs'1
      )
    end
end


(* Interface signature *)

fun addInterfaceConstantSpecs x =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    makeConstantSpec
    x

fun addInterfaceMethodSpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionSpec repo (SOME interfaceIRef))

fun addInterfaceSignalSpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNSignals
    InterfaceInfo.getSignal
    (makeSignalSpec repo interfaceIRef)

fun addInterfacePropertySpecs repo interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNProperties
    InterfaceInfo.getProperty
    (makePropertySpec repo interfaceIRef)

fun makeInterfaceSig
  (repo               : 'a RepositoryClass.class)
  (interfaceNamespace : string)
  (interfaceInfo      : 'b InterfaceInfoClass.class)
  (errs'0             : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated interfaceInfo

    val interfaceName = getName interfaceInfo
    val interfaceIRef = {
      namespace = interfaceNamespace,
      name      = interfaceName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val interfaceStrId = mkStrId interfaceNamespace interfaceName
    val interfaceSigId = toUCU interfaceStrId

    val typeIRef = makeTypeIRef interfaceNamespace (SOME interfaceName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addInterfacePropertySpecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalSpecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodSpecs repo interfaceIRef (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec typeIRef acc'3
    val acc'5 = addInterfaceConstantSpecs (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (specs'6, iRefs'6, errs'6) = acc'6

    val sigIRefs =
      interfaceIRef :: iRefs'6
      (* `interfaceIRef` for class structure dependence *)

    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val specs'7 = addPropertySpecs interfaceNamespace numProps specs'6

    (*
     *     type t = base class
     *)
    val tTySpec = mkTypeSpec (tTyName, SOME (classTy baseTy))
    val specs'8 = tTySpec :: specs'7

    (*
     *     type 'a class
     *
     *     type <varlist[1]> <type_name[1]>_<t>
     *
     *     ...
     *
     *     type <varlist[N]> <type_name[N]>_<t>
     *)
    val specs'9 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'8)

    val sig1 = mkSigSpec specs'9
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(interfaceSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (interfaceSigId, Portable program, sigDeps, errs'6)
  end


(* Interface structure *)

fun addInterfaceConstantStrDecs x =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    makeConstantStrDec
    x

fun addInterfaceMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  interfaceRootIRef
  interfaceIRef =
  addFunctionStrDecsLowLevel
    (InterfaceInfo.getNMethods, InterfaceInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (interfaceRootIRef, interfaceIRef))

fun addInterfaceMethodStrDecsHighLevel repo interfaceRootIRef interfaceIRef =
  revFoldMapInfosWithErrs
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (interfaceRootIRef, interfaceIRef)))

fun addInterfaceSignalStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          InterfaceInfo.getNSignals
          InterfaceInfo.getSignal
          (makeSignalStrDec repo interfaceIRef)
          (interfaceInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["ClosureMarshal"],
                        toList1 ["Signal"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun addInterfacePropertyStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, iRefs, errs)) =>
    let
      val (localStrDecs, iRefs', errs') =
        revFoldMapInfosWithErrs
          InterfaceInfo.getNProperties
          InterfaceInfo.getProperty
          (makePropertyStrDec repo interfaceIRef)
          (interfaceInfo, ([], iRefs, errs))
    in
      case localStrDecs of
        _ :: _ =>
          let
            val strDec =
              StrDecLocal (
                mkStrDecs [
                  StrDecDec (
                    DecOpen (
                      toList1 [
                        toList1 ["Property"]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, iRefs', errs')
          end
      | _      => (strDecs, iRefs', errs')
    end

fun makeInterfaceStr
  (repo               : 'a RepositoryClass.class)
  (vers               : Repository.typelibvers_t)
  (libId              : id)
  (interfaceNamespace : string)
  (interfaceInfo      : 'b InterfaceInfoClass.class)
  (errs'0             : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated interfaceInfo

    val getTypeSymbol =
      case RegisteredTypeInfo.getTypeInit interfaceInfo of
        SOME getTypeSymbol => getTypeSymbol
      | NONE               => raise Fail "no GType for interface"

    val interfaceName = getName interfaceInfo
    val interfaceIRef = {
      namespace = interfaceNamespace,
      name      = interfaceName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val interfaceStrId = mkStrId interfaceNamespace interfaceName
    val interfaceSigId = toUCU interfaceStrId

    val interfaceStrNameId = mkStrNameId interfaceName

    val typeIRef = makeTypeIRef interfaceNamespace (SOME interfaceName)
    val interfaceRootIRef =
      makeInterfaceRootIRef interfaceNamespace (SOME interfaceName)

    val isGObject = interfaceNamespace = "GObject"

    (* module *)
    val acc'0
      : strdec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 =
      addInterfacePropertyStrDecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalStrDecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodStrDecsHighLevel
        repo
        interfaceRootIRef
        interfaceIRef
        (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel typeIRef acc'3
    val acc'5 = addInterfaceConstantStrDecs (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (strDecs'6, iRefs'6, errs'6) = acc'6

    val strIRefs =
      interfaceIRef :: iRefs'6
      (* `interfaceIRef` for class structure dependence *)

    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'7 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'6)

    (*
     *     type t = base class
     *)
    val tTypeDec = mkTypeDec (tTyName, classTy baseTy)
    val strDecs'8 = StrDecDec tTypeDec :: strDecs'7

    (*
     *     type 'a class = 'a <InterfaceNamespace><InterfaceName>Class.class
     * 
     *     type <varlist[1]> <type_name[1]>_<t> =
     *       <varlist[1]> <InterfaceNamespace><TypeName[1]>.<t>
     * 
     *     ...
     * 
     *     type <varlist[N]> <type_name[N]>_<t> =
     *       <varlist[N]> <InterfaceNamespace><TypeName[N]>.<t>
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'9 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'8)

    fun mkModule isPolyML =
      let
        val (strDecs, _) =
          addInterfaceMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            (
              addGetTypeFunctionStrDecLowLevel
                repo
                vers
                libId
                interfaceNamespace
                getTypeSymbol
            )
            interfaceRootIRef
            interfaceIRef
            (interfaceInfo, (strDecs'9, errs'6))

        val struct1 = mkStructBody strDecs

        (* sig *)
        val sig1 = SigName interfaceSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)

        (* strdec *)
        val structDec = toList1 [(interfaceStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val interfaceSpec =
      let
        (* sig *)
        val sig1 = SigName interfaceSigId
        val sigQual'1 = revMap makeLocalTypeStrSpecQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)
      in
        (* spec *)
        SpecStruct (toList1 [(interfaceStrNameId, qSig)])
      end

    (* namespace strdec *)
    val interfaceStrDec =
      StrDecStruct (
        toList1 [
          (interfaceStrNameId, NONE, StructName (toList1 [interfaceStrId]))
        ]
      )
  in
    (
      interfaceStrId,
      ([interfaceSpec], [interfaceStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'6
    )
  end
