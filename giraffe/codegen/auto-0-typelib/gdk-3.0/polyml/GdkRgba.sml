structure GdkRgba :>
  GDK_RGBA
    where type t = GdkRgbaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_rgba_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "gdk_rgba_copy") (GdkRgbaRecord.PolyML.cPtr --> GdkRgbaRecord.PolyML.cPtr)
      val equal_ = call (getSymbol "gdk_rgba_equal") (GdkRgbaRecord.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val hash_ = call (getSymbol "gdk_rgba_hash") (GdkRgbaRecord.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val parse_ = call (getSymbol "gdk_rgba_parse") (GdkRgbaRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "gdk_rgba_to_string") (GdkRgbaRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = GdkRgbaRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkRgbaRecord.FFI.withPtr ---> GdkRgbaRecord.FFI.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.FFI.withPtr ---> GUInt32.FFI.fromVal) hash_ self
    fun parse self spec = (GdkRgbaRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (GdkRgbaRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
