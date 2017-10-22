signature GTK_ACTIONABLE_CLASS =
  sig
    type 'a actionable
    include
      CLASS
        where type 'a class = 'a actionable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
