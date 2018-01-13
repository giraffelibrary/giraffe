structure GioIOExtension :>
  GIO_I_O_EXTENSION
    where type t = GioIOExtensionRecord.t =
  struct
    val getName_ = _import "g_io_extension_get_name" : GioIOExtensionRecord.FFI.notnull GioIOExtensionRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPriority_ = _import "g_io_extension_get_priority" : GioIOExtensionRecord.FFI.notnull GioIOExtensionRecord.FFI.p -> GInt.FFI.val_;
    val getType_ = _import "g_io_extension_get_type" : GioIOExtensionRecord.FFI.notnull GioIOExtensionRecord.FFI.p -> GObjectType.FFI.val_;
    type t = GioIOExtensionRecord.t
    fun getName self = (GioIOExtensionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPriority self = (GioIOExtensionRecord.FFI.withPtr ---> GInt.FFI.fromVal) getPriority_ self
    fun getType self = (GioIOExtensionRecord.FFI.withPtr ---> GObjectType.FFI.fromVal) getType_ self
  end
