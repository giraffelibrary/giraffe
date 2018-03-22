signature GIO_APP_LAUNCH_CONTEXT_CLASS =
  sig
    type 'a app_launch_context
    include
      CLASS
        where type 'a class = 'a app_launch_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
