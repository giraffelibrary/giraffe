structure GtkSourceViewClass :>
  GTK_SOURCE_VIEW_CLASS
    where type C.notnull = GtkTextViewClass.C.notnull
    where type 'a C.p = 'a GtkTextViewClass.C.p =
  struct
    open GtkTextViewClass
    type 'a view = unit
    type 'a class = 'a view class
  end
