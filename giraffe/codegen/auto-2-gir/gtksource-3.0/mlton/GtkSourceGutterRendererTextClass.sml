structure GtkSourceGutterRendererTextClass :>
  GTK_SOURCE_GUTTER_RENDERER_TEXT_CLASS
    where type 'a gutterrendererclass_t = 'a GtkSourceGutterRendererClass.t
    where type C.notnull = GtkSourceGutterRendererClass.C.notnull
    where type 'a C.p = 'a GtkSourceGutterRendererClass.C.p =
  struct
    type 'a gutterrenderertext = unit
    type 'a gutterrendererclass_t = 'a GtkSourceGutterRendererClass.t
    type 'a t = 'a gutterrenderertext gutterrendererclass_t
    fun toBase obj = obj
    val t = GtkSourceGutterRendererClass.t
    val tOpt = GtkSourceGutterRendererClass.tOpt
    structure C = GtkSourceGutterRendererClass.C
  end
