signature GTK_I_M_CONTEXT_CLASS =
  sig
    type 'a i_m_context
    include
      CLASS
        where type 'a class = 'a i_m_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
