signature GTK_ADJUSTMENT_CLASS =
  sig
    type 'a adjustment
    include
      CLASS
        where type 'a class = 'a adjustment GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
