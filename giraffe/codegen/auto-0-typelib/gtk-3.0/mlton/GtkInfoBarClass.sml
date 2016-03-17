structure GtkInfoBarClass :>
  GTK_INFO_BAR_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a info_bar = unit
    type 'a box_class = 'a GtkBoxClass.class
    type 'a class = 'a info_bar box_class
    type t = base class
    fun toBase obj = obj
    val t = GtkBoxClass.t
    val tOpt = GtkBoxClass.tOpt
    structure C = GtkBoxClass.C
  end
