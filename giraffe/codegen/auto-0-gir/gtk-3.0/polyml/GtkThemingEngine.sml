structure GtkThemingEngine :>
  GTK_THEMING_ENGINE
    where type 'a class = 'a GtkThemingEngineClass.class
    where type text_direction_t = GtkTextDirection.t
    where type junction_sides_t = GtkJunctionSides.t
    where type border_t = GtkBorderRecord.t
    where type widget_path_t = GtkWidgetPathRecord.t
    where type state_flags_t = GtkStateFlags.t
    where type region_flags_t = GtkRegionFlags.t
    where type state_type_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_theming_engine_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val load_ = call (load_sym libgtk "gtk_theming_engine_load") (Utf8.PolyML.cInPtr --> GtkThemingEngineClass.PolyML.cPtr)
      val getBackgroundColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_background_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getBorder_ =
        call (load_sym libgtk "gtk_theming_engine_get_border")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getBorderColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_border_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getDirection_ = call (load_sym libgtk "gtk_theming_engine_get_direction") (GtkThemingEngineClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getFont_ = call (load_sym libgtk "gtk_theming_engine_get_font") (GtkThemingEngineClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getJunctionSides_ = call (load_sym libgtk "gtk_theming_engine_get_junction_sides") (GtkThemingEngineClass.PolyML.cPtr --> GtkJunctionSides.PolyML.cVal)
      val getMargin_ =
        call (load_sym libgtk "gtk_theming_engine_get_margin")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_theming_engine_get_padding")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getPath_ = call (load_sym libgtk "gtk_theming_engine_get_path") (GtkThemingEngineClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_theming_engine_get_screen") (GtkThemingEngineClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getState_ = call (load_sym libgtk "gtk_theming_engine_get_state") (GtkThemingEngineClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_theming_engine_get_style_property")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val hasClass_ = call (load_sym libgtk "gtk_theming_engine_has_class") (GtkThemingEngineClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hasRegion_ =
        call (load_sym libgtk "gtk_theming_engine_has_region")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val lookupColor_ =
        call (load_sym libgtk "gtk_theming_engine_lookup_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val stateIsRunning_ =
        call (load_sym libgtk "gtk_theming_engine_state_is_running")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> FFI.Double.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkThemingEngineClass.class
    type text_direction_t = GtkTextDirection.t
    type junction_sides_t = GtkJunctionSides.t
    type border_t = GtkBorderRecord.t
    type widget_path_t = GtkWidgetPathRecord.t
    type state_flags_t = GtkStateFlags.t
    type region_flags_t = GtkRegionFlags.t
    type state_type_t = GtkStateType.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun load name = (Utf8.C.withPtr ---> GtkThemingEngineClass.C.fromPtr false) load_ name
    fun getBackgroundColor self state =
      let
        val color & () =
          (
            GtkThemingEngineClass.C.withPtr
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
            GtkThemingEngineClass.C.withPtr
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
            GtkThemingEngineClass.C.withPtr
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
            GtkThemingEngineClass.C.withPtr
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
    fun getDirection self = (GtkThemingEngineClass.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getFont self state = (GtkThemingEngineClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> PangoFontDescriptionRecord.C.fromPtr false) getFont_ (self & state)
    fun getJunctionSides self = (GtkThemingEngineClass.C.withPtr ---> GtkJunctionSides.C.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GtkThemingEngineClass.C.withPtr
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
            GtkThemingEngineClass.C.withPtr
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
    fun getPath self = (GtkThemingEngineClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr false) getPath_ self
    fun getScreen self = (GtkThemingEngineClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getState self = (GtkThemingEngineClass.C.withPtr ---> GtkStateFlags.C.fromVal) getState_ self
    fun getStyleProperty self propertyName value =
      (
        GtkThemingEngineClass.C.withPtr
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
    fun hasClass self styleClass = (GtkThemingEngineClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasClass_ (self & styleClass)
    fun hasRegion self styleRegion =
      let
        val flags & retVal =
          (
            GtkThemingEngineClass.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GtkRegionFlags.C.withRefVal
             ---> GtkRegionFlags.C.fromVal && FFI.Bool.C.fromVal
          )
            hasRegion_
            (
              self
               & styleRegion
               & GtkRegionFlags.flags []
            )
      in
        if retVal then SOME flags else NONE
      end
    fun lookupColor self colorName =
      let
        val color & retVal =
          (
            GtkThemingEngineClass.C.withPtr
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
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GtkThemingEngineClass.C.withPtr
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
      open Property
    in
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
    end
  end
