structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type t = PangoAttributeRecord.t =
  struct
    val equal_ = fn x1 & x2 => (_import "pango_attribute_equal" : PangoAttributeRecord.FFI.notnull PangoAttributeRecord.FFI.p * PangoAttributeRecord.FFI.notnull PangoAttributeRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = PangoAttributeRecord.t
    fun equal self attr2 = (PangoAttributeRecord.FFI.withPtr &&&> PangoAttributeRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & attr2)
  end
