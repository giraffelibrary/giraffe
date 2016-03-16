(* --------------------------------------------------------------------------
 * Function
 * -------------------------------------------------------------------------- *)

(* Function names to be skipped *)

(* Manually specified symbols
 *
 * Notes
 *
 *   1. Parameter selection_data is annotated with (out) but should probably
 *      be (inout).  (out) requires `withNewPtr` which cannot be implemented
 *      because size of GtkSelectionData is not known by C compiler.
 *
 *)
val excludedFunctionSymbols = [
  "pango_break",
  "pango_default_break",
  "pango_get_log_attrs",
  "pango_glyph_item_letter_space",
  "pango_shape",
  "pango_read_line",
  "pango_scan_int",
  "pango_scan_string",
  "pango_scan_word",
  "pango_attribute_init",
  "pango_attribute_destroy",
  "g_source_new",
  "g_source_set_callback_indirect",
  "g_source_add_poll",
  "g_source_remove_poll",
  "g_source_set_funcs",
  "g_source_remove_by_funcs_user_data",
  "g_source_remove_by_user_data",
  "g_closure_new_simple",
  "g_closure_new_object",
  "g_param_spec_pool_new",
  "g_param_value_convert",
  "g_param_value_defaults",
  "g_param_value_set_default",
  "g_param_value_validate",
  "g_param_values_cmp",
  "g_signal_accumulator_first_wins",
  "g_signal_accumulator_true_handled",
  "g_signal_chain_from_overridden",
  "g_signal_get_invocation_hint",
  "g_signal_has_handler_pending",
  "g_signal_name",
  "g_signal_query",
  "g_signal_remove_emission_hook",
  "g_signal_stop_emission",
  "g_signal_stop_emission_by_name",
  "g_source_set_closure",
  "g_source_set_dummy_callback",
  "g_strdup_value_contents",
  "g_type_check_instance",
  "g_type_check_value",
  "g_type_class_add_private",
  "g_type_default_interface_unref",
  "g_type_free_instance",
  "g_type_name_from_class",
  "g_type_name_from_instance",
  "g_dbus_error_register_error",
  "g_dbus_error_unregister_error",
  "gdk_pixbuf_error_quark",
  "gdk_add_option_entries_libgtk_only",
  "gtk_accel_map_load_scanner",
  "gtk_binding_entry_add_signal_from_string",
  "gtk_binding_entry_remove",
  "gtk_binding_set_find",
  "gtk_bindings_activate",
  "gtk_bindings_activate_event",
  "gtk_binding_entry_skip",
  "gtk_buildable_custom_tag_start",
  "gtk_distribute_natural_allocation",
  "gtk_rc_parse_color",  (* deprecated anyway? *)
  "gtk_rc_parse_color_full",  (* deprecated anyway? *)
  "gtk_rc_property_parse_color",
  "gtk_rc_property_parse_border",
  "gtk_rc_property_parse_enum",
  "gtk_rc_property_parse_flags",
  "gtk_rc_property_parse_requisition",
  "gtk_tree_drag_source_drag_data_get",  (* see note 1 *)
  "vte_pty_error_quark"
]

val excludedFunctionSymbolPrefixes = [
  "g_cclosure_marshal",
  "g_signal_connect",
  "g_signal_handler"
]

val excludedFunctionSymbolSuffixes = [
]

fun checkFunctionSymbol functionInfo =
  let
    val symbol = FunctionInfo.getSymbol functionInfo
  in
    if
      List.exists (fn x => x = symbol) excludedFunctionSymbols
       orelse
         List.exists (fn x => String.isPrefix x symbol)
           excludedFunctionSymbolPrefixes
       orelse
         List.exists (fn x => String.isSuffix x symbol)
           excludedFunctionSymbolSuffixes
    then infoError "manually excluded"
    else ()
  end

(* Systematically formed names that do not belong in the user API *)
val nonUserFunctionNames = [
  "ref",
  "ref_sink",
  "sink",
  "unref",
  "free",
  "false",
  "true",
  "quark",
  "error_quark"
]

fun checkFunctionName name =
  if List.exists (fn x => x = name) nonUserFunctionNames
  then infoError "non-user function"
  else ()


(* Flags/Enum value names to be transformed *)

val newFlagsEnumValueNames = [
  ("2big", "too_big"),
  ("2button_press", "double_button_press"),
  ("3button_press", "triple_button_press")
]

