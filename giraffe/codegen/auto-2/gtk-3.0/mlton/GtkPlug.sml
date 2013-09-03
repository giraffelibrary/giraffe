structure GtkPlug :>
  GTK_PLUG
    where type 'a class_t = 'a GtkPlugClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_plug_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_plug_new" : FFI.UInt64.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gtk_plug_new_for_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt64.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val construct_ = fn x1 & x2 => (_import "gtk_plug_construct" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt64.val_ -> unit;) (x1, x2)
    val constructForDisplay_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_plug_construct_for_display" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt64.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEmbedded_ = _import "gtk_plug_get_embedded" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getId_ = _import "gtk_plug_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt64.val_;
    val getSocketWindow_ = _import "gtk_plug_get_socket_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GtkPlugClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new socketId = (FFI.UInt64.withVal ---> GtkPlugClass.C.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.withVal ---> GtkPlugClass.C.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt64.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt64.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getEmbedded_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.fromVal) getId_ self
    fun getSocketWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSocketWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun embeddedSig f = signal "embedded" (void ---> ret_void) f
    end
    local
      open Property
    in
      val embeddedProp = {get = fn x => get "embedded" boolean x}
      val socketWindowProp = {get = fn x => get "socket-window" GdkWindowClass.tOpt x}
    end
  end
