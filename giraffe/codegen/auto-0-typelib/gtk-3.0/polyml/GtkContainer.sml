structure GtkContainer :>
  GTK_CONTAINER
    where type 'a class = 'a GtkContainerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type widget_path_t = GtkWidgetPathRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type resize_mode_t = GtkResizeMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_container_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val add_ = call (getSymbol "gtk_container_add") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val checkResize_ = call (getSymbol "gtk_container_check_resize") (GtkContainerClass.PolyML.cPtr --> cVoid)
      val childGetProperty_ =
        call (getSymbol "gtk_container_child_get_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val childNotify_ =
        call (getSymbol "gtk_container_child_notify")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val childNotifyByPspec_ =
        call (getSymbol "gtk_container_child_notify_by_pspec")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GObjectParamSpecClass.PolyML.cPtr
             --> cVoid
          )
      val childSetProperty_ =
        call (getSymbol "gtk_container_child_set_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val childType_ = call (getSymbol "gtk_container_child_type") (GtkContainerClass.PolyML.cPtr --> GObjectType.PolyML.cVal)
      val getBorderWidth_ = call (getSymbol "gtk_container_get_border_width") (GtkContainerClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getFocusChild_ = call (getSymbol "gtk_container_get_focus_child") (GtkContainerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getFocusHadjustment_ = call (getSymbol "gtk_container_get_focus_hadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cOptPtr)
      val getFocusVadjustment_ = call (getSymbol "gtk_container_get_focus_vadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cOptPtr)
      val getPathForChild_ = call (getSymbol "gtk_container_get_path_for_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getResizeMode_ = call (getSymbol "gtk_container_get_resize_mode") (GtkContainerClass.PolyML.cPtr --> GtkResizeMode.PolyML.cVal)
      val propagateDraw_ =
        call (getSymbol "gtk_container_propagate_draw")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             --> cVoid
          )
      val remove_ = call (getSymbol "gtk_container_remove") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val resizeChildren_ = call (getSymbol "gtk_container_resize_children") (GtkContainerClass.PolyML.cPtr --> cVoid)
      val setBorderWidth_ = call (getSymbol "gtk_container_set_border_width") (GtkContainerClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setFocusChild_ = call (getSymbol "gtk_container_set_focus_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setFocusHadjustment_ = call (getSymbol "gtk_container_set_focus_hadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setFocusVadjustment_ = call (getSymbol "gtk_container_set_focus_vadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setReallocateRedraws_ = call (getSymbol "gtk_container_set_reallocate_redraws") (GtkContainerClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setResizeMode_ = call (getSymbol "gtk_container_set_resize_mode") (GtkContainerClass.PolyML.cPtr &&> GtkResizeMode.PolyML.cVal --> cVoid)
      val unsetFocusChain_ = call (getSymbol "gtk_container_unset_focus_chain") (GtkContainerClass.PolyML.cPtr --> cVoid)
    end
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
    fun getBorderWidth self = (GtkContainerClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getBorderWidth_ self
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
    fun setBorderWidth self borderWidth = (GtkContainerClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setBorderWidth_ (self & borderWidth)
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
