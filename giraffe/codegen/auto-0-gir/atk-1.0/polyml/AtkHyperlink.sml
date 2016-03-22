structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class = 'a AtkHyperlinkClass.class
    where type 'a action_class = 'a AtkActionClass.class
    where type 'a object_class = 'a AtkObjectClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hyperlink_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getEndIndex_ = call (load_sym libatk "atk_hyperlink_get_end_index") (AtkHyperlinkClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getNAnchors_ = call (load_sym libatk "atk_hyperlink_get_n_anchors") (AtkHyperlinkClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getObject_ = call (load_sym libatk "atk_hyperlink_get_object") (AtkHyperlinkClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> AtkObjectClass.PolyML.cPtr)
      val getStartIndex_ = call (load_sym libatk "atk_hyperlink_get_start_index") (AtkHyperlinkClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getUri_ = call (load_sym libatk "atk_hyperlink_get_uri") (AtkHyperlinkClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val isInline_ = call (load_sym libatk "atk_hyperlink_is_inline") (AtkHyperlinkClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isValid_ = call (load_sym libatk "atk_hyperlink_is_valid") (AtkHyperlinkClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a AtkHyperlinkClass.class
    type 'a action_class = 'a AtkActionClass.class
    type 'a object_class = 'a AtkObjectClass.class
    type t = base class
    fun asAction self = (GObjectObjectClass.C.withPtr ---> AtkActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEndIndex self = (AtkHyperlinkClass.C.withPtr ---> FFI.Int.C.fromVal) getEndIndex_ self
    fun getNAnchors self = (AtkHyperlinkClass.C.withPtr ---> FFI.Int.C.fromVal) getNAnchors_ self
    fun getObject self i = (AtkHyperlinkClass.C.withPtr &&&> FFI.Int.C.withVal ---> AtkObjectClass.C.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (AtkHyperlinkClass.C.withPtr ---> FFI.Int.C.fromVal) getStartIndex_ self
    fun getUri self i = (AtkHyperlinkClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr true) getUri_ (self & i)
    fun isInline self = (AtkHyperlinkClass.C.withPtr ---> FFI.Bool.C.fromVal) isInline_ self
    fun isValid self = (AtkHyperlinkClass.C.withPtr ---> FFI.Bool.C.fromVal) isValid_ self
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
