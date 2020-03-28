signature GTK_CSS_PROVIDER_CLASS =
  sig
    type 'a css_provider
    include
      CLASS
        where type 'a class = 'a css_provider GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end