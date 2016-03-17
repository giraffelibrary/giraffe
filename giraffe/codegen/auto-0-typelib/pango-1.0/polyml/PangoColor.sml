structure PangoColor :>
  PANGO_COLOR
    where type t = PangoColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_color_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (load_sym libpango "pango_color_copy") (PangoColorRecord.PolyML.cPtr --> PangoColorRecord.PolyML.cPtr)
      val parse_ = call (load_sym libpango "pango_color_parse") (PangoColorRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val toString_ = call (load_sym libpango "pango_color_to_string") (PangoColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = PangoColorRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoColorRecord.C.withPtr ---> PangoColorRecord.C.fromPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
  end
