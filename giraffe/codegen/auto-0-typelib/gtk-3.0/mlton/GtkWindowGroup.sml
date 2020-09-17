structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_window_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_window_group_new" : unit -> GtkWindowGroupClass.FFI.non_opt GtkWindowGroupClass.FFI.p;
    val addWindow_ = fn x1 & x2 => (_import "gtk_window_group_add_window" : GtkWindowGroupClass.FFI.non_opt GtkWindowGroupClass.FFI.p * GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val getCurrentDeviceGrab_ = fn x1 & x2 => (_import "gtk_window_group_get_current_device_grab" : GtkWindowGroupClass.FFI.non_opt GtkWindowGroupClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getCurrentGrab_ = _import "gtk_window_group_get_current_grab" : GtkWindowGroupClass.FFI.non_opt GtkWindowGroupClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val removeWindow_ = fn x1 & x2 => (_import "gtk_window_group_remove_window" : GtkWindowGroupClass.FFI.non_opt GtkWindowGroupClass.FFI.p * GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkWindowGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.FFI.fromPtr true) new_ ()
    fun addWindow self window = (GtkWindowGroupClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GtkWindowGroupClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCurrentDeviceGrab_ (self & device) before GtkWindowGroupClass.FFI.touchPtr self before GdkDeviceClass.FFI.touchPtr device
    fun getCurrentGrab self = (GtkWindowGroupClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getCurrentGrab_ self before GtkWindowGroupClass.FFI.touchPtr self
    fun removeWindow self window = (GtkWindowGroupClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I) removeWindow_ (self & window)
  end
