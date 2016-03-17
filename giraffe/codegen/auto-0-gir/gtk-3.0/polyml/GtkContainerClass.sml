structure GtkContainerClass :>
  GTK_CONTAINER_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a container = unit
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a class = 'a container widget_class
    type t = base class
    fun toBase obj = obj
    val t = GtkWidgetClass.t
    val tOpt = GtkWidgetClass.tOpt
    structure C = GtkWidgetClass.C
  end
