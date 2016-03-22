structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class = 'a AtkHypertextClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    val getType_ = _import "atk_hypertext_get_type" : unit -> GObjectType.C.val_;
    val getLink_ = fn x1 & x2 => (_import "atk_hypertext_get_link" : AtkHypertextClass.C.notnull AtkHypertextClass.C.p * FFI.Int32.C.val_ -> AtkHyperlinkClass.C.notnull AtkHyperlinkClass.C.p;) (x1, x2)
    val getLinkIndex_ = fn x1 & x2 => (_import "atk_hypertext_get_link_index" : AtkHypertextClass.C.notnull AtkHypertextClass.C.p * FFI.Int32.C.val_ -> FFI.Int32.C.val_;) (x1, x2)
    val getNLinks_ = _import "atk_hypertext_get_n_links" : AtkHypertextClass.C.notnull AtkHypertextClass.C.p -> FFI.Int32.C.val_;
    type 'a class = 'a AtkHypertextClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLink self linkIndex = (AtkHypertextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkHyperlinkClass.C.fromPtr false) getLink_ (self & linkIndex)
    fun getLinkIndex self charIndex = (AtkHypertextClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) getLinkIndex_ (self & charIndex)
    fun getNLinks self = (AtkHypertextClass.C.withPtr ---> FFI.Int32.C.fromVal) getNLinks_ self
    local
      open ClosureMarshal Signal
    in
      fun linkSelectedSig f = signal "link-selected" (get 0w1 int ---> ret_void) f
    end
  end
