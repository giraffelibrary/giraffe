signature GTK_ACTION_BAR_CLASS =
  sig
    type 'a action_bar
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a action_bar bin_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
