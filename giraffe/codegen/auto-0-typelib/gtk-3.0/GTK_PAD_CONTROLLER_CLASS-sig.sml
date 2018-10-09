signature GTK_PAD_CONTROLLER_CLASS =
  sig
    type 'a pad_controller
    type 'a event_controller_class
    include
      CLASS
        where type 'a class = 'a pad_controller event_controller_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
