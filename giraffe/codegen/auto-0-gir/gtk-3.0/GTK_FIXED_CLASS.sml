signature GTK_FIXED_CLASS =
  sig
    type 'a fixed
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a fixed container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
