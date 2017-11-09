signature GTK_BUTTON_CLASS =
  sig
    type 'a button
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a button bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
