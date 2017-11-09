signature GTK_SCALE_CLASS =
  sig
    type 'a scale
    type 'a range_class
    include
      CLASS
        where type 'a class = 'a scale range_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
