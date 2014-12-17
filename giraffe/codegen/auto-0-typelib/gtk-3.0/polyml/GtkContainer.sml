structure GtkContainer :>
  GTK_CONTAINER
    where type 'a class_t = 'a GtkContainerClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type widgetpathrecord_t = GtkWidgetPathRecord.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type resizemode_t = GtkResizeMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_container_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val add_ = call (load_sym libgtk "gtk_container_add") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val checkResize_ = call (load_sym libgtk "gtk_container_check_resize") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val childGetProperty_ =
        call (load_sym libgtk "gtk_container_child_get_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val childNotify_ =
        call (load_sym libgtk "gtk_container_child_notify")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val childSetProperty_ =
        call (load_sym libgtk "gtk_container_child_set_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBorderWidth_ = call (load_sym libgtk "gtk_container_get_border_width") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getFocusChild_ = call (load_sym libgtk "gtk_container_get_focus_child") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.OPTPTR)
      val getFocusHadjustment_ = call (load_sym libgtk "gtk_container_get_focus_hadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFocusVadjustment_ = call (load_sym libgtk "gtk_container_get_focus_vadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPathForChild_ = call (load_sym libgtk "gtk_container_get_path_for_child") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> GtkWidgetPathRecord.PolyML.PTR)
      val getResizeMode_ = call (load_sym libgtk "gtk_container_get_resize_mode") (GObjectObjectClass.PolyML.PTR --> GtkResizeMode.PolyML.VAL)
      val propagateDraw_ =
        call (load_sym libgtk "gtk_container_propagate_draw")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> CairoContextRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val remove_ = call (load_sym libgtk "gtk_container_remove") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val resizeChildren_ = call (load_sym libgtk "gtk_container_resize_children") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setBorderWidth_ = call (load_sym libgtk "gtk_container_set_border_width") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setFocusChild_ = call (load_sym libgtk "gtk_container_set_focus_child") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setFocusHadjustment_ = call (load_sym libgtk "gtk_container_set_focus_hadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setFocusVadjustment_ = call (load_sym libgtk "gtk_container_set_focus_vadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setReallocateRedraws_ = call (load_sym libgtk "gtk_container_set_reallocate_redraws") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setResizeMode_ = call (load_sym libgtk "gtk_container_set_resize_mode") (GObjectObjectClass.PolyML.PTR &&> GtkResizeMode.PolyML.VAL --> FFI.PolyML.VOID)
      val unsetFocusChain_ = call (load_sym libgtk "gtk_container_unset_focus_chain") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkContainerClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type widgetpathrecord_t = GtkWidgetPathRecord.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type resizemode_t = GtkResizeMode.t
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
