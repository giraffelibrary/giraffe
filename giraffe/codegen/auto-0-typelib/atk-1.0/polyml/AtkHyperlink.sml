structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class = 'a AtkHyperlinkClass.class
    where type 'a action_class = 'a AtkActionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_hyperlink_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getEndIndex_ = call (getSymbol "atk_hyperlink_get_end_index") (AtkHyperlinkClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNAnchors_ = call (getSymbol "atk_hyperlink_get_n_anchors") (AtkHyperlinkClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getObject_ = call (getSymbol "atk_hyperlink_get_object") (AtkHyperlinkClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val getStartIndex_ = call (getSymbol "atk_hyperlink_get_start_index") (AtkHyperlinkClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getUri_ = call (getSymbol "atk_hyperlink_get_uri") (AtkHyperlinkClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val isInline_ = call (getSymbol "atk_hyperlink_is_inline") (AtkHyperlinkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isSelectedLink_ = call (getSymbol "atk_hyperlink_is_selected_link") (AtkHyperlinkClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isValid_ = call (getSymbol "atk_hyperlink_is_valid") (AtkHyperlinkClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a AtkHyperlinkClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.FFI.withPtr false ---> AtkActionClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getEndIndex self = (AtkHyperlinkClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getEndIndex_ self
    fun getNAnchors self = (AtkHyperlinkClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNAnchors_ self
    fun getObject self i = (AtkHyperlinkClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> AtkObjectClass.FFI.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (AtkHyperlinkClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getStartIndex_ self
    fun getUri self i = (AtkHyperlinkClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromPtr ~1) getUri_ (self & i)
    fun isInline self = (AtkHyperlinkClass.FFI.withPtr false ---> GBool.FFI.fromVal) isInline_ self
    fun isSelectedLink self = (AtkHyperlinkClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSelectedLink_ self
    fun isValid self = (AtkHyperlinkClass.FFI.withPtr false ---> GBool.FFI.fromVal) isValid_ self
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
