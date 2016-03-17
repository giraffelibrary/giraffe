signature GTK_I_M_MULTICONTEXT_CLASS =
  sig
    type 'a i_m_multicontext
    type 'a i_m_context_class
    type 'a class = 'a i_m_multicontext i_m_context_class
    type t = base class
    val toBase : 'a class -> base class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a class
        val fromOptPtr :
          bool
           -> unit p
           -> 'a class option
      end
  end
