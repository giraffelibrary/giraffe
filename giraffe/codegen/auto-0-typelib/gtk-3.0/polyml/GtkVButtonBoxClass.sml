structure GtkVButtonBoxClass :>
  GTK_V_BUTTON_BOX_CLASS
    where type 'a button_box_class_t = 'a GtkButtonBoxClass.t
    where type C.notnull = GtkButtonBoxClass.C.notnull
    where type 'a C.p = 'a GtkButtonBoxClass.C.p =
  struct
    type 'a v_button_box = unit
    type 'a button_box_class_t = 'a GtkButtonBoxClass.t
    type 'a t = 'a v_button_box button_box_class_t
    fun toBase obj = obj
    val t = GtkButtonBoxClass.t
    val tOpt = GtkButtonBoxClass.tOpt
    structure C = GtkButtonBoxClass.C
  end
