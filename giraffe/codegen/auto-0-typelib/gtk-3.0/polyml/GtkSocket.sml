structure GtkSocket :>
  GTK_SOCKET
    where type 'a class = 'a GtkSocketClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_socket_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_socket_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addId_ = call (getSymbol "gtk_socket_add_id") (GtkSocketClass.PolyML.cPtr &&> GUInt64.PolyML.cVal --> cVoid)
      val getId_ = call (getSymbol "gtk_socket_get_id") (GtkSocketClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getPlugWindow_ = call (getSymbol "gtk_socket_get_plug_window") (GtkSocketClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
    end
    type 'a class = 'a GtkSocketClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.FFI.fromPtr false) new_ ()
    fun addId self window = (GtkSocketClass.FFI.withPtr false &&&> GUInt64.FFI.withVal ---> I) addId_ (self & window)
    fun getId self = (GtkSocketClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getId_ self
    fun getPlugWindow self = (GtkSocketClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getPlugWindow_ self before GtkSocketClass.FFI.touchPtr self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
