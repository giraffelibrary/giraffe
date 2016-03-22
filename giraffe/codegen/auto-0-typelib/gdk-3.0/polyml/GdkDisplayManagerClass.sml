structure GdkDisplayManagerClass :>
  GDK_DISPLAY_MANAGER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a display_manager = unit
    type 'a class = 'a display_manager class
  end
