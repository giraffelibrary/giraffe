signature GTK_STYLE_PROVIDER_CLASS =
  sig
    type 'a style_provider
    include
      CLASS
        where type 'a class = 'a style_provider GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
