structure GtkSourceMarkClass :>
  GTK_SOURCE_MARK_CLASS
    where type C.notnull = GtkTextMarkClass.C.notnull
    where type 'a C.p = 'a GtkTextMarkClass.C.p =
  struct
    open GtkTextMarkClass
    type 'a mark = unit
    type 'a class = 'a mark class
  end
