structure GdkWindowClass :>
  GDK_WINDOW_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a window = unit
    type 'a class = 'a window class
  end
