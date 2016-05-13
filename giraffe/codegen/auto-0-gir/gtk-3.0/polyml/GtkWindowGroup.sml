structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class = 'a GtkWindowGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_window_group_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_window_group_new") (PolyMLFFI.cVoid --> GtkWindowGroupClass.PolyML.cPtr)
      val addWindow_ = call (load_sym libgtk "gtk_window_group_add_window") (GtkWindowGroupClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getCurrentDeviceGrab_ = call (load_sym libgtk "gtk_window_group_get_current_device_grab") (GtkWindowGroupClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getCurrentGrab_ = call (load_sym libgtk "gtk_window_group_get_current_grab") (GtkWindowGroupClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val removeWindow_ = call (load_sym libgtk "gtk_window_group_remove_window") (GtkWindowGroupClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkWindowGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.C.fromPtr true) new_ ()
    fun addWindow self window = (GtkWindowGroupClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GtkWindowGroupClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GtkWindowGroupClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GtkWindowGroupClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) removeWindow_ (self & window)
  end
