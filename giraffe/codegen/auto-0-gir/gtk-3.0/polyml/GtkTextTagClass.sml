structure GtkTextTagClass :>
  GTK_TEXT_TAG_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a text_tag = unit
    type 'a class = 'a text_tag class
  end
