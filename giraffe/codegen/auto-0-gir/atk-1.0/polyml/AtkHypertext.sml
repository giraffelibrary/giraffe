structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class = 'a AtkHypertextClass.class
    where type 'a hyperlink_class = 'a AtkHyperlinkClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_hypertext_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getLink_ = call (getSymbol "atk_hypertext_get_link") (AtkHypertextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> AtkHyperlinkClass.PolyML.cPtr)
      val getLinkIndex_ = call (getSymbol "atk_hypertext_get_link_index") (AtkHypertextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val getNLinks_ = call (getSymbol "atk_hypertext_get_n_links") (AtkHypertextClass.PolyML.cPtr --> GInt.PolyML.cVal)
    end
    type 'a class = 'a AtkHypertextClass.class
    type 'a hyperlink_class = 'a AtkHyperlinkClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getLink self linkIndex = (AtkHypertextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> AtkHyperlinkClass.FFI.fromPtr false) getLink_ (self & linkIndex)
    fun getLinkIndex self charIndex = (AtkHypertextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) getLinkIndex_ (self & charIndex)
    fun getNLinks self = (AtkHypertextClass.FFI.withPtr ---> GInt.FFI.fromVal) getNLinks_ self
    local
      open ClosureMarshal Signal
    in
      fun linkSelectedSig f = signal "link-selected" (get 0w1 int ---> ret_void) f
    end
  end
