signature GTK_SPIN_BUTTON_ACCESSIBLE_CLASS =
  sig
    type 'a spin_button_accessible
    type 'a entry_accessible_class
    include
      CLASS
        where type 'a class = 'a spin_button_accessible entry_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
