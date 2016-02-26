structure AtkHyperlink :>
  ATK_HYPERLINK
    where type 'a class_t = 'a AtkHyperlinkClass.t
    where type 'a action_class_t = 'a AtkActionClass.t
    where type 'a object_class_t = 'a AtkObjectClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hyperlink_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getEndIndex_ = call (load_sym libatk "atk_hyperlink_get_end_index") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getNAnchors_ = call (load_sym libatk "atk_hyperlink_get_n_anchors") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getObject_ = call (load_sym libatk "atk_hyperlink_get_object") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getStartIndex_ = call (load_sym libatk "atk_hyperlink_get_start_index") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getUri_ = call (load_sym libatk "atk_hyperlink_get_uri") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val isInline_ = call (load_sym libatk "atk_hyperlink_is_inline") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isValid_ = call (load_sym libatk "atk_hyperlink_is_valid") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class_t = 'a AtkHyperlinkClass.t
    type 'a action_class_t = 'a AtkActionClass.t
    type 'a object_class_t = 'a AtkObjectClass.t
    type t = base class_t
    fun asAction self = (GObjectObjectClass.C.withPtr ---> AtkActionClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getEndIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getEndIndex_ self
    fun getNAnchors self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNAnchors_ self
    fun getObject self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> AtkObjectClass.C.fromPtr false) getObject_ (self & i)
    fun getStartIndex self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getStartIndex_ self
    fun getUri self i = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> Utf8.C.fromPtr true) getUri_ (self & i)
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
