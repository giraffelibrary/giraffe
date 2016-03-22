signature GTK_I_M_MULTICONTEXT_CLASS =
  sig
    type 'a i_m_multicontext
    type 'a i_m_context_class
    include
      CLASS
        where type 'a class = 'a i_m_multicontext i_m_context_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
