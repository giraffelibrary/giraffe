structure GioBytesIcon :>
  GIO_BYTES_ICON
    where type 'a class = 'a GioBytesIconClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a loadable_icon_class = 'a GioLoadableIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_bytes_icon_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_bytes_icon_new") (GLibBytesRecord.PolyML.cPtr --> GioBytesIconClass.PolyML.cPtr)
      val getBytes_ = call (getSymbol "g_bytes_icon_get_bytes") (GioBytesIconClass.PolyML.cPtr --> GLibBytesRecord.PolyML.cPtr)
    end
    type 'a class = 'a GioBytesIconClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a loadable_icon_class = 'a GioLoadableIconClass.class
    type t = base class
    fun asIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioIconClass.FFI.fromPtr false) I self
    fun asLoadableIcon self = (GObjectObjectClass.FFI.withPtr false ---> GioLoadableIconClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new bytes = (GLibBytesRecord.FFI.withPtr false ---> GioBytesIconClass.FFI.fromPtr true) new_ bytes
    fun getBytes self = (GioBytesIconClass.FFI.withPtr false ---> GLibBytesRecord.FFI.fromPtr false) getBytes_ self
    local
      open Property
    in
      val bytesProp =
        {
          get = fn x => get "bytes" GLibBytesRecord.tOpt x,
          new = fn x => new "bytes" GLibBytesRecord.tOpt x
        }
    end
  end
