(* --------------------------------------------------------------------------
 * Object - root class stubbed with empty file for now
 * -------------------------------------------------------------------------- *)

datatype program =
  Portable of module list
| Specific of {mlton : module list, polyml : module list}

val isPortable =
  fn
    Portable _ => true
  | Specific _ => false


(* Class signature *)

local
in
  fun makeObjectDerivedClassSig
    (_                : 'a RepositoryClass.class)
    (objectNamespace  : string)
    (parentObjectInfo : 'b ObjectInfoClass.class)
    (objectInfo       : 'c ObjectInfoClass.class)
    : id * program * id list =
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
        ty        = parentObjectTy
      }

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val specs'0 = []
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
      val sigDeps = []
    in
      (objectClassSigId, Portable program, sigDeps)
    end

  fun makeObjectRootClassSig
    (objectNamespace : string)
    (objectInfo      : 'a ObjectInfoClass.class)
    : id * program * id list =
    let
      val () = checkDeprecated objectInfo

      val objectName = getName objectInfo

      val objectClassStrId = mkClassStrId objectNamespace objectName
      val objectClassSigId = toUCU objectClassStrId

      val program = []
      val sigDeps = []
    in
      (objectClassSigId, Portable program, sigDeps)
    end

  fun makeObjectClassSig
    (repo            : 'a RepositoryClass.class)
    (objectNamespace : string)
    (objectInfo      : 'b ObjectInfoClass.class)
    : id * program * id list =
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
        ty        = parentObjectTy
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
      val isGObject = objectNamespace = "GObject"

      (* module *)
      val strDecs'0 = []
      val revAccessorLocalTypes = makeAccessorLocalTypes isGObject

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
      val strDecs'1 =
        StrDecDec (DecOpen (toList1 [parentClassStrLId]))
         :: StrDecDec (mkTypeDec (([aTyVar], objectNameTypeId), unitTy))
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
      val sig1 = SigName objectClassSigId
      (*
       *                                                 -.
       *     where                                        |
       *       type 'a <parent_object_name>_class =       | isParentNamespace
       *         'a <ParentObjectNamespace><ParentObjectName>Class.class
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
        toList1 [(objectClassStrId, SOME (true, qSig), struct1)]
      val strDec = StrDecStruct structDec

      val program = [ModuleDecStr strDec]

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
        objectClassStrId,
        (objectClassSpecs, objectClassStrDecs),
        Specific {mlton = program, polyml = program},
        iRefs'1
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
        objectClassStrId,
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
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvSpec repo objectIRef)

fun addObjectConstantSpecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantSpec
    x

fun addObjectMethodSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionSpec repo (SOME objectIRef))

fun addObjectSignalSpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNSignals
    ObjectInfo.getSignal
    (makeSignalSpec repo objectIRef)

fun addObjectPropertySpecs repo objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNProperties
    ObjectInfo.getProperty
    (makePropertySpec repo objectIRef)

fun makeObjectSig
  (repo            : 'a RepositoryClass.class)
  (objectNamespace : string)
  (objectInfo      : 'b ObjectInfoClass.class)
  (errs'0          : infoerrorhier list)
  : id * program * id list * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
    }

    val objectStrId = mkStrId objectNamespace objectName
    val objectSigId = toUCU objectStrId

    val typeIRef = makeTypeIRef objectNamespace (SOME objectName)

    val acc'0
      : spec list
         * interfaceref list
         * infoerrorhier list =
      ([], [], errs'0)
    val acc'1 = addObjectPropertySpecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalSpecs repo objectIRef (objectInfo, acc'1)
    val acc'3 = addObjectMethodSpecs repo objectIRef (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionSpec typeIRef acc'3
    val acc'5 = addObjectConstantSpecs (objectInfo, acc'4)
    val acc'6 = addObjectInterfaceConvSpecs repo objectIRef (objectInfo, acc'5)
    val (specs'6, iRefs'6, errs'6) = acc'6

    val sigIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    val numProps = ObjectInfo.getNProperties objectInfo
    val specs'7 = addPropertySpecs objectNamespace numProps specs'6

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
    val sigDec = toList1 [(objectSigId, qSig)]
    val program = [ModuleDecSig sigDec]
    val sigDeps = []
  in
    (objectSigId, Portable program, sigDeps, errs'6)
  end


(* Object structure *)

fun addObjectInterfaceConvStrDecs repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNInterfaces
    ObjectInfo.getInterface
    (makeInterfaceConvStrDec repo rootObjectIRef objectIRef)

fun addObjectConstantStrDecs x =
  revFoldMapInfosWithErrs
    ObjectInfo.getNConstants
    ObjectInfo.getConstant
    makeConstantStrDec
    x

fun addObjectMethodStrDecsLowLevel
  isPolyML
  repo
  libId
  addInitStrDecs
  rootObjectIRef
  objectIRef =
  addFunctionStrDecsLowLevel
    (ObjectInfo.getNMethods, ObjectInfo.getMethod)
    isPolyML
    repo
    libId
    addInitStrDecs
    (SOME (rootObjectIRef, objectIRef))

fun addObjectMethodStrDecsHighLevel repo rootObjectIRef objectIRef =
  revFoldMapInfosWithErrs
    ObjectInfo.getNMethods
    ObjectInfo.getMethod
    (makeFunctionStrDecHighLevel repo (SOME (rootObjectIRef, objectIRef)))

fun addObjectSignalStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, x, errs)) =>
    let
      val (localStrDecs, x', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNSignals
          ObjectInfo.getSignal
          (makeSignalStrDec repo objectIRef)
          (objectInfo, ([], x, errs))
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
            (strDec :: strDecs, x', errs')
          end
      | _      => (strDecs, x', errs')
    end

fun addObjectPropertyStrDecs repo objectIRef =
  fn (objectInfo, (strDecs, x, errs)) =>
    let
      val (localStrDecs, x', errs') =
        revFoldMapInfosWithErrs
          ObjectInfo.getNProperties
          ObjectInfo.getProperty
          (makePropertyStrDec repo objectIRef)
          (objectInfo, ([], x, errs))
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
            (strDec :: strDecs, x', errs')
          end
      | _      => (strDecs, x', errs')
    end

fun makeObjectStr
  (repo            : 'a RepositoryClass.class)
  (vers            : Repository.typelibvers_t)
  (libId           : id)
  (objectNamespace : string)
  (objectInfo      : 'b ObjectInfoClass.class)
  (errs'0          : infoerrorhier list)
  : id * (spec list * strdec list) * program * interfaceref list * infoerrorhier list =
  let
    val () = checkDeprecated objectInfo

    val getTypeSymbol = ObjectInfo.getTypeInit objectInfo

    val objectName = getName objectInfo
    val objectIRef = {
      namespace = objectNamespace,
      name      = objectName,
      scope     = LOCALINTERFACESELF,
      ty        = CLASS
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
         * infoerrorhier list =
      ([], ([], ListDict.empty), errs'0)
    val acc'1 = addObjectPropertyStrDecs repo objectIRef (objectInfo, acc'0)
    val acc'2 = addObjectSignalStrDecs repo objectIRef (objectInfo, acc'1)
    val acc'3 =
      addObjectMethodStrDecsHighLevel
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'2)
    val acc'4 = addGetTypeFunctionStrDecHighLevel typeIRef acc'3
    val acc'5 = addObjectConstantStrDecs (objectInfo, acc'4)
    val acc'6 =
      addObjectInterfaceConvStrDecs
        repo
        rootObjectIRef
        objectIRef
        (objectInfo, acc'5)
    val (strDecs'6, (iRefs'6, structDeps'6), errs'6) = acc'6

    val strIRefs =
      objectIRef :: iRefs'6  (* `objectIRef` for class structure dependence *)

    val numProps = ObjectInfo.getNProperties objectInfo
    val revPropLocalTypes = makePropertyLocalTypes isGObject numProps
    val strDecs'7 =
      revMapAppend makeLocalTypeStrDec (revPropLocalTypes, strDecs'6)

    (*
     *     type t = base class
     *)
    val tTypeDec = mkTypeDec (tTyName, classTy baseTy)
    val strDecs'8 = StrDecDec tTypeDec :: strDecs'7

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
    val strDecs'9 = revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'8)

    fun mkModule isPolyML =
      let
        val (strDecs'10, _) =
          addObjectMethodStrDecsLowLevel
            isPolyML
            repo
            libId
            (
              addGetTypeFunctionStrDecLowLevel
                repo
                vers
                libId
                objectNamespace
                getTypeSymbol
            )
            rootObjectIRef
            objectIRef
            (objectInfo, (strDecs'9, errs'6))

        val strDecs'11 =
          revMapAppend mkStructStrDec
            (ListDict.toList structDeps'6, strDecs'10)

        val struct1 = mkBodyStruct strDecs'11

        (* sig *)
        val sig1 = SigName objectSigId
        val sigQual'1 = revMap makeLocalTypeStrModuleQual revPropLocalTypes
        val sigQual'2 =
          revMapAppend makeLocalTypeStrModuleQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)

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
          revMapAppend makeLocalTypeStrSpecQual (revLocalTypes, sigQual'1)
        val qSig : qsig = (sig1, sigQual'2)
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
      objectStrId,
      ([objectSpec], [objectStrDec]),
      Specific {mlton = programMLton, polyml = programPolyML},
      strIRefs,
      errs'6
    )
  end
