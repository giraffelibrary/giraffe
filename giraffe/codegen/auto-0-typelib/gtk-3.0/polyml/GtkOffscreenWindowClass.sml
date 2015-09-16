structure GtkOffscreenWindowClass :>
  GTK_OFFSCREEN_WINDOW_CLASS
    where type 'a window_class_t = 'a GtkWindowClass.t
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a offscreen_window = unit
    type 'a window_class_t = 'a GtkWindowClass.t
    type 'a t = 'a offscreen_window window_class_t
    fun toBase obj = obj
    val t = GtkWindowClass.t
    val tOpt = GtkWindowClass.tOpt
    structure C = GtkWindowClass.C
  end
