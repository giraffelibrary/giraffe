signature GTK_I_M_CONTEXT_SIMPLE_CLASS =
  sig
    type 'a i_m_context_simple
    type 'a i_m_context_class
    include
      CLASS
        where type 'a class = 'a i_m_context_simple i_m_context_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
