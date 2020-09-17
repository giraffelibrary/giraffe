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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_style_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_style_context_new") (cVoid --> GtkStyleContextClass.PolyML.cPtr)
      val addProviderForScreen_ =
        call (getSymbol "gtk_style_context_add_provider_for_screen")
          (
            GdkScreenClass.PolyML.cPtr
             &&> GtkStyleProviderClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val removeProviderForScreen_ = call (getSymbol "gtk_style_context_remove_provider_for_screen") (GdkScreenClass.PolyML.cPtr &&> GtkStyleProviderClass.PolyML.cPtr --> cVoid)
      val resetWidgets_ = call (getSymbol "gtk_style_context_reset_widgets") (GdkScreenClass.PolyML.cPtr --> cVoid)
      val addClass_ = call (getSymbol "gtk_style_context_add_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val addProvider_ =
        call (getSymbol "gtk_style_context_add_provider")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStyleProviderClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val addRegion_ =
        call (getSymbol "gtk_style_context_add_region")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cVal
             --> cVoid
          )
      val getBackgroundColor_ =
        call (getSymbol "gtk_style_context_get_background_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getBorder_ =
        call (getSymbol "gtk_style_context_get_border")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getBorderColor_ =
        call (getSymbol "gtk_style_context_get_border_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getColor_ =
        call (getSymbol "gtk_style_context_get_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getDirection_ = call (getSymbol "gtk_style_context_get_direction") (GtkStyleContextClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getFont_ = call (getSymbol "gtk_style_context_get_font") (GtkStyleContextClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFrameClock_ = call (getSymbol "gtk_style_context_get_frame_clock") (GtkStyleContextClass.PolyML.cPtr --> GdkFrameClockClass.PolyML.cOptPtr)
      val getJunctionSides_ = call (getSymbol "gtk_style_context_get_junction_sides") (GtkStyleContextClass.PolyML.cPtr --> GtkJunctionSides.PolyML.cVal)
      val getMargin_ =
        call (getSymbol "gtk_style_context_get_margin")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getPadding_ =
        call (getSymbol "gtk_style_context_get_padding")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getParent_ = call (getSymbol "gtk_style_context_get_parent") (GtkStyleContextClass.PolyML.cPtr --> GtkStyleContextClass.PolyML.cOptPtr)
      val getPath_ = call (getSymbol "gtk_style_context_get_path") (GtkStyleContextClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getScale_ = call (getSymbol "gtk_style_context_get_scale") (GtkStyleContextClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getScreen_ = call (getSymbol "gtk_style_context_get_screen") (GtkStyleContextClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSection_ = call (getSymbol "gtk_style_context_get_section") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkCssSectionRecord.PolyML.cOptPtr)
      val getState_ = call (getSymbol "gtk_style_context_get_state") (GtkStyleContextClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyleProperty_ =
        call (getSymbol "gtk_style_context_get_style_property")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val hasClass_ = call (getSymbol "gtk_style_context_has_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasRegion_ =
        call (getSymbol "gtk_style_context_has_region")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val invalidate_ = call (getSymbol "gtk_style_context_invalidate") (GtkStyleContextClass.PolyML.cPtr --> cVoid)
      val lookupColor_ =
        call (getSymbol "gtk_style_context_lookup_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val lookupIconSet_ = call (getSymbol "gtk_style_context_lookup_icon_set") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cOptPtr)
      val popAnimatableRegion_ = call (getSymbol "gtk_style_context_pop_animatable_region") (GtkStyleContextClass.PolyML.cPtr --> cVoid)
      val removeClass_ = call (getSymbol "gtk_style_context_remove_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val removeProvider_ = call (getSymbol "gtk_style_context_remove_provider") (GtkStyleContextClass.PolyML.cPtr &&> GtkStyleProviderClass.PolyML.cPtr --> cVoid)
      val removeRegion_ = call (getSymbol "gtk_style_context_remove_region") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val restore_ = call (getSymbol "gtk_style_context_restore") (GtkStyleContextClass.PolyML.cPtr --> cVoid)
      val save_ = call (getSymbol "gtk_style_context_save") (GtkStyleContextClass.PolyML.cPtr --> cVoid)
      val scrollAnimations_ =
        call (getSymbol "gtk_style_context_scroll_animations")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setBackground_ = call (getSymbol "gtk_style_context_set_background") (GtkStyleContextClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val setDirection_ = call (getSymbol "gtk_style_context_set_direction") (GtkStyleContextClass.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> cVoid)
      val setFrameClock_ = call (getSymbol "gtk_style_context_set_frame_clock") (GtkStyleContextClass.PolyML.cPtr &&> GdkFrameClockClass.PolyML.cPtr --> cVoid)
      val setJunctionSides_ = call (getSymbol "gtk_style_context_set_junction_sides") (GtkStyleContextClass.PolyML.cPtr &&> GtkJunctionSides.PolyML.cVal --> cVoid)
      val setParent_ = call (getSymbol "gtk_style_context_set_parent") (GtkStyleContextClass.PolyML.cPtr &&> GtkStyleContextClass.PolyML.cOptPtr --> cVoid)
      val setPath_ = call (getSymbol "gtk_style_context_set_path") (GtkStyleContextClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> cVoid)
      val setScale_ = call (getSymbol "gtk_style_context_set_scale") (GtkStyleContextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setScreen_ = call (getSymbol "gtk_style_context_set_screen") (GtkStyleContextClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> cVoid)
      val setState_ = call (getSymbol "gtk_style_context_set_state") (GtkStyleContextClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> cVoid)
      val stateIsRunning_ =
        call (getSymbol "gtk_style_context_state_is_running")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val toString_ = call (getSymbol "gtk_style_context_to_string") (GtkStyleContextClass.PolyML.cPtr &&> GtkStyleContextPrintFlags.PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end
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
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
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
    fun getScale self = (GtkStyleContextClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getScale_ self
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun setScale self scale = (GtkStyleContextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setScale_ (self & scale)
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
