signature GTK_GESTURE_PAN_CLASS =
  sig
    type 'a gesture_pan
    type 'a gesture_drag_class
    include
      CLASS
        where type 'a class = 'a gesture_pan gesture_drag_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
