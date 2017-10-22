signature GTK_SOURCE_MAP_CLASS =
  sig
    type 'a map
    type 'a view_class
    include
      CLASS
        where type 'a class = 'a map view_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
