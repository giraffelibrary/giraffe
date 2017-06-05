structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_plug_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_plug_new" : XlibWindow.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gtk_plug_new_for_display" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * XlibWindow.FFI.val_ -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val construct_ = fn x1 & x2 => (_import "gtk_plug_construct" : GtkPlugClass.FFI.notnull GtkPlugClass.FFI.p * XlibWindow.FFI.val_ -> unit;) (x1, x2)
    val constructForDisplay_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_plug_construct_for_display" :
              GtkPlugClass.FFI.notnull GtkPlugClass.FFI.p
               * GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * XlibWindow.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEmbedded_ = _import "gtk_plug_get_embedded" : GtkPlugClass.FFI.notnull GtkPlugClass.FFI.p -> GBool.FFI.val_;
    val getId_ = _import "gtk_plug_get_id" : GtkPlugClass.FFI.notnull GtkPlugClass.FFI.p -> XlibWindow.FFI.val_;
    val getSocketWindow_ = _import "gtk_plug_get_socket_window" : GtkPlugClass.FFI.notnull GtkPlugClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    type 'a class = 'a GtkPlugClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new socketId = (XlibWindow.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) new_ socketId
    fun newForDisplay display socketId = (GdkDisplayClass.FFI.withPtr &&&> XlibWindow.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GtkPlugClass.FFI.withPtr &&&> XlibWindow.FFI.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self display socketId =
      (
        GtkPlugClass.FFI.withPtr
         &&&> GdkDisplayClass.FFI.withPtr
         &&&> XlibWindow.FFI.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GtkPlugClass.FFI.withPtr ---> GBool.FFI.fromVal) getEmbedded_ self
    fun getId self = (GtkPlugClass.FFI.withPtr ---> XlibWindow.FFI.fromVal) getId_ self
    fun getSocketWindow self = (GtkPlugClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getSocketWindow_ self
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
