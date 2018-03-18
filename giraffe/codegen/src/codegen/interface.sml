(* --------------------------------------------------------------------------
 * Interface
 * -------------------------------------------------------------------------- *)

(* Class signature *)

local
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

      val specs'0 = []
      val specs'1 =
        addAccessorSpecs
          interfaceNamespace
          interfaceInfo
          (classTy baseTy, classTy aVarTy)
          true
          specs'0

      (*
       *     type 'a <interface_name>
       *                                           -.
       *     type 'a object_class                   | isGObject
       *     include CLASS                          |
       *       where type 'a class = 'a <interface_name> object_class
       *                                           -'
       *                                           -.
       *     include CLASS                          |
       *       where type 'a class =                | not isGObject
       *         'a <interface_name>                |
       *           GObject.ObjectClass.class        |
       *                                           -'
       *)
      val parentClassTypeLId = makeInterfaceRefTyLongId parentObjectIRef
      val classInclSpec =
        SpecIncl (
          SigName (toUCU classId),
          [
            toList1 [
              (
                classTyLName aTyVar,
                TyRef (
                  [TyRef ([aVarTy], toList1 [interfaceNameTypeId])],
                  parentClassTypeLId
                )
              )
            ]
          ]
        )

      (* parentClassTypeLId is (_, [])
       *  <=> parentObjectNamespace = objectNamespace
       *  <=> isParentNamespace *)
      val specs'2 =
        case parentClassTypeLId of
          (id, []) => mkTypeSpec (([aTyVar], id), NONE) :: classInclSpec :: specs'1
        | _        => classInclSpec :: specs'1
      val specs'3 = mkTypeSpec (([aTyVar], interfaceNameTypeId), NONE) :: specs'2

      val sig1 = mkSigSpec specs'3
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
      val strDecs'0 = []
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val iRefs'2 = addAccessorIRefs isGObject iRefs'1

      (*
       *                                           -.
       *     type 'a object_class =                 | isParentNamespace
       *       'a GObjectObjecClass.class           |
       *                                           -'
       *     open GObjectObjectClass
       *     type 'a <interface_name> = unit
       *     type 'a class = 'a <interface_name> class
       *)
      val classTyStrDec =
        StrDecDec (
          mkTypeDec (
            classTyName aTyVar,
            classTy (TyRef ([aVarTy], toList1 [interfaceNameTypeId]))
          )
        )
      val parentClassStrLId =
        toList1 (
          if isParentNamespace
          then [parentClassStrId]
          else prefixInterfaceStrId parentObjectIRef []
        )
      val strDecs'1 =
        StrDecDec (DecOpen (toList1 [parentClassStrLId]))
         :: StrDecDec (mkTypeDec (([aTyVar], interfaceNameTypeId), unitTy))
         :: classTyStrDec
         :: strDecs'0
      val (strDecs'2, revParentClassLocalTypes) =
        if isParentNamespace
        then
          let
            val localType = makeIRefLocalType parentObjectIRef
          in
            (
              makeLocalTypeStrDec localType :: strDecs'1,
              [localType]
            )
          end
        else (strDecs'1, [])

      val struct1 = mkBodyStruct strDecs'2

      (* sig *)
      val sig1 = SigName interfaceClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a object_class =                     | isParentNamespace
       *         'a GObjectObjectClass.class              |
       *                                                 -'
       *                                                 -.
       *     where type ('a, 'b) value_accessor_t =       | isGObject
       *       ('a, 'b) ValueAccessor.t                   |
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
        iRefs'2
      )
    end
end


(* Interface signature *)

fun addInterfaceConstantSpecs repo vers x =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    (makeConstantSpec repo vers)
    x

fun addInterfaceMethodSpecs repo vers interfaceIRef =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionSpec repo vers (SOME interfaceIRef))

fun addInterfaceSignalSpecs repo interfaceIRef =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNSignals
    InterfaceInfo.getSignal
    (makeSignalSpec repo interfaceIRef)

fun addInterfacePropertySpecs repo interfaceIRef =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNProperties
    InterfaceInfo.getProperty
    (makePropertySpec repo interfaceIRef)

