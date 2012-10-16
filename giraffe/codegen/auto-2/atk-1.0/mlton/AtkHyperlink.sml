structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class_t = 'a AtkHyperlinkClass.t
    where type 'a actionclass_t = 'a AtkActionClass.t
    where type 'a objectclass_t = 'a AtkObjectClass.t =
  struct
    val getType_ = _import "atk_hyperlink_get_type" : unit -> GObjectType.C.val_;
    val getEndIndex_ = _import "atk_hyperlink_get_end_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getNAnchors_ = _import "atk_hyperlink_get_n_anchors" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getObject_ = fn x1 & x2 => (_import "atk_hyperlink_get_object" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getStartIndex_ = _import "atk_hyperlink_get_start_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getUri_ = fn x1 & x2 => (_import "atk_hyperlink_get_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> FFI.String.notnull FFI.String.out_p;) (x1, x2)
    val isInline_ = _import "atk_hyperlink_is_inline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val isValid_ = _import "atk_hyperlink_is_valid" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    type 'a class_t = 'a AtkHyperlinkClass.t
    type 'a actionclass_t = 'a AtkActionClass.t
    type 'a objectclass_t = 'a AtkObjectClass.t
    fun asAction self = (GObjectObjectClass.C.withPtr ---> AtkActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEndIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getEndIndex_ self
    fun getNAnchors self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNAnchors_ self
    fun getObject self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> AtkObjectClass.C.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getStartIndex_ self
    fun getUri self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.String.fromPtr true) getUri_ (self & i)
    fun isInline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isInline_ self
    fun isValid self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isValid_ self
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
