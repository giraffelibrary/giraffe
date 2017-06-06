structure GioIOExtensionPoint :>
  GIO_I_O_EXTENSION_POINT
    where type t = GioIOExtensionPointRecord.t
    where type i_o_extension_t = GioIOExtensionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getExtensionByName_ = call (load_sym libgio "g_io_extension_point_get_extension_by_name") (GioIOExtensionPointRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioIOExtensionRecord.PolyML.cPtr)
      val lookup_ = call (load_sym libgio "g_io_extension_point_lookup") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
      val register_ = call (load_sym libgio "g_io_extension_point_register") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
    end
    type t = GioIOExtensionPointRecord.t
    type i_o_extension_t = GioIOExtensionRecord.t
    fun getExtensionByName self name = (GioIOExtensionPointRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioIOExtensionRecord.FFI.fromPtr false) getExtensionByName_ (self & name)
    fun lookup name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) lookup_ name
    fun register name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) register_ name
  end
