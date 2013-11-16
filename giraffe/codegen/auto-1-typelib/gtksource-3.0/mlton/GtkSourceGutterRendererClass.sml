structure GtkSourceGutterRendererClass :>
  GTK_SOURCE_GUTTER_RENDERER_CLASS
    where type C.notnull = GObjectInitiallyUnownedClass.C.notnull
    where type 'a C.p = 'a GObjectInitiallyUnownedClass.C.p =
  struct
    type 'a gutterrenderer = unit
    type 'a t = 'a gutterrenderer GObjectInitiallyUnownedClass.t
    fun toBase obj = obj
    val t = GObjectInitiallyUnownedClass.t
    val tOpt = GObjectInitiallyUnownedClass.tOpt
    structure C = GObjectInitiallyUnownedClass.C
  end
