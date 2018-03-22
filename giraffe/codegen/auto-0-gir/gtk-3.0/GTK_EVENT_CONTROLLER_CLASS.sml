signature GTK_EVENT_CONTROLLER_CLASS =
  sig
    type 'a event_controller
    include
      CLASS
        where type 'a class = 'a event_controller GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
