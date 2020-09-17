structure GioIOExtension :>
  GIO_I_O_EXTENSION
    where type t = GioIOExtensionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getName_ = call (getSymbol "g_io_extension_get_name") (GioIOExtensionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (getSymbol "g_io_extension_get_priority") (GioIOExtensionRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getType_ = call (getSymbol "g_io_extension_get_type") (GioIOExtensionRecord.PolyML.cPtr --> GObjectType.PolyML.cVal)
    end
    type t = GioIOExtensionRecord.t
    fun getName self = (GioIOExtensionRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GioIOExtensionRecord.FFI.touchPtr self
    fun getPriority self = (GioIOExtensionRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getPriority_ self
    fun getType self = (GioIOExtensionRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) getType_ self
  end
