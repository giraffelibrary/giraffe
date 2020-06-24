structure GtkScrolledWindow :>
  GTK_SCROLLED_WINDOW
    where type 'a class = 'a GtkScrolledWindowClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type position_type_t = GtkPositionType.t
    where type direction_type_t = GtkDirectionType.t
    where type scroll_type_t = GtkScrollType.t
    where type shadow_type_t = GtkShadowType.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type policy_type_t = GtkPolicyType.t
    where type corner_type_t = GtkCornerType.t =
  struct
    val getType_ = _import "gtk_scrolled_window_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scrolled_window_new" : GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p * GtkAdjustmentClass.FFI.opt GtkAdjustmentClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val addWithViewport_ = fn x1 & x2 => (_import "gtk_scrolled_window_add_with_viewport" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val getCaptureButtonPress_ = _import "gtk_scrolled_window_get_capture_button_press" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GBool.FFI.val_;
    val getHadjustment_ = _import "gtk_scrolled_window_get_hadjustment" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getHscrollbar_ = _import "gtk_scrolled_window_get_hscrollbar" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getKineticScrolling_ = _import "gtk_scrolled_window_get_kinetic_scrolling" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GBool.FFI.val_;
    val getMaxContentHeight_ = _import "gtk_scrolled_window_get_max_content_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GInt32.FFI.val_;
    val getMaxContentWidth_ = _import "gtk_scrolled_window_get_max_content_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GInt32.FFI.val_;
    val getMinContentHeight_ = _import "gtk_scrolled_window_get_min_content_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GInt32.FFI.val_;
    val getMinContentWidth_ = _import "gtk_scrolled_window_get_min_content_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GInt32.FFI.val_;
    val getOverlayScrolling_ = _import "gtk_scrolled_window_get_overlay_scrolling" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GBool.FFI.val_;
    val getPlacement_ = _import "gtk_scrolled_window_get_placement" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkCornerType.FFI.val_;
    val getPolicy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scrolled_window_get_policy" :
              GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p
               * GtkPolicyType.FFI.ref_
               * GtkPolicyType.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPropagateNaturalHeight_ = _import "gtk_scrolled_window_get_propagate_natural_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GBool.FFI.val_;
    val getPropagateNaturalWidth_ = _import "gtk_scrolled_window_get_propagate_natural_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GBool.FFI.val_;
    val getShadowType_ = _import "gtk_scrolled_window_get_shadow_type" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkShadowType.FFI.val_;
    val getVadjustment_ = _import "gtk_scrolled_window_get_vadjustment" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getVscrollbar_ = _import "gtk_scrolled_window_get_vscrollbar" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val setCaptureButtonPress_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_capture_button_press" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_hadjustment" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setKineticScrolling_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_kinetic_scrolling" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMaxContentHeight_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_max_content_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMaxContentWidth_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_max_content_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMinContentHeight_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_min_content_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMinContentWidth_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_min_content_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setOverlayScrolling_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_overlay_scrolling" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPlacement_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_placement" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GtkCornerType.FFI.val_ -> unit;) (x1, x2)
    val setPolicy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scrolled_window_set_policy" :
              GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p
               * GtkPolicyType.FFI.val_
               * GtkPolicyType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setPropagateNaturalHeight_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_propagate_natural_height" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPropagateNaturalWidth_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_propagate_natural_width" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setShadowType_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_shadow_type" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GtkShadowType.FFI.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_vadjustment" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p * GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val unsetPlacement_ = _import "gtk_scrolled_window_unset_placement" : GtkScrolledWindowClass.FFI.non_opt GtkScrolledWindowClass.FFI.p -> unit;
    type 'a class = 'a GtkScrolledWindowClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type position_type_t = GtkPositionType.t
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
    fun getCaptureButtonPress self = (GtkScrolledWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getCaptureButtonPress_ self
    fun getHadjustment self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self
    fun getHscrollbar self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getHscrollbar_ self
    fun getKineticScrolling self = (GtkScrolledWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getKineticScrolling_ self
    fun getMaxContentHeight self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxContentHeight_ self
    fun getMaxContentWidth self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxContentWidth_ self
    fun getMinContentHeight self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMinContentHeight_ self
    fun getMinContentWidth self = (GtkScrolledWindowClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMinContentWidth_ self
    fun getOverlayScrolling self = (GtkScrolledWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getOverlayScrolling_ self
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
    fun getPropagateNaturalHeight self = (GtkScrolledWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getPropagateNaturalHeight_ self
    fun getPropagateNaturalWidth self = (GtkScrolledWindowClass.FFI.withPtr ---> GBool.FFI.fromVal) getPropagateNaturalWidth_ self
    fun getShadowType self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkShadowType.FFI.fromVal) getShadowType_ self
    fun getVadjustment self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self
    fun getVscrollbar self = (GtkScrolledWindowClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getVscrollbar_ self
    fun setCaptureButtonPress self captureButtonPress = (GtkScrolledWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setCaptureButtonPress_ (self & captureButtonPress)
    fun setHadjustment self hadjustment = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setKineticScrolling self kineticScrolling = (GtkScrolledWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setKineticScrolling_ (self & kineticScrolling)
    fun setMaxContentHeight self height = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxContentHeight_ (self & height)
    fun setMaxContentWidth self width = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxContentWidth_ (self & width)
    fun setMinContentHeight self height = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMinContentHeight_ (self & height)
    fun setMinContentWidth self width = (GtkScrolledWindowClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMinContentWidth_ (self & width)
    fun setOverlayScrolling self overlayScrolling = (GtkScrolledWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOverlayScrolling_ (self & overlayScrolling)
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
    fun setPropagateNaturalHeight self propagate = (GtkScrolledWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPropagateNaturalHeight_ (self & propagate)
    fun setPropagateNaturalWidth self propagate = (GtkScrolledWindowClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPropagateNaturalWidth_ (self & propagate)
    fun setShadowType self type' = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkShadowType.FFI.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self vadjustment = (GtkScrolledWindowClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withPtr ---> I) setVadjustment_ (self & vadjustment)
    fun unsetPlacement self = (GtkScrolledWindowClass.FFI.withPtr ---> I) unsetPlacement_ self
    local
      open ClosureMarshal Signal
    in
      fun edgeOvershotSig f = signal "edge-overshot" (get 0w1 GtkPositionType.t ---> ret_void) f
      fun edgeReachedSig f = signal "edge-reached" (get 0w1 GtkPositionType.t ---> ret_void) f
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun scrollChildSig f = signal "scroll-child" (get 0w1 GtkScrollType.t &&&> get 0w2 boolean ---> ret boolean) (fn scroll & horizontal => f (scroll, horizontal))
    end
    local
      open Property
    in
      val hadjustmentProp =
        {
          get = fn x => get "hadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "hadjustment" GtkAdjustmentClass.tOpt x,
          new = fn x => new "hadjustment" GtkAdjustmentClass.tOpt x
        }
      val hscrollbarPolicyProp =
        {
          get = fn x => get "hscrollbar-policy" GtkPolicyType.t x,
          set = fn x => set "hscrollbar-policy" GtkPolicyType.t x,
          new = fn x => new "hscrollbar-policy" GtkPolicyType.t x
        }
      val kineticScrollingProp =
        {
          get = fn x => get "kinetic-scrolling" boolean x,
          set = fn x => set "kinetic-scrolling" boolean x,
          new = fn x => new "kinetic-scrolling" boolean x
        }
      val maxContentHeightProp =
        {
          get = fn x => get "max-content-height" int x,
          set = fn x => set "max-content-height" int x,
          new = fn x => new "max-content-height" int x
        }
      val maxContentWidthProp =
        {
          get = fn x => get "max-content-width" int x,
          set = fn x => set "max-content-width" int x,
          new = fn x => new "max-content-width" int x
        }
      val minContentHeightProp =
        {
          get = fn x => get "min-content-height" int x,
          set = fn x => set "min-content-height" int x,
          new = fn x => new "min-content-height" int x
        }
      val minContentWidthProp =
        {
          get = fn x => get "min-content-width" int x,
          set = fn x => set "min-content-width" int x,
          new = fn x => new "min-content-width" int x
        }
      val overlayScrollingProp =
        {
          get = fn x => get "overlay-scrolling" boolean x,
          set = fn x => set "overlay-scrolling" boolean x,
          new = fn x => new "overlay-scrolling" boolean x
        }
      val propagateNaturalHeightProp =
        {
          get = fn x => get "propagate-natural-height" boolean x,
          set = fn x => set "propagate-natural-height" boolean x,
          new = fn x => new "propagate-natural-height" boolean x
        }
      val propagateNaturalWidthProp =
        {
          get = fn x => get "propagate-natural-width" boolean x,
          set = fn x => set "propagate-natural-width" boolean x,
          new = fn x => new "propagate-natural-width" boolean x
        }
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x,
          new = fn x => new "shadow-type" GtkShadowType.t x
        }
      val vadjustmentProp =
        {
          get = fn x => get "vadjustment" GtkAdjustmentClass.tOpt x,
          set = fn x => set "vadjustment" GtkAdjustmentClass.tOpt x,
          new = fn x => new "vadjustment" GtkAdjustmentClass.tOpt x
        }
      val vscrollbarPolicyProp =
        {
          get = fn x => get "vscrollbar-policy" GtkPolicyType.t x,
          set = fn x => set "vscrollbar-policy" GtkPolicyType.t x,
          new = fn x => new "vscrollbar-policy" GtkPolicyType.t x
        }
      val windowPlacementProp =
        {
          get = fn x => get "window-placement" GtkCornerType.t x,
          set = fn x => set "window-placement" GtkCornerType.t x,
          new = fn x => new "window-placement" GtkCornerType.t x
        }
      val windowPlacementSetProp =
        {
          get = fn x => get "window-placement-set" boolean x,
          set = fn x => set "window-placement-set" boolean x,
          new = fn x => new "window-placement-set" boolean x
        }
    end
  end
