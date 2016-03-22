structure GtkHScrollbarClass :>
  GTK_H_SCROLLBAR_CLASS
    where type 'a scrollbar_class = 'a GtkScrollbarClass.class
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a scrollbar_class = 'a GtkScrollbarClass.class
    open GtkScrollbarClass
    type 'a h_scrollbar = unit
    type 'a class = 'a h_scrollbar class
  end
