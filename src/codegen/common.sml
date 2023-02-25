(* --------------------------------------------------------------------------
 * Common
 * -------------------------------------------------------------------------- *)

(**
 * Construction of a target-specific directory and file name
 *)

datatype target =
  MLton
| PolyML

val targetString =
  fn
    MLton  => "mlton"
  | PolyML => "polyml"

fun mkTargetDir dir target =
  OS.Path.joinDirFile {dir = dir, file = targetString target}

fun mkTargetFile target file =
  OS.Path.joinDirFile {dir = targetString target, file = file}


(**
 * File extension
 *)

datatype file_type =
  SML
| MLB
| C

val fileTypeExt =
  fn
    SML => "sml"
  | MLB => "mlb"
  | C   => "c"

val smlFileExt = "sml"
val mlbFileExt = "mlb"
val cFileExt   = "c"


(**
 * Construction of a file name from a module name
 *
 * The module name is encoded in the base name as follows:
 *   - <name>-fun for a functor called name
 *   - <name>-sig for a signature called name
 *   - <name>     for a structure called name
 * This encoding of module names requires a file system to be case preserving
 * but not case sensitive for the module name to be recoverable from the file
 * name, as done by the function `useExt` in the run-time source.
 *)

fun mkStrFile id = id
fun mkSigFile id = id ^ "-sig"
fun mkFunFile id = id ^ "-fun"

fun addExt (base, ext) = OS.Path.joinBaseExt {base = base, ext = SOME ext}


(**
 * Namespace names
 *
 * Each namespace dependency returned by
 *
 *   GIRepository.Repository.getDependencies repo vers namespace
 *
 * is a string of the form "<namespace>-<version>".  For example, "GLib-2.0",
 * "Gio-2.0", "Atk-1.0".  Therefore we describe a string of this form as a
 * namespace dependency.
 *
 * A namespace dependency used in a file name is converted to lower case.
 * The directory for a namespace is just the namespace dependency in lower
 * case.  For example, "glib-2.0", "gio-2.0", "atk-1.0".
 *)

fun mkNamespaceDep (namespace, version) =
  String.concat [namespace, "-", version]

fun mkNamespaceFile namespaceDep = String.map Char.toLower namespaceDep


(**
 *
 *)

structure FileMap = ListDict
structure NamespaceMap = ListDict

structure NamespaceFileMap =
  JoinMap(
    structure L = NamespaceMap
    structure R = FileMap
  )

fun thisNamespace x : NamespaceMap.key * 'a = ("", x)
fun otherNamespace namespace x : NamespaceMap.key * 'a =
  if namespace <> ""
  then (namespace, x)
  else raise Fail "empty string specified for other namespace"


(* Representation of a program unit for multiple compiler targets *)

datatype program =
  Portable of module list
| Specific of {mlton : module list, polyml : module list}

val isPortable =
  fn
    Portable _ => true
  | Specific _ => false



(* Representation and printing of generated C source code *)

(**
 * At present, only the C interface for record types requires C functions to
 * be compiled on the target platform.  The required C functions are declared
 * by invoking preprocessor macros whose definitions, in the static part of
 * the C library, provide the actual C function.
 *)

type version = string * string * string  (* (major, minor, patch) : version *)

datatype c_interface_decl =
  CMacroCall of {name : string, args : string list}
| CCheckVersion of {decl : c_interface_decl, version : version}

local
  open HVTextTree

  fun fmtHLast fmtX hLast x = H.seq [fmtX x, hLast]
  fun fmtSeq (separator, terminator) fmtX xs =
    let
      val rec aux =
        fn
          []      => []
        | x :: [] => fmtX terminator x :: []
        | x :: xs => fmtX separator x :: aux xs
    in
      aux xs
    end
in
  fun fmtCInterfaceDecl cppPrefix =
    fn
      CMacroCall {name, args} =>
        V.line (
          H.seq [
            H.str name,
            H.str "(",
            H.seq (fmtSeq (H.str ", ", H.str ")") (fmtHLast H.str) args)
          ]
        )
    | CCheckVersion {decl, version = (major, minor, patch)} =>
        V.seq [
          V.line (
            H.concat [
              "#if ", cppPrefix, "_CHECK_VERSION(", major, ", ", minor, ", ", patch, ")"
            ]
          ),
          fmtCInterfaceDecl cppPrefix decl,
          V.str "#endif"
        ]

  fun fmtCInterfaceDecls cppPrefix = V.seq o map (fmtCInterfaceDecl cppPrefix)
