signature GTK_SOURCE_STYLE_CLASS =
  sig
    type 'a style
    include
      CLASS
        where type 'a class = 'a style GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
