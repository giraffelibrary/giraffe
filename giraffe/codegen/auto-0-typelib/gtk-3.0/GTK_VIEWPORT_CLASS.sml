signature GTK_VIEWPORT_CLASS =
  sig
    type 'a viewport
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a viewport bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
