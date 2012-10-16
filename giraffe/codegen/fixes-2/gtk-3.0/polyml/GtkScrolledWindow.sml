structure GtkScrolledWindow :>
  GTK_SCROLLED_WINDOW
    where type 'a class_t = 'a GtkScrolledWindowClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type directiontype_t = GtkDirectionType.t
    where type scrolltype_t = GtkScrollType.t
    where type shadowtype_t = GtkShadowType.t
    where type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    where type policytype_t = GtkPolicyType.t
    where type cornertype_t = GtkCornerType.t
    where type ('widget, 'a) styleproperty_readonly = ('widget, 'a) StyleProperty.readonly =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scrolled_window_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_scrolled_window_new") (GObjectObjectClass.PolyML.OPTPTR &&> GObjectObjectClass.PolyML.OPTPTR --> GObjectObjectClass.PolyML.PTR)
      val addWithViewport_ = call (load_sym libgtk "gtk_scrolled_window_add_with_viewport") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getHadjustment_ = call (load_sym libgtk "gtk_scrolled_window_get_hadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHscrollbar_ = call (load_sym libgtk "gtk_scrolled_window_get_hscrollbar") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMinContentHeight_ = call (load_sym libgtk "gtk_scrolled_window_get_min_content_height") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getMinContentWidth_ = call (load_sym libgtk "gtk_scrolled_window_get_min_content_width") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getPlacement_ = call (load_sym libgtk "gtk_scrolled_window_get_placement") (GObjectObjectClass.PolyML.PTR --> GtkCornerType.PolyML.VAL)
      val getPolicy_ =
        call (load_sym libgtk "gtk_scrolled_window_get_policy")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkPolicyType.PolyML.REF
             &&> GtkPolicyType.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getShadowType_ = call (load_sym libgtk "gtk_scrolled_window_get_shadow_type") (GObjectObjectClass.PolyML.PTR --> GtkShadowType.PolyML.VAL)
      val getVadjustment_ = call (load_sym libgtk "gtk_scrolled_window_get_vadjustment") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getVscrollbar_ = call (load_sym libgtk "gtk_scrolled_window_get_vscrollbar") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val setHadjustment_ = call (load_sym libgtk "gtk_scrolled_window_set_hadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setMinContentHeight_ = call (load_sym libgtk "gtk_scrolled_window_set_min_content_height") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setMinContentWidth_ = call (load_sym libgtk "gtk_scrolled_window_set_min_content_width") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setPlacement_ = call (load_sym libgtk "gtk_scrolled_window_set_placement") (GObjectObjectClass.PolyML.PTR &&> GtkCornerType.PolyML.VAL --> FFI.PolyML.VOID)
      val setPolicy_ =
        call (load_sym libgtk "gtk_scrolled_window_set_policy")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkPolicyType.PolyML.VAL
             &&> GtkPolicyType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setShadowType_ = call (load_sym libgtk "gtk_scrolled_window_set_shadow_type") (GObjectObjectClass.PolyML.PTR &&> GtkShadowType.PolyML.VAL --> FFI.PolyML.VOID)
      val setVadjustment_ = call (load_sym libgtk "gtk_scrolled_window_set_vadjustment") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val unsetPlacement_ = call (load_sym libgtk "gtk_scrolled_window_unset_placement") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkScrolledWindowClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type directiontype_t = GtkDirectionType.t
    type scrolltype_t = GtkScrollType.t
    type shadowtype_t = GtkShadowType.t
    type 'a adjustmentclass_t = 'a GtkAdjustmentClass.t
    type policytype_t = GtkPolicyType.t
    type cornertype_t = GtkCornerType.t
    type ('widget, 'a) styleproperty_readonly = ('widget, 'a) StyleProperty.readonly
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GObjectObjectClass.C.withOptPtr &&&> GObjectObjectClass.C.withOptPtr ---> GtkScrolledWindowClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun addWithViewport self child = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addWithViewport_ (self & child)
    fun getHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getHadjustment_ self
    fun getHscrollbar self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getHscrollbar_ self
    fun getMinContentHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMinContentHeight_ self
    fun getMinContentWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getMinContentWidth_ self
    fun getPlacement self = (GObjectObjectClass.C.withPtr ---> GtkCornerType.C.fromVal) getPlacement_ self
    fun getPolicy self =
      let
        val hscrollbarPolicy
         & vscrollbarPolicy
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkPolicyType.C.withRefVal
             &&&> GtkPolicyType.C.withRefVal
             ---> GtkPolicyType.C.fromVal
                   && GtkPolicyType.C.fromVal
                   && I
          )
            getPolicy_
            (
              self
               & GtkPolicyType.null
               & GtkPolicyType.null
            )
      in
        (hscrollbarPolicy, vscrollbarPolicy)
      end
    fun getShadowType self = (GObjectObjectClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getVadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getVadjustment_ self
    fun getVscrollbar self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getVscrollbar_ self
    fun setHadjustment self hadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setMinContentHeight self height = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setMinContentHeight_ (self & height)
    fun setMinContentWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setMinContentWidth_ (self & width)
    fun setPlacement self windowPlacement = (GObjectObjectClass.C.withPtr &&&> GtkCornerType.C.withVal ---> I) setPlacement_ (self & windowPlacement)
    fun setPolicy self hscrollbarPolicy vscrollbarPolicy =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkPolicyType.C.withVal
         &&&> GtkPolicyType.C.withVal
         ---> I
      )
        setPolicy_
        (
          self
           & hscrollbarPolicy
           & vscrollbarPolicy
        )
    fun setShadowType self type' = (GObjectObjectClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self vadjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setVadjustment_ (self & vadjustment)
    fun unsetPlacement self = (GObjectObjectClass.C.withPtr ---> I) unsetPlacement_ self
    local
      open ClosureMarshal Signal
    in
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun scrollChildSig f = signal "scroll-child" (get 0w1 GtkScrollType.t &&&> get 0w2 boolean ---> ret boolean) (fn scroll & horizontal => f scroll horizontal)
    end
    local
      open StyleProperty
    in
      val scrollbarSpacingStyleProp = {get = fn x => get "scrollbar-spacing" int x}
    end
    local
      open Property
    in
      val hadjustmentProp =
        {
          get = fn x => get "hadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "hadjustment" GtkAdjustmentClass.tOpt x
        }
      val hscrollbarPolicyProp =
        {
          get = fn x => get "hscrollbar-policy" GtkPolicyType.t x,
          set = fn x => set "hscrollbar-policy" GtkPolicyType.t x
        }
      val minContentHeightProp =
        {
          get = fn x => get "min-content-height" int x,
          set = fn x => set "min-content-height" int x
        }
      val minContentWidthProp =
        {
          get = fn x => get "min-content-width" int x,
          set = fn x => set "min-content-width" int x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
      val vadjustmentProp =
        {
          get = fn x => get "vadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "vadjustment" GtkAdjustmentClass.tOpt x
        }
      val vscrollbarPolicyProp =
        {
          get = fn x => get "vscrollbar-policy" GtkPolicyType.t x,
          set = fn x => set "vscrollbar-policy" GtkPolicyType.t x
        }
      val windowPlacementProp =
        {
          get = fn x => get "window-placement" GtkCornerType.t x,
          set = fn x => set "window-placement" GtkCornerType.t x
        }
      val windowPlacementSetProp =
        {
          get = fn x => get "window-placement-set" boolean x,
          set = fn x => set "window-placement-set" boolean x
        }
    end
  end
