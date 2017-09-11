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
  (strDecs, (iRefs, structDeps), errs) =
  let
    val strDecs' = getTypeStrDecHighLevel :: strDecs

    val iRef as {scope, ...} = typeIRef
    val iRefs' =
      case scope of
        GLOBAL             => iRefs
      | LOCALINTERFACESELF => iRefs
      | _                  => insert (iRef, iRefs)
  in
    (strDecs', (iRefs', structDeps), errs)
  end

fun addGetTypeFunctionStrDecLowLevel
  getTypeSymbol
  isPolyML
  (strDecs, errs) =
  let
    val strDecs' =
      (
        if isPolyML
        then getTypeStrDecLowLevelPolyML getTypeSymbol
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
    val id = makeLocalInterfaceSelfId iRef
  in
    {
      tyVars    = tyVars,
      tyId      = makeLocalInterfaceId iRef,
      varTys    = map TyVar tyVars,
      tyStrLId  = toList1 [makeIRefInterfaceOtherStrId iRef, id],
      tyNameLId = toList1 [makeIRefNamespaceStrId iRef, id]
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





fun mkLocalId name (_, strName, _, id) =
  if strName = name
  then id
  else concat [toLCU strName, "_", id]

fun mkLocalStrModuleLId (strNamespace, strName, strType, id) =
  toList1 [toUCC strNamespace ^ toUCC strName ^ toUCC strType, id]

fun mkLocalStrSpecLId name (tyName as (strNamespace, strName, strType, id)) =
  case strNamespace of
    "" => toList1 [mkLocalId name tyName] (* not in a namespace, use local *)
  | _  => toList1 [toUCC strName ^ toUCC strType, id]

fun mkGlobalLId (strNamespace, strName, strType, id) =
  toList1 [toUCC strNamespace, toUCC strName ^ toUCC strType, id]

fun toSpec name (tyVars, tyName) = mkTypeSpec ((tyVars, mkLocalId name tyName), NONE)
fun toLocalType name (tyVars, tyName) =
  let
  in
    {
      tyVars    = tyVars,
      tyId      = mkLocalId name tyName,
      varTys    = map TyVar tyVars,
      tyStrLId  = mkLocalStrModuleLId tyName,
      tyNameLId = mkLocalStrSpecLId name tyName
    }
  end

local
  val signalTemplate = ([aTyVar], ("", "Signal", "", "t"))
  val signalSpec = toSpec "" signalTemplate
  val signalLocalType = toLocalType "" signalTemplate
in
  (*
   * `addSignalSpecs namespace numSigs specs` adds
   *
   *                                                       -.
   *     type 'a signal_t                                   | isGObject
   *                                                       -'  and numSigs > 0
   *
   * to `specs`.
   *)
  fun addSignalSpecs namespace numSigs specs =
    let
      val isGObject = namespace = "GObject"
    in
      if isGObject andalso numSigs > 0
      then signalSpec :: specs
      else specs
    end

  (*
   * `makeSignalLocalTypes isGObject numSigs` returns `revLocalTypes` such
   * that `revMap makeLocalTypeStrDec revLocalTypes` produces strdec values
   * as follows:
   *
   *                                                       -.
   *     type 'a signal_t = Signal.t                        | isGObject
   *                                                       -'  and numSigs > 0
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                       -.
   *     where type 'a signal_t = Signal.t                  | isGObject
   *                                                       -'  and numSigs > 0
   *)
  fun makeSignalLocalTypes isGObject numSigs =
    if isGObject andalso numSigs > 0
    then [signalLocalType]
    else []
end


local
  val objectTyVar = (false, "object")
  val propertyTemplates = [
    ([objectTyVar, aTyVar], ("", "Property", "", "readonly")),
    ([objectTyVar, aTyVar], ("", "Property", "", "writeonly")),
    ([objectTyVar, aTyVar, bTyVar], ("", "Property", "", "readwrite"))
  ]
  val revPropertySpecs = revMap (toSpec "") propertyTemplates
  val revPropertyLocalTypes = revMap (toLocalType "") propertyTemplates
in
  (*
   * `addPropertySpecs namespace numProps specs` adds
   *
   *                                                       -.
   *     type ('object, 'a) property_readonly               | isGObject
   *     type ('object, 'a) property_writeonly              |  and numProps > 0
   *     type ('object, 'a, 'b) property_readwrite          |
   *                                                       -'
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
   *                                                       -.
   *     type ('object, 'a) property_readonly =             |
   *       ('object, 'a) Property.readonly                  |
   *     type ('object, 'a) property_writeonly =            | isGObject
   *       ('object, 'a) Property.writeonly                 |  and numProps > 0
   *     type ('object, 'a, 'b) property_readwrite =        |
   *       ('object, 'a) Property.readwrite                 |
   *                                                       -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                       -.
   *     where type ('object, 'a) property_readonly =       |
   *       ('object, 'a) Property.readonly                  |
   *     where type ('object, 'a) property_writeonly =      | isGObject
   *       ('object, 'a) Property.writeonly                 |  and numProps > 0
   *     where type ('object, 'a, 'b) property_readwrite =  |
   *       ('object, 'a) Property.readwrite                 |
   *                                                       -'
   *)
  fun makePropertyLocalTypes isGObject numProps =
    if isGObject andalso numProps > 0
    then revPropertyLocalTypes
    else []
end


local
  val accessorName = ("GObject", "Value", "", "accessor")
  val accessorTemplate = ([aTyVar, bTyVar], accessorName)

  val accessorGlobalLId : lid = mkGlobalLId accessorName
  val accessorLocalId : id = mkLocalId "" accessorName
  val accessorLocalLId : lid = toList1 [accessorLocalId]
  val accessorSpec = toSpec "" accessorTemplate
  val accessorLocalType = toLocalType "" accessorTemplate
in
  (*
   * `addAccessorSpecs namespace info (readTy, writeTy) isPtr specs` adds
   *
   *                                                          -.
   *     type ('a, 'b) value_accessor                          |
   *     val t : (<readTy>, <writeTy>) value_accessor          |
   *                                           -.              | isGObject
   *     val tOpt :                             |              |
   *       (<readTy> option, <writeTy> option)  | isPtr        |
   *         value_accessor                     |              |
   *                                           -'             -'
   *                                                          -.
   *     val t : (<readTy>, <writeTy>) GObject.Value.accessor  |
   *                                           -.              |
   *     val tOpt :                             |              | not isGObject
   *       (<readTy> option, <writeTy> option)  | isPtr        |
   *         GObject.Value.accessor             |              |
   *                                           -'             -'
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

  (*
   * `addAccessorIRefs` ...
   *)
  fun addAccessorIRefs isGObject iRefs =
    let
      val iRef =
        {
          namespace = "GObject",
          name      = "Value",
          scope     = LOCALINTERFACEOTHER,
          ty        = SIMPLE
        }
    in
      if isGObject
      then iRef :: iRefs
      else iRefs
    end
end

(*
 * `addAccessorRootStrDecs namespace info` returns
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
 *           (getSymbol "<getTypeSymbol>")                    |
 *           (cVoid --> GObjectType.PolyML.cVal);             |
 *                                                            |
 *       val getValue_ =                                      |
 *         call                                               |
 *           (getSymbol "g_value_get_<valueType>")            |
 *           (GObjectValueRecord.PolyML.cPtr --> <retConv>);  |
 *                                                            |
 *                                             -.             |
 *       val getOptValue_ =                     | isPtr       |
 *         call                                 |             | Poly/ML only
 *           (getSymbol "g_value_get_<valueType>")            |
 *           (GObjectValueRecord.PolyML.cPtr --> <retOptConv>);
 *                                             -'             |
 *                                                            |
 *       val setValue_ =                                      |
 *         call                                               |
 *           (getSymbol "g_value_set_<valueType>")            |
 *           (GObjectValueRecord.PolyML.cPtr &&> <parConv> --> cVoid);
 *                                                            |
 *                                             -.             |
 *       val setOptValue_ =                     | isPtr       |
 *         call                                 |             |
 *           (getSymbol "g_value_set_<valueType>")            |
 *           (GObjectValueRecord.PolyML.cPtr &&> <parOptConv> --> cVoid);
 *                                             -'             |
 *     end                                                    |
 *                                                           -'
 *                                                           -.
 *     val getType_ =                                         |
 *       _import "<getTypeSymbol>" : unit -> GObjectType.FFI.val_;
 *                                                            |
 *     val getValue_ =                                        |
 *       _import "g_value_get_<valueType>" :                  |
 *         GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> <retType>;
 *                                                            |
 *                                           -.               |
 *     val getOptValue_ =                     |               |
 *       _import "g_value_get_<valueType>" :  | isPtr         |
 *         GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
 *          -> <retOptType>;                  |               | MLton only
 *                                           -'               |
 *                                                            |
 *     val setValue_ =                                        |
 *       fn x1 & x2 =>                                        |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
 *             * <parType>                                    |
 *             -> unit;)                                      |
 *         (x1, x2)                                           |
 *                                                            |
 *                                           -.               |
 *     val setOptValue_ =                     | isPtr         |
 *       fn x1 & x2 =>                        |               |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
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
 *         getType  = (I ---> GObjectType.FFI.fromVal) getType_,
 *         getValue = (I ---> <fromFun>) getValue_,
 *         setValue = (I &&&> <withFun> ---> I) setValue_
 *       }
 *
 *                                           -.
 *     val tOpt =                             | isPtr
 *       GObjectValue.C.createAccessor {      |
 *         getType  = (I ---> GObjectType.FFI.fromVal) getType_,
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
 *         PolyML.cPtr
 *           if isPtr
 *
 *         PolyML.cVal
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
 *)
local
  (*
   *     val t<Opt> =
   *       GObjectValue.C.createAccessor {
   *         getType  = (I ---> GObjectType.FFI.fromVal) getType_,
   *         getValue = (I ---> <from<Opt>Fun>) get<Opt>Value_,
   *         setValue = (I &&&> <with<Opt>Fun> ---> I) set<Opt>Value_
   *       }
   *)
  val getTypeExp =
    ExpApp (
      mkParenExp (
        mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", ffiStrId, fromValId])
      ),
      mkIdLNameExp getTypeUId
    )
  fun getValueExp ptrOpt =
    let
      val fromFunExp =
        case ptrOpt of
          NONE       => mkLIdLNameExp [ffiStrId, fromValId]
        | SOME isOpt =>
            ExpApp (
              mkLIdLNameExp [ffiStrId, if isOpt then fromOptPtrId else fromPtrId],
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
          NONE       => mkLIdLNameExp [ffiStrId, withValId]
        | SOME false => mkLIdLNameExp [ffiStrId, withPtrId]
        | SOME true  => mkLIdLNameExp [ffiStrId, withOptPtrId]
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
          mkLIdLNameExp ["GObjectValue", cStrId, "createAccessor"],
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
   *     val get<Opt>Value_ =
   *       _import "g_value_get_<valueType>" :
   *         GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
   *          -> <retType>;
   *)
  fun getValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val retTy =
        makeLowLevelTy false [ffiStrId] (
          case ptrOpt of
            NONE       => VAL
          | SOME isOpt => PTR {optDir = NONE, isOpt = isOpt}
        )
    in
      StrDecDec (
        mkIdValDec (
          case ptrOpt of SOME true => getOptValueUId | _ => getValueUId,
          callMLtonFFIExp ("g_value_get_" ^ valueType) (
            [
              makeLowLevelTy false
                (prefixInterfaceStrId valueIRef [ffiStrId])
                (PTR {optDir = NONE, isOpt = false})
            ],
            retTy
          )
        )
      )
    end

  (*
   *     val set<Opt>Value_ =
   *       _import "g_value_set_<valueType>" :
   *         GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * <parType>
   *          -> unit;
   *)
  fun setValueStrDecLowLevelMLton (valueIRef, valueType) ptrOpt =
    let
      val parTy =
        makeLowLevelTy false [ffiStrId] (
          case ptrOpt of
            NONE       => VAL
          | SOME isOpt => PTR {optDir = NONE, isOpt = isOpt}
        )
    in
      StrDecDec (
        mkIdValDec (
          case ptrOpt of SOME true => setOptValueUId | _ => setValueUId,
          callMLtonFFIExp ("g_value_set_" ^ valueType) (
            [
              makeLowLevelTy false
                (prefixInterfaceStrId valueIRef [ffiStrId])
                (PTR {optDir = NONE, isOpt = false}),
              parTy
            ],
            unitTy
          )
        )
      )
    end

  fun addStrDecsLowLevelMLton
    getTypeSymbol
    valueArgs
    isPtr
    strDecs =
    let
    in
      if isPtr
      then
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton valueArgs (SOME false)
         :: getValueStrDecLowLevelMLton valueArgs (SOME true)
         :: setValueStrDecLowLevelMLton valueArgs (SOME false)
         :: setValueStrDecLowLevelMLton valueArgs (SOME true)
         :: strDecs
      else
        getTypeStrDecLowLevelMLton getTypeSymbol
         :: getValueStrDecLowLevelMLton valueArgs NONE
         :: setValueStrDecLowLevelMLton valueArgs NONE
         :: strDecs
    end


  (* Low-level Poly/ML *)

  (*
   *     val get<Opt>Value_ =
   *       call
   *         (getSymbol "g_value_get_<valueType>")
   *         (GObjectValueRecord.PolyML.cPtr --> <retConv>);
   *)
  fun getValueStrDecLowLevelPolyML (valueIRef, valueType) ptrOpt =
    let
      val parConvs =
        makeConv
          (prefixInterfaceStrId valueIRef [polyMLStrId])
          (PTR {optDir = NONE, isOpt = false})
      val retConv =
        makeConv [polyMLStrId] (
          case ptrOpt of
            NONE       => VAL
          | SOME isOpt => PTR {optDir = NONE, isOpt = isOpt}
        )
      val getTypeSymbol = "g_value_get_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          case ptrOpt of SOME true => getOptValueUId | _ => getValueUId,
          callPolyMLFFIExp getTypeSymbol (parConvs, retConv)
        )
      )
    end

  (*
   *     val set<Opt>Value_ =
   *       call
   *         (getSymbol "g_value_set_<valueType>")
   *         (GObjectValueRecord.PolyML.cPtr &&> <parConv> --> cVoid);
   *)
  fun setValueStrDecLowLevelPolyML (valueIRef, valueType) ptrOpt =
    let
      val parConv =
        makeConv [polyMLStrId] (
          case ptrOpt of
            NONE       => VAL
          | SOME isOpt => PTR {optDir = NONE, isOpt = isOpt}
        )
      val parConvs =
        mkAARExp (
          makeConv
            (prefixInterfaceStrId valueIRef [polyMLStrId])
            (PTR {optDir = NONE, isOpt = false}),
          parConv
        )
      val retConv = cVoidConv
      val getTypeSymbol = "g_value_set_" ^ valueType
    in
      StrDecDec (
        mkIdValDec (
          case ptrOpt of SOME true => setOptValueUId | _ => setValueUId,
          callPolyMLFFIExp getTypeSymbol (parConvs, retConv)
        )
      )
    end

  fun addStrDecsLowLevelPolyML
    getTypeSymbol
    valueArgs
    isPtr
    strDecs =
    let
      val localStrDecs =
        if isPtr
        then
          [
            getTypeStrDecLowLevelPolyML getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs (SOME false),
            getValueStrDecLowLevelPolyML valueArgs (SOME true),
            setValueStrDecLowLevelPolyML valueArgs (SOME false),
            setValueStrDecLowLevelPolyML valueArgs (SOME true)
          ]
        else
          [
            getTypeStrDecLowLevelPolyML getTypeSymbol,
            getValueStrDecLowLevelPolyML valueArgs NONE,
            setValueStrDecLowLevelPolyML valueArgs NONE
          ]
    in
      mkPolyMLFFILocalStrDec localStrDecs :: strDecs
    end
in
  fun addAccessorRootStrDecs
    namespace
    info =
    case RegisteredTypeInfo.getTypeInit info of
      SOME getTypeSymbol =>
        let
          val isGObject = namespace = "GObject"
          val revLocalTypes = makeAccessorLocalTypes isGObject

          fun addIRefs iRefs = addAccessorIRefs isGObject iRefs

          val valueIRef = makeValueIRef namespace (SOME "")
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
                then addStrDecsLowLevelPolyML
                else addStrDecsLowLevelMLton
              )
                getTypeSymbol (valueIRef, valueType) isPtr strDecs'2
            in
              strDecs'3
            end
        in
          (addStrDecsLowLevel, addIRefs, revLocalTypes)
        end
    | NONE               => (K (K I), I, [])
end
