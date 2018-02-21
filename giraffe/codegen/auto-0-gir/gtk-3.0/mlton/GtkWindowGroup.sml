structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_window_group_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_window_group_new" : unit -> GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p;
    val addWindow_ = fn x1 & x2 => (_import "gtk_window_group_add_window" : GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p * GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val getCurrentDeviceGrab_ = fn x1 & x2 => (_import "gtk_window_group_get_current_device_grab" : GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> unit GtkWidgetClass.FFI.p;) (x1, x2)
    val getCurrentGrab_ = _import "gtk_window_group_get_current_grab" : GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val removeWindow_ = fn x1 & x2 => (_import "gtk_window_group_remove_window" : GtkWindowGroupClass.FFI.notnull GtkWindowGroupClass.FFI.p * GtkWindowClass.FFI.notnull GtkWindowClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GtkWindowGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.FFI.fromPtr true) new_ ()
    fun addWindow self window = (GtkWindowGroupClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GtkWindowGroupClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GtkWindowGroupClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GtkWindowGroupClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) removeWindow_ (self & window)
  end
