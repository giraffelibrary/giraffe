signature GTK_GESTURE_SINGLE_CLASS =
  sig
    type 'a gesture_single
    type 'a gesture_class
    include
      CLASS
        where type 'a class = 'a gesture_single gesture_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
