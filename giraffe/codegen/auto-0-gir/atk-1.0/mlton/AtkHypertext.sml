structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class_t = 'a AtkHypertextClass.t
    where type 'a hyperlink_class_t = 'a AtkHyperlinkClass.t =
  struct
    val getType_ = _import "atk_hypertext_get_type" : unit -> GObjectType.C.val_;
    val getLink_ = fn x1 & x2 => (_import "atk_hypertext_get_link" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getLinkIndex_ = fn x1 & x2 => (_import "atk_hypertext_get_link_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val getNLinks_ = _import "atk_hypertext_get_n_links" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    type 'a class_t = 'a AtkHypertextClass.t
    type 'a hyperlink_class_t = 'a AtkHyperlinkClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLink self linkIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkHyperlinkClass.C.fromPtr false) getLink_ (self & linkIndex)
    fun getLinkIndex self charIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) getLinkIndex_ (self & charIndex)
    fun getNLinks self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNLinks_ self
    local
      open ClosureMarshal Signal
    in
      fun linkSelectedSig f = signal "link-selected" (get 0w1 int ---> ret_void) f
    end
  end
