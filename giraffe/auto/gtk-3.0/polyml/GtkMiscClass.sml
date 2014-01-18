structure GtkMiscClass :>
  GTK_MISC_CLASS
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a misc = unit
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a t = 'a misc widgetclass_t
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end