structure GdkGLContextClass :>
  GDK_G_L_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a g_l_context = unit
    type 'a class = 'a g_l_context class
  end
