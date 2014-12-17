structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class_t = 'a AtkHyperlinkImplClass.t
    where type 'a hyperlinkclass_t = 'a AtkHyperlinkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hyperlink_impl_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getHyperlink_ = call (load_sym libatk "atk_hyperlink_impl_get_hyperlink") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a AtkHyperlinkImplClass.t
    type 'a hyperlinkclass_t = 'a AtkHyperlinkClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHyperlink self = (GObjectObjectClass.C.withPtr ---> AtkHyperlinkClass.C.fromPtr true) getHyperlink_ self
  end
