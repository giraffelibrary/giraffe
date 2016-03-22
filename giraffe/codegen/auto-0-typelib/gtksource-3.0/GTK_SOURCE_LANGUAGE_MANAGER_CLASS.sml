signature GTK_SOURCE_LANGUAGE_MANAGER_CLASS =
  sig
    type 'a language_manager
    include
      CLASS
        where type 'a class = 'a language_manager GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
