structure GtkShortcutsWindowClass :>
  GTK_SHORTCUTS_WINDOW_CLASS
    where type 'a window_class = 'a GtkWindowClass.class
    where type C.notnull = GtkWindowClass.C.notnull
    where type 'a C.p = 'a GtkWindowClass.C.p =
  struct
    type 'a window_class = 'a GtkWindowClass.class
    open GtkWindowClass
    type 'a shortcuts_window = unit
    type 'a class = 'a shortcuts_window class
  end
