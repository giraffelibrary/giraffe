signature GTK_PRINT_SETTINGS_CLASS =
  sig
    type 'a print_settings
    include
      CLASS
        where type 'a class = 'a print_settings GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
