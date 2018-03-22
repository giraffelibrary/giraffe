signature GDK_DRAWING_CONTEXT_CLASS =
  sig
    type 'a drawing_context
    include
      CLASS
        where type 'a class = 'a drawing_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
