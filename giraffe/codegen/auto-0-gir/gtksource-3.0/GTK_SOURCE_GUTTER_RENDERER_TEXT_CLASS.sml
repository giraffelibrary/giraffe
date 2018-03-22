signature GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS =
  sig
    type 'a gutter_renderer_text
    type 'a gutter_renderer_class
    include
      CLASS
        where type 'a class = 'a gutter_renderer_text gutter_renderer_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
