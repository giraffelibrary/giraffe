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
    val getType_ = _import "gtk_scrolled_window_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "gtk_scrolled_window_new" : unit GtkAdjustmentClass.C.p * unit GtkAdjustmentClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;) (x1, x2)
    val addWithViewport_ = fn x1 & x2 => (_import "gtk_scrolled_window_add_with_viewport" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val getHadjustment_ = _import "gtk_scrolled_window_get_hadjustment" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getHscrollbar_ = _import "gtk_scrolled_window_get_hscrollbar" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getMinContentHeight_ = _import "gtk_scrolled_window_get_min_content_height" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> FFI.Int32.C.val_;
    val getMinContentWidth_ = _import "gtk_scrolled_window_get_min_content_width" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> FFI.Int32.C.val_;
    val getPlacement_ = _import "gtk_scrolled_window_get_placement" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkCornerType.C.val_;
    val getPolicy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scrolled_window_get_policy" :
              GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p
               * GtkPolicyType.C.ref_
               * GtkPolicyType.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getShadowType_ = _import "gtk_scrolled_window_get_shadow_type" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkShadowType.C.val_;
    val getVadjustment_ = _import "gtk_scrolled_window_get_vadjustment" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p;
    val getVscrollbar_ = _import "gtk_scrolled_window_get_vscrollbar" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val setHadjustment_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_hadjustment" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val setMinContentHeight_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_min_content_height" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setMinContentWidth_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_min_content_width" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setPlacement_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_placement" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * GtkCornerType.C.val_ -> unit;) (x1, x2)
    val setPolicy_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_scrolled_window_set_policy" :
              GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p
               * GtkPolicyType.C.val_
               * GtkPolicyType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShadowType_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_shadow_type" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * GtkShadowType.C.val_ -> unit;) (x1, x2)
    val setVadjustment_ = fn x1 & x2 => (_import "gtk_scrolled_window_set_vadjustment" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p * GtkAdjustmentClass.C.notnull GtkAdjustmentClass.C.p -> unit;) (x1, x2)
    val unsetPlacement_ = _import "gtk_scrolled_window_unset_placement" : GtkScrolledWindowClass.C.notnull GtkScrolledWindowClass.C.p -> unit;
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
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new hadjustment vadjustment = (GtkAdjustmentClass.C.withOptPtr &&&> GtkAdjustmentClass.C.withOptPtr ---> GtkScrolledWindowClass.C.fromPtr false) new_ (hadjustment & vadjustment)
    fun addWithViewport self child = (GtkScrolledWindowClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) addWithViewport_ (self & child)
    fun getHadjustment self = (GtkScrolledWindowClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getHadjustment_ self
    fun getHscrollbar self = (GtkScrolledWindowClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getHscrollbar_ self
    fun getMinContentHeight self = (GtkScrolledWindowClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinContentHeight_ self
    fun getMinContentWidth self = (GtkScrolledWindowClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinContentWidth_ self
    fun getPlacement self = (GtkScrolledWindowClass.C.withPtr ---> GtkCornerType.C.fromVal) getPlacement_ self
    fun getPolicy self =
      let
        val hscrollbarPolicy
         & vscrollbarPolicy
         & () =
          (
            GtkScrolledWindowClass.C.withPtr
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
    fun getShadowType self = (GtkScrolledWindowClass.C.withPtr ---> GtkShadowType.C.fromVal) getShadowType_ self
    fun getVadjustment self = (GtkScrolledWindowClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getVadjustment_ self
    fun getVscrollbar self = (GtkScrolledWindowClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getVscrollbar_ self
    fun setHadjustment self hadjustment = (GtkScrolledWindowClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> I) setHadjustment_ (self & hadjustment)
    fun setMinContentHeight self height = (GtkScrolledWindowClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinContentHeight_ (self & height)
    fun setMinContentWidth self width = (GtkScrolledWindowClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinContentWidth_ (self & width)
    fun setPlacement self windowPlacement = (GtkScrolledWindowClass.C.withPtr &&&> GtkCornerType.C.withVal ---> I) setPlacement_ (self & windowPlacement)
    fun setPolicy self hscrollbarPolicy vscrollbarPolicy =
      (
        GtkScrolledWindowClass.C.withPtr
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
    fun setShadowType self type' = (GtkScrolledWindowClass.C.withPtr &&&> GtkShadowType.C.withVal ---> I) setShadowType_ (self & type')
    fun setVadjustment self vadjustment = (GtkScrolledWindowClass.C.withPtr &&&> GtkAdjustmentClass.C.withPtr ---> I) setVadjustment_ (self & vadjustment)
    fun unsetPlacement self = (GtkScrolledWindowClass.C.withPtr ---> I) unsetPlacement_ self
    local
      open ClosureMarshal Signal
    in
      fun moveFocusOutSig f = signal "move-focus-out" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun scrollChildSig f = signal "scroll-child" (get 0w1 GtkScrollType.t &&&> get 0w2 boolean ---> ret boolean) (fn scroll & horizontal => f scroll horizontal)
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
