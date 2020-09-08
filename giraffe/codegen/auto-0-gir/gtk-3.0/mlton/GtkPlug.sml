structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_plug_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_plug_new" : XlibWindow.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newForDisplay_ = fn x1 & x2 => (_import "gtk_plug_new_for_display" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * XlibWindow.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val construct_ = fn x1 & x2 => (_import "gtk_plug_construct" : GtkPlugClass.FFI.non_opt GtkPlugClass.FFI.p * XlibWindow.FFI.val_ -> unit;) (x1, x2)
    val constructForDisplay_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_plug_construct_for_display" :
              GtkPlugClass.FFI.non_opt GtkPlugClass.FFI.p
               * GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * XlibWindow.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEmbedded_ = _import "gtk_plug_get_embedded" : GtkPlugClass.FFI.non_opt GtkPlugClass.FFI.p -> GBool.FFI.val_;
    val getId_ = _import "gtk_plug_get_id" : GtkPlugClass.FFI.non_opt GtkPlugClass.FFI.p -> XlibWindow.FFI.val_;
    val getSocketWindow_ = _import "gtk_plug_get_socket_window" : GtkPlugClass.FFI.non_opt GtkPlugClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    type 'a class = 'a GtkPlugClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new socketId = (XlibWindow.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) new_ socketId
    fun newForDisplay (display, socketId) = (GdkDisplayClass.FFI.withPtr false &&&> XlibWindow.FFI.withVal ---> GtkPlugClass.FFI.fromPtr false) newForDisplay_ (display & socketId)
    fun construct self socketId = (GtkPlugClass.FFI.withPtr false &&&> XlibWindow.FFI.withVal ---> I) construct_ (self & socketId)
    fun constructForDisplay self (display, socketId) =
      (
        GtkPlugClass.FFI.withPtr false
         &&&> GdkDisplayClass.FFI.withPtr false
         &&&> XlibWindow.FFI.withVal
         ---> I
      )
        constructForDisplay_
        (
          self
           & display
           & socketId
        )
    fun getEmbedded self = (GtkPlugClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEmbedded_ self
    fun getId self = (GtkPlugClass.FFI.withPtr false ---> XlibWindow.FFI.fromVal) getId_ self
    fun getSocketWindow self = (GtkPlugClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getSocketWindow_ self
    local
      open ClosureMarshal Signal
    in
      fun embeddedSig f = signal "embedded" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val embeddedProp =
        {
          name = "embedded",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val socketWindowProp =
        {
          name = "socket-window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn x => fn () => C.get GdkWindowClass.tOpt x,
          set = ignore,
          init = ignore
        }
    end
  end
