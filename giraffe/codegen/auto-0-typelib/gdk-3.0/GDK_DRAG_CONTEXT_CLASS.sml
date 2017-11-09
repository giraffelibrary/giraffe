signature GDK_DRAG_CONTEXT_CLASS =
  sig
    type 'a drag_context
    include
      CLASS
        where type 'a class = 'a drag_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
