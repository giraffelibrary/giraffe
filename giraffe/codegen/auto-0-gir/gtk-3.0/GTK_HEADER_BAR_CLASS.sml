signature GTK_HEADER_BAR_CLASS =
  sig
    type 'a header_bar
    type 'a container_class
    include
      CLASS
        where type 'a class = 'a header_bar container_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
