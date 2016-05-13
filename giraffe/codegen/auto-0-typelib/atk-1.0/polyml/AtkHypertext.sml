structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class = 'a AtkHypertextClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hypertext_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getLink_ = call (load_sym libatk "atk_hypertext_get_link") (AtkHypertextClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> AtkHyperlinkClass.PolyML.cPtr)
      val getLinkIndex_ = call (load_sym libatk "atk_hypertext_get_link_index") (AtkHypertextClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val getNLinks_ = call (load_sym libatk "atk_hypertext_get_n_links") (AtkHypertextClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
    end
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
