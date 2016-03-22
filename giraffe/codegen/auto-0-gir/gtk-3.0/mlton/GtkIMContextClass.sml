structure GtkIMContextClass :>
  GTK_I_M_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a i_m_context = unit
    type 'a class = 'a i_m_context class
  end
