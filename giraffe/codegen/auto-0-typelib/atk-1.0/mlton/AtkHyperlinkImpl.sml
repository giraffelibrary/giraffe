structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class_t = 'a AtkHyperlinkImplClass.t
    where type 'a hyperlink_class_t = 'a AtkHyperlinkClass.t =
  struct
    val getType_ = _import "atk_hyperlink_impl_get_type" : unit -> GObjectType.C.val_;
    val getHyperlink_ = _import "atk_hyperlink_impl_get_hyperlink" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a AtkHyperlinkImplClass.t
    type 'a hyperlink_class_t = 'a AtkHyperlinkClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getHyperlink self = (GObjectObjectClass.C.withPtr ---> AtkHyperlinkClass.C.fromPtr true) getHyperlink_ self
  end
