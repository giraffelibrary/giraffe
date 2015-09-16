structure GtkVSeparatorClass :>
  GTK_V_SEPARATOR_CLASS
    where type 'a separator_class_t = 'a GtkSeparatorClass.t
    where type C.notnull = GtkSeparatorClass.C.notnull
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a v_separator = unit
    type 'a separator_class_t = 'a GtkSeparatorClass.t
    type 'a t = 'a v_separator separator_class_t
    fun toBase obj = obj
    val t = GtkSeparatorClass.t
    val tOpt = GtkSeparatorClass.tOpt
    structure C = GtkSeparatorClass.C
  end