fun fixFlagsEnumValueName name =
  case List.find (fn (x, _) => x = name) newFlagsEnumValueNames of
    SOME (_, name') => name'
  | NONE            => name


(* Support for parameters and return values *)

val containerForUtf8 =
  "** ownership transfer CONTAINER for UTF8 not valid **"

val containerForFilename =
  "** ownership transfer CONTAINER for FILENAME not valid **"

val containerForInterface =
  "** ownership transfer CONTAINER for INTERFACE not valid **"

val everythingForNonPtrStruct =
  "** ownership transfer EVERYTHING for non-pointer STRUCT INTERFACE parameter \
  \not valid **"
  (* In fact this is used for a non-pointer GObject.Value out parameter where
   * the caller must call g_value_unset to free resources used by the
   * GObject.Value.  This appears to occur only for get_property functions, so
   * this is all pending property handling...
   *)

val everythingForNonPtrUnion =
  "** ownership transfer EVERYTHING for non-pointer UNION INTERFACE parameter \
  \not valid **"

val everythingForIn =
  "ownership transfer EVERYTHING for IN parameter not supported"

val everythingForInOut =
  "ownership transfer EVERYTHING for INOUT parameter not supported"

val nonPtrForObject =
  "non-pointer for OBJECT INTERFACE not supported"

val nonPtrForInterface =
  "non-pointer for INTERFACE INTERFACE not supported"

val nonPtrForInStruct =
  "non-pointer IN parameter for STRUCT INTERFACE not supported"

val nonPtrForInUnion =
  "non-pointer IN parameter for UNION INTERFACE not supported"

val nonPtrForRetStruct =
  "non-pointer return for STRUCT INTERFACE not supported"

val nonPtrForRetUnion =
  "non-pointer return for UNION INTERFACE not supported"

val ptrForFlags =
  "pointer for FLAGS INTERFACE not supported"

val ptrForEnum =
  "pointer for ENUM INTERFACE not supported"

local
  open InfoType

  val toString =
    fn
      INVALID     => "INVALID"
    | FUNCTION _  => "FUNCTION"
    | CALLBACK _  => "CALLBACK"
    | STRUCT _    => "STRUCT"
    | BOXED _     => "BOXED"
    | ENUM _      => "ENUM"
    | FLAGS _     => "FLAGS"
    | OBJECT _    => "OBJECT"
    | INTERFACE _ => "INTERFACE"
    | CONSTANT _  => "CONSTANT"
    | INVALID_0   => "INVALID_0"
    | UNION _     => "UNION"
    | VALUE _     => "VALUE"
    | SIGNAL _    => "SIGNAL"
    | VFUNC _     => "VFUNC"
    | PROPERTY _  => "PROPERTY"
    | FIELD _     => "FIELD"
    | ARG _       => "ARG"
    | TYPE _      => "TYPE"
    | UNRESOLVED  => "UNRESOLVED"
in
  fun unsupportedInterface infoType =
    concat ["type ", toString infoType, " INTERFACE not supported"]
end

fun ptrForScalar fmt ty =
  concat ["pointer for scalar (", fmt ty, ") not supported"]

val ptrForVoid =
  "pointer for VOID not supported"


datatype scalartype =
  STBOOLEAN
| STINT8
| STUINT8
| STINT16
| STUINT16
| STINT32
| STUINT32
| STINT64
| STUINT64
| STFLOAT
| STDOUBLE
| STUNICHAR

val scalarToString =
  fn
    STBOOLEAN      => "BOOLEAN"
  | STINT8         => "INT8"
  | STUINT8        => "UINT8"
  | STINT16        => "INT16"
  | STUINT16       => "UINT16"
  | STINT32        => "INT32"
  | STUINT32       => "UINT32"
  | STINT64        => "INT64"
  | STUINT64       => "UINT64"
  | STFLOAT        => "FLOAT"
  | STDOUBLE       => "DOUBLE"
  | STUNICHAR      => "UNICHAR"

val scalarStrId =
  fn
    STBOOLEAN      => "Bool"
  | STINT8         => "Int8"
  | STUINT8        => "UInt8"
  | STINT16        => "Int16"
  | STUINT16       => "UInt16"
  | STINT32        => "Int32"
  | STUINT32       => "UInt32"
  | STINT64        => "Int64"
  | STUINT64       => "UInt64"
  | STFLOAT        => "Float"
  | STDOUBLE       => "Double"
  | STUNICHAR      => "Char"

local
  fun noGType s = infoError ("no corresponding GType for " ^ s)
in
  val scalarAccessorId =
    fn
      STBOOLEAN      => "boolean"
    | STINT8         => noGType "INT8"
    | STUINT8        => noGType "UINT8"
    | STINT16        => noGType "INT16"
    | STUINT16       => noGType "UINT16"
    | STINT32        => "int"
    | STUINT32       => "uint"
    | STINT64        => "long"
    | STUINT64       => "ulong"
    | STFLOAT        => "float"
    | STDOUBLE       => "double"
    | STUNICHAR      => "char"
end

local
  val boolTyRef = (0, toList1 ["bool"])
  val charTyRef = (0, toList1 ["char"])
  val largeIntTyRef = (0, toList1 ["LargeInt", "int"])
  val realTyRef = (0, toList1 ["real"])
in
  val scalarTyRef =
    fn
      STBOOLEAN      => boolTyRef
    | STINT8         => largeIntTyRef
    | STUINT8        => largeIntTyRef
    | STINT16        => largeIntTyRef
    | STUINT16       => largeIntTyRef
    | STINT32        => largeIntTyRef
    | STUINT32       => largeIntTyRef
    | STINT64        => largeIntTyRef
    | STUINT64       => largeIntTyRef
    | STFLOAT        => realTyRef
    | STDOUBLE       => realTyRef
    | STUNICHAR      => charTyRef
end


val utf8TyRef : int * lid = (0, toList1 ["string"])


type scalarinfo =
  {
    name  : id,
    ty    : scalartype
  }

type utf8info =
  {
    name    : id,
    isOpt   : bool,
    ownXfer : bool
  }

type interfaceinfo =
  {
    name       : id,
    rootIRef   : interfaceref,
    iRef       : interfaceref,
    infoType   : InfoType.t,
    isOpt      : bool,
    ptrOwnXfer : bool option  (* NONE when non-pointer *)
  }

(* The ownership transfer flag is only present for a pointer.  The conditions
 * for a pointer and ownership transfer are combined into a single field
 * `ptrOwnXfer` that takes the following values:
 *
 *   NONE          non-pointer
 *   SOME false    pointer with ownership not transferred
 *   SOME true     pointer with ownership transferred
 *
 * The condition `isSome ptrOwnXfer` tests for a pointer.
 *
 * It is not always true that if a value is optionally null, then it must
 * be a pointer, i.e. `isOpt` does not always imply `isSome ptrOwnXfer`: for
 * a CALLBACK, `ptrOwnXfer` is `NONE` but it is possible that `isOpt` is true.
 * Therefore `isOpt` is not included as part of option type for `ptrOwnXfer`.
 *)


datatype dir =
  IN
| OUT of bool  (* flag indicates caller-allocated *)
| INOUT

datatype parinfo =
  PIVOID
| PISCALAR    of dir * scalarinfo
| PIUTF8      of dir * utf8info
| PIINTERFACE of dir * interfaceinfo


datatype retinfo =
  RIVOID
| RISCALAR    of scalarinfo
| RIUTF8      of utf8info
| RIINTERFACE of interfaceinfo


(* 
 * For signals, `getParInfo` and `getRetInfo` must not use TypeInfo.isPointer
 * due to <https://bugzilla.gnome.org/show_bug.cgi?id=646080>.  The parameter
 * `usePtrDefault` indicates whether default pointer use should be assumed
 * rather than using the c:type attribute, which is not present for signals.
 *)

fun getParInfo usePtrDefault repo functionNamespace optContainerName argInfo =
  let
    val direction = ArgInfo.getDirection argInfo
    val mayBeNull = ArgInfo.mayBeNull argInfo

    val ownershipTransfer = ArgInfo.getOwnershipTransfer argInfo
    val isCallerAllocates = ArgInfo.isCallerAllocates argInfo

    val typeInfo = ArgInfo.getType argInfo

    val argName = getName argInfo
    val argId = mkId (toLCC argName)

    val dir =
      case direction of
        Direction.IN    => IN
      | Direction.OUT   => OUT isCallerAllocates
      | Direction.INOUT => INOUT

    val isOpt = mayBeNull

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface isPtr nonPtrForX =
        if isPtr
        then
          case (dir, ownershipTransfer) of
            (_,     NOTHING)    => SOME false
          | (OUT _, EVERYTHING) => SOME true
          | (IN,    EVERYTHING) => infoError everythingForIn
          | (INOUT, EVERYTHING) => infoError everythingForInOut
          | (_,     CONTAINER)  => infoError containerForInterface
        else
          infoError nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion isPtr (nonPtrForInX, everythingForNonPtrX) =
        case (dir, isPtr, ownershipTransfer) of
          (IN,    false, NOTHING)    => infoError nonPtrForInX
        | (_,     false, NOTHING)    => NONE
        | (_,     true,  NOTHING)    => SOME false
        | (OUT _, true,  EVERYTHING) => SOME true
        | (_,     false, EVERYTHING) => infoError everythingForNonPtrX
        | (IN,    true,  EVERYTHING) => infoError everythingForIn
        | (INOUT, true,  EVERYTHING) => infoError everythingForInOut
        | (_,     _,     CONTAINER)  => infoError containerForInterface
      val structMsg = (nonPtrForInStruct, everythingForNonPtrStruct)
      val unionMsg = (nonPtrForInUnion, everythingForNonPtrUnion)

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoError ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

    fun notExpected s = infoError ("parameter type " ^ s ^ " not expected")
    fun notSupported s = infoError ("parameter type " ^ s ^ " not supported")

    fun resolveType () () typeInfo =
      let
        open TypeTag

        fun checkVoid () =
          if
            if usePtrDefault
            then
              true
            else
              TypeInfo.isPointer typeInfo
          then infoError ptrForVoid
          else ()

        fun toScalarInfo ty =
          if
            if usePtrDefault
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoError (ptrForScalar scalarToString ty)
          else
            {
              name  = argId,
              ty    = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => (checkVoid (); PIVOID)
        | BOOLEAN      => PISCALAR (dir, toScalarInfo STBOOLEAN)
        | INT8         => PISCALAR (dir, toScalarInfo STINT8)
        | UINT8        => PISCALAR (dir, toScalarInfo STUINT8)
        | INT16        => PISCALAR (dir, toScalarInfo STINT16)
        | UINT16       => PISCALAR (dir, toScalarInfo STUINT16)
        | INT32        => PISCALAR (dir, toScalarInfo STINT32)
        | UINT32       => PISCALAR (dir, toScalarInfo STUINT32)
        | INT64        => PISCALAR (dir, toScalarInfo STINT64)
        | UINT64       => PISCALAR (dir, toScalarInfo STUINT64)
        | FLOAT        => PISCALAR (dir, toScalarInfo STFLOAT)
        | DOUBLE       => PISCALAR (dir, toScalarInfo STDOUBLE)
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                name    = argId,
                isOpt   = isOpt,
                ownXfer =
                  case ownershipTransfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForFilename
              }
            in
              PIUTF8 (dir, utf8Info)
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                name    = argId,
                isOpt   = isOpt,
                ownXfer =
                  case ownershipTransfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForUtf8
              }
            in
              PIUTF8 (dir, utf8Info)
            end
        | UNICHAR      => PISCALAR (dir, toScalarInfo STUNICHAR)
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceName = getName interfaceInfo
                      val interfaceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
                              if interfaceName = containerName
                              then LOCALINTERFACESELF
                              else LOCALINTERFACEOTHER
                    in
                      {
                        namespace = interfaceNamespace,
                        name      = interfaceName,
                        scope     = interfaceScope,
                        ty        = interfaceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    val isPtr =
                      if usePtrDefault
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => true
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoError (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface isPtr objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface isPtr interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion isPtr structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion isPtr unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoError (unsupportedInterface infoType)

                    val interfaceInfo = {
                      name       = argId,
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    PIINTERFACE (dir, interfaceInfo)
                  end
            end
      end
  in
    resolveType () () typeInfo
  end


fun getRetInfo usePtrDefault repo functionNamespace optContainerName callableInfo =
  let
    val mayReturnNull = CallableInfo.mayReturnNull callableInfo

    val ownershipTransfer = CallableInfo.getCallerOwns callableInfo

    val typeInfo = CallableInfo.getReturnType callableInfo

    val argId = ""

    val isOpt = mayReturnNull

    local
      open Transfer
    in
      fun ptrOwnXferObjectInterface isPtr nonPtrForX =
        if isPtr
        then
          case ownershipTransfer of
            NOTHING    => SOME false
          | EVERYTHING => SOME true
          | CONTAINER  => infoError containerForInterface
        else
          infoError nonPtrForX
      val objectMsg = nonPtrForObject
      val interfaceMsg = nonPtrForInterface

      fun ptrOwnXferStructUnion isPtr nonPtrForRetX =
        case (isPtr, ownershipTransfer) of
          (false, _)          => infoError nonPtrForRetX
        | (_,     NOTHING)    => SOME false
        | (_,     EVERYTHING) => SOME true
        | (_,     CONTAINER)  => infoError containerForInterface
      val structMsg = nonPtrForRetStruct
      val unionMsg = nonPtrForRetUnion

      fun ptrOwnXferFlagsEnum isPtr ptrForX =
        if isPtr
        then infoError ptrForX
        else NONE
      val flagsMsg = ptrForFlags
      val enumMsg = ptrForEnum
    end

    fun notExpected s = infoError ("return type " ^ s ^ " not expected")
    fun notSupported s = infoError ("return type " ^ s ^ " not supported")

    fun resolveType () () typeInfo =
      let
        open TypeTag

        fun checkVoid () =
          if
            (* Don't need a c:type attribute to determine pointer depth for
             * VOID tag, so no need to use default when `usePtrDefault`. *)
            TypeInfo.isPointer typeInfo
          then infoError ptrForVoid
          else ()

        fun toScalarInfo ty =
          if
            if usePtrDefault
            then
              false
            else
              TypeInfo.isPointer typeInfo
          then infoError (ptrForScalar scalarToString ty)
          else
            {
              name  = argId,
              ty    = ty
            }
      in
        case TypeInfo.getTag typeInfo of
          ERROR        => notExpected "ERROR"
        | GTYPE        => notSupported "GTYPE"
        | ARRAY        => notSupported "ARRAY"
        | GLIST        => notSupported "GLIST"
        | GSLIST       => notSupported "GSLIST"
        | GHASH        => notSupported "GHASH"
        | VOID         => (checkVoid (); RIVOID)
        | BOOLEAN      => RISCALAR (toScalarInfo STBOOLEAN)
        | INT8         => RISCALAR (toScalarInfo STINT8)
        | UINT8        => RISCALAR (toScalarInfo STUINT8)
        | INT16        => RISCALAR (toScalarInfo STINT16)
        | UINT16       => RISCALAR (toScalarInfo STUINT16)
        | INT32        => RISCALAR (toScalarInfo STINT32)
        | UINT32       => RISCALAR (toScalarInfo STUINT32)
        | INT64        => RISCALAR (toScalarInfo STINT64)
        | UINT64       => RISCALAR (toScalarInfo STUINT64)
        | FLOAT        => RISCALAR (toScalarInfo STFLOAT)
        | DOUBLE       => RISCALAR (toScalarInfo STDOUBLE)
        | FILENAME     =>
            let
              open Transfer

              val utf8Info = {
                name    = argId,
                isOpt   = isOpt,
                ownXfer =
                  case ownershipTransfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForFilename
              }
            in
              RIUTF8 utf8Info
            end
        | UTF8         =>
            let
              open Transfer

              val utf8Info = {
                name    = argId,
                isOpt   = isOpt,
                ownXfer =
                  case ownershipTransfer of
                    NOTHING    => false
                  | EVERYTHING => true
                  | CONTAINER  => infoError containerForUtf8
              }
            in
              RIUTF8 utf8Info
            end
        | UNICHAR      => RISCALAR (toScalarInfo STUNICHAR)
        | INTERFACE    =>
            let
              val interfaceInfo = getInterface typeInfo
              val interfaceTy = getIRefTy interfaceInfo

              val iRef =
                case () of
                  () =>
                    let
                      val interfaceName = getName interfaceInfo
                      val interfaceNamespace =
                        BaseInfo.getNamespace interfaceInfo
                      val interfaceScope =
                        if interfaceNamespace <> functionNamespace
                        then GLOBAL
                        else
                          case optContainerName of
                            NONE               => LOCALNAMESPACE
                          | SOME containerName =>
                              if interfaceName = containerName
                              then LOCALINTERFACESELF
                              else LOCALINTERFACEOTHER
                    in
                      {
                        namespace = interfaceNamespace,
                        name      = interfaceName,
                        scope     = interfaceScope,
                        ty        = interfaceTy
                      }
                    end

              val infoType = InfoType.getType interfaceInfo
              open InfoType
            in
              case infoType of
                _ =>
                  let
                    val isPtr =
                      if usePtrDefault
                      then
                        case infoType of
                          OBJECT _    => true
                        | INTERFACE _ => true
                        | STRUCT _    => true
                        | UNION _     => true
                        | FLAGS _     => false
                        | ENUM _      => false
                        | _           => infoError (unsupportedInterface infoType)
                      else
                        TypeInfo.isPointer typeInfo

                    val (ptrOwnXfer, rootIRef) =
                      case infoType of
                        OBJECT objectInfo
                                    =>
                          (
                            ptrOwnXferObjectInterface isPtr objectMsg,
                            getRootObjectIRef repo functionNamespace
                              optContainerName
                              (objectInfo, iRef)
                          )
                      | INTERFACE _ =>
                          (
                            ptrOwnXferObjectInterface isPtr interfaceMsg,
                            makeInterfaceRootIRef functionNamespace
                              optContainerName
                          )
                      | STRUCT _    => (ptrOwnXferStructUnion isPtr structMsg, iRef)
                      | UNION _     => (ptrOwnXferStructUnion isPtr unionMsg, iRef)
                      | FLAGS _     => (ptrOwnXferFlagsEnum isPtr flagsMsg, iRef)
                      | ENUM _      => (ptrOwnXferFlagsEnum isPtr enumMsg, iRef)
                      | _           => infoError (unsupportedInterface infoType)

                    val interfaceInfo = {
                      name       = argId,
                      rootIRef   = rootIRef,
                      iRef       = iRef,
                      infoType   = infoType,
                      isOpt      = isOpt,
                      ptrOwnXfer = ptrOwnXfer
                    }
                  in
                    RIINTERFACE interfaceInfo
                  end
            end
      end
  in
    resolveType () () typeInfo
  end


(* Specification *)

fun addSpecParInfo
  (makeInRefTy, makeOutRefTy)
  (parInfo, acc as (((inTys, outTys), tyVarIdx), iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun addInTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy (tyRef, tyVarIdx)
      in
        ((mkOpt isOpt ty :: inTys, outTys), tyVarIdx')
      end

    fun addInOutTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeInRefTy (tyRef, tyVarIdx)
        val isRetCondInit = false
        val optTy = mkOpt isOpt ty
      in
        ((optTy :: inTys, (optTy, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addOutTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy (tyRef, tyVarIdx)
        val isRetCondInit = true
      in
        ((inTys, (mkOpt isOpt ty, isRetCondInit) :: outTys), tyVarIdx')
      end

    fun addTy dir isOpt ifTyRef =
      case dir of
        IN    => addInTy isOpt ifTyRef
      | INOUT => addInOutTy isOpt ifTyRef
      | OUT _ => addOutTy isOpt ifTyRef

    fun addIRefTy dir isOpt iRef iRefs =
      let
        val {scope, ...} = iRef
        val iRefs' =
          case scope of
            GLOBAL             => iRefs
          | LOCALINTERFACESELF => iRefs
          | _                  => insert (iRef, iRefs)

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (addTy dir isOpt ifTyRef, iRefs')
      end
  in
    case parInfo of
      PIVOID                                => acc
    | PISCALAR (dir, {ty, ...})             => (addTy dir false (scalarTyRef ty), iRefs)
    | PIUTF8 (dir, {isOpt, ...})            => (addTy dir isOpt utf8TyRef, iRefs)
    | PIINTERFACE (dir, {iRef, isOpt, ...}) => addIRefTy dir isOpt iRef iRefs
  end


fun addSpecRetInfo
  makeOutRefTy
  (optConstructorIRef)
  (retInfo, (tyVarIdx, iRefs)) =
  let
    fun mkOpt isOpt ty = if isOpt then optionTy ty else ty

    fun mkTy isOpt tyRef =
      let
        val (ty, tyVarIdx') = makeOutRefTy (tyRef, tyVarIdx)
      in
        (mkOpt isOpt ty, tyVarIdx')
      end

    fun mkIRefTy isOpt iRef iRefs =
      let
        val {scope, ...} = iRef
        val iRefs' =
          case scope of
            GLOBAL             => iRefs
          | LOCALINTERFACESELF => iRefs
          | _                  => insert (iRef, iRefs)

        val ifTyRef = (
          numInterfaceRefTyVars iRef,
          makeInterfaceRefTyLongId iRef
        )
      in
        (mkTy isOpt ifTyRef, iRefs')
      end
  in
    case retInfo of
      RIVOID                       => ((unitTy, tyVarIdx), iRefs)
    | RISCALAR {ty, ...}           => (mkTy false (scalarTyRef ty), iRefs)
    | RIUTF8 {isOpt, ...}          => (mkTy isOpt utf8TyRef, iRefs)
    | RIINTERFACE {
        name,
        iRef,
        infoType,
        isOpt,
        ptrOwnXfer,
        ...
      }                            =>
        let
          val interfaceRetInfo = {
            name       = name,
            iRef       =
              case (optConstructorIRef, infoType) of
                (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
              | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
              | _                                            => iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
          val {iRef, isOpt, ...} = interfaceRetInfo
        in
          mkIRefTy isOpt iRef iRefs
        end
  end


fun makeFunctionSpec
  repo
  (optContainerIRef : interfaceref option)
  (functionInfo, (iRefs, errs))
  : spec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = mkId (toLCC functionName)
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    (* For a method function, add an initial argument type for the interface
     * that contains this function. *)
    val tyVarIdx'0 = 0
    val (revInTys'1, tyVarIdx'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optContainerIRef of
          SOME containerIRef =>
            let
              val (selfTy, tyVarIdx'1) =
                makeIRefLocalTypeRef makeRefVarTy (containerIRef, tyVarIdx'0)
            in
              ([selfTy], tyVarIdx'1)
            end
        | NONE               =>
            infoError "function outside interface has method flag set"
      else
        ([], tyVarIdx'0)
    val revOutTys'1 = []
    val iRefs'1 = iRefs

    (* Add types for the arguments and the return value. *)
    val (((revInTys'2, revOutTys'2), tyVarIdx'2), iRefs'2) =
      foldl
        (addSpecParInfo (makeRefVarTy, makeRefBaseTy))
        (((revInTys'1, revOutTys'1), tyVarIdx'1), iRefs'1)
        parInfos

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISCONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val ((retValTy, _), iRefs'3) =
      addSpecRetInfo
        makeRefBaseTy
        optConstructorIRef
        (retInfo, (tyVarIdx'2, iRefs'2))

    (* Handle case L = 0 and ISMETHOD not set in FunctionFlags. *)
    val revInTys'3 =
      case revInTys'2 of
        []     => [unitTy]
      | _ :: _ => revInTys'2

    (* `revOutTys'2` contains out parameter types associated with
     * the caller-allocates flag for each out parameter. *)
    val retTy =
      case revOutTys'2 of
        []     => retValTy
      | _ :: _ =>
          let
            fun getTy (ty, _) = ty
            fun getCondTy (ty, isCond) = if isCond then SOME ty else NONE

            val (outParamTysCond, outParamTysUncond) =
              partitionRevMap (getCondTy, getTy) revOutTys'2

            val retTys =
              case (retInfo, outParamTysCond) of
                (RIVOID,                         [])        => outParamTysUncond

              | (_,                              [])        =>
                  retValTy :: outParamTysUncond

              | (RISCALAR {ty = STBOOLEAN, ...}, ty :: tys) =>
                  optionTy (mkProdTy1 (ty, tys)) :: outParamTysUncond

              | (RIVOID,                         _ :: _)    =>
                  outParamTysCond @ outParamTysUncond

              | (_,                              _ :: _)    =>
                  retValTy :: (outParamTysCond @ outParamTysUncond)

               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
              | (_,                              _ :: _)    =>
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
          in
            mkProdTy0 retTys  (* `length retTys > 0` so result not unit type *)
          end

    val functionTy = foldl TyFun retTy revInTys'3
  in
    (mkValSpec (functionNameId, functionTy), (iRefs'3, errs))
  end

(*
 *     val getType : unit -> <typeIRef>
 *)
fun getTypeSpec typeIRef =
  let
    val (typeRefTy, _) = makeIRefLocalTypeRef makeRefBaseTy (typeIRef, 0)
  in
    mkValSpec (getTypeId, TyFun (unitTy, typeRefTy))
  end


(* High-level *)

(* `addParInfo` accumulates high-level function components in the parameter
 *
 *   `(js, ks, ls, iRefs)`
 *
 * The lists `js`, `ks` and `ls` accumulate the components of the vectors of
 * sizes J, K and L, respectively, in the CODEGEN for HighLevelFunction.
 *
 * `js`, `ks` and `ls` are built up in reverse.  After iterating over all
 * `parInfo` values, the final values are as follows:
 *
 *
 *   the j<th> element of `js` contains
 *
 *     (<withFun[j]>, <argVal[j]>)
 *
 *
 *   the k<th> element of `ks` contains
 *
 *     (<fromFun[k]>, <outParamName[k]>, <isCondOut[k]>)
 *
 *
 *   the l<th> element of `ls` contains
 *
 *     <inParamName[l]>
 *
 *
 * `iRefs` accumulates the references to interfaces for generating type
 * declarations as required by the signature and the corresponding where
 * clauses on the signature ascription in the structure.
 *)

local
  fun withFunExp prefixIds {isRef, isDup, isNew, isOpt, isPtr} =
    let
      val refStr = if isRef then "Ref" else ""
      val dupStr = if isDup then "Dup" else ""
      val newStr = if isNew then "New" else ""
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isPtr then "Ptr" else "Val"

      val withFunId =
        concat ["with", refStr, dupStr, newStr, optStr, ptrStr]
    in
      mkLIdLNameExp (prefixIds @ [withFunId])
    end

  fun fromFunExp prefixIds {isOpt, ptrOwnXfer} =
    let
      val optStr = if isOpt then "Opt" else ""
      val ptrStr = if isSome ptrOwnXfer then "Ptr" else "Val"

      val fromFunId = concat ["from", optStr, ptrStr]
      val funExp = mkLIdLNameExp (prefixIds @ [fromFunId])
    in
      case ptrOwnXfer of
        NONE   => funExp
      | SOME b => ExpApp (funExp, mkIdLNameExp (Bool.toString b))
    end

  fun withFunScalar (dir, {ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, CId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = false,
        isNew = false,
        isOpt = false,
        isPtr = false
      }
    end

  fun withFunUtf8 (dir, {isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, CId]
    in
      withFunExp prefixIds {
        isRef = dir <> IN,
        isDup = false,
        isNew = false,
        isOpt = isOpt orelse case dir of OUT _ => true | _ => false,
        isPtr = true
      }
    end

  fun withFunInterface
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef ["C"]
        | INTERFACE _ => prefixInterfaceStrId rootIRef ["C"]
        | STRUCT _    => prefixInterfaceStrId rootIRef ["C"]
        | _           =>
            if isSelf
            then ["C"]
            else prefixInterfaceStrId rootIRef ["C"]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef ["C"]

      open InfoType
    in
      withFunExp prefixIds {
        isRef =
          dir <> IN andalso (
            case infoType of
              STRUCT _ => isSome ptrOwnXfer
            | _        => true
          ),
        isDup =
          case (infoType, dir) of
            (OBJECT _, INOUT) => true
          | (STRUCT _, INOUT) => true
          | _                 => false,
        isNew =
          case dir of
            OUT isCallerAllocates => isCallerAllocates
          | _                     => false,
        isOpt =
          case dir of
            IN    => isOpt
          | OUT _ => isSome ptrOwnXfer
          | INOUT => false,
        isPtr =
          case infoType of
            STRUCT _ => true
          | _        => isSome ptrOwnXfer
      }
    end

  fun fromFunScalar ({ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, CId]
    in
      fromFunExp prefixIds {
        isOpt      = false,
        ptrOwnXfer = NONE
      }
    end

  fun fromFunUtf8 (_, {ownXfer, isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, CId]
    in
      fromFunExp prefixIds {
        isOpt      = isOpt,
        ptrOwnXfer = SOME ownXfer
      }
    end

  fun fromFunInterface
    (isInOut, {iRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = iRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId iRef ["C"]
        | INTERFACE _ => prefixInterfaceStrId iRef ["C"]
        | STRUCT _    => prefixInterfaceStrId iRef ["C"]
        | _           =>
            if isSelf
            then ["C"]
            else prefixInterfaceStrId iRef ["C"]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId iRef ["C"]

      open InfoType
    in
      fromFunExp prefixIds {
        isOpt      = isOpt,
        ptrOwnXfer =
          case (infoType, isInOut, ptrOwnXfer) of
            (OBJECT _,    true,  _)    => SOME true
          | (INTERFACE _, true,  _)    => SOME true
          | (STRUCT _,    false, NONE) => SOME true
          | (STRUCT _,    true,  _)    => SOME true
          | _                          => ptrOwnXfer
      }
    end

  fun argValScalar (dir, {ty, name, ...} : scalarinfo) =
    case dir of
      OUT _ => mkLIdLNameExp [FFIId, scalarStrId ty, nullId]
    | _     => mkIdLNameExp name

  fun argValUtf8 (dir, {name, ...} : utf8info) =
    case dir of
      OUT _ => noneExp
    | _     => mkIdLNameExp name

  fun argValInterface
    (dir, {iRef, infoType, ptrOwnXfer, name, ...} : interfaceinfo) =
    case dir of
      OUT _ =>
        let
          open InfoType
        in
          case infoType of
            OBJECT _    => noneExp
          | INTERFACE _ => noneExp
          | STRUCT _    =>
              if isSome ptrOwnXfer
              then noneExp
              else ExpConst ConstUnit
          | FLAGS _     =>
              ExpApp (
                mkLIdLNameExp (prefixInterfaceStrId iRef [flagsId]),
                ExpList []
              )
          | ENUM _      => mkLIdLNameExp (prefixInterfaceStrId iRef ["null"])
          | _           =>
              infoError "initVal for unidentified INTERFACE not supported"
        end
    | _     => mkIdLNameExp name

  fun parNameScalar ({name, ...} : scalarinfo) = name

  fun parNameUtf8 ({name, ...} : utf8info) = name

  fun parNameInterface ({name, ...} : interfaceinfo) = name
in
  fun addParInfo (parInfo, acc as (js, ks, ls, iRefs)) =
    case parInfo of
      PIVOID                                             => acc
    | PISCALAR (dir, scalarParInfo)                      =>
        let
          val withFunExp = withFunScalar (dir, scalarParInfo)
          val argValExp = argValScalar (dir, scalarParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameScalar scalarParInfo
          fun makeK isRetCondInit = (
            fromFunScalar scalarParInfo,
            (parName, isRetCondInit)
          )
          val l = mkIdVarAPat parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)

          val iRefs' = iRefs
        in
          (js', ks', ls', iRefs')
        end
    | PIUTF8 (dir, utf8ParInfo)                          =>
        let
          val withFunExp = withFunUtf8 (dir, utf8ParInfo)
          val argValExp = argValUtf8 (dir, utf8ParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameUtf8 utf8ParInfo
          fun makeK isRetCondInit = (
            fromFunUtf8 (dir = INOUT, utf8ParInfo),
            (parName, isRetCondInit)
          )
          val l = mkIdVarAPat parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)

          val iRefs' = iRefs
        in
          (js', ks', ls', iRefs')
        end
    | PIINTERFACE (dir, interfaceParInfo as {iRef, ...}) =>
        let
          val withFunExp = withFunInterface (dir, interfaceParInfo)
          val argValExp = argValInterface (dir, interfaceParInfo)
          val js' = (withFunExp, argValExp) :: js

          val parName = parNameInterface interfaceParInfo
          fun makeK isRetCondInit = (
            fromFunInterface (dir = INOUT, interfaceParInfo),
            (parName, isRetCondInit)
          )
          val l = mkIdVarAPat parName
          val (ks', ls') =
            case dir of
              OUT _ => (makeK true :: ks,  ls)
            | INOUT => (makeK false :: ks, l :: ls)
            | IN    => (ks,                l :: ls)

          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (js', ks', ls', iRefs')
        end

  fun addRetInfo optConstructorIRef (retInfo, iRefs) =
    case retInfo of
      RIVOID                 => (mkIdLNameExp "I", iRefs)
    | RISCALAR scalarRetInfo =>
        let
          val iRefs' = iRefs
        in
          (fromFunScalar scalarRetInfo, iRefs')
        end
    | RIUTF8 utf8RetInfo     =>
        let
          val iRefs' = iRefs
        in
          (fromFunUtf8 (false, utf8RetInfo), iRefs')
        end
    | RIINTERFACE {
        name,
        rootIRef,
        iRef,
        infoType,
        isOpt,
        ptrOwnXfer
      }                      =>
        let
          val interfaceRetInfo = {
            name       = name,
            rootIRef   = rootIRef,
            iRef       =
              case (optConstructorIRef, infoType) of
                (SOME constructorIRef, InfoType.OBJECT _)    => constructorIRef
              | (SOME constructorIRef, InfoType.INTERFACE _) => constructorIRef
              | _                                            => iRef,
            infoType   = infoType,
            isOpt      = isOpt,
            ptrOwnXfer = ptrOwnXfer
          }
          val {iRef, ...} = interfaceRetInfo
          val {scope, ...} = iRef
          val iRefs' =
            case scope of
              GLOBAL             => iRefs
            | LOCALINTERFACESELF => iRefs
            | _                  => insert (iRef, iRefs)
        in
          (fromFunInterface (false, interfaceRetInfo), iRefs')
        end
end


fun withFunErr namespace optName =
  mkLIdLNameExp (
    prefixInterfaceStrId (makeErrorIRef namespace optName) [handleErrorId]
  )

fun argValErr (_ : lid list) =
  ExpList []


val retValId : id = "retVal"
val retValPat : pat = mkIdVarPat retValId
val retValExp : exp = mkIdLNameExp retValId

val retVal =
  fn
    RIVOID => (PatA (APatConst ConstUnit), ExpConst ConstUnit)
  | _      => (retValPat, retValExp)


val aInfixId = "&"
val aAInfixId = "&&"
val aARInfixId = "&&>"
val aAARInfixId = "&&&>"
val dDRInfixId = "-->"
val dDDRInfixId = "--->"

fun mkAExp (a, b) = ExpInfixApp (a, aInfixId, b)
fun mkAPat (a, b) = PatInfix (a, aInfixId, b)
fun mkAAExp (a, b) = ExpInfixApp (a, aAInfixId, b)
fun mkAARExp (a, b) = ExpInfixApp (a, aARInfixId, b)
fun mkAAARExp (a, b) = ExpInfixApp (a, aAARInfixId, b)
fun mkDDRExp (a, b) = ExpInfixApp (a, dDRInfixId, b)
fun mkDDDRExp (a, b) = ExpInfixApp (a, dDDRInfixId, b)


fun retValCondExp retValExp (es1 : exp list1) : exp =
  ExpCond (retValExp, someExp (mkTupleExp1 es1), noneExp)


fun makeFunctionStrDecHighLevel
  repo
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, (iRefs, errs))
  : strdec * (interfaceref list * infoerrorhier list) =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameLCC = toLCC functionName
    val functionNameUId = functionNameLCC ^ "_"
    val functionNameId = mkId functionNameLCC
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerIRef) =
      case optRootContainerIRef of
        SOME (rootIRef, containerIRef) => (SOME rootIRef, SOME containerIRef)
      | NONE                           => (NONE, NONE)
    val optContainerName = Option.map #name optContainerIRef

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val (revJs'1, revLs'1) =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef =>
            let
              val withFun =
                mkLIdLNameExp (
                  prefixInterfaceStrId rootIRef ["C", withPtrId]
                )
              val argVal = mkIdLNameExp selfId
              val inParamAPat = mkIdVarAPat selfId
            in
              ([(withFun, argVal)], [inParamAPat])
            end
        | NONE          =>
            infoError "function outside interface has method flag set"
      else
        ([], [])
    val revKs'1 = []
    val iRefs'1 = iRefs

    (* Construct J, K, L vectors in forward pass over parameter infos.
     * As for a function spec, `iRefs` should be generated in a forwards
     * pass over the parameter infos so types appear in order of first
     * appearance. *)
    val (revJs'2, revKs'2, revLs'2, iRefs'2) =
      foldl addParInfo (revJs'1, revKs'1, revLs'1, iRefs'1) parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revJs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        (
          withFunErr functionNamespace optContainerName,
          argValErr []
        ) :: revJs'2
      else
        revJs'2

    val optConstructorIRef =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISCONSTRUCTOR)
      then
        case optContainerIRef of
          SOME _ => optContainerIRef
        | NONE   =>
            infoError "function outside interface has constructor flag set"
      else
        NONE
    val (retFromFun, iRefs'3) =
      addRetInfo optConstructorIRef (retInfo, iRefs'2)

    (* Derive non-empty lists `revWithFuns1` and `revArgVals1` from `revJs'3`
     * and non-empty list `inParamNames1` from `revLs'2`.  When
     *
     *   J = 0 and not anySet (functionFlags, flags [ISMETHOD, THROWS])
     *
     * `revJs'3` is empty and when L = 0, `revLs'2` is empty.  The cases when
     * `revJs'3` and `revLs'2` are empty are handled as follows:
     *
     * `inParamNames1 : apat list1` is
     *
     *   ()
     *     if revLs'2 = []
     *)
    val inParamNames1 : apat list1 = getList1 (rev revLs'2, APatConst ConstUnit)

    (* `revWithFuns1 : exp list1` is
     *
     *   I
     *     if revJs'3 = []
     *
     * and `revArgVals1 : exp list1` is
     *
     *   ()
     *     if revJs'3 = []
     *)
    val (revWithFuns1 : exp list1, revArgVals1 : exp list1) =
      unzip1 (getList1 (revJs'3, (iExp, ExpConst ConstUnit)))

    (* No need to handle K = 0 here: lists `revFromFuns` and `revOutParams` may
     * be empty.  `revOutParams` contains out parameter names associated with
     * the conditional output flag for each out parameter.
     *)
    val (revFromFuns, revOutParams) = ListPair.unzip revKs'2

    (* Construct
     *
     *   <fromFun[1]> && ... && <fromFun[K]> && <retFromFun>
     *)
    val fromFunsExp = foldl mkAAExp retFromFun revFromFuns

    (*
     *   <withFun[1]> &&&> ... &&&> <withFun[J]>
     *)
    val withFunsExp = foldl1 mkAAARExp revWithFuns1

    (*
     *   <argVal[1]> & ... & <argVal[J]>
     *)
    val argValsExp = foldl1 mkAExp revArgVals1

    (*
     *   (<withFun[1]> &&&> ... &&&> <withFun[J]>
     *     ---> <fromFun[1]> && ... && <fromFun[K]> && <retFromFun>)
     *     <functionName>_
     *     (<argVal[1]> & ... & <argVal[J]>)
     *)
    val functionCoreExp =
      ExpApp (
        ExpApp (
          mkParenExp (mkDDDRExp (withFunsExp, fromFunsExp)),
          mkIdLNameExp functionNameUId
        ),
        case revArgVals1 of
          (_,        _ :: _) => mkParenExp argValsExp
        | (ExpApp _, [])     => mkParenExp argValsExp
        | _                  => argValsExp
      )

    (* Construct the function body with the form:
     *
     *   let
     *     val <outParamName[1]> & ... & <outParamName[K]> & <retVal> =
     *       <functionCoreExp>
     *   in
     *     <retExp>
     *   end
     *     if K > 0
     *
     *
     *   <functionCoreExp>
     *     otherwise
     *)
    val functionExp =
      case revOutParams of
        []     => functionCoreExp
      | _ :: _ =>
          let
            fun getNamePat (id, _) = mkIdVarPat id
            fun getNameExp (id, _) = mkIdLNameExp id
            fun getCondNameExp (id, isCond) =
              if isCond then SOME (mkIdLNameExp id) else NONE

            val (outParamExpsCond, outParamExpsUncond) =
              partitionRevMap (getCondNameExp, getNameExp) revOutParams

            val (retValPat, retValExp) = retVal retInfo
            val retExps =
              case (retInfo, outParamExpsCond) of
                (RIVOID,                         [])      => outParamExpsUncond

              | (_,                              [])      =>
                  retValExp :: outParamExpsUncond

              | (RISCALAR {ty = STBOOLEAN, ...}, e :: es) =>
                  retValCondExp retValExp (e, es) :: outParamExpsUncond

              | (RIVOID,                         _ :: _)  =>
                  outParamExpsCond @ outParamExpsUncond

              | (_,                              _ :: _)  =>
                  retValExp :: (outParamExpsCond @ outParamExpsUncond)
               (*
                * In future, when conditional outs can be identifed
                * the last two cases will be:
                *
                  infoError "non-BOOLEAN return type with \
                            \conditional out parameters"
                *)
            val retExp =
              case retExps of
                []      => ExpConst ConstUnit  (* unreachable *)
              | e :: [] => e
              | e :: es => ExpParen (e, es)

            val revOutParamPats = map getNamePat revOutParams
            val pat = foldl mkAPat retValPat revOutParamPats
            val dec = DecVal (toList1 [([], false, pat, functionCoreExp)])
          in
            ExpLet (mkDecs [dec], toList1 [retExp])
          end
  in
    (
      StrDecDec (
        DecFun (
          [],
          toList1 [
            toList1 [
              (
                FunHeadPrefix (NameId functionNameId, inParamNames1),
                NONE,
                functionExp
              )
            ]
          ]
        )
      ),
      (iRefs'3, errs)
    )
  end

(*
 *     val getType = (I ---> GObjectType.C.fromVal) getType_
 *)
val getTypeStrDecHighLevel =
  StrDecDec (
    mkIdValDec (
      getTypeId,
      ExpApp (
        mkParenExp (
          mkDDDRExp (iExp, mkLIdLNameExp ["GObjectType", "C", fromValId])
        ),
        mkIdLNameExp getTypeUId
      )
    )
  )



(* Low-level - common *)

datatype low_level_spec =
  VAL
| PTR of {optIsRet : bool option, isOpt : bool}
| REF of {isInOut : bool, isOpt : bool} option



(* Low-level - Poly/ML *)

(* `callPolyMLFFIExp libId functionSymbol (parConvs, retConv)` constructs
 * a Poly/ML low-level function call expression as follows:
 *
 *   call
 *     (load_sym <libId> "<functionSymbol>")
 *     (<parConvs> --> <retConv>)
 *)
fun callPolyMLFFIExp libId functionSymbol (parConvs, retConv) =
  ExpApp (
    ExpApp (
      mkIdLNameExp callId,
      mkParenExp (
        ExpApp (
          ExpApp (
            mkIdLNameExp loadSymId,
            mkIdLNameExp libId
          ),
          ExpConst (ConstString functionSymbol)
        )
      )
    ),
    mkParenExp (mkDDRExp (parConvs, retConv))
  )


local
  (*
   * Value conversions:
   *   <A>.cVal
   *   <A>.cRef
   *
   * Pointer conversions:
   *   <A>.c<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *
   * Array types:
   *   <A>.cIn<Opt>Ptr
   *   <A>.cOut<Opt>Ptr
   *   <A>.cOut<Opt>Ref
   *   <A>.cInOut<Opt>Ref
   *)
  fun convExp prefixIds spec =
    let
      val convId =
        case spec of
          VAL                         => "cVal"
        | PTR {optIsRet, isOpt}       =>
            let
              val inOutStr =
               case optIsRet of
                  NONE       => ""
                | SOME false => "In"
                | SOME true  => "Out"
              val optStr = if isOpt then "Opt" else ""
            in
              concat ["c", inOutStr, optStr, "Ptr"]
            end
        | REF NONE                    => "cRef"
        | REF (SOME {isInOut, isOpt}) =>
            let
              val inOutStr = if isInOut then "InOut" else "Out"
              val optStr = if isOpt then "Opt" else ""
            in
              concat ["c", inOutStr, optStr, "Ref"]
            end
    in
      mkLIdLNameExp (prefixIds @ [convId])
    end

  val retVoidConv = cVoidConv

  fun parScalarConv (dir, {ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, PolyMLId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarConv ({ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, PolyMLId]
    in
      convExp prefixIds VAL
    end

  fun parUtf8Conv (dir, {isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, PolyMLId]
    in
      convExp prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optIsRet = SOME false,
            isOpt    = isOpt
          }
      )
    end

  fun retUtf8Conv ({isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, PolyMLId]
    in
      convExp prefixIds (
        PTR {
          optIsRet = SOME true,
          isOpt    = isOpt
        }
      )
    end

  fun parInterfaceConv
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId rootIRef [PolyMLId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [PolyMLId]

      open InfoType
    in
      convExp prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optIsRet = NONE,
            isOpt    = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceConv
    ({rootIRef, infoType, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [PolyMLId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [PolyMLId]
        | _           =>
            if isSelf
            then [PolyMLId]
            else prefixInterfaceStrId rootIRef [PolyMLId]

 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [PolyMLId]

      open InfoType
    in
      convExp prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optIsRet = NONE,
            isOpt    = isOpt
          }
      )
    end
in
  val makeConv = convExp

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID => acc
    | PISCALAR (dir, scalarParInfo) =>
        let
          val convExp = parScalarConv (dir, scalarParInfo)
        in
          convExp :: acc
        end
    | PIUTF8 (dir, utf8ParInfo) =>
        let
          val convExp = parUtf8Conv (dir, utf8ParInfo)
        in
          convExp :: acc
        end
    | PIINTERFACE (dir, interfaceParInfo) =>
        let
          val convExp = parInterfaceConv (dir, interfaceParInfo)
        in
          convExp :: acc
        end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID                       => retVoidConv
    | RISCALAR scalarRetInfo       => retScalarConv scalarRetInfo
    | RIUTF8 utf8RetInfo           => retUtf8Conv utf8RetInfo
    | RIINTERFACE interfaceRetInfo => retInterfaceConv interfaceRetInfo

  fun parSelfConv rootIRef =
    convExp
      (prefixInterfaceStrId rootIRef [PolyMLId])
      (
        PTR {
          optIsRet = NONE,
          isOpt    = false
        }
      )

  fun parErrConv namespace optName =
    convExp
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [PolyMLId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelPolyML
  repo
  libId
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerName) =
      case optRootContainerIRef of
        SOME (rootIRef, {name, ...}) => (SOME rootIRef, SOME name)
      | NONE                         => (NONE, NONE)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParConvs'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef => [parSelfConv rootIRef]
        | NONE          =>
            infoError "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParConvs'2 = foldl addParInfo revParConvs'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParConvs'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrConv functionNamespace optContainerName :: revParConvs'2
      else
        revParConvs'2

    val retConv = addRetInfo retInfo

    (* `revParConvs1 : exp list1` is
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>, <selfConv>
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>, <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   <paramConv[J]>, ..., <paramConv[1]>
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   <paramConvErr>
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   FFI.PolyML.cVoid
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val revParConvs1 : exp list1 = getList1 (revParConvs'3, cVoidConv)

    val parConvs = foldl1 mkAARExp revParConvs1

    (* Construct the function body with the form:
     *
     *   call
     *     (load_sym lib<functionnamespace> "<function_symbol>")
     *     (<parConvs> --> <retConv>)
     *)
    val functionExp =
      callPolyMLFFIExp
        libId
        functionSymbolStr
        (parConvs, retConv)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      errs
    )
  end

(*
 *     val getType_ =
 *       call
 *         (load_sym <libId> "<getTypeSymbol>")
 *         (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal);
 *)
fun getTypeStrDecLowLevelPolyML libId getTypeSymbol =
  let
    val parConvs = cVoidConv
    val retConv = makeConv ["GObjectType", PolyMLId] VAL
  in
    StrDecDec (
      mkIdValDec (
        getTypeUId,
        callPolyMLFFIExp libId getTypeSymbol (parConvs, retConv)
      )
    )
  end


(* Low-level - MLton *)

(* `callMLtonFFIExp functionSymbol (parProdTys, retTy)` constructs a MLton
 * low-level function call expression as follows:
 *
 *
 *   fn <xProd[1]> & ... & <xProd[N]> =>
 *     (_import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;)
 *     (x<1>, ..., x<M>)
 *
 *     if N > 1
 *
 *
 *   _import "<symbol>" : <parTy[1]> * ... * <parTy[M]> -> <retTy>;
 *
 *     if N = 1
 *
 *
 *   _import "<symbol>" : unit -> <retTy>;
 *
 *     if N = 0
 *
 *
 * where
 *
 *
 *   N = length parProdTys
 *
 *
 *   xProd[n]
 *     is defined as follows, for some m:
 *
 *       x<m>
 *         if parProdTys[n] is <parTy[m]>
 *
 *       (x<m>, ..., x<m + p>)
 *         if parProdTys[n] is <parTy[m]> * ... * <parTy[m + p]>
 *
 *
 *   symbol
 *     is defined as follows:
 *
 *       mlton_<functionSymbol>
 *         if there exists an i such that parProdTys[i] is a tuple type
 *
 *       <functionSymbol>
 *
 *
 * and
 *
 *
 *   parTy[n], for 1 <= n <= N, is not a tuple type
 *
 *
 *   xProd[1]
 *     has one of the forms
 *
 *       x1
 *
 *       (x1, ...)
 *
 *
 *   xProd[n + 1]
 *     for n >= 1, has one of the forms
 *
 *       x<m + 1>
 *
 *       (x<m + 1>, ...)
 *
 *         where m is such that xProd[n] has one of the forms
 *
 *           x<m>
 *
 *           (..., x<m>)
 *
 *
 *   xProd[N]
 *     has one of the forms
 *
 *       x<M>
 *
 *       (..., x<M>)
 *)

local
  fun addProdTy (prodTy, (acc, revTuplePats, existsProdTy)) =
    let
      val tys = destProdTy0 prodTy

      fun addTy (ty, ((exps, tys, n), pats)) =
        let
          val id = "x" ^ Int.toString n
          val exps' = mkIdLNameExp id :: exps
          val tys' = ty :: tys
          val pats' = mkIdVarPat id :: pats
        in
          ((exps', tys', n + 1), pats')
        end

      val (acc', revPats') = foldl addTy (acc, []) tys

      val tuplePat =
        case rev revPats' of
          []          => PatA (APatConst ConstUnit)
        | op :: pats1 => mkTuplePat1 pats1

      val existsProdTy' =
        case prodTy of
          TyProd _ => true
        | _        => existsProdTy
    in
      (acc', tuplePat :: revTuplePats, existsProdTy')
    end
in
  fun callMLtonFFIExp functionSymbol (parProdTys, retTy) =
    let
      val ((revExps, revTys, _), revTuplePats, existsProdTy) =
        foldl addProdTy (([], [], 1), [], false) parProdTys;

      val symbol =
        if existsProdTy
        then "mlton_" ^ functionSymbol
        else functionSymbol
    in
      case (rev revExps, rev revTys, revTuplePats) of
        (op :: exps1, parTys, op :: (revTuplePats1 as (_, _ :: _))) =>
          (* Wrap with fn ... => ... when `revTuplePats` has two or more
           * elements.  Note that a match `op :: exps1` always occurs when
           * `revTuplePats` has at least one element, so its only purpose
           * is to give `exps1 : list1`.
           *)
          let
            val tupleExp = mkTupleExp1 exps1
            val pat = foldl1 mkAPat revTuplePats1
            val exp =
              ExpApp (
                mkParenExp (mkMLtonImportExp symbol (parTys, retTy)),
                tupleExp
              )
          in
            ExpFn (toList1 [(pat, exp)])
          end
      | (_,           parTys, _)                                    =>
          mkMLtonImportExp symbol (parTys, retTy)

    end
end

(*
val exp = callMLtonFFIExp "testfun" ([], unitTy);
val exp = callMLtonFFIExp "testfun" ([unitTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([boolTy, boolTy], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy]], unitTy);
val exp = callMLtonFFIExp "testfun" ([mkProdTy0 [boolTy, boolTy], boolTy], unitTy);

HVTextTree.V.app (fn () => print "\n", print) (HVTextTree.toV (PrettyPrint.fmtExp (HTextTree.str "") exp));
*)


local
  (*
   * Value types:
   *   <A>.val_
   *   <A>.ref_
   *
   * Pointer types:
   *   <opt> <A>.p
   *   (<inopt>, <outopt>) <A>.r
   *
   * Array types:
   *   <opt> <A>.in_p
   *   <opt> <A>.out_p
   *   (<inopt>, <outopt>) <A>.r
   *)
  local
    val structId = utf8StrId
    val mltonId = "MLton"
    fun mkOptTy isOpt = if isOpt then unitTy else mkNotnullTy [structId, CId]
  in
    (* `Utf8.MLton.p1 * <opt> Utf8.MLton.p2`
     *
     *   where <opt> is
     *     unit
     *       if `isOpt`
     *
     *     Utf8.C.notnull
     *       otherwise
     *)
    fun utf8PtrTy isOpt =
      mkProdTy0 [
        TyRef ([], toList1 [structId, mltonId, "p1"]),
        TyRef ([mkOptTy isOpt], toList1 [structId, mltonId, "p2"])
      ]

    (* `Utf8.MLton.r1 * (<inopt>, <outopt>) Utf8.MLton.r2`
     *
     *   where <inopt> is
     *     unit
     *       if `isOpt orelse not isInOut`
     *
     *     Utf8.C.notnull
     *       otherwise
     *
     *   where <outopt> is
     *     unit
     *       if `isOpt`
     *
     *     Utf8.C.notnull
     *       otherwise
     *)
    fun utf8RefTy isInOut isOpt =
      mkProdTy0 [
        TyRef ([], toList1 [structId, mltonId, "r1"]),
        TyRef (
          [
            mkOptTy (isOpt orelse not isInOut),
            mkOptTy isOpt
          ],
          toList1 [structId, mltonId, "r2"]
        )
      ]
  end

  fun typeTy isUtf8 prefixIds spec =
    let
      val ty =
        case spec of
          VAL                         => mkLIdTy (prefixIds @ ["val_"])
        | PTR {optIsRet, isOpt}       =>
            if isUtf8
            then
              utf8PtrTy isOpt
            else
              let
                val inOutStr =
                  case optIsRet of
                    NONE       => ""
                  | SOME false => "in_"
                  | SOME true  => "out_"
                val ty = if isOpt then unitTy else mkNotnullTy prefixIds
              in
                TyRef ([ty], toList1 (prefixIds @ [concat [inOutStr, "p"]]))
              end
        | REF NONE                    => mkLIdTy (prefixIds @ ["ref_"])
        | REF (SOME {isInOut, isOpt}) =>
            if isUtf8
            then
              utf8RefTy isInOut isOpt  (* !!!! needed? !!!! *)
            else
              let
                val isInOpt = isOpt orelse not isInOut
                val isOutOpt = isOpt

                val tys'0 = []
                val tys'1 =
                  case isOutOpt of
                    false => mkNotnullTy prefixIds :: tys'0
                  | true  => unitTy :: tys'0
                val tys'2 =
                  case isInOpt of
                    false => mkNotnullTy prefixIds :: tys'1
                  | true  => unitTy :: tys'1
              in
                TyRef (tys'2, toList1 (prefixIds @ ["r"]))
              end
    in
      ty
    end

  val retVoidType = unitTy

  fun parScalarType (dir, {ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, CId]
    in
      typeTy false prefixIds (
        if dir <> IN
        then
          REF NONE
        else
          VAL
      )
    end

  fun retScalarType ({ty, ...} : scalarinfo) =
    let
      val prefixIds = [FFIId, scalarStrId ty, CId]
    in
      typeTy false prefixIds VAL
    end

  fun parUtf8Type (dir, {isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, CId]
    in
      typeTy true prefixIds (
        if dir <> IN
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else
          PTR {
            optIsRet = SOME false,
            isOpt    = isOpt
          }
      )
    end

  fun retUtf8Type ({isOpt, ...} : utf8info) =
    let
      val prefixIds = [utf8StrId, CId]
    in
      typeTy false prefixIds (
        PTR {
          optIsRet = SOME true,
          isOpt    = isOpt
        }
      )
    end

  fun parInterfaceType
    (dir, {rootIRef, infoType, ptrOwnXfer, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [CId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [CId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [CId]
        | _           =>
            if isSelf
            then [CId]
            else prefixInterfaceStrId rootIRef [CId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [CId]

      open InfoType
    in
      typeTy false prefixIds (
        if dir <> IN andalso isSome ptrOwnXfer
        then
          REF (
            SOME {
              isInOut = dir = INOUT,
              isOpt   = false
            }
          )
        else if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          if dir <> IN
          then
            REF NONE
          else
            VAL
        else
          PTR {
            optIsRet = NONE,
            isOpt    = isOpt andalso isSome ptrOwnXfer
          }
      )
    end

  fun retInterfaceType
    ({rootIRef, infoType, isOpt, ...} : interfaceinfo) =
    let
(*
      val {isSelf, ...} = rootIRef

      open InfoType
      val prefixIds =
        case infoType of
          OBJECT _    => prefixInterfaceStrId rootIRef [CId]
        | INTERFACE _ => prefixInterfaceStrId rootIRef [CId]
        | STRUCT _    => prefixInterfaceStrId rootIRef [CId]
        | _           =>
            if isSelf
            then [CId]
            else prefixInterfaceStrId rootIRef [CId]
 * Is above really needed?
 * Doesn't `prefixInterfaceStrId` handle SIMPLE case for LOCALINTERFACESELF?
 * Let's see...
 *)
      val prefixIds = prefixInterfaceStrId rootIRef [CId]

      open InfoType
    in
      typeTy false prefixIds (
        if
          case infoType of
            FLAGS _ => true
          | ENUM _  => true
          | _       => false
        then
          VAL
        else
          PTR {
            optIsRet = NONE,
            isOpt    = isOpt
          }
      )
    end
in
  val makeLowLevelTy = typeTy

  fun addParInfo (parInfo, acc) =
    case parInfo of
      PIVOID                              => acc
    | PISCALAR (dir, scalarParInfo)       =>
        let
          val typeTy = parScalarType (dir, scalarParInfo)
        in
          typeTy :: acc
        end
    | PIUTF8 (dir, utf8ParInfo)           =>
        let
          val typeTy = parUtf8Type (dir, utf8ParInfo)
        in
          typeTy :: acc
        end
    | PIINTERFACE (dir, interfaceParInfo) =>
        let
          val typeTy = parInterfaceType (dir, interfaceParInfo)
        in
          typeTy :: acc
        end

  fun addRetInfo retInfo =
    case retInfo of
      RIVOID                       => retVoidType
    | RISCALAR scalarRetInfo       => retScalarType scalarRetInfo
    | RIUTF8 utf8RetInfo           => retUtf8Type utf8RetInfo
    | RIINTERFACE interfaceRetInfo => retInterfaceType interfaceRetInfo

  fun parSelfType rootIRef =
    typeTy
      false
      (prefixInterfaceStrId rootIRef [CId])
      (
        PTR {
          optIsRet = NONE,
          isOpt    = false
        }
      )

  fun parErrType namespace optName =
    typeTy
      false
      (prefixInterfaceStrId (makeErrorIRef namespace optName) [CId])
      (
        REF (
          SOME {
            isInOut = false,
            isOpt   = true
          }
        )
      )
end


fun makeFunctionStrDecLowLevelMLton
  repo
  (optRootContainerIRef : (interfaceref * interfaceref) option)
  (functionInfo, errs)
  : strdec * infoerrorhier list =
  let
    val () = checkDeprecated functionInfo

    val () = checkFunctionSymbol functionInfo

    val functionName = getName functionInfo
    val () = checkFunctionName functionName

    val functionNameId = toLCC functionName ^ "_"
    val functionNamespace = BaseInfo.getNamespace functionInfo
    val functionFlags = FunctionInfo.getFlags functionInfo

    val (optRootIRef, optContainerName) =
      case optRootContainerIRef of
        SOME (rootIRef, {name, ...}) => (SOME rootIRef, SOME name)
      | NONE                         => (NONE, NONE)

    (* Construct parameter infos and return value info *)
    val parInfos =
      revMapInfos
        CallableInfo.getNArgs
        CallableInfo.getArg
        (getParInfo false repo functionNamespace optContainerName)
        (functionInfo, [])

    val retInfo =
      getRetInfo false repo functionNamespace optContainerName
        functionInfo

    val functionSymbolStr = FunctionInfo.getSymbol functionInfo

    (* For a method function, add an initial argument for the interface
     * that contains this function. *)
    val revParTypes'1 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.ISMETHOD)
      then
        case optRootIRef of
          SOME rootIRef => [parSelfType rootIRef]
        | NONE          =>
            infoError "function outside interface has method flag set"
      else
        []

    (* Construct reverse list of J parameter conversions in forward pass over
     * parameter infos. *)
    val revParTypes'2 = foldl addParInfo revParTypes'1 parInfos

    (* For a function that may raise an exception, add a final argument for
     * the GError out parameter. *)
    val revParTypes'3 =
      if FunctionInfoFlags.anySet
           (functionFlags, FunctionInfoFlags.THROWS)
      then
        parErrType functionNamespace optContainerName :: revParTypes'2
      else
        revParTypes'2

    val retType = addRetInfo retInfo

    (* `revParTypes : exp list` is
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>, <selfType>]
     *     if J > 0 and anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>, <parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and anySet (FunctionFlags, THROWS)
     *
     *   [<parType[J]>, ..., <parType[1]>]
     *     if J > 0 and not anySet (FunctionFlags, ISMETHOD)
     *              and not anySet (FunctionFlags, THROWS)
     *
     *   [<parTypeErr>]
     *     if J = 0 and anySet (FunctionFlags, THROWS)
     *
     *   []
     *     if J = 0 and not anySet (FunctionFlags, THROWS)
     *)
    val parTypes = rev revParTypes'3

    (* Construct the function body *)
    val functionExp = callMLtonFFIExp functionSymbolStr (parTypes, retType)
  in
    (
      StrDecDec (mkIdValDec (functionNameId, functionExp)),
      errs
    )
  end


(*
 *     val getType_ =
 *       _import "<getTypeSymbol>" : unit -> GObjectType.C.val_;
 *)
fun getTypeStrDecLowLevelMLton getTypeSymbol =
  StrDecDec (
    mkIdValDec (
      getTypeUId,
      callMLtonFFIExp getTypeSymbol ([], mkLIdTy ["GObjectType", "C", valId])
    )
  )


(* Low-level - common *)

fun mkPolyMLFFILocalStrDec strDecs =
  StrDecLocal (
    mkStrDecs [
      StrDecDec (DecOpen (toList1 [toList1 [PolyMLFFIId]]))
    ],
    mkStrDecs strDecs
  )

fun addFunctionStrDecsLowLevel
  (getNMethods, getMethod)
  isPolyML
  repo
  libId
  addInitStrDecs
  optRootContainerIRef =
  if isPolyML
  then
    fn (containerInfo, (strDecs, errs)) =>
      let
        val acc'1 =
          revMapInfosWithErrs
            getNMethods
            getMethod
            (makeFunctionStrDecLowLevelPolyML repo libId optRootContainerIRef)
            (containerInfo, ([], errs))
        val (localStrDecs'2, errs'2) = addInitStrDecs isPolyML acc'1
      in
        case localStrDecs'2 of
          _ :: _ => (mkPolyMLFFILocalStrDec localStrDecs'2 :: strDecs, errs'2)
        | _      => (strDecs, errs'2)
      end
  else
    addInitStrDecs isPolyML o
      revMapInfosWithErrs
        getNMethods
        getMethod
        (makeFunctionStrDecLowLevelMLton repo optRootContainerIRef)
