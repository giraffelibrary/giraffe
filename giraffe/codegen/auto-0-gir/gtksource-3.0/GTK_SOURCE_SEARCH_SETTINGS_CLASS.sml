signature GTK_SOURCE_SEARCH_SETTINGS_CLASS =
  sig
    type 'a search_settings
    include
      CLASS
        where type 'a class = 'a search_settings GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
