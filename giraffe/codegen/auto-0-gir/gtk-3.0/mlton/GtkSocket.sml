structure GtkSocket :>
  GTK_SOCKET
    where type 'a class_t = 'a GtkSocketClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_socket_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_socket_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addId_ = fn x1 & x2 => (_import "gtk_socket_add_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * XlibWindow.C.val_ -> unit;) (x1, x2)
    val getId_ = _import "gtk_socket_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> XlibWindow.C.val_;
    val getPlugWindow_ = _import "gtk_socket_get_plug_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkSocketClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.C.fromPtr false) new_ ()
    fun addId self window = (GObjectObjectClass.C.withPtr &&&> XlibWindow.C.withVal ---> I) addId_ (self & window)
    fun getId self = (GObjectObjectClass.C.withPtr ---> XlibWindow.C.fromVal) getId_ self
    fun getPlugWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getPlugWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
