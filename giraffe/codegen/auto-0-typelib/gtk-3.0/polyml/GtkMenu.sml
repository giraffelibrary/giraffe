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
      val getType_ = call (getSymbol "gtk_menu_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromModel_ = call (getSymbol "gtk_menu_new_from_model") (GioMenuModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val attach_ =
        call (getSymbol "gtk_menu_attach")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val detach_ = call (getSymbol "gtk_menu_detach") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val getAccelGroup_ = call (getSymbol "gtk_menu_get_accel_group") (GtkMenuClass.PolyML.cPtr --> GtkAccelGroupClass.PolyML.cPtr)
      val getAccelPath_ = call (getSymbol "gtk_menu_get_accel_path") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getActive_ = call (getSymbol "gtk_menu_get_active") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAttachWidget_ = call (getSymbol "gtk_menu_get_attach_widget") (GtkMenuClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMonitor_ = call (getSymbol "gtk_menu_get_monitor") (GtkMenuClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getReserveToggleSize_ = call (getSymbol "gtk_menu_get_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTearoffState_ = call (getSymbol "gtk_menu_get_tearoff_state") (GtkMenuClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTitle_ = call (getSymbol "gtk_menu_get_title") (GtkMenuClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val placeOnMonitor_ = call (getSymbol "gtk_menu_place_on_monitor") (GtkMenuClass.PolyML.cPtr &&> GdkMonitorClass.PolyML.cPtr --> cVoid)
      val popdown_ = call (getSymbol "gtk_menu_popdown") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val popupAtPointer_ = call (getSymbol "gtk_menu_popup_at_pointer") (GtkMenuClass.PolyML.cPtr &&> GdkEvent.PolyML.cOptPtr --> cVoid)
      val popupAtRect_ =
        call (getSymbol "gtk_menu_popup_at_rect")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkGravity.PolyML.cVal
             &&> GdkGravity.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             --> cVoid
          )
      val popupAtWidget_ =
        call (getSymbol "gtk_menu_popup_at_widget")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkGravity.PolyML.cVal
             &&> GdkGravity.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             --> cVoid
          )
      val reorderChild_ =
        call (getSymbol "gtk_menu_reorder_child")
          (
            GtkMenuClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val reposition_ = call (getSymbol "gtk_menu_reposition") (GtkMenuClass.PolyML.cPtr --> cVoid)
      val setAccelGroup_ = call (getSymbol "gtk_menu_set_accel_group") (GtkMenuClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> cVoid)
      val setAccelPath_ = call (getSymbol "gtk_menu_set_accel_path") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setActive_ = call (getSymbol "gtk_menu_set_active") (GtkMenuClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setMonitor_ = call (getSymbol "gtk_menu_set_monitor") (GtkMenuClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setReserveToggleSize_ = call (getSymbol "gtk_menu_set_reserve_toggle_size") (GtkMenuClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setScreen_ = call (getSymbol "gtk_menu_set_screen") (GtkMenuClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cOptPtr --> cVoid)
      val setTearoffState_ = call (getSymbol "gtk_menu_set_tearoff_state") (GtkMenuClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTitle_ = call (getSymbol "gtk_menu_set_title") (GtkMenuClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkMenuClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.FFI.fromPtr false) new_ ()
    fun newFromModel model = (GioMenuModelClass.FFI.withPtr ---> GtkMenuClass.FFI.fromPtr false) newFromModel_ model
    fun attach
      self
      (
        child,
        leftAttach,
        rightAttach,
        topAttach,
        bottomAttach
      ) =
      (
        GtkMenuClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
    fun detach self = (GtkMenuClass.FFI.withPtr ---> I) detach_ self
    fun getAccelGroup self = (GtkMenuClass.FFI.withPtr ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self
    fun getAccelPath self = (GtkMenuClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAccelPath_ self
    fun getActive self = (GtkMenuClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getActive_ self
    fun getAttachWidget self = (GtkMenuClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getAttachWidget_ self
    fun getMonitor self = (GtkMenuClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GtkMenuClass.FFI.withPtr ---> GBool.FFI.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GtkMenuClass.FFI.withPtr ---> GBool.FFI.fromVal) getTearoffState_ self
    fun getTitle self = (GtkMenuClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun placeOnMonitor self monitor = (GtkMenuClass.FFI.withPtr &&&> GdkMonitorClass.FFI.withPtr ---> I) placeOnMonitor_ (self & monitor)
    fun popdown self = (GtkMenuClass.FFI.withPtr ---> I) popdown_ self
    fun popupAtPointer self triggerEvent = (GtkMenuClass.FFI.withPtr &&&> GdkEvent.FFI.withOptPtr ---> I) popupAtPointer_ (self & triggerEvent)
    fun popupAtRect
      self
      (
        rectWindow,
        rect,
        rectAnchor,
        menuAnchor,
        triggerEvent
      ) =
      (
        GtkMenuClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr
         ---> I
      )
        popupAtRect_
        (
          self
           & rectWindow
           & rect
           & rectAnchor
           & menuAnchor
           & triggerEvent
        )
    fun popupAtWidget
      self
      (
        widget,
        widgetAnchor,
        menuAnchor,
        triggerEvent
      ) =
      (
        GtkMenuClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr
         ---> I
      )
        popupAtWidget_
        (
          self
           & widget
           & widgetAnchor
           & menuAnchor
           & triggerEvent
        )
    fun reorderChild self (child, position) =
      (
        GtkMenuClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun reposition self = (GtkMenuClass.FFI.withPtr ---> I) reposition_ self
    fun setAccelGroup self accelGroup = (GtkMenuClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withOptPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkMenuClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GtkMenuClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GtkMenuClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GtkMenuClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GtkMenuClass.FFI.withPtr &&&> GdkScreenClass.FFI.withOptPtr ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GtkMenuClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GtkMenuClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
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
      val anchorHintsProp =
        {
          get = fn x => get "anchor-hints" GdkAnchorHints.t x,
          set = fn x => set "anchor-hints" GdkAnchorHints.t x
        }
      val attachWidgetProp =
        {
          get = fn x => get "attach-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "attach-widget" GtkWidgetClass.tOpt x
        }
      val menuTypeHintProp =
        {
          get = fn x => get "menu-type-hint" GdkWindowTypeHint.t x,
          set = fn x => set "menu-type-hint" GdkWindowTypeHint.t x
        }
      val monitorProp =
        {
          get = fn x => get "monitor" int x,
          set = fn x => set "monitor" int x
        }
      val rectAnchorDxProp =
        {
          get = fn x => get "rect-anchor-dx" int x,
          set = fn x => set "rect-anchor-dx" int x
        }
      val rectAnchorDyProp =
        {
          get = fn x => get "rect-anchor-dy" int x,
          set = fn x => set "rect-anchor-dy" int x
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
