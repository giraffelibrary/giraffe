signature GTK_POPOVER_CLASS =
  sig
    type 'a popover
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a popover bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
