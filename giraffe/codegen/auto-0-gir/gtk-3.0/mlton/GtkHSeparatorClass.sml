structure GtkHSeparatorClass :>
  GTK_H_SEPARATOR_CLASS
    where type 'a separatorclass_t = 'a GtkSeparatorClass.t
    where type C.notnull = GtkSeparatorClass.C.notnull
    where type 'a C.p = 'a GtkSeparatorClass.C.p =
  struct
    type 'a hseparator = unit
    type 'a separatorclass_t = 'a GtkSeparatorClass.t
    type 'a t = 'a hseparator separatorclass_t
    fun toBase obj = obj
    val t = GtkSeparatorClass.t
    val tOpt = GtkSeparatorClass.tOpt
    structure C = GtkSeparatorClass.C
  end
