structure GtkScrolledWindowClass :>
  GTK_SCROLLED_WINDOW_CLASS
    where type 'a bin_class = 'a GtkBinClass.class
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a bin_class = 'a GtkBinClass.class
    open GtkBinClass
    type 'a scrolled_window = unit
    type 'a class = 'a scrolled_window class
  end
