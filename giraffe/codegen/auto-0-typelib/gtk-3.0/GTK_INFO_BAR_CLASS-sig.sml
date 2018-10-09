signature GTK_INFO_BAR_CLASS =
  sig
    type 'a info_bar
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a info_bar box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
