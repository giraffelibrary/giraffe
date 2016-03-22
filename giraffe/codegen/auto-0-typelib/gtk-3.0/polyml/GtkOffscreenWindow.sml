structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class = 'a GtkOffscreenWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_offscreen_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_offscreen_window_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getPixbuf_ = call (load_sym libgtk "gtk_offscreen_window_get_pixbuf") (GtkOffscreenWindowClass.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getSurface_ = call (load_sym libgtk "gtk_offscreen_window_get_surface") (GtkOffscreenWindowClass.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
    end
    type 'a class = 'a GtkOffscreenWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOffscreenWindowClass.C.fromPtr false) new_ ()
    fun getPixbuf self = (GtkOffscreenWindowClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSurface self = (GtkOffscreenWindowClass.C.withPtr ---> CairoSurfaceRecord.C.fromPtr false) getSurface_ self
  end
