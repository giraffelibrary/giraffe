signature GIO_TASK_CLASS =
  sig
    type 'a task
    include
      CLASS
        where type 'a class = 'a task GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
