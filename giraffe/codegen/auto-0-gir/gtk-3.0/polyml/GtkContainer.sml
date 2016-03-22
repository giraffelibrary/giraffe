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
      val getType_ = call (load_sym libgtk "gtk_container_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val add_ = call (load_sym libgtk "gtk_container_add") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val checkResize_ = call (load_sym libgtk "gtk_container_check_resize") (GtkContainerClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val childGetProperty_ =
        call (load_sym libgtk "gtk_container_child_get_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val childNotify_ =
        call (load_sym libgtk "gtk_container_child_notify")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val childSetProperty_ =
        call (load_sym libgtk "gtk_container_child_set_property")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getBorderWidth_ = call (load_sym libgtk "gtk_container_get_border_width") (GtkContainerClass.PolyML.cPtr --> FFI.UInt.PolyML.cVal)
      val getFocusChild_ = call (load_sym libgtk "gtk_container_get_focus_child") (GtkContainerClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getFocusHadjustment_ = call (load_sym libgtk "gtk_container_get_focus_hadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getFocusVadjustment_ = call (load_sym libgtk "gtk_container_get_focus_vadjustment") (GtkContainerClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getPathForChild_ = call (load_sym libgtk "gtk_container_get_path_for_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getResizeMode_ = call (load_sym libgtk "gtk_container_get_resize_mode") (GtkContainerClass.PolyML.cPtr --> GtkResizeMode.PolyML.cVal)
      val propagateDraw_ =
        call (load_sym libgtk "gtk_container_propagate_draw")
          (
            GtkContainerClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val remove_ = call (load_sym libgtk "gtk_container_remove") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val resizeChildren_ = call (load_sym libgtk "gtk_container_resize_children") (GtkContainerClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setBorderWidth_ = call (load_sym libgtk "gtk_container_set_border_width") (GtkContainerClass.PolyML.cPtr &&> FFI.UInt.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocusChild_ = call (load_sym libgtk "gtk_container_set_focus_child") (GtkContainerClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setFocusHadjustment_ = call (load_sym libgtk "gtk_container_set_focus_hadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setFocusVadjustment_ = call (load_sym libgtk "gtk_container_set_focus_vadjustment") (GtkContainerClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setReallocateRedraws_ = call (load_sym libgtk "gtk_container_set_reallocate_redraws") (GtkContainerClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setResizeMode_ = call (load_sym libgtk "gtk_container_set_resize_mode") (GtkContainerClass.PolyML.cPtr &&> GtkResizeMode.PolyML.cVal --> FFI.PolyML.cVoid)
      val unsetFocusChain_ = call (load_sym libgtk "gtk_container_unset_focus_chain") (GtkContainerClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
    fun getBorderWidth self = (GtkContainerClass.C.withPtr ---> FFI.UInt.C.fromVal) getBorderWidth_ self
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
    fun setBorderWidth self borderWidth = (GtkContainerClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setBorderWidth_ (self & borderWidth)
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
