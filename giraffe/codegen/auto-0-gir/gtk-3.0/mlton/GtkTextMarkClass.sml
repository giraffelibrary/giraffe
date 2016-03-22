structure GtkTextMarkClass :>
  GTK_TEXT_MARK_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a text_mark = unit
    type 'a class = 'a text_mark class
  end
