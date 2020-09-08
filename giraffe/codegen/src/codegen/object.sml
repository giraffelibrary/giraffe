(* --------------------------------------------------------------------------
 * Object - root class stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

(* Class signature *)

local
in
  fun makeObjectDerivedClassSig
    (_                : 'a RepositoryClass.class)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.class)
    (objectInfo       : 'c ObjectInfoClass.class)
    : id * program * interfaceref list * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLCU objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy,
        container = NONE
      }

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val specs'0 = [toDerivedSpec objectNamespace]
      val specs'1 =
        addAccessorSpecs
          objectNamespace
          objectInfo
          (classTy baseTy, classTy aVarTy)
          true
          specs'0

      (*
       *     type 'a <object_name>
       *                                           -.
       *     type 'a <parent_object_name>_class     | isParentNamespace
       *     include CLASS                          |
       *       where type 'a class = 'a <object_name> <parent_object_name>_class
       *                                           -'
       *                                           -.
       *     include CLASS                          |
       *       where type 'a class =                | not isParentNamespace
       *         'a <object_name>                   |
       *           <ParentObjectNamespace>.<ParentObjectName>Class.class
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
                  [TyRef ([aVarTy], toList1 [objectNameTypeId])],
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
      val specs'3 = mkTypeSpec (([aTyVar], objectNameTypeId), NONE) :: specs'2

      val sig1 = mkSigSpec specs'3
      val qSig : qsig = (sig1, [])
      val sigDec = toList1 [(objectClassSigId, qSig)]
      val program = [ModuleDecSig sigDec]
      val sigIRefs = []
      val extIRefs = []
    in
      (mkSigFile objectClassSigId, Portable program, sigIRefs, extIRefs)
    end

  fun makeObjectRootClassSig
    (objectNamespace : string)
    (objectInfo      : 'a ObjectInfoClass.class)
    : id * program * interfaceref list * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val program = []
      val sigIRefs = []
      val extIRefs = []
    in
      (mkSigFile objectClassSigId, Portable program, sigIRefs, extIRefs)
    end

  fun makeObjectClassSig
    (repo            : 'a RepositoryClass.class)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.class)
    : id * program * interfaceref list * interfaceref list =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassSig
          repo
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassSig objectNamespace objectInfo
end


(* Class structure *)

local
in
  fun makeObjectDerivedClassStr
    (_                : 'a RepositoryClass.class)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.class)
    (objectInfo       : 'c ObjectInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo
      val objectNameTypeId = toLCU objectName

      val parentObjectNamespace = BaseInfo.getNamespace parentObjectInfo
      val parentObjectName = getName parentObjectInfo
      val parentObjectScope =
        if parentObjectNamespace <> objectNamespace
        then GLOBAL
        else LOCALINTERFACEOTHER
      val parentObjectTy = CLASS

      val parentObjectIRef = {
        namespace = parentObjectNamespace,
        name      = parentObjectName,
        scope     = parentObjectScope,
        ty        = parentObjectTy,
        container = NONE
      }

      (* <ParentObjectNamespace><ParentObjectName>Class *)
      val parentClassStrId = makeIRefInterfaceOtherStrId parentObjectIRef

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val iRefs'1 =
        case parentObjectScope of
          GLOBAL             => []
     (* | LOCALINTERFACESELF => [] *) (* unreachable *)
        | _                  => [parentObjectIRef]

      val isParentNamespace = parentObjectScope <> GLOBAL

      (* module *)
      val strDecs'0 = []

      val getValueType =
        fn
          ("GObject", name) =>
            if String.isPrefix "ParamSpec" name
            then "param"
            else "object"
        | _                 => "object"

      val (addAccessorStrDecs, addAccessorIRefs, revAccessorLocalTypes) =
        addAccessorRootStrDecs (objectNamespace, objectName) getValueType objectInfo

      val iRefs'2 = addAccessorIRefs iRefs'1

      val revParentClassLocalTypes =
        if isParentNamespace
        then [makeIRefLocalType parentObjectIRef]
        else []

      fun mkModule isPolyML =
        let
          val strDecs'1 = addAccessorStrDecs true isPolyML strDecs'0

          (*
           *                                           -.
           *     type 'a <parent_object_name>_class =   | isParentNamespace
           *       'a <ParentObjectNamespace><ParentObjectName>Class.class
           *                                           -'
           *     open <ParentObjectNamespace><ParentObjectName>Class
           *     type 'a <object_name> = unit
           *     type 'a class = 'a <object_name> class
           *)
          val classTyStrDec =
            StrDecDec (
              mkTypeDec (
                classTyName aTyVar,
                classTy (TyRef ([aVarTy], toList1 [objectNameTypeId]))
              )
            )
          val parentClassStrLId =
            toList1 (
              if isParentNamespace
              then [parentClassStrId]
              else prefixInterfaceStrId parentObjectIRef []
            )
          val strDecs'2 =
            StrDecDec (DecOpen (toList1 [parentClassStrLId]))
             :: StrDecDec (mkTypeDec (([aTyVar], objectNameTypeId), unitTy))
             :: classTyStrDec
             :: strDecs'1
          val strDecs'3 = map makeLocalTypeStrDec revParentClassLocalTypes @ strDecs'2

          val struct1 = mkBodyStruct strDecs'3

          (* sig *)
          val sig1 = SigName objectClassSigId
          (*
           *                                                 -.
           *     where                                        |
           *       type 'a <parent_object_name>_class =       | isParentNamespace
           *         'a <ParentObjectNamespace><ParentObjectName>Class.class
           *                                                 -'
           *                                                 -.
           *     where type ('a, 'b) value_accessor_t =       | isGObject
           *       ('a, 'b) ValueAccessor.t                   |
           *                                                 -'
           *     where type C.opt =
           *       <ParentObjectNamespace><ParentObjectName>Class.C.opt
           *     where type C.non_opt =
           *       <ParentObjectNamespace><ParentObjectName>Class.C.non_opt
           *     where type 'a C.p =
           *       'a <ParentObjectNamespace><ParentObjectName>Class.C.p
           *)
          val cOptQual =
            toList1 [
              (([], cOptLId), TyRef ([], cons1 (parentClassStrId, cOptLId)))
            ]
          val cNonOptQual =
            toList1 [
              (([], cNonOptLId), TyRef ([], cons1 (parentClassStrId, cNonOptLId)))
            ]
          val cPtrQual =
            toList1 [
              (
                ([aTyVar], cPtrLId),
                TyRef ([aVarTy], cons1 (parentClassStrId, cPtrLId))
              )
            ]

          val sigQual'1 : qual list = [cOptQual, cNonOptQual, cPtrQual]
          val sigQual'2 =
            revMapAppend makeLocalTypeStrModuleQual (revAccessorLocalTypes, sigQual'1)
          val sigQual'3 =
            revMapAppend makeLocalTypeStrModuleQual
              (revParentClassLocalTypes, sigQual'2)
          val qSig : qsig = (sig1, sigQual'3)

          (* strdec *)
          val structDec =
            toList1 [(objectClassStrId, SOME (true, qSig), struct1)]
          val strDec = StrDecStruct structDec
        in
          [ModuleDecStr strDec]
        end

      val programMLton = mkModule false
      val programPolyML = mkModule true

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val sigQual'2 =
            revMapAppend makeLocalTypeStrSpecQual
              (revParentClassLocalTypes, sigQual'1)
          val qSig : qsig = (sig1, sigQual'2)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        mkStrFile objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        iRefs'2
      )
    end

  fun makeObjectRootClassStr
    (_               : 'a RepositoryClass.class)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val objectClassStrNameId = mkClassStrNameId objectName

      val isGObject = objectNamespace = "GObject"

      (* module *)
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject
      val programMLton = []
      val programPolyML = []

      (* namespace spec *)
      val objectClassSpec =
        let
          (* sig *)
          val sig1 = SigName objectClassSigId
          val sigQual'1 = revMap makeLocalTypeStrSpecQual revAccessorLocalTypes
          val qSig : qsig = (sig1, sigQual'1)
        in
          (* spec *)
          SpecStruct (toList1 [(objectClassStrNameId, qSig)])
        end
      val objectClassSpecs = [objectClassSpec]

      (* namespace strdec *)
      val objectClassStrDec =
        StrDecStruct (
          toList1 [
            (objectClassStrNameId, NONE, StructName (toList1 [objectClassStrId]))
          ]
        )
      val objectClassStrDecs = [objectClassStrDec]
    in
      (
        mkStrFile objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = programMLton, polyml = programPolyML},
        []
      )
    end

  fun makeObjectClassStr
    (repo            : 'a RepositoryClass.class)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.class)
    : id * (spec list * strdec list) * program * interfaceref list =
    case ObjectInfo.getParent objectInfo of
      SOME parentObjectInfo =>
        makeObjectDerivedClassStr
          repo
          objectNamespace
          parentObjectInfo
          objectInfo
    | NONE                  =>
        makeObjectRootClassStr
          repo
          objectNamespace
          objectInfo
end


(* Object signature *)

fun addObjectInterfaceConvSpecs repo objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvSpec repo objectIRef)

fun addObjectConstantSpecs repo vers x =
  revFoldMapInfosWithExcls
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    (makeConstantSpec repo vers)
    x

fun addObjectMethodSpecs repo vers objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionSpec repo vers (SOME objectIRef))

fun addObjectSignalSpecs repo objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNSignals
    ObjectInfo.getSignal
    (makeSignalSpec repo objectIRef)

fun addObjectPropertySpecs repo objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNProperties
    ObjectInfo.getProperty
    (makePropertySpec repo objectIRef)

fun makeObjectSig
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (objectNamespace : string)
  (objectInfo      : 'b ObjectInfoClass.class)
  (excls'0         : info_excl_hier list)
  : id * program * interfaceref list * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated objectInfo

    val getTypeSymbol = ObjectInfo.getTypeInit objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS,
      container = NONE
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)

    val acc'0
      : spec list
         * (interfaceref list * interfaceref list)
         * info_excl_hier list =
      ([], ([], []), excls'0)
    val acc'1 = addObjectPropertySpecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalSpecs repo objectIRef (objectInfo, acc'1)
    val acc'3 = addObjectMethodSpecs repo vers objectIRef (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec getTypeSymbol typeIRef acc'3
    val acc'5 = addObjectConstantSpecs repo vers (objectInfo, acc'4)
    val acc'6 = addObjectInterfaceConvSpecs repo objectIRef (objectInfo, acc'5)
    val (specs'6, (localIRefs'6, extIRefs'6), excls'6) = acc'6

    val localIRefs =
      objectIRef :: localIRefs'6  (* `objectIRef` for class structure dependence *)

    (*
     *     type t = base class
     *)
    val tTySpec = mkTypeSpec (tTyName, SOME (classTy baseTy))
    val specs'7 = tTySpec :: specs'6

    (*
     *                                                     -.
     *     type ('object_class, 'get, 'set, 'init) property_t
     *                                                      | isGObject
     *                                                     -'  and numProps > 0
     *)
    val numProps = ObjectInfo.getNProperties objectInfo
    val specs'8 = addPropertySpecs objectNamespace numProps specs'7

    (*
     *                                       -.
     *     type 'a signal_t                   | isGObject and numSigs > 0
     *                                       -'
     *)
    val numSigs = ObjectInfo.getNSignals objectInfo
    val specs'9 = addSignalSpecs objectNamespace numSigs specs'8

    (*
     *     type 'a class
     *
     *     type <varlist[1]> <type_name[1]>_<t>
     *
     *     ...
     *
     *     type <varlist[N]> <type_name[N]>_<t>
     *)
    val specs'10 = revMapAppend makeIRefLocalTypeSpec (rev localIRefs, specs'9)

    val sig1 = mkSigSpec specs'10
    val qSig : qsig = (sig1, [])
    val sigDec = toList1 [(objectSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigIRefs = []
  in
    (mkSigFile objectSigId, Portable program, sigIRefs, extIRefs'6, excls'6)
  end


(* Object structure *)

fun addObjectInterfaceConvStrDecs repo rootObjectIRef objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvStrDec repo rootObjectIRef objectIRef)

fun addObjectConstantStrDecs repo vers x =
  revFoldMapInfosWithExcls
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    (makeConstantStrDec repo vers)
    x

fun addObjectMethodStrDecsLowLevel
  isPolyML
  repo
  vers
  addInitStrDecs
  rootObjectIRef
  objectIRef =
  addFunctionStrDecsLowLevel
    (ObjectInfo.getNMethods, ObjectInfo.getMethod)
    isPolyML
    repo
    vers
    addInitStrDecs
    (SOME (rootObjectIRef, objectIRef))

fun addObjectMethodStrDecsHighLevel repo vers rootObjectIRef objectIRef =
  revFoldMapInfosWithExcls
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionStrDecHighLevel repo vers (SOME (rootObjectIRef, objectIRef)))

fun addObjectSignalStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, x, excls)) =>
    let
      val (localStrDecs, x', excls') =
        revFoldMapInfosWithExcls
          ObjectInfo.getNSignals
          ObjectInfo.getSignal
          (makeSignalStrDec repo objectIRef)
          (objectInfo, ([], x, excls))
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

fun addObjectPropertyStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, x, excls)) =>
    let
      val (localStrDecs, x', excls') =
        revFoldMapInfosWithExcls
          ObjectInfo.getNProperties
          ObjectInfo.getProperty
          (makePropertyStrDec repo objectIRef)
          (objectInfo, ([], x, excls))
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
                        toList1 [valueAccessorStrId]
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

fun makeObjectStr
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (objectNamespace : string)
  (objectInfo      : 'b ObjectInfoClass.class)
  (excls'0         : info_excl_hier list)
  : id * (spec list * strdec list) * program * interfaceref list * info_excl_hier list =
  let
    val () = checkDeprecated objectInfo

    val getTypeSymbol = ObjectInfo.getTypeInit objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS,
      container = NONE
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val objectStrNameId = mkStrNameId objectName

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)
    val rootObjectIRef =
      getRootObjectIRef repo objectNamespace (SOME objectName)
        (objectInfo, objectIRef)

    val isGObject = objectNamespace = "GObject"

    (* module *)
    val acc'0
      : strdec list
         * (interfaceref list * struct1 ListDict.t)
         * info_excl_hier list =
      ([], ([], ListDict.empty), excls'0)
    val acc'1 = addObjectPropertyStrDecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalStrDecs repo objectIRef (objectInfo, acc'1)
    val acc'3 =
      addObjectMethodStrDecsHighLevel
        repo
        vers
        rootObjectIRef
        objectIRef
        (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel getTypeSymbol typeIRef acc'3
    val acc'5 = addObjectConstantStrDecs repo vers (objectInfo, acc'4)
    val acc'6 =
      addObjectInterfaceConvStrDecs
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'5)
    val (strDecs'6, (iRefs'6, structDeps'6), excls'6) = acc'6

    val strIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    (*
     *     type t = base class
     *)
    val tTypeDec = mkTypeDec (tTyName, classTy baseTy)
    val strDecs'7 = StrDecDec tTypeDec :: strDecs'6

    (*
     *                                                     -.
     *     type ('object_class, 'get, 'set, 'init) property_t =
     *       ('object_class, 'get, 'set, 'init) Property.t  | isGObject
     *                                                     -'  and numProps > 0
     *)
    val numProps = ObjectInfo.getNProperties objectInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'8 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'7)

    (*
     *                                       -.
     *     type 'a signal_t = 'a Signal.t     | isGObject and numSigs > 0
     *                                       -'
     *)
    val numSigs = ObjectInfo.getNSignals objectInfo
    val revSigLocalTypes = makeSignalLocalTypes isGObject numSigs
    val strDecs'9 =
      revMapAppend makeLocalTypeStrDec (revSigLocalTypes, strDecs'8)

    (*
     *     type 'a class = 'a <ObjectNamespace><ObjectName>Class.class
     *
     *     type <varlist[1]> <type_name[1]>_<t> =
     *       <varlist[1]> <ObjectNamespace><TypeName[1]>.<t>
     *
     *     ...
     *
     *     type <varlist[N]> <type_name[N]>_<t> =
     *       <varlist[N]> <ObjectNamespace><TypeName[N]>.<t>
     *)
    val revLocalTypes = revMap makeIRefLocalType strIRefs
    val strDecs'10 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'9)

    fun mkModule isPolyML =
      let
        val (strDecs'11, _) =
          addObjectMethodStrDecsLowLevel
            isPolyML
            repo
            vers
            (addGetTypeFunctionStrDecLowLevel getTypeSymbol)
            rootObjectIRef
            objectIRef
            (objectInfo, (strDecs'10, excls'6))

        val strDecs'12 =
          revMapAppend mkStructStrDec
            (ListDict.toList structDeps'6, strDecs'11)

        val struct1 = mkBodyStruct strDecs'12

        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revSigLocalTypes, sigQual'1)
        val sigQual'3 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'2)
        val qSig : qsig = (sig1, sigQual'3)

        (* strdec *)
        val structDec = toList1 [(objectStrId, SOME (true, qSig), struct1)]
        val strDec = StrDecStruct structDec
      in
        [ModuleDecStr strDec]
      end

    val programMLton = mkModule false
    val programPolyML = mkModule true

    (* namespace spec *)
    val objectSpec =
      let
        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrSpecQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrSpecQual (revSigLocalTypes, sigQual'1)
        val sigQual'3 =
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'2)
        val qSig : qsig = (sig1, sigQual'3)
      in
        (* spec *)
        SpecStruct (toList1 [(objectStrNameId, qSig)])
      end

    (* namespace strdec *)
    val objectStrDec =
      StrDecStruct (
        toList1 [
          (objectStrNameId, NONE, StructName (toList1 [objectStrId]))
        ]
      )
  in
    (
      mkStrFile objectStrId,
      ([objectSpec], [objectStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      excls'6
    )
  end
