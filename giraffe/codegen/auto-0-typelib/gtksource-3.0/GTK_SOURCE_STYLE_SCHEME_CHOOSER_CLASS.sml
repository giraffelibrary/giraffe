signature GTK_SOURCE_STYLE_SCHEME_CHOOSER_CLASS =
  sig
    type 'a style_scheme_chooser
    include
      CLASS
        where type 'a class = 'a style_scheme_chooser GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
