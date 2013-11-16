structure GtkVSeparatorClass :>
  GTK_V_SEPARATOR_CLASS
    where type 'a separatorclass_t = 'a GtkSeparatorClass.t
    where type C.notnull = GtkSeparatorClass.C.notnull
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a vseparator = unit
    type 'a separatorclass_t = 'a GtkSeparatorClass.t
    type 'a t = 'a vseparator separatorclass_t
    fun toBase obj = obj
    val t = GtkSeparatorClass.t
    val tOpt = GtkSeparatorClass.tOpt
    structure C = GtkSeparatorClass.C
  end
