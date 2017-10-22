signature GTK_GESTURE_MULTI_PRESS_CLASS =
  sig
    type 'a gesture_multi_press
    type 'a gesture_single_class
    include
      CLASS
        where type 'a class = 'a gesture_multi_press gesture_single_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
