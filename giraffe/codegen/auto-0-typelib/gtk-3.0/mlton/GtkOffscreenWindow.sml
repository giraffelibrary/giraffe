structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class = 'a GtkOffscreenWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_offscreen_window_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_offscreen_window_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPixbuf_ = _import "gtk_offscreen_window_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSurface_ = _import "gtk_offscreen_window_get_surface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p;
    type 'a class = 'a GtkOffscreenWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOffscreenWindowClass.C.fromPtr false) new_ ()
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSurface self = (GObjectObjectClass.C.withPtr ---> CairoSurfaceRecord.C.fromPtr false) getSurface_ self
  end
