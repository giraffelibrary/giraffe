signature GTK_SCROLLBAR_CLASS =
  sig
    type 'a scrollbar
    type 'a range_class
    include
      CLASS
        where type 'a class = 'a scrollbar range_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
