structure GdkCursorClass :>
  GDK_CURSOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a cursor = unit
    type 'a class = 'a cursor class
  end
