structure GtkHButtonBoxClass :>
  GTK_H_BUTTON_BOX_CLASS
    where type 'a button_box_class = 'a GtkButtonBoxClass.class
    where type C.notnull = GtkButtonBoxClass.C.notnull
    where type 'a C.p = 'a GtkButtonBoxClass.C.p =
  struct
    type 'a h_button_box = unit
    type 'a button_box_class = 'a GtkButtonBoxClass.class
    type 'a class = 'a h_button_box button_box_class
    type t = base class
    fun toBase obj = obj
    val t = GtkButtonBoxClass.t
    val tOpt = GtkButtonBoxClass.tOpt
    structure C = GtkButtonBoxClass.C
  end
