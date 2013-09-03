structure GdkRgba :>
  GDK_RGBA
    where type record_t = GdkRgbaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_rgba_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgdk "gdk_rgba_copy") (GdkRgbaRecord.PolyML.PTR --> GdkRgbaRecord.PolyML.PTR)
      val equal_ = call (load_sym libgdk "gdk_rgba_equal") (GdkRgbaRecord.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val hash_ = call (load_sym libgdk "gdk_rgba_hash") (GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.UInt32.VAL)
      val parse_ = call (load_sym libgdk "gdk_rgba_parse") (GdkRgbaRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val toString_ = call (load_sym libgdk "gdk_rgba_to_string") (GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
    type record_t = GdkRgbaRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkRgbaRecord.C.withPtr ---> GdkRgbaRecord.C.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.C.withPtr ---> FFI.UInt32.fromVal) hash_ self
    fun parse self spec = (GdkRgbaRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) parse_ (self & spec)
    fun toString self = (GdkRgbaRecord.C.withPtr ---> FFI.String.fromPtr true) toString_ self
  end
