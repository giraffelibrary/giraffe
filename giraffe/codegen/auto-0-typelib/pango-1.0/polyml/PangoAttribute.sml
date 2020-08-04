structure PangoAttribute :>
  PANGO_ATTRIBUTE
    where type t = PangoAttributeRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val equal_ = call (getSymbol "pango_attribute_equal") (PangoAttributeRecord.PolyML.cPtr &&> PangoAttributeRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = PangoAttributeRecord.t
    fun equal self attr2 = (PangoAttributeRecord.FFI.withPtr false &&&> PangoAttributeRecord.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & attr2)
  end
