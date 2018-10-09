signature GTK_GESTURE_ZOOM_CLASS =
  sig
    type 'a gesture_zoom
    type 'a gesture_class
    include
      CLASS
        where type 'a class = 'a gesture_zoom gesture_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
