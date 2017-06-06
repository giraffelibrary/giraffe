structure GioIOExtensionPoint :>
  GIO_I_O_EXTENSION_POINT
    where type t = GioIOExtensionPointRecord.t
    where type i_o_extension_t = GioIOExtensionRecord.t =
  struct
    val getExtensionByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_io_extension_point_get_extension_by_name" :
              GioIOExtensionPointRecord.FFI.notnull GioIOExtensionPointRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GioIOExtensionRecord.FFI.notnull GioIOExtensionRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val lookup_ = _import "mlton_g_io_extension_point_lookup" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.notnull GioIOExtensionPointRecord.FFI.p;
    val register_ = _import "mlton_g_io_extension_point_register" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.notnull GioIOExtensionPointRecord.FFI.p;
    type t = GioIOExtensionPointRecord.t
    type i_o_extension_t = GioIOExtensionRecord.t
    fun getExtensionByName self name = (GioIOExtensionPointRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioIOExtensionRecord.FFI.fromPtr false) getExtensionByName_ (self & name)
    fun lookup name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) lookup_ name
    fun register name = (Utf8.FFI.withPtr ---> GioIOExtensionPointRecord.FFI.fromPtr false) register_ name
  end
