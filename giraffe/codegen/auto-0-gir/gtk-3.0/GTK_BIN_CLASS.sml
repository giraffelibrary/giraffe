signature GTK_BIN_CLASS =
  sig
    type 'a bin
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a bin container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
