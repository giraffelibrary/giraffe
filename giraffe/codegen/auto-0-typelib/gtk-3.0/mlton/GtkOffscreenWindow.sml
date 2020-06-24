structure GtkOffscreenWindow :>
  GTK_OFFSCREEN_WINDOW
    where type 'a class = 'a GtkOffscreenWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_offscreen_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_offscreen_window_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getPixbuf_ = _import "gtk_offscreen_window_get_pixbuf" : GtkOffscreenWindowClass.FFI.non_opt GtkOffscreenWindowClass.FFI.p -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
    val getSurface_ = _import "gtk_offscreen_window_get_surface" : GtkOffscreenWindowClass.FFI.non_opt GtkOffscreenWindowClass.FFI.p -> CairoSurfaceRecord.FFI.opt CairoSurfaceRecord.FFI.p;
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
