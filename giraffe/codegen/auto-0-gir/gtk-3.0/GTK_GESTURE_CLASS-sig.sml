signature GTK_GESTURE_CLASS =
  sig
    type 'a gesture
    type 'a event_controller_class
    include
      CLASS
        where type 'a class = 'a gesture event_controller_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
