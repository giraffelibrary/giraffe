structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_window_group_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_window_group_new") (cVoid --> GtkWindowGroupClass.PolyML.cPtr)
      val addWindow_ = call (getSymbol "gtk_window_group_add_window") (GtkWindowGroupClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
      val getCurrentDeviceGrab_ = call (getSymbol "gtk_window_group_get_current_device_grab") (GtkWindowGroupClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getCurrentGrab_ = call (getSymbol "gtk_window_group_get_current_grab") (GtkWindowGroupClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val removeWindow_ = call (getSymbol "gtk_window_group_remove_window") (GtkWindowGroupClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkWindowGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.FFI.fromPtr true) new_ ()
    fun addWindow self window = (GtkWindowGroupClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GtkWindowGroupClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GtkWindowGroupClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GtkWindowGroupClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withPtr false ---> I) removeWindow_ (self & window)
  end
