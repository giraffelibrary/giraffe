structure GdkColor :>
  GDK_COLOR
    where type t = GdkColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_color_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libgdk "gdk_color_copy") (GdkColorRecord.PolyML.cPtr --> GdkColorRecord.PolyML.cPtr)
      val equal_ = call (load_sym libgdk "gdk_color_equal") (GdkColorRecord.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hash_ = call (load_sym libgdk "gdk_color_hash") (GdkColorRecord.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val toString_ = call (load_sym libgdk "gdk_color_to_string") (GdkColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parse_ = call (load_sym libgdk "gdk_color_parse") (Utf8.PolyML.cInPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = GdkColorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (GdkColorRecord.C.withPtr ---> GdkColorRecord.C.fromPtr true) copy_ self
    fun equal self colorb = (GdkColorRecord.C.withPtr &&&> GdkColorRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & colorb)
    fun hash self = (GdkColorRecord.C.withPtr ---> FFI.UInt.C.fromVal) hash_ self
    fun toString self = (GdkColorRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
    fun parse spec =
      let
        val color & retVal = (Utf8.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && FFI.Bool.C.fromVal) parse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
  end
