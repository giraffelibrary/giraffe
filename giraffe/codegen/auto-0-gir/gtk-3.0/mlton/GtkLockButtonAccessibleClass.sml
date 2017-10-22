structure GtkLockButtonAccessibleClass :>
  GTK_LOCK_BUTTON_ACCESSIBLE_CLASS
    where type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    where type C.notnull = GtkButtonAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkButtonAccessibleClass.C.p =
  struct
    type 'a button_accessible_class = 'a GtkButtonAccessibleClass.class
    open GtkButtonAccessibleClass
    type 'a lock_button_accessible = unit
    type 'a class = 'a lock_button_accessible class
  end
