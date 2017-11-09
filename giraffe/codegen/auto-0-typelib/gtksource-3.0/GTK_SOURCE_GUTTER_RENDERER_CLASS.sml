signature GTK_SOURCE_GUTTER_RENDERER_CLASS =
  sig
    type 'a gutter_renderer
    include
      CLASS
        where type 'a class = 'a gutter_renderer GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