end



(* Common code generation functions *)

val internTypeSymbol = "intern"

fun addGetTypeFunctionSpec
  getTypeSymbol
  (typeIRef : interfaceref)
  (init as (specs, (sigIRefs, extIRefs), excls)) =
  if getTypeSymbol <> internTypeSymbol
  then
    let
      val specs' = getTypeSpec typeIRef :: specs

      val iRef as {scope, container, ...} = typeIRef
      val sigIRefs' =
        case scope of
          GLOBAL             => sigIRefs
        | LOCALINTERFACESELF => sigIRefs
        | _                  => insert (iRef, sigIRefs)
      val extIRefs' =
        case container of
          NONE   => extIRefs
        | SOME _ => insert (iRef, extIRefs)
    in
      (specs', (sigIRefs', extIRefs'), excls)
    end
  else init

val addOptGetTypeFunctionSpec =
  fn
    SOME getTypeSymbol => addGetTypeFunctionSpec getTypeSymbol
  | NONE               => K I

fun addGetTypeFunctionStrDecHighLevel
  getTypeSymbol
  (typeIRef : interfaceref)
  (init as (strDecs, (iRefs, structDeps), excls)) =
  if getTypeSymbol <> internTypeSymbol
  then
    let
      val strDecs' = getTypeStrDecHighLevel :: strDecs

      val iRef as {scope, ...} = typeIRef
      val iRefs' =
        case scope of
          GLOBAL             => iRefs
        | LOCALINTERFACESELF => iRefs
        | _                  => insert (iRef, iRefs)
    in
      (strDecs', (iRefs', structDeps), excls)
    end
  else init

val addOptGetTypeFunctionStrDecHighLevel =
  fn
    SOME getTypeSymbol => addGetTypeFunctionStrDecHighLevel getTypeSymbol
  | NONE               => K I

fun addGetTypeFunctionStrDecLowLevel
  getTypeSymbol
  isPolyML
  (init as (strDecs, excls)) =
  if getTypeSymbol <> internTypeSymbol
  then
    let
      val strDecs' =
        (
          if isPolyML
          then getTypeStrDecLowLevelPolyML getTypeSymbol
          else getTypeStrDecLowLevelMLton getTypeSymbol
        ) :: strDecs
    in
      (strDecs', excls)
    end
  else init

val addOptGetTypeFunctionStrDecLowLevel =
  fn
    SOME getTypeSymbol => addGetTypeFunctionStrDecLowLevel getTypeSymbol
  | NONE               => K I


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
  case strNamespace of
    "" => toList1 [toUCC strName ^ toUCC strType, id] (* not in a namespace *)
  | _  => toList1 [toUCC strNamespace, toUCC strName ^ toUCC strType, id]

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
  val signalTemplate =
    (
      [
        (false, "object_class"),
        (false, "arg_e"),
        (false, "arg_h"),
        (false, "res_h"),
        (false, "res_e")
      ],
      ("", "Signal", "", "t")
    )
  val signalSpec = toSpec "" signalTemplate
  val signalLocalType = toLocalType "" signalTemplate
in
  (*
   * `addSignalSpecs namespace numSigs specs` adds
   *
   *                                                       -.
   *                                                        | isGObject
   *     type                                               |  and numSigs > 0
   *       ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t
   *                                                       -'
   *
   * to `specs`.
   *)
  fun addSignalSpecs namespace (numSigs : LargeInt.int) specs =
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
   *                                                        | isGObject
   *     type                                               |  and numSigs > 0
   *       ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t =
   *       ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t
   *                                                       -'
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                       -.
   *     where                                              | isGObject
   *       type                                             |  and numSigs > 0
   *         ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) signal_t =
   *         ('object_class, 'arg_e, 'arg_h, 'res_h, 'res_e) Signal.t
   *                                                       -'
   *)
  fun makeSignalLocalTypes isGObject (numSigs : LargeInt.int) =
    if isGObject andalso numSigs > 0
    then [signalLocalType]
    else []
end


local
  val objectClassTyVar = (false, "object_class")
  val getTyVar         = (false, getId)
  val setTyVar         = (false, setId)
  val initTyVar        = (false, initId)
  val propertyTemplates = [
    (
      [objectClassTyVar, getTyVar, setTyVar, initTyVar],
      ("", propertyStrId, "", tId)
    )
  ]
  val revPropertySpecs = revMap (toSpec "") propertyTemplates
  val revPropertyLocalTypes = revMap (toLocalType "") propertyTemplates
