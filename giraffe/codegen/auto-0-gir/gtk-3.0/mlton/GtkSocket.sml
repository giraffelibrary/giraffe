structure GtkSocket :>
  GTK_SOCKET
    where type 'a class = 'a GtkSocketClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_socket_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_socket_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val addId_ = fn x1 & x2 => (_import "gtk_socket_add_id" : GtkSocketClass.C.notnull GtkSocketClass.C.p * XlibWindow.C.val_ -> unit;) (x1, x2)
    val getId_ = _import "gtk_socket_get_id" : GtkSocketClass.C.notnull GtkSocketClass.C.p -> XlibWindow.C.val_;
    val getPlugWindow_ = _import "gtk_socket_get_plug_window" : GtkSocketClass.C.notnull GtkSocketClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    type 'a class = 'a GtkSocketClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkSocketClass.C.fromPtr false) new_ ()
    fun addId self window = (GtkSocketClass.C.withPtr &&&> XlibWindow.C.withVal ---> I) addId_ (self & window)
    fun getId self = (GtkSocketClass.C.withPtr ---> XlibWindow.C.fromVal) getId_ self
    fun getPlugWindow self = (GtkSocketClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getPlugWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun plugAddedSig f = signal "plug-added" (void ---> ret_void) f
      fun plugRemovedSig f = signal "plug-removed" (void ---> ret boolean) f
    end
  end
