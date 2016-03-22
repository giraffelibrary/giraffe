structure GdkDisplayClass :>
  GDK_DISPLAY_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a display = unit
    type 'a class = 'a display class
  end