in
  (*
   * `addPropertySpecs namespace numProps specs` adds
   *
   *                                                       -.
   *     type ('object_class, 'get, 'set, 'init) property_t | isGObject
   *                                                       -'  and numProps > 0
   *
   * to `specs`.
   *)
  fun addPropertySpecs namespace (numProps : LargeInt.int) specs =
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
   *     type ('object_class, 'get, 'set, 'init) property_t =
   *       ('object_class, 'get, 'set, 'init) Property.t    | isGObject
   *                                                       -'  and numProps > 0
   *
   * and `revMap makeLocalTypeStrModuleQual revLocalTypes` produces qual
   * values as follows:
   *
   *                                                       -.
   *     where type ('object_class, 'get, 'set, 'init) property_t =
   *       'object_class Property.t                         | isGObject
   *                                                       -'  and numProps > 0
   *)
  fun makePropertyLocalTypes isGObject (numProps : LargeInt.int) =
    if isGObject andalso numProps > 0
    then revPropertyLocalTypes
    else []
end


local
  val accessorName = ("", "ValueAccessor", "", "t")
  val accessorTemplate = ([aTyVar], accessorName)
in
  val accessorGlobalLId : lid = mkGlobalLId accessorName
  val accessorLocalId : id = mkLocalId "" accessorName
  val accessorLocalLId : lid = toList1 [accessorLocalId]
  val accessorSpec = toSpec "" accessorTemplate
  val accessorLocalType = toLocalType "" accessorTemplate

  (*
   *     val toDerived :
   *       'a class ValueAccessor.t -> base class -> 'a class
   *)
  val toDerivedSpec =
    let
      val derivedClassTy = classTy aVarTy
      val baseClassTy = classTy baseTy

      val accessorLId = accessorGlobalLId
      val accessorTy = TyRef ([derivedClassTy], accessorLId)
      val ty = TyFun (accessorTy, TyFun (baseClassTy, derivedClassTy))

      val toDerivedId = "toDerived"
    in
      mkValSpec (toDerivedId, ty)
    end

  (*
   * `addAccessorSpecs info accessTy isPtr specs` adds
   *
   *     val t : <accessTy> ValueAccessor.t
   *                                           -.
   *     val tOpt :                             |
   *       <accessTy> option                    | isPtr
   *         ValueAccessor.t                    |
   *                                           -'
   *
   * to `specs`.
   *)
  fun addAccessorSpecs info accessTy isPtr specs =
    case RegisteredTypeInfo.getTypeInit info of
      SOME _ =>
        let
          fun addValSpecs accessorLId specs =
            mkValSpec (tId, TyRef ([accessTy], accessorLId))
             :: (
              if isPtr
              then
                mkValSpec (tOptId, TyRef ([optionTy accessTy], accessorLId))
                 :: specs
              else
                specs
            )
        in
          addValSpecs accessorGlobalLId specs
        end
    | NONE   => specs
end

