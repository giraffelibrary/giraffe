structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type record_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val equal_ = call (load_sym libpango "pango_attribute_equal") (PangoAttributeRecord.PolyML.PTR &&> PangoAttributeRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = PangoAttributeRecord.t
    fun equal self attr2 = (PangoAttributeRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & attr2)
  end