fun makeInterfaceSig
  (repo               : 'a RepositoryClass.class)
  (vers               : Repository.typelibvers_t)
  (interfaceNamespace : string)
  (interfaceInfo      : 'b InterfaceInfoClass.class)
  (excls'0            : info_excl_hier list)
  : id * program * id list * info_excl_hier list =
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

    val typeIRef = makeTypeIRef interfaceNamespace (SOME interfaceName)

    val acc'0
      : spec list
         * interfaceref list
         * info_excl_hier list =
      ([], [], excls'0)
    val acc'1 =
      addInterfacePropertySpecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalSpecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodSpecs repo vers interfaceIRef (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec getTypeSymbol typeIRef acc'3
    val acc'5 = addInterfaceConstantSpecs repo vers (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (specs'6, iRefs'6, excls'6) = acc'6

    val sigIRefs =
      interfaceIRef :: iRefs'6
      (* `interfaceIRef` for class structure dependence *)

    (*
     *     type t = base class
     *)
    val tTySpec = mkTypeSpec (tTyName, SOME (classTy baseTy))
    val specs'7 = tTySpec :: specs'6

    (*
     *                                       -.
     *     type 'object_class property_t      | isGObject and numProps > 0
     *                                       -'
     *)
    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val specs'8 = addPropertySpecs interfaceNamespace numProps specs'7

    (*
     *                                       -.
     *     type 'a signal_t                   | isGObject and numSigs > 0
     *                                       -'
     *)
    val numSigs = InterfaceInfo.getNSignals interfaceInfo
    val specs'9 = addSignalSpecs interfaceNamespace numSigs specs'8

    (*
     *     type 'a class
     *
     *     type <varlist[1]> <type_name[1]>_<t>
     *
     *     ...
     *
     *     type <varlist[N]> <type_name[N]>_<t>
     *)
    val specs'10 = revMapAppend makeIRefLocalTypeSpec (rev sigIRefs, specs'9)

    val sig1 = mkSigSpec specs'10
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(interfaceSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (interfaceSigId, Portable program, sigDeps, excls'6)
  end


(* Interface structure *)

fun addInterfaceConstantStrDecs repo vers x =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNConstants
    InterfaceInfo.getConstant
    (makeConstantStrDec repo vers)
    x

fun addInterfaceMethodStrDecsLowLevel
  isPolyML
  repo
  vers
  addInitStrDecs
  interfaceRootIRef
  interfaceIRef =
  addFunctionStrDecsLowLevel
    (InterfaceInfo.getNMethods, InterfaceInfo.getMethod)
    isPolyML
    repo
    vers
    addInitStrDecs
    (SOME (interfaceRootIRef, interfaceIRef))

fun addInterfaceMethodStrDecsHighLevel repo vers interfaceRootIRef interfaceIRef =
  revFoldMapInfosWithExcls
    InterfaceInfo.getNMethods
    InterfaceInfo.getMethod
    (makeFunctionStrDecHighLevel repo vers (SOME (interfaceRootIRef, interfaceIRef)))

fun addInterfaceSignalStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, x, excls)) =>
    let
      val (localStrDecs, x', excls') =
        revFoldMapInfosWithExcls
          InterfaceInfo.getNSignals
          InterfaceInfo.getSignal
          (makeSignalStrDec repo interfaceIRef)
          (interfaceInfo, ([], x, excls))
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
            (strDec :: strDecs, x', excls')
          end
      | _      => (strDecs, x', excls')
    end

fun addInterfacePropertyStrDecs repo interfaceIRef =
  fn (interfaceInfo, (strDecs, x, excls)) =>
    let
      val (localStrDecs, x', excls') =
        revFoldMapInfosWithExcls
          InterfaceInfo.getNProperties
          InterfaceInfo.getProperty
          (makePropertyStrDec repo interfaceIRef)
          (interfaceInfo, ([], x, excls))
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
                        toList1 [propertyStrId]
                      ]
                    )
                  )
                ],
                mkStrDecs localStrDecs
              )
          in
            (strDec :: strDecs, x', excls')
          end
      | _      => (strDecs, x', excls')
    end

fun makeInterfaceStr
  (repo               : 'a RepositoryClass.class)
  (vers               : Repository.typelibvers_t)
  (interfaceNamespace : string)
  (interfaceInfo      : 'b InterfaceInfoClass.class)
  (excls'0            : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
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
         * (interfaceref list * struct1 ListDict.t)
         * info_excl_hier list =
      ([], ([], ListDict.empty), excls'0)
    val acc'1 =
      addInterfacePropertyStrDecs repo interfaceIRef (interfaceInfo, acc'0)
    val acc'2 =
      addInterfaceSignalStrDecs repo interfaceIRef (interfaceInfo, acc'1)
    val acc'3 =
      addInterfaceMethodStrDecsHighLevel
        repo
        vers
        interfaceRootIRef
        interfaceIRef
        (interfaceInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel getTypeSymbol typeIRef acc'3
    val acc'5 = addInterfaceConstantStrDecs repo vers (interfaceInfo, acc'4)
    val acc'6 = acc'5
    val (strDecs'6, (iRefs'6, structDeps'6), excls'6) = acc'6

    val strIRefs =
      interfaceIRef :: iRefs'6
      (* `interfaceIRef` for class structure dependence *)

    (*
     *     type t = base class
     *)
    val tTypeDec = mkTypeDec (tTyName, classTy baseTy)
    val strDecs'7 = StrDecDec tTypeDec :: strDecs'6

    (*
     *                                                   -.
     *     type 'object_class property_t =                | isGObject
     *       'object_class Property.t                     |  and numProps > 0
     *                                                   -'
     *)
    val numProps = InterfaceInfo.getNProperties interfaceInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'8 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'7)

    (*
     *                                       -.
     *     type 'a signal_t = 'a Signal.t     | isGObject and numSigs > 0
     *                                       -'
     *)
    val numSigs = InterfaceInfo.getNSignals interfaceInfo
    val revSigLocalTypes = makeSignalLocalTypes isGObject numSigs
    val strDecs'9 =
      revMapAppend makeLocalTypeStrDec (revSigLocalTypes, strDecs'8)

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
    val strDecs'10 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'9)

    fun mkModule isPolyML =
      let
        val (strDecs'11, _) =
          addInterfaceMethodStrDecsLowLevel
            isPolyML
            repo
            vers
            (addGetTypeFunctionStrDecLowLevel getTypeSymbol)
            interfaceRootIRef
            interfaceIRef
            (interfaceInfo, (strDecs'10, excls'6))

        val strDecs'12 =
          revMapAppend mkStructStrDec
            (ListDict.toList structDeps'6, strDecs'11)

        val struct1 = mkBodyStruct strDecs'12

        (* sig *)
        val sig1 = SigName interfaceSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revSigLocalTypes, sigQual'1)
        val sigQual'3 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'2)
        val qSig : qsig = (sig1, sigQual'3)

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
          revMapAppend makeLocalTypeStrSpecQual (revSigLocalTypes, sigQual'1)
        val sigQual'3 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'2)
        val qSig : qsig = (sig1, sigQual'3)
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
      excls'6
    )
  end
