structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class = 'a AtkHyperlinkImplClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_hyperlink_impl_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getHyperlink_ = call (getSymbol "atk_hyperlink_impl_get_hyperlink") (AtkHyperlinkImplClass.PolyML.cPtr --> AtkHyperlinkClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkHyperlinkImplClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getHyperlink self = (AtkHyperlinkImplClass.FFI.withPtr ---> AtkHyperlinkClass.FFI.fromPtr true) getHyperlink_ self
  end
