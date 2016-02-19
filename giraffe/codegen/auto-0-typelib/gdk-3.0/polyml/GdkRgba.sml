structure GdkRgba :>
  GDK_RGBA
    where type record_t = GdkRgbaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_rgba_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libgdk "gdk_rgba_copy") (GdkRgbaRecord.PolyML.PTR --> GdkRgbaRecord.PolyML.PTR)
      val equal_ = call (load_sym libgdk "gdk_rgba_equal") (GdkRgbaRecord.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val hash_ = call (load_sym libgdk "gdk_rgba_hash") (GdkRgbaRecord.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val parse_ = call (load_sym libgdk "gdk_rgba_parse") (GdkRgbaRecord.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val toString_ = call (load_sym libgdk "gdk_rgba_to_string") (GdkRgbaRecord.PolyML.PTR --> Utf8.PolyML.RETPTR)
    end
    type record_t = GdkRgbaRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkRgbaRecord.C.withPtr ---> GdkRgbaRecord.C.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.C.withPtr ---> FFI.UInt32.C.fromVal) hash_ self
    fun parse self spec = (GdkRgbaRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) parse_ (self & spec)
    fun toString self = (GdkRgbaRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
