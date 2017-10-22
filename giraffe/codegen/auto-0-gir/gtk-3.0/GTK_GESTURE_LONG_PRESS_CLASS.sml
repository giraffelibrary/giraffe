signature GTK_GESTURE_LONG_PRESS_CLASS =
  sig
    type 'a gesture_long_press
    type 'a gesture_single_class
    include
      CLASS
        where type 'a class = 'a gesture_long_press gesture_single_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
