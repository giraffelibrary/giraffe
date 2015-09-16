structure GtkProgressBarClass :>
  GTK_PROGRESS_BAR_CLASS
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a progress_bar = unit
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a t = 'a progress_bar widget_class_t
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end
