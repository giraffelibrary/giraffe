structure GtkPlug :>
  GTK_PLUG
    where type 'a class = 'a GtkPlugClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_plug_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_plug_new") (XlibWindow.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val newForDisplay_ = call (getSymbol "gtk_plug_new_for_display") (GdkDisplayClass.PolyML.cPtr &&> XlibWindow.PolyML.cVal --> GtkWidgetClass.PolyML.cPtr)
      val construct_ = call (getSymbol "gtk_plug_construct") (GtkPlugClass.PolyML.cPtr &&> XlibWindow.PolyML.cVal --> cVoid)
      val constructForDisplay_ =
        call (getSymbol "gtk_plug_construct_for_display")
          (
            GtkPlugClass.PolyML.cPtr
             &&> GdkDisplayClass.PolyML.cPtr
             &&> XlibWindow.PolyML.cVal
             --> cVoid
          )
      val getEmbedded_ = call (getSymbol "gtk_plug_get_embedded") (GtkPlugClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getId_ = call (getSymbol "gtk_plug_get_id") (GtkPlugClass.PolyML.cPtr --> XlibWindow.PolyML.cVal)
      val getSocketWindow_ = call (getSymbol "gtk_plug_get_socket_window") (GtkPlugClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
    end
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
