structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_window_group_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_window_group_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addWindow_ = call (load_sym libgtk "gtk_window_group_add_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getCurrentDeviceGrab_ = call (load_sym libgtk "gtk_window_group_get_current_device_grab") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCurrentGrab_ = call (load_sym libgtk "gtk_window_group_get_current_grab") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val removeWindow_ = call (load_sym libgtk "gtk_window_group_remove_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
