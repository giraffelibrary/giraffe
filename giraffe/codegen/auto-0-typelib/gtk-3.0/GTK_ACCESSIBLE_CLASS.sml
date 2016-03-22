signature GTK_ACCESSIBLE_CLASS =
  sig
    type 'a accessible
    include
      CLASS
        where type 'a class = 'a accessible Atk.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
