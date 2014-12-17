structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type record_t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val equal_ = call (load_sym libpango "pango_attribute_equal") (PangoAttributeRecord.PolyML.PTR &&> PangoAttributeRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type record_t = PangoAttributeRecord.t
    type t = record_t
    fun equal self attr2 = (PangoAttributeRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & attr2)
  end
