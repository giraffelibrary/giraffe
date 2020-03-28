signature GTK_SEPARATOR_CLASS =
  sig
    type 'a separator
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a separator widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end