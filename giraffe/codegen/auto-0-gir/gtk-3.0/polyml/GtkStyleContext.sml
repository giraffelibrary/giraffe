structure GtkStyleContext :>
  GTK_STYLE_CONTEXT
    where type 'a class_t = 'a GtkStyleContextClass.t
    where type border_record_t = GtkBorderRecord.t
    where type region_flags_t = GtkRegionFlags.t
    where type icon_set_record_t = GtkIconSetRecord.t
    where type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    where type junction_sides_t = GtkJunctionSides.t
    where type widget_path_record_t = GtkWidgetPathRecord.t
    where type state_flags_t = GtkStateFlags.t
    where type state_type_t = GtkStateType.t
    where type text_direction_t = GtkTextDirection.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_style_context_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_style_context_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addProviderForScreen_ =
        call (load_sym libgtk "gtk_style_context_add_provider_for_screen")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val removeProviderForScreen_ = call (load_sym libgtk "gtk_style_context_remove_provider_for_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val resetWidgets_ = call (load_sym libgtk "gtk_style_context_reset_widgets") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val addClass_ = call (load_sym libgtk "gtk_style_context_add_class") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val addProvider_ =
        call (load_sym libgtk "gtk_style_context_add_provider")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val addRegion_ =
        call (load_sym libgtk "gtk_style_context_add_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkRegionFlags.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val getBackgroundColor_ =
        call (load_sym libgtk "gtk_style_context_get_background_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBorder_ =
        call (load_sym libgtk "gtk_style_context_get_border")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBorderColor_ =
        call (load_sym libgtk "gtk_style_context_get_border_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getColor_ =
        call (load_sym libgtk "gtk_style_context_get_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getDirection_ = call (load_sym libgtk "gtk_style_context_get_direction") (GObjectObjectClass.PolyML.PTR --> GtkTextDirection.PolyML.VAL)
      val getFont_ = call (load_sym libgtk "gtk_style_context_get_font") (GObjectObjectClass.PolyML.PTR &&> GtkStateFlags.PolyML.VAL --> PangoFontDescriptionRecord.PolyML.PTR)
      val getJunctionSides_ = call (load_sym libgtk "gtk_style_context_get_junction_sides") (GObjectObjectClass.PolyML.PTR --> GtkJunctionSides.PolyML.VAL)
      val getMargin_ =
        call (load_sym libgtk "gtk_style_context_get_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_style_context_get_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPath_ = call (load_sym libgtk "gtk_style_context_get_path") (GObjectObjectClass.PolyML.PTR --> GtkWidgetPathRecord.PolyML.PTR)
      val getScreen_ = call (load_sym libgtk "gtk_style_context_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getState_ = call (load_sym libgtk "gtk_style_context_get_state") (GObjectObjectClass.PolyML.PTR --> GtkStateFlags.PolyML.VAL)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_style_context_get_style_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val hasClass_ = call (load_sym libgtk "gtk_style_context_has_class") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val hasRegion_ =
        call (load_sym libgtk "gtk_style_context_has_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkRegionFlags.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val invalidate_ = call (load_sym libgtk "gtk_style_context_invalidate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val lookupColor_ =
        call (load_sym libgtk "gtk_style_context_lookup_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val lookupIconSet_ = call (load_sym libgtk "gtk_style_context_lookup_icon_set") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> GtkIconSetRecord.PolyML.PTR)
      val popAnimatableRegion_ = call (load_sym libgtk "gtk_style_context_pop_animatable_region") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeClass_ = call (load_sym libgtk "gtk_style_context_remove_class") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val removeProvider_ = call (load_sym libgtk "gtk_style_context_remove_provider") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val removeRegion_ = call (load_sym libgtk "gtk_style_context_remove_region") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val restore_ = call (load_sym libgtk "gtk_style_context_restore") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val save_ = call (load_sym libgtk "gtk_style_context_save") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val scrollAnimations_ =
        call (load_sym libgtk "gtk_style_context_scroll_animations")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setBackground_ = call (load_sym libgtk "gtk_style_context_set_background") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setDirection_ = call (load_sym libgtk "gtk_style_context_set_direction") (GObjectObjectClass.PolyML.PTR &&> GtkTextDirection.PolyML.VAL --> FFI.PolyML.VOID)
      val setJunctionSides_ = call (load_sym libgtk "gtk_style_context_set_junction_sides") (GObjectObjectClass.PolyML.PTR &&> GtkJunctionSides.PolyML.VAL --> FFI.PolyML.VOID)
      val setPath_ = call (load_sym libgtk "gtk_style_context_set_path") (GObjectObjectClass.PolyML.PTR &&> GtkWidgetPathRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setScreen_ = call (load_sym libgtk "gtk_style_context_set_screen") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setState_ = call (load_sym libgtk "gtk_style_context_set_state") (GObjectObjectClass.PolyML.PTR &&> GtkStateFlags.PolyML.VAL --> FFI.PolyML.VOID)
      val stateIsRunning_ =
        call (load_sym libgtk "gtk_style_context_state_is_running")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateType.PolyML.VAL
             &&> FFI.Double.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GtkStyleContextClass.t
    type border_record_t = GtkBorderRecord.t
    type region_flags_t = GtkRegionFlags.t
    type icon_set_record_t = GtkIconSetRecord.t
    type 'a style_provider_class_t = 'a GtkStyleProviderClass.t
    type junction_sides_t = GtkJunctionSides.t
    type widget_path_record_t = GtkWidgetPathRecord.t
    type state_flags_t = GtkStateFlags.t
    type state_type_t = GtkStateType.t
    type text_direction_t = GtkTextDirection.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkStyleContextClass.C.fromPtr true) new_ ()
    fun addProviderForScreen screen provider priority =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         ---> I
      )
        addProviderForScreen_
        (
          screen
           & provider
           & priority
        )
    fun removeProviderForScreen screen provider = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeProviderForScreen_ (screen & provider)
    fun resetWidgets screen = (GObjectObjectClass.C.withPtr ---> I) resetWidgets_ screen
    fun addClass self className = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) addClass_ (self & className)
    fun addProvider self provider priority =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun getDirection self = (GObjectObjectClass.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getFont self state = (GObjectObjectClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ (self & state)
    fun getJunctionSides self = (GObjectObjectClass.C.withPtr ---> GtkJunctionSides.C.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
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
    fun getPath self = (GObjectObjectClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr false) getPath_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getState self = (GObjectObjectClass.C.withPtr ---> GtkStateFlags.C.fromVal) getState_ self
    fun getStyleProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
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
    fun hasClass self className = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasClass_ (self & className)
    fun hasRegion self regionName =
      let
        val flagsReturn & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun invalidate self = (GObjectObjectClass.C.withPtr ---> I) invalidate_ self
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun lookupIconSet self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> GtkIconSetRecord.C.fromPtr false) lookupIconSet_ (self & stockId)
    fun popAnimatableRegion self = (GObjectObjectClass.C.withPtr ---> I) popAnimatableRegion_ self
    fun removeClass self className = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeClass_ (self & className)
    fun removeProvider self provider = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeProvider_ (self & provider)
    fun removeRegion self regionName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) removeRegion_ (self & regionName)
    fun restore self = (GObjectObjectClass.C.withPtr ---> I) restore_ self
    fun save self = (GObjectObjectClass.C.withPtr ---> I) save_ self
    fun scrollAnimations self window dx dy =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun setBackground self window = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setBackground_ (self & window)
    fun setDirection self direction = (GObjectObjectClass.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & direction)
    fun setJunctionSides self sides = (GObjectObjectClass.C.withPtr &&&> GtkJunctionSides.C.withVal ---> I) setJunctionSides_ (self & sides)
    fun setPath self path = (GObjectObjectClass.C.withPtr &&&> GtkWidgetPathRecord.C.withPtr ---> I) setPath_ (self & path)
    fun setScreen self screen = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setScreen_ (self & screen)
    fun setState self flags = (GObjectObjectClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> I) setState_ (self & flags)
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GObjectObjectClass.C.withPtr
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
