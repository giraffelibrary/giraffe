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
              GioIOExtensionPointRecord.FFI.non_opt GioIOExtensionPointRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioIOExtensionRecord.FFI.non_opt GioIOExtensionRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getRequiredType_ = _import "g_io_extension_point_get_required_type" : GioIOExtensionPointRecord.FFI.non_opt GioIOExtensionPointRecord.FFI.p -> GObjectType.FFI.val_;
    val setRequiredType_ = fn x1 & x2 => (_import "g_io_extension_point_set_required_type" : GioIOExtensionPointRecord.FFI.non_opt GioIOExtensionPointRecord.FFI.p * GObjectType.FFI.val_ -> unit;) (x1, x2)
    val implement_ =
      fn
        (x1, x2)
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_io_extension_point_implement" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt32.FFI.val_
               -> GioIOExtensionRecord.FFI.non_opt GioIOExtensionRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val lookup_ = _import "mlton_g_io_extension_point_lookup" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.non_opt GioIOExtensionPointRecord.FFI.p;
    val register_ = _import "mlton_g_io_extension_point_register" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioIOExtensionPointRecord.FFI.non_opt GioIOExtensionPointRecord.FFI.p;
    type t = GioIOExtensionPointRecord.t
    type i_o_extension_t = GioIOExtensionRecord.t
    fun getExtensionByName self name = (GioIOExtensionPointRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioIOExtensionRecord.FFI.fromPtr false) getExtensionByName_ (self & name)
    fun getRequiredType self = (GioIOExtensionPointRecord.FFI.withPtr false ---> GObjectType.FFI.fromVal) getRequiredType_ self
    fun setRequiredType self type' = (GioIOExtensionPointRecord.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> I) setRequiredType_ (self & type')
    fun implement
      (
        extensionPointName,
        type',
        extensionName,
        priority
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt32.FFI.withVal
         ---> GioIOExtensionRecord.FFI.fromPtr false
      )
        implement_
        (
          extensionPointName
           & type'
           & extensionName
           & priority
        )
    fun lookup name = (Utf8.FFI.withPtr 0 ---> GioIOExtensionPointRecord.FFI.fromPtr false) lookup_ name
    fun register name = (Utf8.FFI.withPtr 0 ---> GioIOExtensionPointRecord.FFI.fromPtr false) register_ name
  end
