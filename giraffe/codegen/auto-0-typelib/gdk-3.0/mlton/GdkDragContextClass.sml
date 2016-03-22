structure GdkDragContextClass :>
  GDK_DRAG_CONTEXT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a drag_context = unit
    type 'a class = 'a drag_context class
  end
