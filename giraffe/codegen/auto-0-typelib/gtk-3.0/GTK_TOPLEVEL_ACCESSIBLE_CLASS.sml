signature GTK_TOPLEVEL_ACCESSIBLE_CLASS =
  sig
    type 'a toplevel_accessible
    include
      CLASS
        where type 'a class = 'a toplevel_accessible Atk.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
