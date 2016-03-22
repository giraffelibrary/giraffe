structure GtkSourceMarkAttributesClass :>
  GTK_SOURCE_MARK_ATTRIBUTES_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a mark_attributes = unit
    type 'a class = 'a mark_attributes class
  end
