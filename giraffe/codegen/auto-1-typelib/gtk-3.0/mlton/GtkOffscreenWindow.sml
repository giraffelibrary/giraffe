structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class_t = 'a GtkOffscreenWindowClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_offscreen_window_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_offscreen_window_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPixbuf_ = _import "gtk_offscreen_window_get_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSurface_ = _import "gtk_offscreen_window_get_surface" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p;
    type 'a class_t = 'a GtkOffscreenWindowClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkOffscreenWindowClass.C.fromPtr false) new_ ()
    fun getPixbuf self = (GObjectObjectClass.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr true) getPixbuf_ self
    fun getSurface self = (GObjectObjectClass.C.withPtr ---> CairoSurfaceRecord.C.fromPtr false) getSurface_ self
  end
