structure GtkSourceGutterRendererTextClass :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS
    where type 'a gutter_renderer_class_t = 'a GtkSourceGutterRendererClass.t
    where type C.notnull = GtkSourceGutterRendererClass.C.notnull
    where type 'a C.p = 'a GtkSourceGutterRendererClass.C.p =
  struct
    type 'a gutter_renderer_text = unit
    type 'a gutter_renderer_class_t = 'a GtkSourceGutterRendererClass.t
    type 'a t = 'a gutter_renderer_text gutter_renderer_class_t
    fun toBase obj = obj
    val t = GtkSourceGutterRendererClass.t
    val tOpt = GtkSourceGutterRendererClass.tOpt
    structure C = GtkSourceGutterRendererClass.C
  end
