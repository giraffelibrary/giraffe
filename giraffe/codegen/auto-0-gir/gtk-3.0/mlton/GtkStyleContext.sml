structure GtkStyleContext :>
  GTK_STYLE_CONTEXT
    where type 'a class = 'a GtkStyleContextClass.class
    where type border_t = GtkBorderRecord.t
    where type region_flags_t = GtkRegionFlags.t
    where type icon_set_t = GtkIconSetRecord.t
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type junction_sides_t = GtkJunctionSides.t
    where type widget_path_t = GtkWidgetPathRecord.t
    where type state_flags_t = GtkStateFlags.t
    where type state_type_t = GtkStateType.t
    where type text_direction_t = GtkTextDirection.t =
  struct
    val getType_ = _import "gtk_style_context_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_style_context_new" : unit -> GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p;
    val addProviderForScreen_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_add_provider_for_screen" :
              GdkScreenClass.C.notnull GdkScreenClass.C.p
               * GtkStyleProviderClass.C.notnull GtkStyleProviderClass.C.p
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeProviderForScreen_ = fn x1 & x2 => (_import "gtk_style_context_remove_provider_for_screen" : GdkScreenClass.C.notnull GdkScreenClass.C.p * GtkStyleProviderClass.C.notnull GtkStyleProviderClass.C.p -> unit;) (x1, x2)
    val resetWidgets_ = _import "gtk_style_context_reset_widgets" : GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;
    val addClass_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_add_class" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addProvider_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_add_provider" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStyleProviderClass.C.notnull GtkStyleProviderClass.C.p
               * FFI.UInt.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addRegion_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_add_region" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkRegionFlags.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBackgroundColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_background_color" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getBorder_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_border" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GtkBorderRecord.C.notnull GtkBorderRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getBorderColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_border_color" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_color" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDirection_ = _import "gtk_style_context_get_direction" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GtkTextDirection.C.val_;
    val getFont_ = fn x1 & x2 => (_import "gtk_style_context_get_font" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkStateFlags.C.val_ -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;) (x1, x2)
    val getJunctionSides_ = _import "gtk_style_context_get_junction_sides" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GtkJunctionSides.C.val_;
    val getMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_margin" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GtkBorderRecord.C.notnull GtkBorderRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPadding_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_padding" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateFlags.C.val_
               * GtkBorderRecord.C.notnull GtkBorderRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPath_ = _import "gtk_style_context_get_path" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;
    val getScreen_ = _import "gtk_style_context_get_screen" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getState_ = _import "gtk_style_context_get_state" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> GtkStateFlags.C.val_;
    val getStyleProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_get_style_property" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val hasClass_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_has_class" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasRegion_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_has_region" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkRegionFlags.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val invalidate_ = _import "gtk_style_context_invalidate" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> unit;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_lookup_color" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val lookupIconSet_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_lookup_icon_set" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> GtkIconSetRecord.C.notnull GtkIconSetRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val popAnimatableRegion_ = _import "gtk_style_context_pop_animatable_region" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> unit;
    val removeClass_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_remove_class" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeProvider_ = fn x1 & x2 => (_import "gtk_style_context_remove_provider" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkStyleProviderClass.C.notnull GtkStyleProviderClass.C.p -> unit;) (x1, x2)
    val removeRegion_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_remove_region" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val restore_ = _import "gtk_style_context_restore" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> unit;
    val save_ = _import "gtk_style_context_save" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p -> unit;
    val scrollAnimations_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_style_context_scroll_animations" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setBackground_ = fn x1 & x2 => (_import "gtk_style_context_set_background" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;) (x1, x2)
    val setDirection_ = fn x1 & x2 => (_import "gtk_style_context_set_direction" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkTextDirection.C.val_ -> unit;) (x1, x2)
    val setJunctionSides_ = fn x1 & x2 => (_import "gtk_style_context_set_junction_sides" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkJunctionSides.C.val_ -> unit;) (x1, x2)
    val setPath_ = fn x1 & x2 => (_import "gtk_style_context_set_path" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_style_context_set_screen" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GdkScreenClass.C.notnull GdkScreenClass.C.p -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "gtk_style_context_set_state" : GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p * GtkStateFlags.C.val_ -> unit;) (x1, x2)
    val stateIsRunning_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_state_is_running" :
              GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p
               * GtkStateType.C.val_
               * FFI.Double.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkStyleContextClass.class
    type border_t = GtkBorderRecord.t
    type region_flags_t = GtkRegionFlags.t
    type icon_set_t = GtkIconSetRecord.t
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type junction_sides_t = GtkJunctionSides.t
    type widget_path_t = GtkWidgetPathRecord.t
    type state_flags_t = GtkStateFlags.t
    type state_type_t = GtkStateType.t
    type text_direction_t = GtkTextDirection.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStyleContextClass.C.fromPtr true) new_ ()
    fun addProviderForScreen screen provider priority =
      (
        GdkScreenClass.C.withPtr
         &&&> GtkStyleProviderClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        addProviderForScreen_
        (
          screen
           & provider
           & priority
        )
    fun removeProviderForScreen screen provider = (GdkScreenClass.C.withPtr &&&> GtkStyleProviderClass.C.withPtr ---> I) removeProviderForScreen_ (screen & provider)
    fun resetWidgets screen = (GdkScreenClass.C.withPtr ---> I) resetWidgets_ screen
    fun addClass self className = (GtkStyleContextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addClass_ (self & className)
    fun addProvider self provider priority =
      (
        GtkStyleContextClass.C.withPtr
         &&&> GtkStyleProviderClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        addProvider_
        (
          self
           & provider
           & priority
        )
    fun addRegion self regionName flags =
      (
        GtkStyleContextClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkRegionFlags.C.withVal
         ---> I
      )
        addRegion_
        (
          self
           & regionName
           & flags
        )
    fun getBackgroundColor self state =
      let
        val color & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && I
          )
            getBackgroundColor_
            (
              self
               & state
               & ()
            )
      in
        color
      end
    fun getBorder self state =
      let
        val border & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GtkBorderRecord.C.withNewPtr
             ---> GtkBorderRecord.C.fromPtr true && I
          )
            getBorder_
            (
              self
               & state
               & ()
            )
      in
        border
      end
    fun getBorderColor self state =
      let
        val color & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && I
          )
            getBorderColor_
            (
              self
               & state
               & ()
            )
      in
        color
      end
    fun getColor self state =
      let
        val color & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && I
          )
            getColor_
            (
              self
               & state
               & ()
            )
      in
        color
      end
    fun getDirection self = (GtkStyleContextClass.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getFont self state = (GtkStyleContextClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ (self & state)
    fun getJunctionSides self = (GtkStyleContextClass.C.withPtr ---> GtkJunctionSides.C.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GtkBorderRecord.C.withNewPtr
             ---> GtkBorderRecord.C.fromPtr true && I
          )
            getMargin_
            (
              self
               & state
               & ()
            )
      in
        margin
      end
    fun getPadding self state =
      let
        val padding & () =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateFlags.C.withVal
             &&&> GtkBorderRecord.C.withNewPtr
             ---> GtkBorderRecord.C.fromPtr true && I
          )
            getPadding_
            (
              self
               & state
               & ()
            )
      in
        padding
      end
    fun getPath self = (GtkStyleContextClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr false) getPath_ self
    fun getScreen self = (GtkStyleContextClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getState self = (GtkStyleContextClass.C.withPtr ---> GtkStateFlags.C.fromVal) getState_ self
    fun getStyleProperty self propertyName value =
      (
        GtkStyleContextClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        getStyleProperty_
        (
          self
           & propertyName
           & value
        )
    fun hasClass self className = (GtkStyleContextClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasClass_ (self & className)
    fun hasRegion self regionName =
      let
        val flagsReturn & retVal =
          (
            GtkStyleContextClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.C.fromVal
          )
            hasRegion_
            (
              self
               & regionName
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flagsReturn else NONE
      end
    fun invalidate self = (GtkStyleContextClass.C.withPtr ---> I) invalidate_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleContextClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GdkRgbaRecord.C.withNewPtr
             ---> GdkRgbaRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            lookupColor_
            (
              self
               & colorName
               & ()
            )
      in
        if retVal then SOME color else NONE
      end
    fun lookupIconSet self stockId = (GtkStyleContextClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun popAnimatableRegion self = (GtkStyleContextClass.C.withPtr ---> I) popAnimatableRegion_ self
    fun removeClass self className = (GtkStyleContextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeClass_ (self & className)
    fun removeProvider self provider = (GtkStyleContextClass.C.withPtr &&&> GtkStyleProviderClass.C.withPtr ---> I) removeProvider_ (self & provider)
    fun removeRegion self regionName = (GtkStyleContextClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeRegion_ (self & regionName)
    fun restore self = (GtkStyleContextClass.C.withPtr ---> I) restore_ self
    fun save self = (GtkStyleContextClass.C.withPtr ---> I) save_ self
    fun scrollAnimations self window dx dy =
      (
        GtkStyleContextClass.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        scrollAnimations_
        (
          self
           & window
           & dx
           & dy
        )
    fun setBackground self window = (GtkStyleContextClass.C.withPtr &&&> GdkWindowClass.C.withPtr ---> I) setBackground_ (self & window)
    fun setDirection self direction = (GtkStyleContextClass.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & direction)
    fun setJunctionSides self sides = (GtkStyleContextClass.C.withPtr &&&> GtkJunctionSides.C.withVal ---> I) setJunctionSides_ (self & sides)
    fun setPath self path = (GtkStyleContextClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> I) setPath_ (self & path)
    fun setScreen self screen = (GtkStyleContextClass.C.withPtr &&&> GdkScreenClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setState self flags = (GtkStyleContextClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> I) setState_ (self & flags)
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GtkStyleContextClass.C.withPtr
             &&&> GtkStateType.C.withVal
             &&&> FFI.Double.C.withRefVal
             ---> FFI.Double.C.fromVal && FFI.Bool.C.fromVal
          )
            stateIsRunning_
            (
              self
               & state
               & FFI.Double.null
            )
      in
        if retVal then SOME progress else NONE
      end
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val directionProp =
        {
          get = fn x => get "direction" GtkTextDirection.t x,
          set = fn x => set "direction" GtkTextDirection.t x
        }
      val screenProp =
        {
          get = fn x => get "screen" GdkScreenClass.tOpt x,
          set = fn x => set "screen" GdkScreenClass.tOpt x
        }
    end
  end
