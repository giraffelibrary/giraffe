structure GtkSocket :>
  GTK_SOCKET
    where type 'a class = 'a GtkSocketClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_socket_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_socket_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val addId_ = fn x1 & x2 => (_import "gtk_socket_add_id" : GtkSocketClass.FFI.notnull GtkSocketClass.FFI.p * GUInt64.FFI.val_ -> unit;) (x1, x2)
    val getId_ = _import "gtk_socket_get_id" : GtkSocketClass.FFI.notnull GtkSocketClass.FFI.p -> GUInt64.FFI.val_;
    val getPlugWindow_ = _import "gtk_socket_get_plug_window" : GtkSocketClass.FFI.notnull GtkSocketClass.FFI.p -> unit GdkWindowClass.FFI.p;
    type 'a class = 'a GtkSocketClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.FFI.fromPtr false) new_ ()
    fun addId self window = (GtkSocketClass.FFI.withPtr &&&> GUInt64.FFI.withVal ---> I) addId_ (self & window)
    fun getId self = (GtkSocketClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getId_ self
    fun getPlugWindow self = (GtkSocketClass.FFI.withPtr ---> GdkWindowClass.FFI.fromOptPtr false) getPlugWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
