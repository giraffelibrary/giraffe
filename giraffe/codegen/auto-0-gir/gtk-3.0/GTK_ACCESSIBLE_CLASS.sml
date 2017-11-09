signature GTK_ACCESSIBLE_CLASS =
  sig
    type 'a accessible
    include
      CLASS
        where type 'a class = 'a accessible Atk.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
