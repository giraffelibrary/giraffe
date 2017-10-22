signature GTK_STACK_CLASS =
  sig
    type 'a stack
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a stack container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
