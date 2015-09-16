signature GTK_I_M_MULTICONTEXT_CLASS =
  sig
    type 'a i_m_multicontext
    type 'a i_m_context_class_t
    type 'a t = 'a i_m_multicontext i_m_context_class_t
    val toBase : 'a t -> base t
    val t : (base t, 'a t) GObject.Value.accessor
    val tOpt : (base t option, 'a t option) GObject.Value.accessor
    structure C :
      sig
        type notnull
        type 'a p
        val fromPtr :
          bool
           -> notnull p
           -> 'a t
        val fromOptPtr :
          bool
           -> unit p
           -> 'a t option
      end
  end
