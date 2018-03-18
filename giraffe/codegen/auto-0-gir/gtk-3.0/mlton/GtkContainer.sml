structure GtkContainer :>
  GTK_CONTAINER
    where type 'a class = 'a GtkContainerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type widget_path_t = GtkWidgetPathRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type resize_mode_t = GtkResizeMode.t =
  struct
    val getType_ = _import "gtk_container_get_type" : unit -> GObjectType.FFI.val_;
    val add_ = fn x1 & x2 => (_import "gtk_container_add" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val checkResize_ = _import "gtk_container_check_resize" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit;
    val childGetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_get_property" :
              GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val childNotify_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_container_child_notify" :
              GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val childNotifyByPspec_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_container_child_notify_by_pspec" :
              GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GObjectParamSpecClass.FFI.notnull GObjectParamSpecClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val childSetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_set_property" :
              GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val childType_ = _import "gtk_container_child_type" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> GObjectType.FFI.val_;
    val getBorderWidth_ = _import "gtk_container_get_border_width" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> GUInt.FFI.val_;
    val getFocusChild_ = _import "gtk_container_get_focus_child" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit GtkWidgetClass.FFI.p;
    val getFocusHadjustment_ = _import "gtk_container_get_focus_hadjustment" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit GtkAdjustmentClass.FFI.p;
    val getFocusVadjustment_ = _import "gtk_container_get_focus_vadjustment" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit GtkAdjustmentClass.FFI.p;
    val getPathForChild_ = fn x1 & x2 => (_import "gtk_container_get_path_for_child" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p;) (x1, x2)
    val getResizeMode_ = _import "gtk_container_get_resize_mode" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> GtkResizeMode.FFI.val_;
    val propagateDraw_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_container_propagate_draw" :
              GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_container_remove" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val resizeChildren_ = _import "gtk_container_resize_children" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit;
    val setBorderWidth_ = fn x1 & x2 => (_import "gtk_container_set_border_width" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setFocusChild_ = fn x1 & x2 => (_import "gtk_container_set_focus_child" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setFocusHadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_hadjustment" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setFocusVadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_vadjustment" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkAdjustmentClass.FFI.notnull GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setReallocateRedraws_ = fn x1 & x2 => (_import "gtk_container_set_reallocate_redraws" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setResizeMode_ = fn x1 & x2 => (_import "gtk_container_set_resize_mode" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p * GtkResizeMode.FFI.val_ -> unit;) (x1, x2)
    val unsetFocusChain_ = _import "gtk_container_unset_focus_chain" : GtkContainerClass.FFI.notnull GtkContainerClass.FFI.p -> unit;
    type 'a class = 'a GtkContainerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type widget_path_t = GtkWidgetPathRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type resize_mode_t = GtkResizeMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun add self widget = (GtkContainerClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) add_ (self & widget)
    fun checkResize self = (GtkContainerClass.FFI.withPtr ---> I) checkResize_ self
    fun childGetProperty
      self
      (
        child,
        propertyName,
        value
      ) =
      (
        GtkContainerClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        childGetProperty_
        (
          self
           & child
           & propertyName
           & value
        )
    fun childNotify self (child, childProperty) =
      (
        GtkContainerClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        childNotify_
        (
          self
           & child
           & childProperty
        )
    fun childNotifyByPspec self (child, pspec) =
      (
        GtkContainerClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GObjectParamSpecClass.FFI.withPtr
         ---> I
      )
        childNotifyByPspec_
        (
          self
           & child
           & pspec
        )
    fun childSetProperty
      self
      (
        child,
        propertyName,
        value
      ) =
      (
        GtkContainerClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        childSetProperty_
        (
          self
           & child
           & propertyName
           & value
        )
    fun childType self = (GtkContainerClass.FFI.withPtr ---> GObjectType.FFI.fromVal) childType_ self
    fun getBorderWidth self = (GtkContainerClass.FFI.withPtr ---> GUInt.FFI.fromVal) getBorderWidth_ self
    fun getFocusChild self = (GtkContainerClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getFocusChild_ self
    fun getFocusHadjustment self = (GtkContainerClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromOptPtr false) getFocusHadjustment_ self
    fun getFocusVadjustment self = (GtkContainerClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromOptPtr false) getFocusVadjustment_ self
    fun getPathForChild self child = (GtkContainerClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkWidgetPathRecord.FFI.fromPtr true) getPathForChild_ (self & child)
    fun getResizeMode self = (GtkContainerClass.FFI.withPtr ---> GtkResizeMode.FFI.fromVal) getResizeMode_ self
    fun propagateDraw self (child, cr) =
      (
        GtkContainerClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         ---> I
      )
        propagateDraw_
        (
          self
           & child
           & cr
        )
    fun remove self widget = (GtkContainerClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) remove_ (self & widget)
    fun resizeChildren self = (GtkContainerClass.FFI.withPtr ---> I) resizeChildren_ self
    fun setBorderWidth self borderWidth = (GtkContainerClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setBorderWidth_ (self & borderWidth)
    fun setFocusChild self child = (GtkContainerClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setFocusChild_ (self & child)
    fun setFocusHadjustment self adjustment = (GtkContainerClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setFocusHadjustment_ (self & adjustment)
    fun setFocusVadjustment self adjustment = (GtkContainerClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setFocusVadjustment_ (self & adjustment)
    fun setReallocateRedraws self needsRedraws = (GtkContainerClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReallocateRedraws_ (self & needsRedraws)
    fun setResizeMode self resizeMode = (GtkContainerClass.FFI.withPtr &&&> GtkResizeMode.FFI.withVal ---> I) setResizeMode_ (self & resizeMode)
    fun unsetFocusChain self = (GtkContainerClass.FFI.withPtr ---> I) unsetFocusChain_ self
    local
      open ClosureMarshal Signal
    in
      fun addSig f = signal "add" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun checkResizeSig f = signal "check-resize" (void ---> ret_void) f
      fun removeSig f = signal "remove" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun setFocusChildSig f = signal "set-focus-child" (get 0w1 GtkWidgetClass.tOpt ---> ret_void) f
    end
    local
      open Property
    in
      val borderWidthProp =
        {
          get = fn x => get "border-width" uint x,
          set = fn x => set "border-width" uint x,
          new = fn x => new "border-width" uint x
        }
      val childProp =
        {
          set = fn x => set "child" GtkWidgetClass.tOpt x,
          new = fn x => new "child" GtkWidgetClass.tOpt x
        }
      val resizeModeProp =
        {
          get = fn x => get "resize-mode" GtkResizeMode.t x,
          set = fn x => set "resize-mode" GtkResizeMode.t x,
          new = fn x => new "resize-mode" GtkResizeMode.t x
        }
    end
  end
