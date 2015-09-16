structure GtkIMContextSimpleClass :>
  GTK_I_M_CONTEXT_SIMPLE_CLASS
    where type 'a i_m_context_class_t = 'a GtkIMContextClass.t
    where type C.notnull = GtkIMContextClass.C.notnull
    where type 'a C.p = 'a GtkIMContextClass.C.p =
  struct
    type 'a i_m_context_simple = unit
    type 'a i_m_context_class_t = 'a GtkIMContextClass.t
    type 'a t = 'a i_m_context_simple i_m_context_class_t
    fun toBase obj = obj
    val t = GtkIMContextClass.t
    val tOpt = GtkIMContextClass.tOpt
    structure C = GtkIMContextClass.C
  end
