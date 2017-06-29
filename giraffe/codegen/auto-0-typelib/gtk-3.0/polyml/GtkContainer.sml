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
      val getType_ = call (getSymbol "gtk_container_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val add_ = call (getSymbol "gtk_container_add") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val checkResize_ = call (getSymbol "gtk_container_check_resize") (GtkContainerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val childGetProperty_ =
        call (getSymbol "gtk_container_child_get_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val childNotify_ =
        call (getSymbol "gtk_container_child_notify")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val childSetProperty_ =
        call (getSymbol "gtk_container_child_set_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getBorderWidth_ = call (getSymbol "gtk_container_get_border_width") (GtkContainerClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getFocusChild_ = call (getSymbol "gtk_container_get_focus_child") (GtkContainerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getFocusHadjustment_ = call (getSymbol "gtk_container_get_focus_hadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getFocusVadjustment_ = call (getSymbol "gtk_container_get_focus_vadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getPathForChild_ = call (getSymbol "gtk_container_get_path_for_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getResizeMode_ = call (getSymbol "gtk_container_get_resize_mode") (GtkContainerClass.PolyML.cPtr --> GtkResizeMode.PolyML.cVal)
      val propagateDraw_ =
        call (getSymbol "gtk_container_propagate_draw")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val remove_ = call (getSymbol "gtk_container_remove") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val resizeChildren_ = call (getSymbol "gtk_container_resize_children") (GtkContainerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setBorderWidth_ = call (getSymbol "gtk_container_set_border_width") (GtkContainerClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFocusChild_ = call (getSymbol "gtk_container_set_focus_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setFocusHadjustment_ = call (getSymbol "gtk_container_set_focus_hadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setFocusVadjustment_ = call (getSymbol "gtk_container_set_focus_vadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setReallocateRedraws_ = call (getSymbol "gtk_container_set_reallocate_redraws") (GtkContainerClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setResizeMode_ = call (getSymbol "gtk_container_set_resize_mode") (GtkContainerClass.PolyML.cPtr &&> GtkResizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val unsetFocusChain_ = call (getSymbol "gtk_container_unset_focus_chain") (GtkContainerClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
    fun childGetProperty self child propertyName value =
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
    fun childNotify self child childProperty =
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
    fun childSetProperty self child propertyName value =
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
    fun getBorderWidth self = (GtkContainerClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getBorderWidth_ self
    fun getFocusChild self = (GtkContainerClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getFocusChild_ self
    fun getFocusHadjustment self = (GtkContainerClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getFocusHadjustment_ self
    fun getFocusVadjustment self = (GtkContainerClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getFocusVadjustment_ self
    fun getPathForChild self child = (GtkContainerClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> GtkWidgetPathRecord.FFI.fromPtr true) getPathForChild_ (self & child)
    fun getResizeMode self = (GtkContainerClass.FFI.withPtr ---> GtkResizeMode.FFI.fromVal) getResizeMode_ self
    fun propagateDraw self child cr =
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
    fun setBorderWidth self borderWidth = (GtkContainerClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setBorderWidth_ (self & borderWidth)
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
