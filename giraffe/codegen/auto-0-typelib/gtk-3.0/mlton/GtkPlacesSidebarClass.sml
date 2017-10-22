structure GtkPlacesSidebarClass :>
  GTK_PLACES_SIDEBAR_CLASS
    where type 'a scrolled_window_class = 'a GtkScrolledWindowClass.class
    where type C.notnull = GtkScrolledWindowClass.C.notnull
    where type 'a C.p = 'a GtkScrolledWindowClass.C.p =
  struct
    type 'a scrolled_window_class = 'a GtkScrolledWindowClass.class
    open GtkScrolledWindowClass
    type 'a places_sidebar = unit
    type 'a class = 'a places_sidebar class
  end
