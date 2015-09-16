structure GtkScrolledWindowClass :>
  GTK_SCROLLED_WINDOW_CLASS
    where type 'a bin_class_t = 'a GtkBinClass.t
    where type C.notnull = GtkBinClass.C.notnull
    where type 'a C.p = 'a GtkBinClass.C.p =
  struct
    type 'a scrolled_window = unit
    type 'a bin_class_t = 'a GtkBinClass.t
    type 'a t = 'a scrolled_window bin_class_t
    fun toBase obj = obj
    val t = GtkBinClass.t
    val tOpt = GtkBinClass.tOpt
    structure C = GtkBinClass.C
  end
