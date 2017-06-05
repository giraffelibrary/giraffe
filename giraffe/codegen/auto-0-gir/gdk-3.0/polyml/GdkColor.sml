structure GdkColor :>
  GDK_COLOR
    where type t = GdkColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_color_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libgdk "gdk_color_copy") (GdkColorRecord.PolyML.cPtr --> GdkColorRecord.PolyML.cPtr)
      val equal_ = call (load_sym libgdk "gdk_color_equal") (GdkColorRecord.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val hash_ = call (load_sym libgdk "gdk_color_hash") (GdkColorRecord.PolyML.cPtr --> GUInt.PolyML.cVal)
      val toString_ = call (load_sym libgdk "gdk_color_to_string") (GdkColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val parse_ = call (load_sym libgdk "gdk_color_parse") (Utf8.PolyML.cInPtr &&> GdkColorRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GdkColorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (GdkColorRecord.FFI.withPtr ---> GdkColorRecord.FFI.fromPtr true) copy_ self
    fun equal self colorb = (GdkColorRecord.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & colorb)
    fun hash self = (GdkColorRecord.FFI.withPtr ---> GUInt.FFI.fromVal) hash_ self
    fun toString self = (GdkColorRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    fun parse spec =
      let
        val color & retVal = (Utf8.FFI.withPtr &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && GBool.FFI.fromVal) parse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
  end
