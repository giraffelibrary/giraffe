structure GtkStyleContext :>
  GTK_STYLE_CONTEXT
    where type 'a class = 'a GtkStyleContextClass.class
    where type border_t = GtkBorderRecord.t
    where type css_section_t = GtkCssSectionRecord.t
    where type region_flags_t = GtkRegionFlags.t
    where type icon_set_t = GtkIconSetRecord.t
    where type 'a style_provider_class = 'a GtkStyleProviderClass.class
    where type junction_sides_t = GtkJunctionSides.t
    where type widget_path_t = GtkWidgetPathRecord.t
    where type state_flags_t = GtkStateFlags.t
    where type state_type_t = GtkStateType.t
    where type style_context_print_flags_t = GtkStyleContextPrintFlags.t
    where type text_direction_t = GtkTextDirection.t =
  struct
    val getType_ = _import "gtk_style_context_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_style_context_new" : unit -> GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p;
    val addProviderForScreen_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_add_provider_for_screen" :
              GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p
               * GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeProviderForScreen_ = fn x1 & x2 => (_import "gtk_style_context_remove_provider_for_screen" : GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p * GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p -> unit;) (x1, x2)
    val resetWidgets_ = _import "gtk_style_context_reset_widgets" : GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;
    val addClass_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_add_class" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p
               * GUInt.FFI.val_
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkRegionFlags.FFI.val_
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.non_opt GtkBorderRecord.FFI.p
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDirection_ = _import "gtk_style_context_get_direction" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GtkTextDirection.FFI.val_;
    val getFont_ = fn x1 & x2 => (_import "gtk_style_context_get_font" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkStateFlags.FFI.val_ -> PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p;) (x1, x2)
    val getFrameClock_ = _import "gtk_style_context_get_frame_clock" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GdkFrameClockClass.FFI.opt GdkFrameClockClass.FFI.p;
    val getJunctionSides_ = _import "gtk_style_context_get_junction_sides" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GtkJunctionSides.FFI.val_;
    val getMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_get_margin" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.non_opt GtkBorderRecord.FFI.p
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.non_opt GtkBorderRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getParent_ = _import "gtk_style_context_get_parent" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GtkStyleContextClass.FFI.opt GtkStyleContextClass.FFI.p;
    val getPath_ = _import "gtk_style_context_get_path" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;
    val getScale_ = _import "gtk_style_context_get_scale" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GInt.FFI.val_;
    val getScreen_ = _import "gtk_style_context_get_screen" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getSection_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_get_section" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkCssSectionRecord.FFI.opt GtkCssSectionRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getState_ = _import "gtk_style_context_get_state" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> GtkStateFlags.FFI.val_;
    val getStyleProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_get_style_property" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val invalidate_ = _import "gtk_style_context_invalidate" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> unit;
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_style_context_lookup_color" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkRgbaRecord.FFI.non_opt GdkRgbaRecord.FFI.p
               -> GBool.FFI.val_;
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
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkIconSetRecord.FFI.opt GtkIconSetRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val popAnimatableRegion_ = _import "gtk_style_context_pop_animatable_region" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> unit;
    val removeClass_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_remove_class" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeProvider_ = fn x1 & x2 => (_import "gtk_style_context_remove_provider" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkStyleProviderClass.FFI.non_opt GtkStyleProviderClass.FFI.p -> unit;) (x1, x2)
    val removeRegion_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_style_context_remove_region" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val restore_ = _import "gtk_style_context_restore" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> unit;
    val save_ = _import "gtk_style_context_save" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p -> unit;
    val scrollAnimations_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_style_context_scroll_animations" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setBackground_ = fn x1 & x2 => (_import "gtk_style_context_set_background" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setDirection_ = fn x1 & x2 => (_import "gtk_style_context_set_direction" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkTextDirection.FFI.val_ -> unit;) (x1, x2)
    val setFrameClock_ = fn x1 & x2 => (_import "gtk_style_context_set_frame_clock" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GdkFrameClockClass.FFI.non_opt GdkFrameClockClass.FFI.p -> unit;) (x1, x2)
    val setJunctionSides_ = fn x1 & x2 => (_import "gtk_style_context_set_junction_sides" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkJunctionSides.FFI.val_ -> unit;) (x1, x2)
    val setParent_ = fn x1 & x2 => (_import "gtk_style_context_set_parent" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkStyleContextClass.FFI.opt GtkStyleContextClass.FFI.p -> unit;) (x1, x2)
    val setPath_ = fn x1 & x2 => (_import "gtk_style_context_set_path" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p -> unit;) (x1, x2)
    val setScale_ = fn x1 & x2 => (_import "gtk_style_context_set_scale" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setScreen_ = fn x1 & x2 => (_import "gtk_style_context_set_screen" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p -> unit;) (x1, x2)
    val setState_ = fn x1 & x2 => (_import "gtk_style_context_set_state" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkStateFlags.FFI.val_ -> unit;) (x1, x2)
    val stateIsRunning_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_style_context_state_is_running" :
              GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p
               * GtkStateType.FFI.val_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val toString_ = fn x1 & x2 => (_import "gtk_style_context_to_string" : GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p * GtkStyleContextPrintFlags.FFI.val_ -> Utf8.FFI.non_opt Utf8.FFI.out_p;) (x1, x2)
    type 'a class = 'a GtkStyleContextClass.class
    type border_t = GtkBorderRecord.t
    type css_section_t = GtkCssSectionRecord.t
    type region_flags_t = GtkRegionFlags.t
    type icon_set_t = GtkIconSetRecord.t
    type 'a style_provider_class = 'a GtkStyleProviderClass.class
    type junction_sides_t = GtkJunctionSides.t
    type widget_path_t = GtkWidgetPathRecord.t
    type state_flags_t = GtkStateFlags.t
    type state_type_t = GtkStateType.t
    type style_context_print_flags_t = GtkStyleContextPrintFlags.t
    type text_direction_t = GtkTextDirection.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStyleContextClass.FFI.fromPtr true) new_ ()
    fun addProviderForScreen
      (
        screen,
        provider,
        priority
      ) =
      (
        GdkScreenClass.FFI.withPtr false
         &&&> GtkStyleProviderClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         ---> I
      )
        addProviderForScreen_
        (
          screen
           & provider
           & priority
        )
    fun removeProviderForScreen (screen, provider) = (GdkScreenClass.FFI.withPtr false &&&> GtkStyleProviderClass.FFI.withPtr false ---> I) removeProviderForScreen_ (screen & provider)
    fun resetWidgets screen = (GdkScreenClass.FFI.withPtr false ---> I) resetWidgets_ screen
    fun addClass self className = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) addClass_ (self & className)
    fun addProvider self (provider, priority) =
      (
        GtkStyleContextClass.FFI.withPtr false
         &&&> GtkStyleProviderClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         ---> I
      )
        addProvider_
        (
          self
           & provider
           & priority
        )
    fun addRegion self (regionName, flags) =
      (
        GtkStyleContextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkRegionFlags.FFI.withVal
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
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GdkRgbaRecord.FFI.withNewPtr
             ---> GdkRgbaRecord.FFI.fromPtr true && I
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
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GtkBorderRecord.FFI.withNewPtr
             ---> GtkBorderRecord.FFI.fromPtr true && I
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
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GdkRgbaRecord.FFI.withNewPtr
             ---> GdkRgbaRecord.FFI.fromPtr true && I
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
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GdkRgbaRecord.FFI.withNewPtr
             ---> GdkRgbaRecord.FFI.fromPtr true && I
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
    fun getDirection self = (GtkStyleContextClass.FFI.withPtr false ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getFont self state = (GtkStyleContextClass.FFI.withPtr false &&&> GtkStateFlags.FFI.withVal ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ (self & state) before GtkStyleContextClass.FFI.touchPtr self
    fun getFrameClock self = (GtkStyleContextClass.FFI.withPtr false ---> GdkFrameClockClass.FFI.fromOptPtr false) getFrameClock_ self before GtkStyleContextClass.FFI.touchPtr self
    fun getJunctionSides self = (GtkStyleContextClass.FFI.withPtr false ---> GtkJunctionSides.FFI.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GtkBorderRecord.FFI.withNewPtr
             ---> GtkBorderRecord.FFI.fromPtr true && I
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
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateFlags.FFI.withVal
             &&&> GtkBorderRecord.FFI.withNewPtr
             ---> GtkBorderRecord.FFI.fromPtr true && I
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
    fun getParent self = (GtkStyleContextClass.FFI.withPtr false ---> GtkStyleContextClass.FFI.fromOptPtr false) getParent_ self before GtkStyleContextClass.FFI.touchPtr self
    fun getPath self = (GtkStyleContextClass.FFI.withPtr false ---> GtkWidgetPathRecord.FFI.fromPtr false) getPath_ self before GtkStyleContextClass.FFI.touchPtr self
    fun getScale self = (GtkStyleContextClass.FFI.withPtr false ---> GInt.FFI.fromVal) getScale_ self
    fun getScreen self = (GtkStyleContextClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self before GtkStyleContextClass.FFI.touchPtr self
    fun getSection self property = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkCssSectionRecord.FFI.fromOptPtr false) getSection_ (self & property) before GtkStyleContextClass.FFI.touchPtr self before Utf8.FFI.touchPtr property
    fun getState self = (GtkStyleContextClass.FFI.withPtr false ---> GtkStateFlags.FFI.fromVal) getState_ self
    fun getStyleProperty self (propertyName, value) =
      (
        GtkStyleContextClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        getStyleProperty_
        (
          self
           & propertyName
           & value
        )
    fun hasClass self className = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasClass_ (self & className)
    fun hasRegion self regionName =
      let
        val flagsReturn & retVal =
          (
            GtkStyleContextClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
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
    fun invalidate self = (GtkStyleContextClass.FFI.withPtr false ---> I) invalidate_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleContextClass.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> GdkRgbaRecord.FFI.withNewPtr
             ---> GdkRgbaRecord.FFI.fromPtr true && GBool.FFI.fromVal
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
    fun lookupIconSet self stockId = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkIconSetRecord.FFI.fromOptPtr false) lookupIconSet_ (self & stockId) before GtkStyleContextClass.FFI.touchPtr self before Utf8.FFI.touchPtr stockId
    fun popAnimatableRegion self = (GtkStyleContextClass.FFI.withPtr false ---> I) popAnimatableRegion_ self
    fun removeClass self className = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) removeClass_ (self & className)
    fun removeProvider self provider = (GtkStyleContextClass.FFI.withPtr false &&&> GtkStyleProviderClass.FFI.withPtr false ---> I) removeProvider_ (self & provider)
    fun removeRegion self regionName = (GtkStyleContextClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) removeRegion_ (self & regionName)
    fun restore self = (GtkStyleContextClass.FFI.withPtr false ---> I) restore_ self
    fun save self = (GtkStyleContextClass.FFI.withPtr false ---> I) save_ self
    fun scrollAnimations
      self
      (
        window,
        dx,
        dy
      ) =
      (
        GtkStyleContextClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        scrollAnimations_
        (
          self
           & window
           & dx
           & dy
        )
    fun setBackground self window = (GtkStyleContextClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) setBackground_ (self & window)
    fun setDirection self direction = (GtkStyleContextClass.FFI.withPtr false &&&> GtkTextDirection.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setFrameClock self frameClock = (GtkStyleContextClass.FFI.withPtr false &&&> GdkFrameClockClass.FFI.withPtr false ---> I) setFrameClock_ (self & frameClock)
    fun setJunctionSides self sides = (GtkStyleContextClass.FFI.withPtr false &&&> GtkJunctionSides.FFI.withVal ---> I) setJunctionSides_ (self & sides)
    fun setParent self parent = (GtkStyleContextClass.FFI.withPtr false &&&> GtkStyleContextClass.FFI.withOptPtr false ---> I) setParent_ (self & parent)
    fun setPath self path = (GtkStyleContextClass.FFI.withPtr false &&&> GtkWidgetPathRecord.FFI.withPtr false ---> I) setPath_ (self & path)
    fun setScale self scale = (GtkStyleContextClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setScale_ (self & scale)
    fun setScreen self screen = (GtkStyleContextClass.FFI.withPtr false &&&> GdkScreenClass.FFI.withPtr false ---> I) setScreen_ (self & screen)
    fun setState self flags = (GtkStyleContextClass.FFI.withPtr false &&&> GtkStateFlags.FFI.withVal ---> I) setState_ (self & flags)
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GtkStyleContextClass.FFI.withPtr false
             &&&> GtkStateType.FFI.withVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal && GBool.FFI.fromVal
          )
            stateIsRunning_
            (
              self
               & state
               & GDouble.null
            )
      in
        if retVal then SOME progress else NONE
      end
    fun toString self flags = (GtkStyleContextClass.FFI.withPtr false &&&> GtkStyleContextPrintFlags.FFI.withVal ---> Utf8.FFI.fromPtr ~1) toString_ (self & flags)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val directionProp =
        {
          name = "direction",
          gtype = fn () => C.gtype GtkTextDirection.t (),
          get = fn x => fn () => C.get GtkTextDirection.t x,
          set = fn x => C.set GtkTextDirection.t x,
          init = fn x => C.set GtkTextDirection.t x
        }
      val paintClockProp =
        {
          name = "paint-clock",
          gtype = fn () => C.gtype GdkFrameClockClass.tOpt (),
          get = fn x => fn () => C.get GdkFrameClockClass.tOpt x,
          set = fn x => C.set GdkFrameClockClass.tOpt x,
          init = fn x => C.set GdkFrameClockClass.tOpt x
        }
      val parentProp =
        {
          name = "parent",
          gtype = fn () => C.gtype GtkStyleContextClass.tOpt (),
          get = fn x => fn () => C.get GtkStyleContextClass.tOpt x,
          set = fn x => C.set GtkStyleContextClass.tOpt x,
          init = fn x => C.set GtkStyleContextClass.tOpt x
        }
      val screenProp =
        {
          name = "screen",
          gtype = fn () => C.gtype GdkScreenClass.tOpt (),
          get = fn x => fn () => C.get GdkScreenClass.tOpt x,
          set = fn x => C.set GdkScreenClass.tOpt x,
          init = fn x => C.set GdkScreenClass.tOpt x
        }
    end
  end
