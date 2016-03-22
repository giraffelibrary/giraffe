signature GTK_SOURCE_LANGUAGE_CLASS =
  sig
    type 'a language
    include
      CLASS
        where type 'a class = 'a language GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
