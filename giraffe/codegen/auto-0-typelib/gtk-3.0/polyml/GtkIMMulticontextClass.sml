structure GtkIMMulticontextClass :>
  GTK_I_M_MULTICONTEXT_CLASS
    where type 'a i_m_context_class = 'a GtkIMContextClass.class
    where type C.notnull = GtkIMContextClass.C.notnull
    where type 'a C.p = 'a GtkIMContextClass.C.p =
  struct
    type 'a i_m_context_class = 'a GtkIMContextClass.class
    open GtkIMContextClass
    type 'a i_m_multicontext = unit
    type 'a class = 'a i_m_multicontext class
  end
