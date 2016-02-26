structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class_t = 'a GtkOffscreenWindowClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_offscreen_window_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_offscreen_window_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getPixbuf_ = call (load_sym libgtk "gtk_offscreen_window_get_pixbuf") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSurface_ = call (load_sym libgtk "gtk_offscreen_window_get_surface") (GObjectObjectClass.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
    end
    type 'a class_t = 'a GtkOffscreenWindowClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOffscreenWindowClass.C.fromPtr false) new_ ()
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSurface self = (GObjectObjectClass.C.withPtr ---> CairoSurfaceRecord.C.fromPtr false) getSurface_ self
  end
