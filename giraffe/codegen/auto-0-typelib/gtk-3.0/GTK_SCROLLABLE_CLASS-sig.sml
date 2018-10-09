signature GTK_SCROLLABLE_CLASS =
  sig
    type 'a scrollable
    include
      CLASS
        where type 'a class = 'a scrollable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
