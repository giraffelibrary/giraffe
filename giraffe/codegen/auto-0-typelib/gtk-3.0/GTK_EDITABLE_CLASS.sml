signature GTK_EDITABLE_CLASS =
  sig
    type 'a editable
    include
      CLASS
        where type 'a class = 'a editable GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
