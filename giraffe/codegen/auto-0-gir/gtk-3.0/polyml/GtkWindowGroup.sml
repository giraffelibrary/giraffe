structure GtkWindowGroup :>
  GTK_WINDOW_GROUP
    where type 'a class_t = 'a GtkWindowGroupClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a windowclass_t = 'a GtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_window_group_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_window_group_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addWindow_ = call (load_sym libgtk "gtk_window_group_add_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getCurrentDeviceGrab_ = call (load_sym libgtk "gtk_window_group_get_current_device_grab") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getCurrentGrab_ = call (load_sym libgtk "gtk_window_group_get_current_grab") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val removeWindow_ = call (load_sym libgtk "gtk_window_group_remove_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkWindowGroupClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a windowclass_t = 'a GtkWindowClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkWindowGroupClass.C.fromPtr true) new_ ()
    fun addWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWindow_ (self & window)
    fun getCurrentDeviceGrab self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentDeviceGrab_ (self & device)
    fun getCurrentGrab self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getCurrentGrab_ self
    fun removeWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWindow_ (self & window)
  end
