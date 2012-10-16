structure AtkHypertext :>
  ATK_HYPERTEXT
    where type 'a class_t = 'a AtkHypertextClass.t
    where type 'a hyperlinkclass_t = 'a AtkHyperlinkClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libatk "atk_hypertext_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getLink_ = call (load_sym libatk "atk_hypertext_get_link") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val getLinkIndex_ = call (load_sym libatk "atk_hypertext_get_link_index") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Int32.VAL)
      val getNLinks_ = call (load_sym libatk "atk_hypertext_get_n_links") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
    end
    type 'a class_t = 'a AtkHypertextClass.t
    type 'a hyperlinkclass_t = 'a AtkHyperlinkClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getLink self linkIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> AtkHyperlinkClass.C.fromPtr false) getLink_ (self & linkIndex)
    fun getLinkIndex self charIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Int32.fromVal) getLinkIndex_ (self & charIndex)
    fun getNLinks self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNLinks_ self
    local
      open ClosureMarshal Signal
    in
      fun linkSelectedSig f = signal "link-selected" (get 0w1 int ---> ret_void) f
    end
  end
