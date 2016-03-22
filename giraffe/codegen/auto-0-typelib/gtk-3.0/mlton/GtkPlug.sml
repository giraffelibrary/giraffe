structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_plug_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_plug_new" : FFI.UInt64.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gtk_plug_new_for_display" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * FFI.UInt64.C.val_ -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val construct_ = fn x1 & x2 => (_import "gtk_plug_construct" : GtkPlugClass.C.notnull GtkPlugClass.C.p * FFI.UInt64.C.val_ -> unit;) (x1, x2)
    val constructForDisplay_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_plug_construct_for_display" :
              GtkPlugClass.C.notnull GtkPlugClass.C.p
               * GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * FFI.UInt64.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEmbedded_ = _import "gtk_plug_get_embedded" : GtkPlugClass.C.notnull GtkPlugClass.C.p -> FFI.Bool.C.val_;
    val getId_ = _import "gtk_plug_get_id" : GtkPlugClass.C.notnull GtkPlugClass.C.p -> FFI.UInt64.C.val_;
    val getSocketWindow_ = _import "gtk_plug_get_socket_window" : GtkPlugClass.C.notnull GtkPlugClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    type 'a class = 'a GtkPlugClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new socketId = (FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GdkDisplayClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> GtkPlugClass.C.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GtkPlugClass.C.withPtr &&&> FFI.UInt64.C.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GtkPlugClass.C.withPtr
         &&&> GdkDisplayClass.C.withPtr
         &&&> FFI.UInt64.C.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GtkPlugClass.C.withPtr ---> FFI.Bool.C.fromVal) getEmbedded_ self
    fun getId self = (GtkPlugClass.C.withPtr ---> FFI.UInt64.C.fromVal) getId_ self
    fun getSocketWindow self = (GtkPlugClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getSocketWindow_ self
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
