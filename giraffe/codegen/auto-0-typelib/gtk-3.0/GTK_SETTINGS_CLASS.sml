signature GTK_SETTINGS_CLASS =
  sig
    type 'a settings
    include
      CLASS
        where type 'a class = 'a settings GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
