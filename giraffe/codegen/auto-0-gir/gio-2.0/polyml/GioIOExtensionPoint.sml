structure GioIOExtensionPoint :>
  GIO_I_O_EXTENSION_POINT
    where type t = GioIOExtensionPointRecord.t
    where type i_o_extension_t = GioIOExtensionRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getExtensionByName_ = call (getSymbol "g_io_extension_point_get_extension_by_name") (GioIOExtensionPointRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioIOExtensionRecord.PolyML.cPtr)
      val getRequiredType_ = call (getSymbol "g_io_extension_point_get_required_type") (GioIOExtensionPointRecord.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val setRequiredType_ = call (getSymbol "g_io_extension_point_set_required_type") (GioIOExtensionPointRecord.PolyML.cPtr &&> GObjectType.PolyML.cVal --> cVoid)
      val implement_ =
        call (getSymbol "g_io_extension_point_implement")
          (
            Utf8.PolyML.cInPtr
             &&> GObjectType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GioIOExtensionRecord.PolyML.cPtr
          )
      val lookup_ = call (getSymbol "g_io_extension_point_lookup") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
      val register_ = call (getSymbol "g_io_extension_point_register") (Utf8.PolyML.cInPtr --> GioIOExtensionPointRecord.PolyML.cPtr)
    end
    type t = GioIOExtensionPointRecord.t
    type i_o_extension_t = GioIOExtensionRecord.t
    fun getExtensionByName self name = (GioIOExtensionPointRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioIOExtensionRecord.FFI.fromPtr false) getExtensionByName_ (self & name) before GioIOExtensionPointRecord.FFI.touchPtr self before Utf8.FFI.touchPtr name
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
         &&&> GInt.FFI.withVal
         ---> GioIOExtensionRecord.FFI.fromPtr false
      )
        implement_
        (
          extensionPointName
           & type'
           & extensionName
           & priority
        )
       before Utf8.FFI.touchPtr extensionPointName
       before Utf8.FFI.touchPtr extensionName
    fun lookup name = (Utf8.FFI.withPtr 0 ---> GioIOExtensionPointRecord.FFI.fromPtr false) lookup_ name before Utf8.FFI.touchPtr name
    fun register name = (Utf8.FFI.withPtr 0 ---> GioIOExtensionPointRecord.FFI.fromPtr false) register_ name before Utf8.FFI.touchPtr name
  end
