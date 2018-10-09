signature GTK_RECENT_FILTER_CLASS =
  sig
    type 'a recent_filter
    include
      CLASS
        where type 'a class = 'a recent_filter GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
