structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class_t = 'a GtkApplicationClass.t
    where type 'a window_class_t = 'a GtkWindowClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_application_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_application_new") (Utf8.PolyML.INPTR &&> GioApplicationFlags.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val addWindow_ = call (load_sym libgtk "gtk_application_add_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeWindow_ = call (load_sym libgtk "gtk_application_remove_window") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkApplicationClass.t
    type 'a window_class_t = 'a GtkWindowClass.t
    type t = base class_t
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (Utf8.C.withPtr &&&> GioApplicationFlags.C.withVal ---> GtkApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
