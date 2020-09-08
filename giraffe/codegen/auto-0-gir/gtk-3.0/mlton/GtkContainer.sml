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
    val add_ = fn x1 & x2 => (_import "gtk_container_add" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val checkResize_ = _import "gtk_container_check_resize" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> unit;
    val childGetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_get_property" :
              GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
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
              GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GObjectParamSpecClass.FFI.non_opt GObjectParamSpecClass.FFI.p
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
              GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val childType_ = _import "gtk_container_child_type" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GObjectType.FFI.val_;
    val getBorderWidth_ = _import "gtk_container_get_border_width" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GUInt.FFI.val_;
    val getFocusChild_ = _import "gtk_container_get_focus_child" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getFocusHadjustment_ = _import "gtk_container_get_focus_hadjustment" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p;
    val getFocusVadjustment_ = _import "gtk_container_get_focus_vadjustment" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p;
    val getPathForChild_ = fn x1 & x2 => (_import "gtk_container_get_path_for_child" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;) (x1, x2)
    val getResizeMode_ = _import "gtk_container_get_resize_mode" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> GtkResizeMode.FFI.val_;
    val propagateDraw_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_container_propagate_draw" :
              GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_container_remove" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val resizeChildren_ = _import "gtk_container_resize_children" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> unit;
    val setBorderWidth_ = fn x1 & x2 => (_import "gtk_container_set_border_width" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setFocusChild_ = fn x1 & x2 => (_import "gtk_container_set_focus_child" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setFocusHadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_hadjustment" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setFocusVadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_vadjustment" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setReallocateRedraws_ = fn x1 & x2 => (_import "gtk_container_set_reallocate_redraws" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setResizeMode_ = fn x1 & x2 => (_import "gtk_container_set_resize_mode" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p * GtkResizeMode.FFI.val_ -> unit;) (x1, x2)
    val unsetFocusChain_ = _import "gtk_container_unset_focus_chain" : GtkContainerClass.FFI.non_opt GtkContainerClass.FFI.p -> unit;
    type 'a class = 'a GtkContainerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type widget_path_t = GtkWidgetPathRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type resize_mode_t = GtkResizeMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun add self widget = (GtkContainerClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) add_ (self & widget)
    fun checkResize self = (GtkContainerClass.FFI.withPtr false ---> I) checkResize_ self
    fun childGetProperty
      self
      (
        child,
        propertyName,
        value
      ) =
      (
        GtkContainerClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
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
        GtkContainerClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkContainerClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GObjectParamSpecClass.FFI.withPtr false
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
        GtkContainerClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        childSetProperty_
        (
          self
           & child
           & propertyName
           & value
        )
    fun childType self = (GtkContainerClass.FFI.withPtr false ---> GObjectType.FFI.fromVal) childType_ self
    fun getBorderWidth self = (GtkContainerClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getBorderWidth_ self
    fun getFocusChild self = (GtkContainerClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getFocusChild_ self
    fun getFocusHadjustment self = (GtkContainerClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromOptPtr false) getFocusHadjustment_ self
    fun getFocusVadjustment self = (GtkContainerClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromOptPtr false) getFocusVadjustment_ self
    fun getPathForChild self child = (GtkContainerClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GtkWidgetPathRecord.FFI.fromPtr true) getPathForChild_ (self & child)
    fun getResizeMode self = (GtkContainerClass.FFI.withPtr false ---> GtkResizeMode.FFI.fromVal) getResizeMode_ self
    fun propagateDraw self (child, cr) =
      (
        GtkContainerClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> CairoContextRecord.FFI.withPtr false
         ---> I
      )
        propagateDraw_
        (
          self
           & child
           & cr
        )
    fun remove self widget = (GtkContainerClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) remove_ (self & widget)
    fun resizeChildren self = (GtkContainerClass.FFI.withPtr false ---> I) resizeChildren_ self
    fun setBorderWidth self borderWidth = (GtkContainerClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setBorderWidth_ (self & borderWidth)
    fun setFocusChild self child = (GtkContainerClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setFocusChild_ (self & child)
    fun setFocusHadjustment self adjustment = (GtkContainerClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setFocusHadjustment_ (self & adjustment)
    fun setFocusVadjustment self adjustment = (GtkContainerClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withPtr false ---> I) setFocusVadjustment_ (self & adjustment)
    fun setReallocateRedraws self needsRedraws = (GtkContainerClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReallocateRedraws_ (self & needsRedraws)
    fun setResizeMode self resizeMode = (GtkContainerClass.FFI.withPtr false &&&> GtkResizeMode.FFI.withVal ---> I) setResizeMode_ (self & resizeMode)
    fun unsetFocusChain self = (GtkContainerClass.FFI.withPtr false ---> I) unsetFocusChain_ self
    local
      open ClosureMarshal Signal
    in
      fun addSig f = signal "add" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun checkResizeSig f = signal "check-resize" (void ---> ret_void) f
      fun removeSig f = signal "remove" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun setFocusChildSig f = signal "set-focus-child" (get 0w1 GtkWidgetClass.tOpt ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val borderWidthProp =
        {
          name = "border-width",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val childProp =
        {
          name = "child",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val resizeModeProp =
        {
          name = "resize-mode",
          gtype = fn () => C.gtype GtkResizeMode.t (),
          get = fn x => fn () => C.get GtkResizeMode.t x,
          set = fn x => C.set GtkResizeMode.t x,
          init = fn x => C.set GtkResizeMode.t x
        }
    end
  end
