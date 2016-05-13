structure GdkRgba :>
  GDK_RGBA
    where type record_t = GdkRgbaRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_rgba_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libgdk "gdk_rgba_copy") (GdkRgbaRecord.PolyML.cPtr --> GdkRgbaRecord.PolyML.cPtr)
      val equal_ = call (load_sym libgdk "gdk_rgba_equal") (GdkRgbaRecord.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hash_ = call (load_sym libgdk "gdk_rgba_hash") (GdkRgbaRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val parse_ = call (load_sym libgdk "gdk_rgba_parse") (GdkRgbaRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val toString_ = call (load_sym libgdk "gdk_rgba_to_string") (GdkRgbaRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type record_t = GdkRgbaRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkRgbaRecord.C.withPtr ---> GdkRgbaRecord.C.fromPtr true) copy_ self
    fun equal self p2 = (GdkRgbaRecord.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & p2)
    fun hash self = (GdkRgbaRecord.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    fun parse spec =
      let
        val rgba & retVal = (GdkRgbaRecord.C.withNewPtr &&&> Utf8.C.withPtr ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal) parse_ (() & spec)
      in
        if retVal then SOME rgba else NONE
      end
    fun toString self = (GdkRgbaRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
