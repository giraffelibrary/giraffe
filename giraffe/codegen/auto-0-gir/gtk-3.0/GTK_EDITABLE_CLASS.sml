signature GTK_EDITABLE_CLASS =
  sig
    type 'a editable
    include
      CLASS
        where type 'a class = 'a editable GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
