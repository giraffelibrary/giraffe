structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_application_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_application_new") (Utf8.PolyML.cInPtr &&> GioApplicationFlags.PolyML.cVal --> GtkApplicationClass.PolyML.cPtr)
      val addWindow_ = call (load_sym libgtk "gtk_application_add_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val removeWindow_ = call (load_sym libgtk "gtk_application_remove_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkApplicationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.C.withPtr ---> GioActionGroupClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new applicationId flags = (Utf8.C.withPtr &&&> GioApplicationFlags.C.withVal ---> GtkApplicationClass.C.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GtkApplicationClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GtkApplicationClass.C.withPtr &&&> GtkWindowClass.C.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
