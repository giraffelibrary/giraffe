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
    val getType_ = _import "gtk_theming_engine_get_type" : unit -> GObjectType.C.val_;
    val load_ = _import "mlton_gtk_theming_engine_load" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p;
    val getBackgroundColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_theming_engine_get_background_color" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "gtk_theming_engine_get_border" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "gtk_theming_engine_get_border_color" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "gtk_theming_engine_get_color" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
               * GtkStateFlags.C.val_
               * GdkRgbaRecord.C.notnull GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDirection_ = _import "gtk_theming_engine_get_direction" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p -> GtkTextDirection.C.val_;
    val getFont_ = fn x1 & x2 => (_import "gtk_theming_engine_get_font" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p * GtkStateFlags.C.val_ -> PangoFontDescriptionRecord.C.notnull PangoFontDescriptionRecord.C.p;) (x1, x2)
    val getJunctionSides_ = _import "gtk_theming_engine_get_junction_sides" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p -> GtkJunctionSides.C.val_;
    val getMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_theming_engine_get_margin" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "gtk_theming_engine_get_padding" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
               * GtkStateFlags.C.val_
               * GtkBorderRecord.C.notnull GtkBorderRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPath_ = _import "gtk_theming_engine_get_path" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;
    val getScreen_ = _import "gtk_theming_engine_get_screen" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getState_ = _import "gtk_theming_engine_get_state" : GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p -> GtkStateFlags.C.val_;
    val getStyleProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_theming_engine_get_style_property" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "mlton_gtk_theming_engine_has_class" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
            _import "mlton_gtk_theming_engine_has_region" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
    val lookupColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_theming_engine_lookup_color" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
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
    val stateIsRunning_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_theming_engine_state_is_running" :
              GtkThemingEngineClass.C.notnull GtkThemingEngineClass.C.p
               * GtkStateType.C.val_
               * FFI.Double.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
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
