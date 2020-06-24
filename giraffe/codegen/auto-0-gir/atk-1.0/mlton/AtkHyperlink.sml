structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class = 'a AtkHyperlinkClass.class
    where type 'a action_class = 'a AtkActionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_hyperlink_get_type" : unit -> GObjectType.FFI.val_;
    val getEndIndex_ = _import "atk_hyperlink_get_end_index" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GInt.FFI.val_;
    val getNAnchors_ = _import "atk_hyperlink_get_n_anchors" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GInt.FFI.val_;
    val getObject_ = fn x1 & x2 => (_import "atk_hyperlink_get_object" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p * GInt.FFI.val_ -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;) (x1, x2)
    val getStartIndex_ = _import "atk_hyperlink_get_start_index" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GInt.FFI.val_;
    val getUri_ = fn x1 & x2 => (_import "atk_hyperlink_get_uri" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p * GInt.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    val isInline_ = _import "atk_hyperlink_is_inline" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GBool.FFI.val_;
    val isSelectedLink_ = _import "atk_hyperlink_is_selected_link" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GBool.FFI.val_;
    val isValid_ = _import "atk_hyperlink_is_valid" : AtkHyperlinkClass.FFI.non_opt AtkHyperlinkClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a AtkHyperlinkClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr ---> AtkActionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEndIndex self = (AtkHyperlinkClass.FFI.withPtr ---> GInt.FFI.fromVal) getEndIndex_ self
    fun getNAnchors self = (AtkHyperlinkClass.FFI.withPtr ---> GInt.FFI.fromVal) getNAnchors_ self
    fun getObject self i = (AtkHyperlinkClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkObjectClass.FFI.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (AtkHyperlinkClass.FFI.withPtr ---> GInt.FFI.fromVal) getStartIndex_ self
    fun getUri self i = (AtkHyperlinkClass.FFI.withPtr &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr 1) getUri_ (self & i)
    fun isInline self = (AtkHyperlinkClass.FFI.withPtr ---> GBool.FFI.fromVal) isInline_ self
    fun isSelectedLink self = (AtkHyperlinkClass.FFI.withPtr ---> GBool.FFI.fromVal) isSelectedLink_ self
    fun isValid self = (AtkHyperlinkClass.FFI.withPtr ---> GBool.FFI.fromVal) isValid_ self
    local
      open ClosureMarshal Signal
    in
      fun linkActivatedSig f = signal "link-activated" (void ---> ret_void) f
    end
    local
      open Property
    in
      val endIndexProp = {get = fn x => get "end-index" int x}
      val numberOfAnchorsProp = {get = fn x => get "number-of-anchors" int x}
      val selectedLinkProp = {get = fn x => get "selected-link" boolean x}
      val startIndexProp = {get = fn x => get "start-index" int x}
    end
  end
