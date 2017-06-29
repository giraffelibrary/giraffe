structure GtkApplication :>
  GTK_APPLICATION
    where type 'a class = 'a GtkApplicationClass.class
    where type 'a window_class = 'a GtkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_application_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_application_new") (Utf8.PolyML.cInPtr &&> GioApplicationFlags.PolyML.cVal --> GtkApplicationClass.PolyML.cPtr)
      val addWindow_ = call (getSymbol "gtk_application_add_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeWindow_ = call (getSymbol "gtk_application_remove_window") (GtkApplicationClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkApplicationClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type t = base class
    fun asActionGroup self = (GObjectObjectClass.FFI.withPtr ---> GioActionGroupClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new applicationId flags = (Utf8.FFI.withPtr &&&> GioApplicationFlags.FFI.withVal ---> GtkApplicationClass.FFI.fromPtr true) new_ (applicationId & flags)
    fun addWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) addWindow_ (self & window)
    fun removeWindow self window = (GtkApplicationClass.FFI.withPtr &&&> GtkWindowClass.FFI.withPtr ---> I) removeWindow_ (self & window)
    local
      open ClosureMarshal Signal
    in
      fun windowAddedSig f = signal "window-added" (get 0w1 GtkWindowClass.t ---> ret_void) f
      fun windowRemovedSig f = signal "window-removed" (get 0w1 GtkWindowClass.t ---> ret_void) f
    end
  end
