structure GdkScreenClass :>
  GDK_SCREEN_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a screen = unit
    type 'a class = 'a screen class
  end
