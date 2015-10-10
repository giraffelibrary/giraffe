(* --------------------------------------------------------------------------
 * Common functions
 * -------------------------------------------------------------------------- *)

fun addGetTypeFunctionSpec (typeIRef : interfaceref) (specs, iRefs, errs) =
  let
    val specs' = getTypeSpec typeIRef :: specs

    val iRef as {scope, ...} = typeIRef
    val iRefs' =
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
  in
    (specs', iRefs', errs)
  end

fun addGetTypeFunctionStrDecHighLevel
  (typeIRef : interfaceref)
  (strDecs, iRefs, errs) =
  let
    val strDecs' = getTypeStrDecHighLevel :: strDecs

    val iRef as {scope, ...} = typeIRef
    val iRefs' =
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
  in
    (strDecs', iRefs', errs)
  end

fun addGetTypeFunctionStrDecLowLevel
  repo
  vers
  libId
  namespace
  getTypeSymbol
  isPolyML
  (strDecs, errs) =
  let
    val getTypeLibId =
      if namespace = "GLib"
      then getSharedLibraryId repo vers "GObject"
      else libId

    val strDecs' =
      (
        if isPolyML
        then getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol
        else getTypeStrDecLowLevelMLton getTypeSymbol
      ) :: strDecs
  in
    (strDecs', errs)
  end


type localtype = {
  tyVars    : (bool * id) list,
  tyId      : id,
  varTys    : ty list,
  tyStrLId  : lid,
  tyNameLId : lid
}

fun makeIRefLocalType iRef : localtype =
  let
    val nTys = numInterfaceRefTyVars iRef
    val (tyVars, _) = makeTyList makeTyVar (nTys, 0)
  in
    {
      tyVars    = tyVars,
      tyId      = makeLocalInterfaceId iRef,
      varTys    = map TyVar tyVars,
      tyStrLId  = toList1 [makeIRefInterfaceOtherStrId iRef, tId],
      tyNameLId = toList1 [makeIRefNamespaceStrId iRef, tId]
    }
  end

fun makeLocalTypeSpec ({tyVars, tyId, ...} : localtype) : spec =
  SpecType (false, toList1 [((tyVars, tyId), NONE)])

fun makeLocalTypeStrDec ({tyVars, tyId, varTys, tyStrLId, ...} : localtype) =
  StrDecDec (DecType (toList1 [((tyVars, tyId), TyRef (varTys, tyStrLId))]))

fun makeLocalTypeStrModuleQual ({tyVars, tyId, varTys, tyStrLId, ...} : localtype) =
  toList1 [((tyVars, toList1 [tyId]), TyRef (varTys, tyStrLId))]

fun makeLocalTypeStrSpecQual ({tyVars, tyId, varTys, tyNameLId, ...} : localtype) =
  toList1 [((tyVars, toList1 [tyId]), TyRef (varTys, tyNameLId))]





fun mkLocalId (_, strName, id) = concat [toLCU strName, "_", id]

fun mkLocalStrModuleLId (strNamespace, strName, id) =
  toList1 [toUCC strNamespace ^ toUCC strName, id]

fun mkLocalStrSpecLId (name as (strNamespace, strName, id)) =
  case strNamespace of
    "" => toList1 [mkLocalId name] (* not present in namespace, use local *)
  | _  => toList1 [toUCC strName, id]

fun mkGlobalLId (strNamespace, strName, id) =
  toList1 [toUCC strNamespace, toUCC strName, id]

fun toSpec (tyVars, name) = mkTypeSpec ((tyVars, mkLocalId name), NONE)
fun toLocalType (tyVars, name) =
  let
  in
    {
      tyVars    = tyVars,
      tyId      = mkLocalId name,
      varTys    = map TyVar tyVars,
      tyStrLId  = mkLocalStrModuleLId name,
      tyNameLId = mkLocalStrSpecLId name
    }
  end


local
  val objectTyVar = (false, "object")
  val propertyTemplates = [
    ([objectTyVar, aTyVar], ("", "Property", "readonly")),
    ([objectTyVar, aTyVar], ("", "Property", "writeonly")),
    ([objectTyVar, aTyVar, bTyVar], ("", "Property", "readwrite"))
  ]
  val revPropertySpecs = revMap toSpec propertyTemplates
  val revPropertyLocalTypes = revMap toLocalType propertyTemplates
in
  (*
   * `addPropertySpecs namespace numProps specs` adds
   *
   *                                                             -.
   *     type ('object, 'a) property_readonly                     | isGObject
   *     type ('object, 'a) property_writeonly                    |  and P > 0
   *     type ('object, 'a, 'b) property_readwrite                |
   *                                                             -'
   *
   * to `specs`.
   *)
  fun addPropertySpecs namespace numProps specs =
    let
      val isGObject = namespace = "GObject"
    in
      if isGObject andalso numProps > 0
      then List.revAppend (revPropertySpecs, specs)
      else specs
    end

  (*
   * `makePropertyLocalTypes isGObject numProps` returns `revLocalTypes` such
   * that `revMap makeLocalTypeStrDec revLocalTypes` produces strdec values
   * as follows:
   *
   *                                                             -.
   *     type ('object, 'a) property_readonly =                   |
   *       ('object, 'a) Property.readonly                        |
   *     type ('object, 'a) property_writeonly =                  | isGObject
   *       ('object, 'a) Property.writeonly                       |  and P > 0
   *     type ('object, 'a, 'b) property_readwrite =              |
   *       ('object, 'a) Property.readwrite                       |
   *                                                             -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                             -.
   *     where type ('object, 'a) property_readonly =             |
   *       ('object, 'a) Property.readonly                        |
   *     where type ('object, 'a) property_writeonly =            | isGObject
   *       ('object, 'a) Property.writeonly                       |  and P > 0
   *     where type ('object, 'a, 'b) property_readwrite =        |
   *       ('object, 'a) Property.readwrite                       |
   *                                                             -'
   *)
  fun makePropertyLocalTypes isGObject numProps =
    if isGObject andalso numProps > 0
    then revPropertyLocalTypes
    else []
end


local
  val accessorName = ("GObject", "Value", "accessor")
  val accessorTemplate = ([aTyVar, bTyVar], accessorName)

  val accessorGlobalLId : lid = mkGlobalLId accessorName
  val accessorLocalId : id = mkLocalId accessorName
  val accessorLocalLId : lid = toList1 [accessorLocalId]
  val accessorSpec = toSpec accessorTemplate
  val accessorLocalType = toLocalType accessorTemplate
in
  (*
   * `addAccessorSpecs namespace info (readTy, writeTy) isPtr specs` adds
   *
   *                                                     -.
   *     type ('a, 'b) value_accessor                     |
   *     val t : (base t, 'a t) value_accessor            |
   *                                        -.            | isGObject
   *     val tOpt :                          |            |
   *      (base t option, 'a t option)       | isPtr      |
   *        value_accessor                   |            |
   *                                        -'           -'
   *                                                     -.
   *     val t : (base t, 'a t) GObject.Value.accessor    |
   *                                        -.            |
   *     val tOpt :                          |            | not isGObject
   *       (base t option, 'a t option)      | isPtr      |
   *         GObject.Value.accessor          |            |
   *                                        -'           -'
   *
   * to `specs`.
   *)
  fun addAccessorSpecs namespace info (readTy, writeTy) isPtr specs =
    case RegisteredTypeInfo.getTypeInit info of
      SOME _ =>
        let
          val isGObject = namespace = "GObject"

          val accessorTys = [readTy, writeTy]
          fun addValSpecs accessorLId specs =
            mkValSpec (tId, TyRef (accessorTys, accessorLId))
             :: (
              if isPtr
              then
                mkValSpec (tOptId, TyRef (map optionTy accessorTys, accessorLId))
                 :: specs
              else
                specs
            )
        in
          if isGObject
          then accessorSpec :: addValSpecs accessorLocalLId specs
          else addValSpecs accessorGlobalLId specs
        end
    | NONE   => specs

  (*
   * `makeAccessorLocalTypes isGObject` returns `revLocalTypes` such
   * that `revMap makeLocalTypeStrDec revLocalTypes` produces strdec values
   * as follows:
   *
   *                                                 -.
   *     type ('a, 'b) value_accessor =               | isGObject
   *       ('a, 'b) GObjectValue.accessor             |
   *                                                 -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                 -.
   *     where                                        |
   *       type ('a, 'b) value_accessor =             | isGObject
   *         ('a, 'b) GObjectValue.accessor           |
   *                                                 -'
   *)
  fun makeAccessorLocalTypes isGObject =
    if isGObject
    then [accessorLocalType]
    else []
end

(*
 * `addAccessorRootStrDecs repo libId namespace info` returns
 * `(add, revLocalTypes)` where `add (valueType, isPtr) isPolyML strDecs`
 * prepends the following to `strDecs` when `info` is a registered GType,
 * i.e.
 *
 *   RegisteredTypeInfo.getTypeInit info
 *
 * returns is `SOME _`.
 *
 *                                                           -.
 *     local                                                  |
 *       open PolyMLFFI                                       |
 *     in                                                     |
 *       val getType_ =                                       |
 *         call                                               |
 *           (load_sym <libId> "<getTypeSymbol>")             |
 *           (FFI.PolyML.VOID --> GObjectType.PolyML.VAL);    |
 *                                                            |
 *       val getValue_ =                                      |
 *         call                                               |
 *           (load_sym <valueLibId> "g_value_get_<valueType>")|
 *           (GObjectValue.PolyML.PTR --> <retConv>);         |
 *                                                            |
 *                                             -.             |
 *       val getOptValue_ =                     | isPtr       |
 *         call                                 |             | Poly/ML only
 *           (load_sym <valueLibId> "g_value_get_<valueType>")|
 *           (GObjectValue.PolyML.PTR --> <retOptConv>);      |
 *                                             -'             |
 *                                                            |
 *       val setValue_ =                                      |
 *         call                                               |
 *           (load_sym <valueLibId> "g_value_set_<valueType>")|
 *           (GObjectValue.PolyML.PTR &&> <parConv> --> FFI.PolyML.VOID);
 *                                                            |
 *                                             -.             |
 *       val setOptValue_ =                     | isPtr       |
 *         call                                 |             |
 *           (load_sym <valueLibId> "g_value_set_<valueType>")|
 *           (GObjectValue.PolyML.PTR &&> <parOptConv> --> FFI.PolyML.VOID);
 *                                             -'             |
 *     end                                                    |
 *                                                           -'
 *                                                           -.
 *     val getType_ =                                         |
 *       _import "<getTypeSymbol>" : unit -> GObjectType.C.val_;
 *                                                            |
 *     val getValue_ =                                        |
 *       _import "g_value_get_<valueType>" :                  |
 *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> <retType>;
 *                                                            |
 *                                           -.               |
 *     val getOptValue_ =                     |               |
 *       _import "g_value_get_<valueType>" :  | isPtr         |
 *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *          -> <retOptType>;                  |               | MLton only
 *                                           -'               |
 *                                                            |
 *     val setValue_ =                                        |
 *       fn x1 & x2 =>                                        |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *             * <parType>                                    |
 *             -> unit;)                                      |
 *         (x1, x2)                                           |
 *                                                            |
 *                                           -.               |
 *     val setOptValue_ =                     | isPtr         |
 *       fn x1 & x2 =>                        |               |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.C.notnull GObjectValueRecord.C.p
 *             * <parOptType>                 |               |
 *             -> unit;)                      |               |
 *         (x1, x2)                           |               |
 *                                           -'              -'
 *                                                           -.
 *     type ('a, 'b) value_accessor =                         | isGObject
 *       ('a, 'b) GObjectValue.accessor                       |
 *                                                           -'
 *     val t =
 *       GObjectValue.C.createAccessor {
 *         getType  = (I ---> GObjectType.C.fromVal) getType_,
 *         getValue = (I ---> <fromFun>) getValue_,
 *         setValue = (I &&&> <withFun> ---> I) setValue_
 *       }
 *
 *                                           -.
 *     val tOpt =                             | isPtr
 *       GObjectValue.C.createAccessor {      |
 *         getType  = (I ---> GObjectType.C.fromVal) getType_,
 *         getValue = (I ---> <fromOptFun>) getOptValue_,
 *         setValue = (I &&&> <withOptFun> ---> I) setOptValue_
 *       }                                    |
 *                                           -'
 *
 * where
 *
 *
 *   ObjectNamespace
 *     is defined as
 *
 *         GObject
 *           if namespace = "GLib"
 *
 *         EnumNamespace
 *           otherwise
 *
 *
 *   parType and retType
 *     are defined as
 *
 *         C.notnull C.p
 *           if isPtr
 *
 *         C.val_
 *           otherwise
 *
 *
 *   parConv and retConv
 *     are defined as
 *
 *         PolyML.PTR
 *           if isPtr
 *
 *         PolyML.VAL
 *           otherwise
 *
 *
 *   fromFun
 *     is defined as
 *
 *         C.fromPtr false
 *           if isPtr
 *
 *         C.fromVal
 *           otherwise
 *
 *
 *   withFun
 *     is defined as
 *
 *         C.withPtr
 *           if isPtr
 *
 *         C.withVal
 *           otherwise
 *
 *
 *   valueLibId
 *     is `getSharedLibraryId repo vers "GObject"`
 *
 *)
local
  (*
   *     val t<Opt> =
   *       GObjectValue.C.createAccessor {
   *         getType  = (I ---> GObjectType.C.fromVal) getType_,
   *         getValue = (I ---> <from<Opt>Fun>) get<Opt>Value_,
   *         setValue = (I &&&> <with<Opt>Fun> ---> I) set<Opt>Value_
   *       }
   *)
  val getTypeExp =
    ExpApp (
      mkParenExp (
        mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", "C", fromValId])
      ),
      mkIdLNameExp getTypeUId
    )
  fun getValueExp ptrOpt =
    let
      val fromFunExp =
        case ptrOpt of
          NONE       => mkLIdLNameExp ["C", fromValId]
        | SOME isOpt =>
            ExpApp (
              mkLIdLNameExp ["C", if isOpt then fromOptPtrId else fromPtrId],
              mkIdLNameExp "false"
          )
    in
      ExpApp (
        mkParenExp (mkDDDRExp (iExp, fromFunExp)),
        mkIdLNameExp (
          case ptrOpt of
            SOME true => getOptValueUId
          | _         => getValueUId
        )
      )
    end
  fun setValueExp ptrOpt =
    let
      val withFunExp =
        case ptrOpt of
          NONE       => mkLIdLNameExp ["C", withValId]
        | SOME false => mkLIdLNameExp ["C", withPtrId]
        | SOME true  => mkLIdLNameExp ["C", withOptPtrId]
    in
      ExpApp (
        mkParenExp (mkDDDRExp (mkAAARExp (iExp, withFunExp), iExp)),
        mkIdLNameExp (
          case ptrOpt of
            SOME true => setOptValueUId
          | _         => setValueUId
        )
      )
    end
  fun tStrDec ptrOpt =
    StrDecDec (
      mkIdValDec (
        case ptrOpt of SOME true => tOptId | _ => tId,
        ExpApp (
          mkLIdLNameExp ["GObjectValue", "C", "createAccessor"],
          ExpRec [
            (getTypeId, getTypeExp),
            (getValueId, getValueExp ptrOpt),
            (setValueId, setValueExp ptrOpt)
          ]
        )
      )
    )


  (* Low-level MLton *)

  (*
   *     val getValue_ =
   *       _import "g_value_get_<valueType>" :
   *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p
   *          -> <retType>;
   *)
  fun getValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val retTy =
        case ptrOpt of
          NONE       => mkLIdTy ["C", valId]
        | SOME isOpt => mkPtrTy isOpt [CId]
    in
      StrDecDec (
        mkIdValDec (
          getValueUId,
          callMLtonFFIExp ("g_value_get_" ^ valueType) (
            [
              mkPtrTy false
                (prefixInterfaceStrId valueIRef [CId])
            ],
            retTy
          )
        )
      )
    end

  (*
   *     val setValue_ =
   *       _import "g_value_set_<valueType>" :
   *         GObjectValueRecord.C.notnull GObjectValueRecord.C.p * <parType>
   *          -> unit;
   *)
  fun setValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val parTy =
        case ptrOpt of
          NONE       => mkLIdTy [CId, valId]
        | SOME isOpt => mkPtrTy isOpt [CId]
    in
      StrDecDec (
        mkIdValDec (
          setValueUId,
          callMLtonFFIExp ("g_value_set_" ^ valueType) (
            [
              mkPtrTy false
                (prefixInterfaceStrId valueIRef [CId]),
              parTy
            ],
            unitTy
          )
        )
      )
    end

  fun addStrDecsLowLevelMLton
    namespace
    getTypeSymbol
    valueType
    isPtr
    strDecs =
    let
      val valueIRef = makeValueIRef namespace (SOME "")
    in
      if isPtr
      then
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) (SOME false)
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) (SOME true)
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) (SOME false)
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) (SOME true)
         :: strDecs
      else
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton (valueIRef, valueType) NONE
         :: setValueStrDecLowLevelMLton (valueIRef, valueType) NONE
         :: strDecs
    end


  (* Low-level Poly/ML *)

  (*
   *     val getValue_ =
   *       call
   *         (load_sym <valueLibId> "g_value_get_<valueType>")
   *         (GObjectValueRecord.PolyML.PTR --> <retConv>);
   *)
  fun getValueStrDecLowLevelPolyML (valueLibId, valueIRef, valueType) ptrOpt =
    let
      val parConvs =
        mkLIdLNameExp (prefixInterfaceStrId valueIRef [PolyMLId, PTRId])
      val convId =
        case ptrOpt of
          NONE       => VALId
        | SOME false => PTRId
        | SOME true  => OPTPTRId
      val retConv = mkLIdLNameExp [PolyMLId, convId]
      val getTypeSymbol = "g_value_get_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          getValueUId,
          callPolyMLFFIExp valueLibId getTypeSymbol (parConvs, retConv)
        )
      )
    end

  (*
   *     val setValue_ =
   *       call
   *         (load_sym <valueLibId> "g_value_set_<valueType>")
   *         (GObjectValueRecord.PolyML.PTR &&> <parConv> --> FFI.PolyML.VOID);
   *)
  fun setValueStrDecLowLevelPolyML (valueLibId, valueIRef, valueType) ptrOpt =
    let
      val convId =
        case ptrOpt of
          NONE       => VALId
        | SOME false => PTRId
        | SOME true  => OPTPTRId
      val parConv = mkLIdLNameExp [PolyMLId, convId]
      val parConvs =
        mkAARExp (
          mkLIdLNameExp (
            prefixInterfaceStrId valueIRef [PolyMLId, PTRId]
          ),
          parConv
        )
      val retConv = mkLIdLNameExp [FFIId, PolyMLId, VOIDId]
      val getTypeSymbol = "g_value_set_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          setValueUId,
          callPolyMLFFIExp valueLibId getTypeSymbol (parConvs, retConv)
        )
      )
    end

  fun addStrDecsLowLevelPolyML
    repo
    vers
    libId
    namespace
    getTypeSymbol
    valueType
    isPtr
    strDecs =
    let
      val valueIRef = makeValueIRef namespace (SOME "")
      val gobjectLibId = getSharedLibraryId repo vers "GObject"
      val getTypeLibId =
        if namespace = "GLib"
        then gobjectLibId
        else libId
      val valueArgs = (gobjectLibId, valueIRef, valueType)
      val localStrDecs =
        if isPtr
        then
          [
            getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs (SOME false),
            getValueStrDecLowLevelPolyML valueArgs (SOME true),
            setValueStrDecLowLevelPolyML valueArgs (SOME false),
            setValueStrDecLowLevelPolyML valueArgs (SOME true)
          ]
        else
          [
            getTypeStrDecLowLevelPolyML getTypeLibId getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs NONE,
            setValueStrDecLowLevelPolyML valueArgs NONE
          ]
    in
      mkPolyMLFFILocalStrDec localStrDecs :: strDecs
    end
in
  fun addAccessorRootStrDecs
    repo
    vers
    libId
    namespace
    info =
    case RegisteredTypeInfo.getTypeInit info of
      SOME getTypeSymbol =>
        let
          val isGObject = namespace = "GObject"
          val revLocalTypes = makeAccessorLocalTypes isGObject

          fun addStrDecsLowLevel (valueType, isPtr) isPolyML strDecs =
            let
              val strDecs'1 =
                if isPtr
                then tStrDec (SOME false) :: tStrDec (SOME true) :: strDecs
                else tStrDec NONE :: strDecs
              val strDecs'2 =
                revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'1)

              val strDecs'3 = (
                if isPolyML
                then addStrDecsLowLevelPolyML repo vers libId
                else addStrDecsLowLevelMLton
              )
                namespace getTypeSymbol valueType isPtr strDecs'2
            in
              strDecs'3
            end
        in
          (addStrDecsLowLevel, revLocalTypes)
        end
    | NONE               => (K (K I), [])
end
