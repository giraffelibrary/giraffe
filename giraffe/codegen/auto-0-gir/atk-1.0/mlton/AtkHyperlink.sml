structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class = 'a AtkHyperlinkClass.class
    where type 'a action_class = 'a AtkActionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    val getType_ = _import "atk_hyperlink_get_type" : unit -> GObjectType.C.val_;
    val getEndIndex_ = _import "atk_hyperlink_get_end_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getNAnchors_ = _import "atk_hyperlink_get_n_anchors" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getObject_ = fn x1 & x2 => (_import "atk_hyperlink_get_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getStartIndex_ = _import "atk_hyperlink_get_start_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getUri_ = fn x1 & x2 => (_import "atk_hyperlink_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val isInline_ = _import "atk_hyperlink_is_inline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isValid_ = _import "atk_hyperlink_is_valid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class = 'a AtkHyperlinkClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.C.withPtr ---> AtkActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEndIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getEndIndex_ self
    fun getNAnchors self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getNAnchors_ self
    fun getObject self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getStartIndex_ self
    fun getUri self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) getUri_ (self & i)
    fun isInline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isInline_ self
    fun isValid self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isValid_ self
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
