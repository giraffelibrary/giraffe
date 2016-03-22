structure GtkMenu :>
  GTK_MENU
    where type 'a class = 'a GtkMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_menu_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val attach_ =
        call (load_sym libgtk "gtk_menu_attach")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val detach_ = call (load_sym libgtk "gtk_menu_detach") (GtkMenuClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAccelGroup_ = call (load_sym libgtk "gtk_menu_get_accel_group") (GtkMenuClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAccelPath_ = call (load_sym libgtk "gtk_menu_get_accel_path") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getActive_ = call (load_sym libgtk "gtk_menu_get_active") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAttachWidget_ = call (load_sym libgtk "gtk_menu_get_attach_widget") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMonitor_ = call (load_sym libgtk "gtk_menu_get_monitor") (GtkMenuClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getReserveToggleSize_ = call (load_sym libgtk "gtk_menu_get_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTearoffState_ = call (load_sym libgtk "gtk_menu_get_tearoff_state") (GtkMenuClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_menu_get_title") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val popdown_ = call (load_sym libgtk "gtk_menu_popdown") (GtkMenuClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val reorderChild_ =
        call (load_sym libgtk "gtk_menu_reorder_child")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val reposition_ = call (load_sym libgtk "gtk_menu_reposition") (GtkMenuClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAccelGroup_ = call (load_sym libgtk "gtk_menu_set_accel_group") (GtkMenuClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setAccelPath_ = call (load_sym libgtk "gtk_menu_set_accel_path") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setActive_ = call (load_sym libgtk "gtk_menu_set_active") (GtkMenuClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMonitor_ = call (load_sym libgtk "gtk_menu_set_monitor") (GtkMenuClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setReserveToggleSize_ = call (load_sym libgtk "gtk_menu_set_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_menu_set_screen") (GtkMenuClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setTearoffState_ = call (load_sym libgtk "gtk_menu_set_tearoff_state") (GtkMenuClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_menu_set_title") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkMenuClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.C.fromPtr false) new_ ()
    fun attach self child leftAttach rightAttach topAttach bottomAttach =
      (
        GtkMenuClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        attach_
        (
          self
           & child
           & leftAttach
           & rightAttach
           & topAttach
           & bottomAttach
        )
    fun detach self = (GtkMenuClass.C.withPtr ---> I) detach_ self
    fun getAccelGroup self = (GtkMenuClass.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) getAccelGroup_ self
    fun getAccelPath self = (GtkMenuClass.C.withPtr ---> Utf8.C.fromPtr false) getAccelPath_ self
    fun getActive self = (GtkMenuClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActive_ self
    fun getAttachWidget self = (GtkMenuClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getAttachWidget_ self
    fun getMonitor self = (GtkMenuClass.C.withPtr ---> FFI.Int32.C.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GtkMenuClass.C.withPtr ---> FFI.Bool.C.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GtkMenuClass.C.withPtr ---> FFI.Bool.C.fromVal) getTearoffState_ self
    fun getTitle self = (GtkMenuClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun popdown self = (GtkMenuClass.C.withPtr ---> I) popdown_ self
    fun reorderChild self child position =
      (
        GtkMenuClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun reposition self = (GtkMenuClass.C.withPtr ---> I) reposition_ self
    fun setAccelGroup self accelGroup = (GtkMenuClass.C.withPtr &&&> GtkAccelGroupClass.C.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkMenuClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GtkMenuClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GtkMenuClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GtkMenuClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GtkMenuClass.C.withPtr &&&> GdkScreenClass.C.withOptPtr ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GtkMenuClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GtkMenuClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    local
      open ClosureMarshal Signal
    in
      fun moveScrollSig f = signal "move-scroll" (get 0w1 GtkScrollType.t ---> ret_void) f
    end
    local
      open Property
    in
      val accelGroupProp =
        {
          get = fn x => get "accel-group" GtkAccelGroupClass.tOpt x,
          set = fn x => set "accel-group" GtkAccelGroupClass.tOpt x
        }
      val accelPathProp =
        {
          get = fn x => get "accel-path" stringOpt x,
          set = fn x => set "accel-path" stringOpt x
        }
      val activeProp =
        {
          get = fn x => get "active" int x,
          set = fn x => set "active" int x
        }
      val attachWidgetProp =
        {
          get = fn x => get "attach-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "attach-widget" GtkWidgetClass.tOpt x
        }
      val monitorProp =
        {
          get = fn x => get "monitor" int x,
          set = fn x => set "monitor" int x
        }
      val reserveToggleSizeProp =
        {
          get = fn x => get "reserve-toggle-size" boolean x,
          set = fn x => set "reserve-toggle-size" boolean x
        }
      val tearoffStateProp =
        {
          get = fn x => get "tearoff-state" boolean x,
          set = fn x => set "tearoff-state" boolean x
        }
      val tearoffTitleProp =
        {
          get = fn x => get "tearoff-title" stringOpt x,
          set = fn x => set "tearoff-title" stringOpt x
        }
    end
  end
