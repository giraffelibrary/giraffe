structure GtkSpinButtonAccessibleClass :>
  GTK_SPIN_BUTTON_ACCESSIBLE_CLASS
    where type 'a entry_accessible_class = 'a GtkEntryAccessibleClass.class
    where type C.notnull = GtkEntryAccessibleClass.C.notnull
    where type 'a C.p = 'a GtkEntryAccessibleClass.C.p =
  struct
    type 'a entry_accessible_class = 'a GtkEntryAccessibleClass.class
    open GtkEntryAccessibleClass
    type 'a spin_button_accessible = unit
    type 'a class = 'a spin_button_accessible class
  end