(*
 * The function application
 *
 *   addAccessorRootStrDecs
 *     (containerNamespace, containerName)
 *     getValueType
 *     info
 *
 * returns
 *
 *   (addStrDecs, addIRefs, revLocalTypes)
 *
 * where
 *
 *   addStrDecs isPtr isBoxed isPolyML strDecs
 *
 * prepends the following to `strDecs` when `info` is a registered GType
 * whose get-type function is <getTypeSymbol>, i.e.
 *
 *   RegisteredTypeInfo.getTypeInit info = SOME getTypeSymbol
 *
 *                                                           -.
 *     local                                                  |
 *       open PolyMLFFI                                       |
 *     in                                                     |
 *                                           -.               |
 *       val getType_ =                       | not isBoxed   |
 *         call                               | getTypeSymbol |
 *           (getSymbol "<getTypeSymbol>")    |  <> "intern"  |
 *           (cVoid --> GObjectType.PolyML.cVal);             |
 *                                           -'               |
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
 *                                           -.              -.
 *     val getType_ =                         | not isBoxed   |
 *       _import "<getTypeSymbol>" :          | getTypeSymbol |
 *         unit -> GObjectType.FFI.val_;      |  <> "intern"  |
 *                                           -'               |
 *                                                            |
 *     val getValue_ =                                        |
 *       _import "g_value_get_<valueType>" :                  |
 *         GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> <retType>;
 *                                                            |
 *                                           -.               |
 *     val getOptValue_ =                     |               |
 *       _import "g_value_get_<valueType>" :  | isPtr         |
 *         GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
 *          -> <retOptType>;                  |               | MLton only
 *                                           -'               |
 *                                                            |
 *     val setValue_ =                                        |
 *       fn x1 & x2 =>                                        |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
 *             * <parType>                                    |
 *             -> unit;)                                      |
 *         (x1, x2)                                           |
 *                                                            |
 *                                           -.               |
 *     val setOptValue_ =                     | isPtr         |
 *       fn x1 & x2 =>                        |               |
 *         (_import "g_value_set_<valueType>" :               |
 *            GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
 *             * <parOptType>                 |               |
 *             -> unit;)                      |               |
 *         (x1, x2)                           |               |
 *                                           -'              -'
 *     val t =
 *       ValueAccessor.C.createAccessor {
 *         getType  = <getType>,
 *         getValue = (I ---> <fromFun>) getValue_,
 *         setValue = (I &&&> <withFun> ---> I) setValue_
 *       }
 *
 *                                           -.
 *     val tOpt =                             | isPtr
 *       ValueAccessor.C.createAccessor {     |
 *         getType  = <getType>,
 *         getValue = (I ---> <fromOptFun>) getOptValue_,
 *         setValue = (I &&&> <withOptFun> ---> I) setOptValue_
 *       }                                    |
 *                                           -'
 *
 * where
 *
 *
 *   parType and retType
 *     are defined as
 *
 *         FFI.non_opt FFI.p
 *           if isPtr
 *
 *         FFI.val_
 *           otherwise
 *
 *
 *   parOptType and retOptType
 *     are defined as
 *
 *         FFI.opt FFI.p
 *           if isPtr
 *
 *         FFI.val_
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
 *   parOptConv and retOptConv
 *     are defined as
 *
 *         PolyML.cOptPtr
 *           if isPtr
 *
 *         PolyML.cVal
 *           otherwise
 *
 *
 *   fromFun
 *     is defined as
 *
 *         FFI.fromPtr false
 *           if isPtr
 *
 *         FFI.fromVal
 *           otherwise
 *
 *
 *   fromOptFun
 *     is defined as
 *
 *         FFI.fromOptPtr false
 *           if isPtr
 *
 *         FFI.fromVal
 *           otherwise
 *
 *
 *   withFun
 *     is defined as
 *
 *         FFI.withPtr false
 *           if isPtr
 *
 *         FFI.withVal
 *           otherwise
 *
 *
 *   withOptFun
 *     is defined as
 *
 *         FFI.withOptPtr false
 *           if isPtr
 *
 *         FFI.withVal
 *           otherwise
 *
 *
 *   getType
 *     is defined as
 *
 *         (I ---> GObjectType.FFI.fromVal) getType_
 *           if getTypeSymbol <> "intern"
 *
 *         GObject.Type.param<T>
 *           if getTypeSymbol = "intern" and <containerName> = "ParamSpec<T>"
 *
 *         GObject.Type.<containerName>
 *           otherwise
 *
 *
 * In the case of a boxed type, `getType_` is already declared for use in the
 * the defintion of `dup_` and `free_`, so is not needed to define the
 * accessors functions.
 *)
