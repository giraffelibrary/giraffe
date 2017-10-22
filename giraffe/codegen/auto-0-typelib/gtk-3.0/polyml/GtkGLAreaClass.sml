structure GtkGLAreaClass :>
  GTK_G_L_AREA_CLASS
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type C.notnull = GtkWidgetClass.C.notnull
    where type 'a C.p = 'a GtkWidgetClass.C.p =
  struct
    type 'a widget_class = 'a GtkWidgetClass.class
    open GtkWidgetClass
    type 'a g_l_area = unit
    type 'a class = 'a g_l_area class
  end
