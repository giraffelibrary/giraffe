signature GTK_GESTURE_SWIPE_CLASS =
  sig
    type 'a gesture_swipe
    type 'a gesture_single_class
    include
      CLASS
        where type 'a class = 'a gesture_swipe gesture_single_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
