structure GtkWidgetClass :>
  GTK_WIDGET_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    open GObjectInitiallyUnownedClass
    type 'a widget = unit
    type 'a class = 'a widget class
  end
