structure GdkDrawingContextClass :>
  GDK_DRAWING_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a drawing_context = unit
    type 'a class = 'a drawing_context class
  end
