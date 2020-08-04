structure GtkMenu :>
  GTK_MENU
    where type 'a class = 'a GtkMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_menu_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_menu_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromModel_ = _import "gtk_menu_new_from_model" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val attach_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_menu_attach" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val detach_ = _import "gtk_menu_detach" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> unit;
    val getAccelGroup_ = _import "gtk_menu_get_accel_group" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p;
    val getAccelPath_ = _import "gtk_menu_get_accel_path" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getActive_ = _import "gtk_menu_get_active" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAttachWidget_ = _import "gtk_menu_get_attach_widget" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getMonitor_ = _import "gtk_menu_get_monitor" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GInt.FFI.val_;
    val getReserveToggleSize_ = _import "gtk_menu_get_reserve_toggle_size" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GBool.FFI.val_;
    val getTearoffState_ = _import "gtk_menu_get_tearoff_state" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> GBool.FFI.val_;
    val getTitle_ = _import "gtk_menu_get_title" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val placeOnMonitor_ = fn x1 & x2 => (_import "gtk_menu_place_on_monitor" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p -> unit;) (x1, x2)
    val popdown_ = _import "gtk_menu_popdown" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> unit;
    val popupAtPointer_ = fn x1 & x2 => (_import "gtk_menu_popup_at_pointer" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GdkEvent.FFI.opt GdkEvent.FFI.p -> unit;) (x1, x2)
    val popupAtRect_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_menu_popup_at_rect" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkGravity.FFI.val_
               * GdkGravity.FFI.val_
               * GdkEvent.FFI.opt GdkEvent.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val popupAtWidget_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_menu_popup_at_widget" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkGravity.FFI.val_
               * GdkGravity.FFI.val_
               * GdkEvent.FFI.opt GdkEvent.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_menu_reorder_child" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reposition_ = _import "gtk_menu_reposition" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p -> unit;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_menu_set_accel_group" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GtkAccelGroupClass.FFI.opt GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_accel_path" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActive_ = fn x1 & x2 => (_import "gtk_menu_set_active" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setMonitor_ = fn x1 & x2 => (_import "gtk_menu_set_monitor" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setReserveToggleSize_ = fn x1 & x2 => (_import "gtk_menu_set_reserve_toggle_size" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_menu_set_screen" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GdkScreenClass.FFI.opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setTearoffState_ = fn x1 & x2 => (_import "gtk_menu_set_tearoff_state" : GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_title" :
              GtkMenuClass.FFI.non_opt GtkMenuClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkMenuClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type scroll_type_t = GtkScrollType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.FFI.fromPtr false) new_ ()
    fun newFromModel model = (GioMenuModelClass.FFI.withPtr false ---> GtkMenuClass.FFI.fromPtr false) newFromModel_ model
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
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
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
    fun detach self = (GtkMenuClass.FFI.withPtr false ---> I) detach_ self
    fun getAccelGroup self = (GtkMenuClass.FFI.withPtr false ---> GtkAccelGroupClass.FFI.fromPtr false) getAccelGroup_ self
    fun getAccelPath self = (GtkMenuClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getAccelPath_ self
    fun getActive self = (GtkMenuClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getActive_ self
    fun getAttachWidget self = (GtkMenuClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getAttachWidget_ self
    fun getMonitor self = (GtkMenuClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GtkMenuClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GtkMenuClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTearoffState_ self
    fun getTitle self = (GtkMenuClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun placeOnMonitor self monitor = (GtkMenuClass.FFI.withPtr false &&&> GdkMonitorClass.FFI.withPtr false ---> I) placeOnMonitor_ (self & monitor)
    fun popdown self = (GtkMenuClass.FFI.withPtr false ---> I) popdown_ self
    fun popupAtPointer self triggerEvent = (GtkMenuClass.FFI.withPtr false &&&> GdkEvent.FFI.withOptPtr false ---> I) popupAtPointer_ (self & triggerEvent)
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
        GtkMenuClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
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
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkGravity.FFI.withVal
         &&&> GdkGravity.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
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
        GtkMenuClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        reorderChild_
        (
          self
           & child
           & position
        )
    fun reposition self = (GtkMenuClass.FFI.withPtr false ---> I) reposition_ self
    fun setAccelGroup self accelGroup = (GtkMenuClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withOptPtr false ---> I) setAccelGroup_ (self & accelGroup)
    fun setAccelPath self accelPath = (GtkMenuClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GtkMenuClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GtkMenuClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GtkMenuClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GtkMenuClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withOptPtr false ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GtkMenuClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GtkMenuClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
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
          set = fn x => set "accel-group" GtkAccelGroupClass.tOpt x,
          new = fn x => new "accel-group" GtkAccelGroupClass.tOpt x
        }
      val accelPathProp =
        {
          get = fn x => get "accel-path" stringOpt x,
          set = fn x => set "accel-path" stringOpt x,
          new = fn x => new "accel-path" stringOpt x
        }
      val activeProp =
        {
          get = fn x => get "active" int x,
          set = fn x => set "active" int x,
          new = fn x => new "active" int x
        }
      val anchorHintsProp =
        {
          get = fn x => get "anchor-hints" GdkAnchorHints.t x,
          set = fn x => set "anchor-hints" GdkAnchorHints.t x,
          new = fn x => new "anchor-hints" GdkAnchorHints.t x
        }
      val attachWidgetProp =
        {
          get = fn x => get "attach-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "attach-widget" GtkWidgetClass.tOpt x,
          new = fn x => new "attach-widget" GtkWidgetClass.tOpt x
        }
      val menuTypeHintProp =
        {
          get = fn x => get "menu-type-hint" GdkWindowTypeHint.t x,
          set = fn x => set "menu-type-hint" GdkWindowTypeHint.t x,
          new = fn x => new "menu-type-hint" GdkWindowTypeHint.t x
        }
      val monitorProp =
        {
          get = fn x => get "monitor" int x,
          set = fn x => set "monitor" int x,
          new = fn x => new "monitor" int x
        }
      val rectAnchorDxProp =
        {
          get = fn x => get "rect-anchor-dx" int x,
          set = fn x => set "rect-anchor-dx" int x,
          new = fn x => new "rect-anchor-dx" int x
        }
      val rectAnchorDyProp =
        {
          get = fn x => get "rect-anchor-dy" int x,
          set = fn x => set "rect-anchor-dy" int x,
          new = fn x => new "rect-anchor-dy" int x
        }
      val reserveToggleSizeProp =
        {
          get = fn x => get "reserve-toggle-size" boolean x,
          set = fn x => set "reserve-toggle-size" boolean x,
          new = fn x => new "reserve-toggle-size" boolean x
        }
      val tearoffStateProp =
        {
          get = fn x => get "tearoff-state" boolean x,
          set = fn x => set "tearoff-state" boolean x,
          new = fn x => new "tearoff-state" boolean x
        }
      val tearoffTitleProp =
        {
          get = fn x => get "tearoff-title" stringOpt x,
          set = fn x => set "tearoff-title" stringOpt x,
          new = fn x => new "tearoff-title" stringOpt x
        }
    end
  end
