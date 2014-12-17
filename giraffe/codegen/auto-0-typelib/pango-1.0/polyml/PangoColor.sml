structure PangoColor :>
  PANGO_COLOR
    where type record_t = PangoColorRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libpango "pango_color_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val copy_ = call (load_sym libpango "pango_color_copy") (PangoColorRecord.PolyML.PTR --> PangoColorRecord.PolyML.PTR)
      val parse_ = call (load_sym libpango "pango_color_parse") (PangoColorRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val toString_ = call (load_sym libpango "pango_color_to_string") (PangoColorRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
    end
    type record_t = PangoColorRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun copy self = (PangoColorRecord.C.withPtr ---> PangoColorRecord.C.fromPtr true) copy_ self
    fun parse self spec = (PangoColorRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) parse_ (self & spec)
    fun toString self = (PangoColorRecord.C.withPtr ---> FFI.String.C.fromPtr true) toString_ self
  end
