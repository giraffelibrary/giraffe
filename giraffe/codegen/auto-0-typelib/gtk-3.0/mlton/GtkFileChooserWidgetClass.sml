structure GtkFileChooserWidgetClass :>
  GTK_FILE_CHOOSER_WIDGET_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a file_chooser_widget = unit
    type 'a box_class = 'a GtkBoxClass.class
    type 'a class = 'a file_chooser_widget box_class
    type t = base class
    fun toBase obj = obj
    val t = GtkBoxClass.t
    val tOpt = GtkBoxClass.tOpt
    structure C = GtkBoxClass.C
  end
