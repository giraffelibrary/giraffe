structure GtkIMMulticontextClass :>
  GTK_I_M_MULTICONTEXT_CLASS
    where type 'a imcontextclass_t = 'a GtkIMContextClass.t
    where type C.notnull = GtkIMContextClass.C.notnull
    where type 'a C.p = 'a GtkIMContextClass.C.p =
  struct
    type 'a immulticontext = unit
    type 'a imcontextclass_t = 'a GtkIMContextClass.t
    type 'a t = 'a immulticontext imcontextclass_t
    fun toBase obj = obj
    val t = GtkIMContextClass.t
    val tOpt = GtkIMContextClass.tOpt
    structure C = GtkIMContextClass.C
  end
