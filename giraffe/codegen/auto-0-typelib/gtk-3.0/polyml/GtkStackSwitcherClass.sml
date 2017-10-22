structure GtkStackSwitcherClass :>
  GTK_STACK_SWITCHER_CLASS
    where type 'a box_class = 'a GtkBoxClass.class
    where type C.notnull = GtkBoxClass.C.notnull
    where type 'a C.p = 'a GtkBoxClass.C.p =
  struct
    type 'a box_class = 'a GtkBoxClass.class
    open GtkBoxClass
    type 'a stack_switcher = unit
    type 'a class = 'a stack_switcher class
  end
