signature GTK_ICON_INFO =
  sig
    type 'a class
    type 'a icon_theme_class
    type 'a style_context_class
    type state_type_t
    type 'a style_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val newForPixbuf : 'a icon_theme_class * 'b GdkPixbuf.PixbufClass.class -> base class
    val getAttachPoints : 'a class -> Gdk.PointRecord.t vector option
    val getBaseScale : 'a class -> LargeInt.int
    val getBaseSize : 'a class -> LargeInt.int
    val getBuiltinPixbuf : 'a class -> base GdkPixbuf.PixbufClass.class option
    val getDisplayName : 'a class -> string
    val getEmbeddedRect : 'a class -> Gdk.RectangleRecord.t option
    val getFilename : 'a class -> string option
    val isSymbolic : 'a class -> bool
    val loadIcon : 'a class -> base GdkPixbuf.PixbufClass.class
    val loadIconFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> base GdkPixbuf.PixbufClass.class
    val loadSurface :
      'a class
       -> 'b Gdk.WindowClass.class option
       -> Cairo.SurfaceRecord.t
    val loadSymbolic :
      'a class
       -> Gdk.RgbaRecord.t
           * Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t option
           * Gdk.RgbaRecord.t option
       -> base GdkPixbuf.PixbufClass.class * bool
    val loadSymbolicFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> base GdkPixbuf.PixbufClass.class * bool
    val loadSymbolicForContext :
      'a class
       -> 'b style_context_class
       -> base GdkPixbuf.PixbufClass.class * bool
    val loadSymbolicForContextFinish :
      'a class
       -> 'b Gio.AsyncResultClass.class
       -> base GdkPixbuf.PixbufClass.class * bool
    val loadSymbolicForStyle :
      'a class
       -> 'b style_class * state_type_t
       -> base GdkPixbuf.PixbufClass.class * bool
    val setRawCoordinates :
      'a class
       -> bool
       -> unit
  end
