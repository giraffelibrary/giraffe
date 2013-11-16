structure GtkFontChooserWidgetClass :>
  GTK_FONT_CHOOSER_WIDGET_CLASS
    where type 'a boxclass_t = 'a GtkBoxClass.t
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a fontchooserwidget = unit
    type 'a boxclass_t = 'a GtkBoxClass.t
    type 'a t = 'a fontchooserwidget boxclass_t
    fun toBase obj = obj
    val t = GtkBoxClass.t
    val tOpt = GtkBoxClass.tOpt
    structure C = GtkBoxClass.C
  end
