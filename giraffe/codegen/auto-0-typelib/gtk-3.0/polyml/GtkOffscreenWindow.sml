structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class = 'a GtkOffscreenWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_offscreen_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_offscreen_window_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getPixbuf_ = call (getSymbol "gtk_offscreen_window_get_pixbuf") (GtkOffscreenWindowClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getSurface_ = call (getSymbol "gtk_offscreen_window_get_surface") (GtkOffscreenWindowClass.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cOptPtr)
    end
    type 'a class = 'a GtkOffscreenWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkOffscreenWindowClass.FFI.fromPtr false) new_ ()
    fun getPixbuf self = (GtkOffscreenWindowClass.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getPixbuf_ self
    fun getSurface self = (GtkOffscreenWindowClass.FFI.withPtr ---> CairoSurfaceRecord.FFI.fromOptPtr false) getSurface_ self
  end
