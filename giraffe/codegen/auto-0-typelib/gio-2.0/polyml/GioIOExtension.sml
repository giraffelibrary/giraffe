structure GioIOExtension :>
  GIO_I_O_EXTENSION
    where type t = GioIOExtensionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getName_ = call (load_sym libgio "g_io_extension_get_name") (GioIOExtensionRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPriority_ = call (load_sym libgio "g_io_extension_get_priority") (GioIOExtensionRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
    end
    type t = GioIOExtensionRecord.t
    fun getName self = (GioIOExtensionRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPriority self = (GioIOExtensionRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getPriority_ self
  end
