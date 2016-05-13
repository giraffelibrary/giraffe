structure GtkSocket :>
  GTK_SOCKET
    where type 'a class = 'a GtkSocketClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_socket_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_socket_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addId_ = call (load_sym libgtk "gtk_socket_add_id") (GtkSocketClass.PolyML.cPtr &&> FFI.UInt64.PolyML.cVal --> PolyMLFFI.cVoid)
      val getId_ = call (load_sym libgtk "gtk_socket_get_id") (GtkSocketClass.PolyML.cPtr --> FFI.UInt64.PolyML.cVal)
      val getPlugWindow_ = call (load_sym libgtk "gtk_socket_get_plug_window") (GtkSocketClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
    end
    type 'a class = 'a GtkSocketClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.C.fromPtr false) new_ ()
    fun addId self window = (GtkSocketClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) addId_ (self & window)
    fun getId self = (GtkSocketClass.C.withPtr ---> FFI.UInt64.C.fromVal) getId_ self
    fun getPlugWindow self = (GtkSocketClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getPlugWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
