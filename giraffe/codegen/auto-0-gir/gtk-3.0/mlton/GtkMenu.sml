structure GtkMenu :>
  GTK_MENU
    where type 'a class = 'a GtkMenuClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type scroll_type_t = GtkScrollType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_menu_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_menu_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
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
              GtkMenuClass.C.notnull GtkMenuClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
               * FFI.UInt.C.val_
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
    val detach_ = _import "gtk_menu_detach" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> unit;
    val getAccelGroup_ = _import "gtk_menu_get_accel_group" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p;
    val getAccelPath_ = _import "gtk_menu_get_accel_path" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getActive_ = _import "gtk_menu_get_active" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getAttachWidget_ = _import "gtk_menu_get_attach_widget" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getMonitor_ = _import "gtk_menu_get_monitor" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> FFI.Int.C.val_;
    val getReserveToggleSize_ = _import "gtk_menu_get_reserve_toggle_size" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> FFI.Bool.C.val_;
    val getTearoffState_ = _import "gtk_menu_get_tearoff_state" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> FFI.Bool.C.val_;
    val getTitle_ = _import "gtk_menu_get_title" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val popdown_ = _import "gtk_menu_popdown" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> unit;
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_menu_reorder_child" :
              GtkMenuClass.C.notnull GtkMenuClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reposition_ = _import "gtk_menu_reposition" : GtkMenuClass.C.notnull GtkMenuClass.C.p -> unit;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_menu_set_accel_group" : GtkMenuClass.C.notnull GtkMenuClass.C.p * unit GtkAccelGroupClass.C.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_accel_path" :
              GtkMenuClass.C.notnull GtkMenuClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActive_ = fn x1 & x2 => (_import "gtk_menu_set_active" : GtkMenuClass.C.notnull GtkMenuClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setMonitor_ = fn x1 & x2 => (_import "gtk_menu_set_monitor" : GtkMenuClass.C.notnull GtkMenuClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setReserveToggleSize_ = fn x1 & x2 => (_import "gtk_menu_set_reserve_toggle_size" : GtkMenuClass.C.notnull GtkMenuClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_menu_set_screen" : GtkMenuClass.C.notnull GtkMenuClass.C.p * unit GdkScreenClass.C.p -> unit;) (x1, x2)
    val setTearoffState_ = fn x1 & x2 => (_import "gtk_menu_set_tearoff_state" : GtkMenuClass.C.notnull GtkMenuClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_title" :
              GtkMenuClass.C.notnull GtkMenuClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuClass.C.fromPtr false) new_ ()
    fun attach self child leftAttach rightAttach topAttach bottomAttach =
      (
        GtkMenuClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> FFI.UInt.C.withVal
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
    fun getMonitor self = (GtkMenuClass.C.withPtr ---> FFI.Int.C.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GtkMenuClass.C.withPtr ---> FFI.Bool.C.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GtkMenuClass.C.withPtr ---> FFI.Bool.C.fromVal) getTearoffState_ self
    fun getTitle self = (GtkMenuClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun popdown self = (GtkMenuClass.C.withPtr ---> I) popdown_ self
    fun reorderChild self child position =
      (
        GtkMenuClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
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
    fun setActive self index = (GtkMenuClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GtkMenuClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMonitor_ (self & monitorNum)
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
