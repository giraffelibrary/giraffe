structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    val getType_ = _import "gtk_window_group_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_window_group_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addWindow_ = fn x1 & x2 => (_import "gtk_window_group_add_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val getCurrentDeviceGrab_ = fn x1 & x2 => (_import "gtk_window_group_get_current_device_grab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getCurrentGrab_ = _import "gtk_window_group_get_current_grab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val removeWindow_ = fn x1 & x2 => (_import "gtk_window_group_remove_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    type 'a class = 'a GtkWindowGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.C.fromPtr true) new_ ()
    fun addWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWindow_ (self & window)
  end
