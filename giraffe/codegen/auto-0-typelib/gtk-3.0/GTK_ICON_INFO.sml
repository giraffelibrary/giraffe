signature GTK_ICON_INFO =
  sig
    type t
    type 'a icon_theme_class
    type 'a style_context_class
    val getType : unit -> GObject.Type.t
    val newForPixbuf :
      'a icon_theme_class
       -> 'b GdkPixbuf.PixbufClass.class
       -> t
    val copy : t -> t
    val getBaseSize : t -> LargeInt.int
    val getBuiltinPixbuf : t -> base GdkPixbuf.PixbufClass.class
    val getDisplayName : t -> string
    val getEmbeddedRect : t -> Cairo.RectangleIntRecord.t option
    val getFilename : t -> string
    val loadIcon : t -> base GdkPixbuf.PixbufClass.class
    val loadSymbolic :
      t
       -> Gdk.RgbaRecord.t
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> Gdk.RgbaRecord.t option
       -> base GdkPixbuf.PixbufClass.class * bool
    val loadSymbolicForContext :
      t
       -> 'a style_context_class
       -> base GdkPixbuf.PixbufClass.class * bool
    val setRawCoordinates :
      t
       -> bool
       -> unit
  end
