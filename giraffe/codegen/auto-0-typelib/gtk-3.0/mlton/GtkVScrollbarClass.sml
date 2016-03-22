structure GtkVScrollbarClass :>
  GTK_V_SCROLLBAR_CLASS
    where type 'a scrollbar_class = 'a GtkScrollbarClass.class
    where type C.notnull = GtkScrollbarClass.C.notnull
    where type 'a C.p = 'a GtkScrollbarClass.C.p =
  struct
    type 'a scrollbar_class = 'a GtkScrollbarClass.class
    open GtkScrollbarClass
    type 'a v_scrollbar = unit
    type 'a class = 'a v_scrollbar class
  end
