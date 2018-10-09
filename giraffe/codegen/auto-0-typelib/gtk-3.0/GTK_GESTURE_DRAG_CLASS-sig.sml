signature GTK_GESTURE_DRAG_CLASS =
  sig
    type 'a gesture_drag
    type 'a gesture_single_class
    include
      CLASS
        where type 'a class = 'a gesture_drag gesture_single_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
