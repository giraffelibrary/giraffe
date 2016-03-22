signature GTK_THEMING_ENGINE_CLASS =
  sig
    type 'a theming_engine
    include
      CLASS
        where type 'a class = 'a theming_engine GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
