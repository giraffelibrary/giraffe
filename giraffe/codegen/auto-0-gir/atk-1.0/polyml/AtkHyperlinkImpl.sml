structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class = 'a AtkHyperlinkImplClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hyperlink_impl_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getHyperlink_ = call (load_sym libatk "atk_hyperlink_impl_get_hyperlink") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
    end
    type 'a class = 'a AtkHyperlinkImplClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHyperlink self = (GObjectObjectClass.C.withPtr ---> AtkHyperlinkClass.C.fromPtr true) getHyperlink_ self
  end
