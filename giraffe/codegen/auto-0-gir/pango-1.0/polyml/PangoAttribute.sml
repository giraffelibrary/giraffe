structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val equal_ = call (load_sym libpango "pango_attribute_equal") (PangoAttributeRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = PangoAttributeRecord.t
    fun equal self attr2 = (PangoAttributeRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & attr2)
  end