local
  (*
   *     val t<Opt> =
   *       ValueAccessor.C.createAccessor {
   *         getType  = <getType>,
   *         getValue = (I ---> <from<Opt>Fun>) get<Opt>Value_,
   *         setValue = (I &&&> <with<Opt>Fun> ---> I) set<Opt>Value_
   *       }
   *
   *
   * where
   *
   *
   *   getType
   *     is defined as
   *
   *         (I ---> GObjectType.FFI.fromVal) getType_
   *           if getTypeSymbol <> "intern"
   *
   *         GObject.Type.param<T>
   *           if getTypeSymbol = "intern" and <containerName> = "ParamSpec<T>"
   *
   *         GObjectType.<containerName>
   *           otherwise
   *)
  fun getTypeExp containerName getTypeSymbol =
    if getTypeSymbol <> internTypeSymbol
    then
      ExpApp (
        mkParenExp (
          mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", ffiStrId, fromValId])
        ),
        mkIdLNameExp getTypeUId
      )
    else
      mkLIdLNameExp [
        "GObjectType",
        toLCC (
          case stripPrefix "ParamSpec" containerName of
            SOME t => "Param" ^ t
          | NONE   => containerName
        )
      ]
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
        | SOME isOpt =>
            ExpApp (
              mkLIdLNameExp [ffiStrId, if isOpt then withOptPtrId else withPtrId],
              mkIdLNameExp "false"
          )
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
  fun tStrDec containerName getTypeSymbol ptrOpt =
    StrDecDec (
      mkIdValDec (
        case ptrOpt of SOME true => tOptId | _ => tId,
        ExpApp (
          mkLIdLNameExp ["ValueAccessor", cStrId, "createAccessor"],
          ExpRec [
            (getTypeId, getTypeExp containerName getTypeSymbol),
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
   *         GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
   *          -> <ret<Opt>Type>;
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
          callMLtonFFIExp ("g_value_get_" ^ valueType, []) (
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
   *         GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * <par<Opt>Type>
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
          callMLtonFFIExp ("g_value_set_" ^ valueType, []) (
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
    isBoxed
    strDecs =
    let
      val strDecs'1 =
        if isPtr
        then
          getValueStrDecLowLevelMLton valueArgs (SOME false)
           :: getValueStrDecLowLevelMLton valueArgs (SOME true)
           :: setValueStrDecLowLevelMLton valueArgs (SOME false)
           :: setValueStrDecLowLevelMLton valueArgs (SOME true)
           :: strDecs
        else
          getValueStrDecLowLevelMLton valueArgs NONE
           :: setValueStrDecLowLevelMLton valueArgs NONE
           :: strDecs
    in
      if not isBoxed andalso getTypeSymbol <> internTypeSymbol
      then getTypeStrDecLowLevelMLton getTypeSymbol :: strDecs'1
      else strDecs'1
    end


  (* Low-level Poly/ML *)

  (*
   *     val get<Opt>Value_ =
   *       call
   *         (getSymbol "g_value_get_<valueType>")
   *         (GObjectValueRecord.PolyML.cPtr --> <ret<Opt>Conv>);
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
   *         (GObjectValueRecord.PolyML.cPtr &&> <par<Opt>Conv> --> cVoid);
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
    isBoxed
    strDecs =
    let
      val localStrDecs'1 =
        if isPtr
        then
          [
            getValueStrDecLowLevelPolyML valueArgs (SOME false),
            getValueStrDecLowLevelPolyML valueArgs (SOME true),
            setValueStrDecLowLevelPolyML valueArgs (SOME false),
            setValueStrDecLowLevelPolyML valueArgs (SOME true)
          ]
        else
          [
            getValueStrDecLowLevelPolyML valueArgs NONE,
            setValueStrDecLowLevelPolyML valueArgs NONE
          ]

      val localStrDecs =
        if not isBoxed andalso getTypeSymbol <> internTypeSymbol
        then getTypeStrDecLowLevelPolyML getTypeSymbol :: localStrDecs'1
        else localStrDecs'1
    in
      mkPolyMLFFILocalStrDec localStrDecs :: strDecs
    end
in
  fun addAccessorRootStrDecs
    (containerNamespace, containerName)
    getValueType
    info =
    case RegisteredTypeInfo.getTypeInit info of
      SOME getTypeSymbol =>
        let
          val revLocalTypes = []

          fun addIRefs iRefs = iRefs

          val valueIRef = makeValueIRef containerNamespace (SOME "")

          val valueType = getValueType (containerNamespace, containerName)

          fun addStrDecsLowLevel isPtr isBoxed isPolyML strDecs =
            let
              val tStrDec1 = tStrDec containerName getTypeSymbol
              val strDecs'1 =
                if isPtr
                then tStrDec1 (SOME false) :: tStrDec1 (SOME true) :: strDecs
                else tStrDec1 NONE :: strDecs
              val strDecs'2 =
                revMapAppend makeLocalTypeStrDec (revLocalTypes, strDecs'1)

              val strDecs'3 = (
                if isPolyML
                then addStrDecsLowLevelPolyML
                else addStrDecsLowLevelMLton
              )
                getTypeSymbol (valueIRef, valueType) isPtr isBoxed strDecs'2
            in
              strDecs'3
            end
        in
          (addStrDecsLowLevel, addIRefs, revLocalTypes)
        end
    | NONE               => (K (K (K I)), I, [])
end
