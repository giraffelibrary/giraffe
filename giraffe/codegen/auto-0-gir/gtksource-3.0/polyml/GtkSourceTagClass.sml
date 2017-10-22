structure GtkSourceTagClass :>
  GTK_SOURCE_TAG_CLASS
    where type C.notnull = GtkTextTagClass.C.notnull
    where type 'a C.p = 'a GtkTextTagClass.C.p =
  struct
    open GtkTextTagClass
    type 'a tag = unit
    type 'a class = 'a tag class
  end
