structure AtkHyperlinkImpl :>
  ATK_HYPERLINK_IMPL
    where type 'a class = 'a AtkHyperlinkImplClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    val getType_ = _import "atk_hyperlink_impl_get_type" : unit -> GObjectType.FFI.val_;
    val getHyperlink_ = _import "atk_hyperlink_impl_get_hyperlink" : AtkHyperlinkImplClass.FFI.notnull AtkHyperlinkImplClass.FFI.p -> AtkHyperlinkClass.FFI.notnull AtkHyperlinkClass.FFI.p;
    type 'a class = 'a AtkHyperlinkImplClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getHyperlink self = (AtkHyperlinkImplClass.FFI.withPtr ---> AtkHyperlinkClass.FFI.fromPtr true) getHyperlink_ self
  end
