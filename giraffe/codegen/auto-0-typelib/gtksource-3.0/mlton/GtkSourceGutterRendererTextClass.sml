structure GtkSourceGutterRendererTextClass :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS
    where type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    where type C.notnull = GtkSourceGutterRendererClass.C.notnull
    where type 'a C.p = 'a GtkSourceGutterRendererClass.C.p =
  struct
    type 'a gutter_renderer_text = unit
    type 'a gutter_renderer_class = 'a GtkSourceGutterRendererClass.class
    type 'a class = 'a gutter_renderer_text gutter_renderer_class
    type t = base class
    fun toBase obj = obj
    val t = GtkSourceGutterRendererClass.t
    val tOpt = GtkSourceGutterRendererClass.tOpt
    structure C = GtkSourceGutterRendererClass.C
  end
