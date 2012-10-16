structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type record_t = PangoAttributeRecord.t =
  struct
    val equal_ = fn x1 & x2 => (_import "pango_attribute_equal" : PangoAttributeRecord.C.notnull PangoAttributeRecord.C.p * PangoAttributeRecord.C.notnull PangoAttributeRecord.C.p -> FFI.Bool.val_;) (x1, x2)
    type record_t = PangoAttributeRecord.t
    fun equal self attr2 = (PangoAttributeRecord.C.withPtr &&&> PangoAttributeRecord.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & attr2)
  end
