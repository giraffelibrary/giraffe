structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class = 'a AtkHyperlinkImplClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    val getType_ = _import "atk_hyperlink_impl_get_type" : unit -> GObjectType.C.val_;
    val getHyperlink_ = _import "atk_hyperlink_impl_get_hyperlink" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class = 'a AtkHyperlinkImplClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHyperlink self = (GObjectObjectClass.C.withPtr ---> AtkHyperlinkClass.C.fromPtr true) getHyperlink_ self
  end
