structure GtkContainer :>
  GTK_CONTAINER
    where type 'a class_t = 'a GtkContainerClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type widget_path_record_t = GtkWidgetPathRecord.t
    where type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type resize_mode_t = GtkResizeMode.t =
  struct
    val getType_ = _import "gtk_container_get_type" : unit -> GObjectType.C.val_;
    val add_ = fn x1 & x2 => (_import "gtk_container_add" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val checkResize_ = _import "gtk_container_check_resize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val childGetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_container_child_get_property" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
    val getBorderWidth_ = _import "gtk_container_get_border_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getFocusChild_ = _import "gtk_container_get_focus_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit GObjectObjectClass.C.p;
    val getFocusHadjustment_ = _import "gtk_container_get_focus_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFocusVadjustment_ = _import "gtk_container_get_focus_vadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getPathForChild_ = fn x1 & x2 => (_import "gtk_container_get_path_for_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;) (x1, x2)
    val getResizeMode_ = _import "gtk_container_get_resize_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkResizeMode.C.val_;
    val propagateDraw_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_container_propagate_draw" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_container_remove" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val resizeChildren_ = _import "gtk_container_resize_children" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setBorderWidth_ = fn x1 & x2 => (_import "gtk_container_set_border_width" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setFocusChild_ = fn x1 & x2 => (_import "gtk_container_set_focus_child" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFocusHadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFocusVadjustment_ = fn x1 & x2 => (_import "gtk_container_set_focus_vadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setReallocateRedraws_ = fn x1 & x2 => (_import "gtk_container_set_reallocate_redraws" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setResizeMode_ = fn x1 & x2 => (_import "gtk_container_set_resize_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkResizeMode.C.val_ -> unit;) (x1, x2)
    val unsetFocusChain_ = _import "gtk_container_unset_focus_chain" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkContainerClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type widget_path_record_t = GtkWidgetPathRecord.t
    type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type resize_mode_t = GtkResizeMode.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun add self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) add_ (self & widget)
    fun checkResize self = (GObjectObjectClass.C.withPtr ---> I) checkResize_ self
    fun childGetProperty self child propertyName value =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
    fun getBorderWidth self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getBorderWidth_ self
    fun getFocusChild self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromOptPtr false) getFocusChild_ self
    fun getFocusHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getFocusHadjustment_ self
    fun getFocusVadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getFocusVadjustment_ self
    fun getPathForChild self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr true) getPathForChild_ (self & child)
    fun getResizeMode self = (GObjectObjectClass.C.withPtr ---> GtkResizeMode.C.fromVal) getResizeMode_ self
    fun propagateDraw self child cr =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         ---> I
      )
        propagateDraw_
        (
          self
           & child
           & cr
        )
    fun remove self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) remove_ (self & widget)
    fun resizeChildren self = (GObjectObjectClass.C.withPtr ---> I) resizeChildren_ self
    fun setBorderWidth self borderWidth = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setBorderWidth_ (self & borderWidth)
    fun setFocusChild self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setFocusChild_ (self & child)
    fun setFocusHadjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFocusHadjustment_ (self & adjustment)
    fun setFocusVadjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setFocusVadjustment_ (self & adjustment)
    fun setReallocateRedraws self needsRedraws = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReallocateRedraws_ (self & needsRedraws)
    fun setResizeMode self resizeMode = (GObjectObjectClass.C.withPtr &&&> GtkResizeMode.C.withVal ---> I) setResizeMode_ (self & resizeMode)
    fun unsetFocusChain self = (GObjectObjectClass.C.withPtr ---> I) unsetFocusChain_ self
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
