signature GTK_STACK_SWITCHER_CLASS =
  sig
    type 'a stack_switcher
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a stack_switcher box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
