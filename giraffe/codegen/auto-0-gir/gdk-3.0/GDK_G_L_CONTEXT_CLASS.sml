signature GDK_G_L_CONTEXT_CLASS =
  sig
    type 'a g_l_context
    include
      CLASS
        where type 'a class = 'a g_l_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
