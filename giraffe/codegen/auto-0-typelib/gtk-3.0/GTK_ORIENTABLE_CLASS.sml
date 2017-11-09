signature GTK_ORIENTABLE_CLASS =
  sig
    type 'a orientable
    include
      CLASS
        where type 'a class = 'a orientable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
