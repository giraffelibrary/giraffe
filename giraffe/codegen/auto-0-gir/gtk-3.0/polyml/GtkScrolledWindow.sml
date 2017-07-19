structure GtkScrolledWindow :>
  GTK_SCROLLED_WINDOW
    where type 'a class = 'a GtkScrolledWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type direction_type_t = GtkDirectionType.t
    where type scroll_type_t = GtkScrollType.t
    where type shadow_type_t = GtkShadowType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type policy_type_t = GtkPolicyType.t
    where type corner_type_t = GtkCornerType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_scrolled_window_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_scrolled_window_new") (GtkAdjustmentClass.PolyML.cOptPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val addWithViewport_ = call (getSymbol "gtk_scrolled_window_add_with_viewport") (GtkScrolledWindowClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val getHadjustment_ = call (getSymbol "gtk_scrolled_window_get_hadjustment") (GtkScrolledWindowClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getHscrollbar_ = call (getSymbol "gtk_scrolled_window_get_hscrollbar") (GtkScrolledWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getMinContentHeight_ = call (getSymbol "gtk_scrolled_window_get_min_content_height") (GtkScrolledWindowClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMinContentWidth_ = call (getSymbol "gtk_scrolled_window_get_min_content_width") (GtkScrolledWindowClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPlacement_ = call (getSymbol "gtk_scrolled_window_get_placement") (GtkScrolledWindowClass.PolyML.cPtr --> GtkCornerType.PolyML.cVal)
      val getPolicy_ =
        call (getSymbol "gtk_scrolled_window_get_policy")
          (
            GtkScrolledWindowClass.PolyML.cPtr
             &&> GtkPolicyType.PolyML.cRef
             &&> GtkPolicyType.PolyML.cRef
             --> cVoid
          )
      val getShadowType_ = call (getSymbol "gtk_scrolled_window_get_shadow_type") (GtkScrolledWindowClass.PolyML.cPtr --> GtkShadowType.PolyML.cVal)
      val getVadjustment_ = call (getSymbol "gtk_scrolled_window_get_vadjustment") (GtkScrolledWindowClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getVscrollbar_ = call (getSymbol "gtk_scrolled_window_get_vscrollbar") (GtkScrolledWindowClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val setHadjustment_ = call (getSymbol "gtk_scrolled_window_set_hadjustment") (GtkScrolledWindowClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val setMinContentHeight_ = call (getSymbol "gtk_scrolled_window_set_min_content_height") (GtkScrolledWindowClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMinContentWidth_ = call (getSymbol "gtk_scrolled_window_set_min_content_width") (GtkScrolledWindowClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setPlacement_ = call (getSymbol "gtk_scrolled_window_set_placement") (GtkScrolledWindowClass.PolyML.cPtr &&> GtkCornerType.PolyML.cVal --> cVoid)
      val setPolicy_ =
        call (getSymbol "gtk_scrolled_window_set_policy")
          (
            GtkScrolledWindowClass.PolyML.cPtr
             &&> GtkPolicyType.PolyML.cVal
             &&> GtkPolicyType.PolyML.cVal
             --> cVoid
          )
      val setShadowType_ = call (getSymbol "gtk_scrolled_window_set_shadow_type") (GtkScrolledWindowClass.PolyML.cPtr &&> GtkShadowType.PolyML.cVal --> cVoid)
      val setVadjustment_ = call (getSymbol "gtk_scrolled_window_set_vadjustment") (GtkScrolledWindowClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cPtr --> cVoid)
      val unsetPlacement_ = call (getSymbol "gtk_scrolled_window_unset_placement") (GtkScrolledWindowClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkScrolledWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type direction_type_t = GtkDirectionType.t
    type scroll_type_t = GtkScrollType.t
    type shadow_type_t = GtkShadowType.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type policy_type_t = GtkPolicyType.t
    type corner_type_t = GtkCornerType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (hadjustment, vadjustment) = (GtkAdjustmentClass.FFI.withOptPtr &&&> GtkAdjustmentClass.FFI.withOptPtr ---> GtkScrolledWindowClass.FFI.fromPtr false) new_ (hadjustment & vadjustment)
    fun addWithViewport self child = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) addWithViewport_ (self & child)
    fun getHadjustment self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getHscrollbar self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getHscrollbar_ self
    fun getMinContentHeight self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt.FFI.fromVal) getMinContentHeight_ self
    fun getMinContentWidth self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt.FFI.fromVal) getMinContentWidth_ self
    fun getPlacement self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkCornerType.FFI.fromVal) getPlacement_ self
    fun getPolicy self =
      let
        val hscrollbarPolicy
         & vscrollbarPolicy
         & () =
          (
            GtkScrolledWindowClass.FFI.withPtr
             &&&> GtkPolicyType.FFI.withRefVal
             &&&> GtkPolicyType.FFI.withRefVal
             ---> GtkPolicyType.FFI.fromVal
                   && GtkPolicyType.FFI.fromVal
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
    fun getShadowType self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getVadjustment self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun getVscrollbar self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getVscrollbar_ self
    fun setHadjustment self hadjustment = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setMinContentHeight self height = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMinContentHeight_ (self & height)
    fun setMinContentWidth self width = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMinContentWidth_ (self & width)
    fun setPlacement self windowPlacement = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkCornerType.FFI.withVal ---> I) setPlacement_ (self & windowPlacement)
    fun setPolicy self (hscrollbarPolicy, vscrollbarPolicy) =
      (
        GtkScrolledWindowClass.FFI.withPtr
         &&&> GtkPolicyType.FFI.withVal
         &&&> GtkPolicyType.FFI.withVal
         ---> I
      )
        setPolicy_
        (
          self
           & hscrollbarPolicy
           & vscrollbarPolicy
        )
    fun setShadowType self type' = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self vadjustment = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setVadjustment_ (self & vadjustment)
    fun unsetPlacement self = (GtkScrolledWindowClass.FFI.withPtr ---> I) unsetPlacement_ self
    local
      open ClosureMarshal Signal
    in
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun scrollChildSig f = signal "scroll-child" (get 0w1 GtkScrollType.t &&&> get 0w2 boolean ---> ret boolean) (fn scroll & horizontal => f (scroll, horizontal))
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
