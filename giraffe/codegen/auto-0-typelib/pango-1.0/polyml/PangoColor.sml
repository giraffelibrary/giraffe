structure PangoColor :>
  PANGO_COLOR
    where type t = PangoColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_color_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val copy_ = call (getSymbol "pango_color_copy") (PangoColorRecord.PolyML.cPtr --> PangoColorRecord.PolyML.cPtr)
      val parse_ = call (getSymbol "pango_color_parse") (PangoColorRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val toString_ = call (getSymbol "pango_color_to_string") (PangoColorRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type t = PangoColorRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun copy self = (PangoColorRecord.FFI.withPtr ---> PangoColorRecord.FFI.fromPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
  end
