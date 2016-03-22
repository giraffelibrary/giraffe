structure GtkContainer :>
  GTK_CONTAINER
    where type 'a class = 'a GtkContainerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type widget_path_t = GtkWidgetPathRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type resize_mode_t = GtkResizeMode.t =
  struct
    val getType_ = _import "gtk_container_get_type" : unit -> GObjectType.C.val_;
    val add_ = fn x1 & x2 => (_import "gtk_container_add" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val checkResize_ = _import "gtk_container_check_resize" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> unit;
    val childGetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_get_property" :
              GtkContainerClass.C.notnull GtkContainerClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
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
              GtkContainerClass.C.notnull GtkContainerClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val childSetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_set_property" :
              GtkContainerClass.C.notnull GtkContainerClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getBorderWidth_ = _import "gtk_container_get_border_width" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> FFI.UInt32.C.val_;
    val getFocusChild_ = _import "gtk_container_get_focus_child" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> unit GtkWidgetClass.C.p;
    val getFocusHadjustment_ = _import "gtk_container_get_focus_hadjustment" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getFocusVadjustment_ = _import "gtk_container_get_focus_vadjustment" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getPathForChild_ = fn x1 & x2 => (_import "gtk_container_get_path_for_child" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;) (x1, x2)
    val getResizeMode_ = _import "gtk_container_get_resize_mode" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> GtkResizeMode.C.val_;
    val propagateDraw_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_container_propagate_draw" :
              GtkContainerClass.C.notnull GtkContainerClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_container_remove" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val resizeChildren_ = _import "gtk_container_resize_children" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> unit;
    val setBorderWidth_ = fn x1 & x2 => (_import "gtk_container_set_border_width" : GtkContainerClass.C.notnull GtkContainerClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setFocusChild_ = fn x1 & x2 => (_import "gtk_container_set_focus_child" : GtkContainerClass.C.notnull GtkContainerClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setFocusHadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_hadjustment" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setFocusVadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_vadjustment" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setReallocateRedraws_ = fn x1 & x2 => (_import "gtk_container_set_reallocate_redraws" : GtkContainerClass.C.notnull GtkContainerClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setResizeMode_ = fn x1 & x2 => (_import "gtk_container_set_resize_mode" : GtkContainerClass.C.notnull GtkContainerClass.C.p * GtkResizeMode.C.val_ -> unit;) (x1, x2)
    val unsetFocusChain_ = _import "gtk_container_unset_focus_chain" : GtkContainerClass.C.notnull GtkContainerClass.C.p -> unit;
    type 'a class = 'a GtkContainerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type widget_path_t = GtkWidgetPathRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type resize_mode_t = GtkResizeMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self widget = (GtkContainerClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) add_ (self & widget)
    fun checkResize self = (GtkContainerClass.C.withPtr ---> I) checkResize_ self
    fun childGetProperty self child propertyName value =
      (
        GtkContainerClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        childGetProperty_
        (
          self
           & child
           & propertyName
           & value
        )
    fun childNotify self child childProperty =
      (
        GtkContainerClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        childNotify_
        (
          self
           & child
           & childProperty
        )
    fun childSetProperty self child propertyName value =
      (
        GtkContainerClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        childSetProperty_
        (
          self
           & child
           & propertyName
           & value
        )
    fun getBorderWidth self = (GtkContainerClass.C.withPtr ---> FFI.UInt32.C.fromVal) getBorderWidth_ self
    fun getFocusChild self = (GtkContainerClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getFocusChild_ self
    fun getFocusHadjustment self = (GtkContainerClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getFocusHadjustment_ self
    fun getFocusVadjustment self = (GtkContainerClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getFocusVadjustment_ self
    fun getPathForChild self child = (GtkContainerClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr true) getPathForChild_ (self & child)
    fun getResizeMode self = (GtkContainerClass.C.withPtr ---> GtkResizeMode.C.fromVal) getResizeMode_ self
    fun propagateDraw self child cr =
      (
        GtkContainerClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         ---> I
      )
        propagateDraw_
        (
          self
           & child
           & cr
        )
    fun remove self widget = (GtkContainerClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) remove_ (self & widget)
    fun resizeChildren self = (GtkContainerClass.C.withPtr ---> I) resizeChildren_ self
    fun setBorderWidth self borderWidth = (GtkContainerClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setBorderWidth_ (self & borderWidth)
    fun setFocusChild self child = (GtkContainerClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setFocusChild_ (self & child)
    fun setFocusHadjustment self adjustment = (GtkContainerClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> I) setFocusHadjustment_ (self & adjustment)
    fun setFocusVadjustment self adjustment = (GtkContainerClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> I) setFocusVadjustment_ (self & adjustment)
    fun setReallocateRedraws self needsRedraws = (GtkContainerClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReallocateRedraws_ (self & needsRedraws)
    fun setResizeMode self resizeMode = (GtkContainerClass.C.withPtr &&&> GtkResizeMode.C.withVal ---> I) setResizeMode_ (self & resizeMode)
    fun unsetFocusChain self = (GtkContainerClass.C.withPtr ---> I) unsetFocusChain_ self
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
          set = fn x => set "border-width" uint x
        }
      val childProp = {set = fn x => set "child" GtkWidgetClass.tOpt x}
      val resizeModeProp =
        {
          get = fn x => get "resize-mode" GtkResizeMode.t x,
          set = fn x => set "resize-mode" GtkResizeMode.t x
        }
    end
  end
