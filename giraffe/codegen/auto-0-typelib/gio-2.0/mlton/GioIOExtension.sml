structure GioIOExtension :>
  GIO_I_O_EXTENSION
    where type t = GioIOExtensionRecord.t =
  struct
    val getName_ = _import "g_io_extension_get_name" : GioIOExtensionRecord.FFI.non_opt GioIOExtensionRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPriority_ = _import "g_io_extension_get_priority" : GioIOExtensionRecord.FFI.non_opt GioIOExtensionRecord.FFI.p -> GInt32.FFI.val_;
    val getType_ = _import "g_io_extension_get_type" : GioIOExtensionRecord.FFI.non_opt GioIOExtensionRecord.FFI.p -> GObjectType.FFI.val_;
    type t = GioIOExtensionRecord.t
    fun getName self = (GioIOExtensionRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPriority self = (GioIOExtensionRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getPriority_ self
    fun getType self = (GioIOExtensionRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) getType_ self
  end
