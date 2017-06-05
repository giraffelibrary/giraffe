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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_context_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_style_context_new") (PolyMLFFI.cVoid --> GtkStyleContextClass.PolyML.cPtr)
      val addProviderForScreen_ =
        call (load_sym libgtk "gtk_style_context_add_provider_for_screen")
          (
            GdkScreenClass.PolyML.cPtr
             &&> GtkStyleProviderClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val removeProviderForScreen_ = call (load_sym libgtk "gtk_style_context_remove_provider_for_screen") (GdkScreenClass.PolyML.cPtr &&> GtkStyleProviderClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val resetWidgets_ = call (load_sym libgtk "gtk_style_context_reset_widgets") (GdkScreenClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val addClass_ = call (load_sym libgtk "gtk_style_context_add_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val addProvider_ =
        call (load_sym libgtk "gtk_style_context_add_provider")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStyleProviderClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val addRegion_ =
        call (load_sym libgtk "gtk_style_context_add_region")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val getBackgroundColor_ =
        call (load_sym libgtk "gtk_style_context_get_background_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getBorder_ =
        call (load_sym libgtk "gtk_style_context_get_border")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getBorderColor_ =
        call (load_sym libgtk "gtk_style_context_get_border_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getColor_ =
        call (load_sym libgtk "gtk_style_context_get_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getDirection_ = call (load_sym libgtk "gtk_style_context_get_direction") (GtkStyleContextClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getFont_ = call (load_sym libgtk "gtk_style_context_get_font") (GtkStyleContextClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getJunctionSides_ = call (load_sym libgtk "gtk_style_context_get_junction_sides") (GtkStyleContextClass.PolyML.cPtr --> GtkJunctionSides.PolyML.cVal)
      val getMargin_ =
        call (load_sym libgtk "gtk_style_context_get_margin")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_style_context_get_padding")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getPath_ = call (load_sym libgtk "gtk_style_context_get_path") (GtkStyleContextClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_style_context_get_screen") (GtkStyleContextClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getState_ = call (load_sym libgtk "gtk_style_context_get_state") (GtkStyleContextClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_style_context_get_style_property")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val hasClass_ = call (load_sym libgtk "gtk_style_context_has_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasRegion_ =
        call (load_sym libgtk "gtk_style_context_has_region")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val invalidate_ = call (load_sym libgtk "gtk_style_context_invalidate") (GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val lookupColor_ =
        call (load_sym libgtk "gtk_style_context_lookup_color")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val lookupIconSet_ = call (load_sym libgtk "gtk_style_context_lookup_icon_set") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkIconSetRecord.PolyML.cPtr)
      val popAnimatableRegion_ = call (load_sym libgtk "gtk_style_context_pop_animatable_region") (GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeClass_ = call (load_sym libgtk "gtk_style_context_remove_class") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val removeProvider_ = call (load_sym libgtk "gtk_style_context_remove_provider") (GtkStyleContextClass.PolyML.cPtr &&> GtkStyleProviderClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val removeRegion_ = call (load_sym libgtk "gtk_style_context_remove_region") (GtkStyleContextClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val restore_ = call (load_sym libgtk "gtk_style_context_restore") (GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val save_ = call (load_sym libgtk "gtk_style_context_save") (GtkStyleContextClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val scrollAnimations_ =
        call (load_sym libgtk "gtk_style_context_scroll_animations")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setBackground_ = call (load_sym libgtk "gtk_style_context_set_background") (GtkStyleContextClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setDirection_ = call (load_sym libgtk "gtk_style_context_set_direction") (GtkStyleContextClass.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> PolyMLFFI.cVoid)
      val setJunctionSides_ = call (load_sym libgtk "gtk_style_context_set_junction_sides") (GtkStyleContextClass.PolyML.cPtr &&> GtkJunctionSides.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPath_ = call (load_sym libgtk "gtk_style_context_set_path") (GtkStyleContextClass.PolyML.cPtr &&> GtkWidgetPathRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setScreen_ = call (load_sym libgtk "gtk_style_context_set_screen") (GtkStyleContextClass.PolyML.cPtr &&> GdkScreenClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setState_ = call (load_sym libgtk "gtk_style_context_set_state") (GtkStyleContextClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> PolyMLFFI.cVoid)
      val stateIsRunning_ =
        call (load_sym libgtk "gtk_style_context_state_is_running")
          (
            GtkStyleContextClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
          )
    end
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStyleContextClass.FFI.fromPtr true) new_ ()
    fun addProviderForScreen screen provider priority =
      (
        GdkScreenClass.FFI.withPtr
         &&&> GtkStyleProviderClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         ---> I
      )
        addProviderForScreen_
        (
          screen
           & provider
           & priority
        )
    fun removeProviderForScreen screen provider = (GdkScreenClass.FFI.withPtr &&&> GtkStyleProviderClass.FFI.withPtr ---> I) removeProviderForScreen_ (screen & provider)
    fun resetWidgets screen = (GdkScreenClass.FFI.withPtr ---> I) resetWidgets_ screen
    fun addClass self className = (GtkStyleContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) addClass_ (self & className)
    fun addProvider self provider priority =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> GtkStyleProviderClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
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
        GtkStyleContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
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
            GtkStyleContextClass.FFI.withPtr
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
            GtkStyleContextClass.FFI.withPtr
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
            GtkStyleContextClass.FFI.withPtr
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
            GtkStyleContextClass.FFI.withPtr
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
    fun getDirection self = (GtkStyleContextClass.FFI.withPtr ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getFont self state = (GtkStyleContextClass.FFI.withPtr &&&> GtkStateFlags.FFI.withVal ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ (self & state)
    fun getJunctionSides self = (GtkStyleContextClass.FFI.withPtr ---> GtkJunctionSides.FFI.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GtkStyleContextClass.FFI.withPtr
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
            GtkStyleContextClass.FFI.withPtr
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
    fun getPath self = (GtkStyleContextClass.FFI.withPtr ---> GtkWidgetPathRecord.FFI.fromPtr false) getPath_ self
    fun getScreen self = (GtkStyleContextClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getState self = (GtkStyleContextClass.FFI.withPtr ---> GtkStateFlags.FFI.fromVal) getState_ self
    fun getStyleProperty self propertyName value =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        getStyleProperty_
        (
          self
           & propertyName
           & value
        )
    fun hasClass self className = (GtkStyleContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasClass_ (self & className)
    fun hasRegion self regionName =
      let
        val flagsReturn & retVal =
          (
            GtkStyleContextClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
    fun invalidate self = (GtkStyleContextClass.FFI.withPtr ---> I) invalidate_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkStyleContextClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
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
    fun lookupIconSet self stockId = (GtkStyleContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkIconSetRecord.FFI.fromPtr false) lookupIconSet_ (self & stockId)
    fun popAnimatableRegion self = (GtkStyleContextClass.FFI.withPtr ---> I) popAnimatableRegion_ self
    fun removeClass self className = (GtkStyleContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeClass_ (self & className)
    fun removeProvider self provider = (GtkStyleContextClass.FFI.withPtr &&&> GtkStyleProviderClass.FFI.withPtr ---> I) removeProvider_ (self & provider)
    fun removeRegion self regionName = (GtkStyleContextClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) removeRegion_ (self & regionName)
    fun restore self = (GtkStyleContextClass.FFI.withPtr ---> I) restore_ self
    fun save self = (GtkStyleContextClass.FFI.withPtr ---> I) save_ self
    fun scrollAnimations self window dx dy =
      (
        GtkStyleContextClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
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
    fun setBackground self window = (GtkStyleContextClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> I) setBackground_ (self & window)
    fun setDirection self direction = (GtkStyleContextClass.FFI.withPtr &&&> GtkTextDirection.FFI.withVal ---> I) setDirection_ (self & direction)
    fun setJunctionSides self sides = (GtkStyleContextClass.FFI.withPtr &&&> GtkJunctionSides.FFI.withVal ---> I) setJunctionSides_ (self & sides)
    fun setPath self path = (GtkStyleContextClass.FFI.withPtr &&&> GtkWidgetPathRecord.FFI.withPtr ---> I) setPath_ (self & path)
    fun setScreen self screen = (GtkStyleContextClass.FFI.withPtr &&&> GdkScreenClass.FFI.withPtr ---> I) setScreen_ (self & screen)
    fun setState self flags = (GtkStyleContextClass.FFI.withPtr &&&> GtkStateFlags.FFI.withVal ---> I) setState_ (self & flags)
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GtkStyleContextClass.FFI.withPtr
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
