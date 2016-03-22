structure GtkEditableClass :>
  GTK_EDITABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a editable = unit
    type 'a class = 'a editable class
  end
