structure GtkThemingEngine :>
  GTK_THEMING_ENGINE
    where type 'a class_t = 'a GtkThemingEngineClass.t
    where type text_direction_t = GtkTextDirection.t
    where type junction_sides_t = GtkJunctionSides.t
    where type border_record_t = GtkBorderRecord.t
    where type widget_path_record_t = GtkWidgetPathRecord.t
    where type state_flags_t = GtkStateFlags.t
    where type region_flags_t = GtkRegionFlags.t
    where type state_type_t = GtkStateType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_theming_engine_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val load_ = call (load_sym libgtk "gtk_theming_engine_load") (Utf8.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getBackgroundColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_background_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBorder_ =
        call (load_sym libgtk "gtk_theming_engine_get_border")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getBorderColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_border_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getColor_ =
        call (load_sym libgtk "gtk_theming_engine_get_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getDirection_ = call (load_sym libgtk "gtk_theming_engine_get_direction") (GObjectObjectClass.PolyML.PTR --> GtkTextDirection.PolyML.VAL)
      val getFont_ = call (load_sym libgtk "gtk_theming_engine_get_font") (GObjectObjectClass.PolyML.PTR &&> GtkStateFlags.PolyML.VAL --> PangoFontDescriptionRecord.PolyML.PTR)
      val getJunctionSides_ = call (load_sym libgtk "gtk_theming_engine_get_junction_sides") (GObjectObjectClass.PolyML.PTR --> GtkJunctionSides.PolyML.VAL)
      val getMargin_ =
        call (load_sym libgtk "gtk_theming_engine_get_margin")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPadding_ =
        call (load_sym libgtk "gtk_theming_engine_get_padding")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateFlags.PolyML.VAL
             &&> GtkBorderRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val getPath_ = call (load_sym libgtk "gtk_theming_engine_get_path") (GObjectObjectClass.PolyML.PTR --> GtkWidgetPathRecord.PolyML.PTR)
      val getScreen_ = call (load_sym libgtk "gtk_theming_engine_get_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getState_ = call (load_sym libgtk "gtk_theming_engine_get_state") (GObjectObjectClass.PolyML.PTR --> GtkStateFlags.PolyML.VAL)
      val getStyleProperty_ =
        call (load_sym libgtk "gtk_theming_engine_get_style_property")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GObjectValueRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val hasClass_ = call (load_sym libgtk "gtk_theming_engine_has_class") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val hasRegion_ =
        call (load_sym libgtk "gtk_theming_engine_has_region")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GtkRegionFlags.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val lookupColor_ =
        call (load_sym libgtk "gtk_theming_engine_lookup_color")
          (
            GObjectObjectClass.PolyML.PTR
             &&> Utf8.PolyML.INPTR
             &&> GdkRgbaRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val stateIsRunning_ =
        call (load_sym libgtk "gtk_theming_engine_state_is_running")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GtkStateType.PolyML.VAL
             &&> FFI.Double.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a GtkThemingEngineClass.t
    type text_direction_t = GtkTextDirection.t
    type junction_sides_t = GtkJunctionSides.t
    type border_record_t = GtkBorderRecord.t
    type widget_path_record_t = GtkWidgetPathRecord.t
    type state_flags_t = GtkStateFlags.t
    type region_flags_t = GtkRegionFlags.t
    type state_type_t = GtkStateType.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun load name = (Utf8.C.withPtr ---> GtkThemingEngineClass.C.fromPtr false) load_ name
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
    fun hasClass self styleClass = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasClass_ (self & styleClass)
    fun hasRegion self styleRegion =
      let
        val flags & retVal =
          (
            GObjectObjectClass.C.withPtr
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
      open Property
    in
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
    end
  end
