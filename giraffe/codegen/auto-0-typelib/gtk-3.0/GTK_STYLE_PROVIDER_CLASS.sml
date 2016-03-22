signature GTK_STYLE_PROVIDER_CLASS =
  sig
    type 'a style_provider
    include
      CLASS
        where type 'a class = 'a style_provider GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
