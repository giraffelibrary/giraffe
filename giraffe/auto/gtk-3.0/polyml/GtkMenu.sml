structure GtkMenu :>
  GTK_MENU
    where type 'a class_t = 'a GtkMenuClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type scrolltype_t = GtkScrollType.t
    where type 'a accelgroupclass_t = 'a GtkAccelGroupClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_menu_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val attach_ =
        call (load_sym libgtk "gtk_menu_attach")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val detach_ = call (load_sym libgtk "gtk_menu_detach") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAccelGroup_ = call (load_sym libgtk "gtk_menu_get_accel_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAccelPath_ = call (load_sym libgtk "gtk_menu_get_accel_path") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getActive_ = call (load_sym libgtk "gtk_menu_get_active") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAttachWidget_ = call (load_sym libgtk "gtk_menu_get_attach_widget") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMonitor_ = call (load_sym libgtk "gtk_menu_get_monitor") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getReserveToggleSize_ = call (load_sym libgtk "gtk_menu_get_reserve_toggle_size") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTearoffState_ = call (load_sym libgtk "gtk_menu_get_tearoff_state") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTitle_ = call (load_sym libgtk "gtk_menu_get_title") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val popdown_ = call (load_sym libgtk "gtk_menu_popdown") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val reorderChild_ =
        call (load_sym libgtk "gtk_menu_reorder_child")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val reposition_ = call (load_sym libgtk "gtk_menu_reposition") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setAccelGroup_ = call (load_sym libgtk "gtk_menu_set_accel_group") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setAccelPath_ = call (load_sym libgtk "gtk_menu_set_accel_path") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INOPTPTR --> FFI.PolyML.VOID)
      val setActive_ = call (load_sym libgtk "gtk_menu_set_active") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setMonitor_ = call (load_sym libgtk "gtk_menu_set_monitor") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> FFI.PolyML.VOID)
      val setReserveToggleSize_ = call (load_sym libgtk "gtk_menu_set_reserve_toggle_size") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgtk "gtk_menu_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setTearoffState_ = call (load_sym libgtk "gtk_menu_set_tearoff_state") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTitle_ = call (load_sym libgtk "gtk_menu_set_title") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkMenuClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type scrolltype_t = GtkScrollType.t
    type 'a accelgroupclass_t = 'a GtkAccelGroupClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.C.fromPtr false) new_ ()
    fun attach self child leftAttach rightAttach topAttach bottomAttach =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun detach self = (GObjectObjectClass.C.withPtr ---> I) detach_ self
    fun getAccelGroup self = (GObjectObjectClass.C.withPtr ---> GtkAccelGroupClass.C.fromPtr false) getAccelGroup_ self
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getAccelPath_ self
    fun getActive self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActive_ self
    fun getAttachWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getAttachWidget_ self
    fun getMonitor self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTearoffState_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getTitle_ self
    fun popdown self = (GObjectObjectClass.C.withPtr ---> I) popdown_ self
    fun reorderChild self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun reposition self = (GObjectObjectClass.C.withPtr ---> I) reposition_ self
    fun setAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setTitle_ (self & title)
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
