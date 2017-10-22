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
      val getType_ = call (getSymbol "gtk_theming_engine_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val load_ = call (getSymbol "gtk_theming_engine_load") (Utf8.PolyML.cInPtr --> GtkThemingEngineClass.PolyML.cPtr)
      val getBackgroundColor_ =
        call (getSymbol "gtk_theming_engine_get_background_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getBorder_ =
        call (getSymbol "gtk_theming_engine_get_border")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getBorderColor_ =
        call (getSymbol "gtk_theming_engine_get_border_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getColor_ =
        call (getSymbol "gtk_theming_engine_get_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cPtr
             --> cVoid
          )
      val getDirection_ = call (getSymbol "gtk_theming_engine_get_direction") (GtkThemingEngineClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getFont_ = call (getSymbol "gtk_theming_engine_get_font") (GtkThemingEngineClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getJunctionSides_ = call (getSymbol "gtk_theming_engine_get_junction_sides") (GtkThemingEngineClass.PolyML.cPtr --> GtkJunctionSides.PolyML.cVal)
      val getMargin_ =
        call (getSymbol "gtk_theming_engine_get_margin")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getPadding_ =
        call (getSymbol "gtk_theming_engine_get_padding")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GtkBorderRecord.PolyML.cPtr
             --> cVoid
          )
      val getPath_ = call (getSymbol "gtk_theming_engine_get_path") (GtkThemingEngineClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getScreen_ = call (getSymbol "gtk_theming_engine_get_screen") (GtkThemingEngineClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getState_ = call (getSymbol "gtk_theming_engine_get_state") (GtkThemingEngineClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyleProperty_ =
        call (getSymbol "gtk_theming_engine_get_style_property")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val hasClass_ = call (getSymbol "gtk_theming_engine_has_class") (GtkThemingEngineClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasRegion_ =
        call (getSymbol "gtk_theming_engine_has_region")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRegionFlags.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val lookupColor_ =
        call (getSymbol "gtk_theming_engine_lookup_color")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val stateIsRunning_ =
        call (getSymbol "gtk_theming_engine_state_is_running")
          (
            GtkThemingEngineClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GDouble.PolyML.cRef
             --> GBool.PolyML.cVal
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun load name = (Utf8.FFI.withPtr ---> GtkThemingEngineClass.FFI.fromPtr false) load_ name
    fun getBackgroundColor self state =
      let
        val color & () =
          (
            GtkThemingEngineClass.FFI.withPtr
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
            GtkThemingEngineClass.FFI.withPtr
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
            GtkThemingEngineClass.FFI.withPtr
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
            GtkThemingEngineClass.FFI.withPtr
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
    fun getDirection self = (GtkThemingEngineClass.FFI.withPtr ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getFont self state = (GtkThemingEngineClass.FFI.withPtr &&&> GtkStateFlags.FFI.withVal ---> PangoFontDescriptionRecord.FFI.fromPtr false) getFont_ (self & state)
    fun getJunctionSides self = (GtkThemingEngineClass.FFI.withPtr ---> GtkJunctionSides.FFI.fromVal) getJunctionSides_ self
    fun getMargin self state =
      let
        val margin & () =
          (
            GtkThemingEngineClass.FFI.withPtr
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
            GtkThemingEngineClass.FFI.withPtr
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
    fun getPath self = (GtkThemingEngineClass.FFI.withPtr ---> GtkWidgetPathRecord.FFI.fromPtr false) getPath_ self
    fun getScreen self = (GtkThemingEngineClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self
    fun getState self = (GtkThemingEngineClass.FFI.withPtr ---> GtkStateFlags.FFI.fromVal) getState_ self
    fun getStyleProperty self propertyName =
      let
        val value & () =
          (
            GtkThemingEngineClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GObjectValueRecord.FFI.withNewPtr
             ---> GObjectValueRecord.FFI.fromPtr true && I
          )
            getStyleProperty_
            (
              self
               & propertyName
               & ()
            )
      in
        value
      end
    fun hasClass self styleClass = (GtkThemingEngineClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasClass_ (self & styleClass)
    fun hasRegion self styleRegion =
      let
        val flags & retVal =
          (
            GtkThemingEngineClass.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GtkRegionFlags.FFI.withRefVal
             ---> GtkRegionFlags.FFI.fromVal && GBool.FFI.fromVal
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
            GtkThemingEngineClass.FFI.withPtr
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
    fun stateIsRunning self state =
      let
        val progress & retVal =
          (
            GtkThemingEngineClass.FFI.withPtr
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
      open Property
    in
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
    end
  end
