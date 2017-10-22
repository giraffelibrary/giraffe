signature GTK_GESTURE_ROTATE_CLASS =
  sig
    type 'a gesture_rotate
    type 'a gesture_class
    include
      CLASS
        where type 'a class = 'a gesture_rotate gesture_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
