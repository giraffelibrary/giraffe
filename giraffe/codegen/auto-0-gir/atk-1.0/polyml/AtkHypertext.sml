structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class_t = 'a AtkHypertextClass.t
    where type 'a hyperlink_class_t = 'a AtkHyperlinkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hypertext_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getLink_ = call (load_sym libatk "atk_hypertext_get_link") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getLinkIndex_ = call (load_sym libatk "atk_hypertext_get_link_index") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Int.PolyML.cVal)
      val getNLinks_ = call (load_sym libatk "atk_hypertext_get_n_links") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
    end
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
