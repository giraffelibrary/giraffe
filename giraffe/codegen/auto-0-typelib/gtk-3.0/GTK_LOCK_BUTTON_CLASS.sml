signature GTK_LOCK_BUTTON_CLASS =
  sig
    type 'a lock_button
    type 'a button_class
    include
      CLASS
        where type 'a class = 'a lock_button button_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
