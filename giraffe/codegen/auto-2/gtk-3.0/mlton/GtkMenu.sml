structure GtkMenu :>
  GTK_MENU
    where type 'a class_t = 'a GtkMenuClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type scrolltype_t = GtkScrollType.t
    where type 'a accelgroupclass_t = 'a GtkAccelGroupClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_menu_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_menu_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Word32.val_
               * FFI.Word32.val_
               * FFI.Word32.val_
               * FFI.Word32.val_
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
    val detach_ = _import "gtk_menu_detach" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAccelGroup_ = _import "gtk_menu_get_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAccelPath_ = _import "gtk_menu_get_accel_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getActive_ = _import "gtk_menu_get_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAttachWidget_ = _import "gtk_menu_get_attach_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getMonitor_ = _import "gtk_menu_get_monitor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getReserveToggleSize_ = _import "gtk_menu_get_reserve_toggle_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getTearoffState_ = _import "gtk_menu_get_tearoff_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getTitle_ = _import "gtk_menu_get_title" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val popdown_ = _import "gtk_menu_popdown" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val reorderChild_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_menu_reorder_child" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val reposition_ = _import "gtk_menu_reposition" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_menu_set_accel_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_accel_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setActive_ = fn x1 & x2 => (_import "gtk_menu_set_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Word32.val_ -> unit;) (x1, x2)
    val setMonitor_ = fn x1 & x2 => (_import "gtk_menu_set_monitor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val setReserveToggleSize_ = fn x1 & x2 => (_import "gtk_menu_set_reserve_toggle_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_menu_set_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setTearoffState_ = fn x1 & x2 => (_import "gtk_menu_set_tearoff_state" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_set_title" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
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
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
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
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getAccelPath_ self
    fun getActive self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getActive_ self
    fun getAttachWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getAttachWidget_ self
    fun getMonitor self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMonitor_ self
    fun getReserveToggleSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getReserveToggleSize_ self
    fun getTearoffState self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getTearoffState_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getTitle_ self
    fun popdown self = (GObjectObjectClass.C.withPtr ---> I) popdown_ self
    fun reorderChild self child position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
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
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setActive self index = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) setActive_ (self & index)
    fun setMonitor self monitorNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setMonitor_ (self & monitorNum)
    fun setReserveToggleSize self reserveToggleSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setReserveToggleSize_ (self & reserveToggleSize)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setScreen_ (self & screen)
    fun setTearoffState self tornOff = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setTearoffState_ (self & tornOff)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setTitle_ (self & title)
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
