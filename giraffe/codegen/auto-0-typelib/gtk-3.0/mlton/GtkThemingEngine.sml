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
    val getType_ = _import "gtk_theming_engine_get_type" : unit -> GObjectType.FFI.val_;
    val load_ = _import "mlton_gtk_theming_engine_load" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p;
    val getBackgroundColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_theming_engine_get_background_color" :
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDirection_ = _import "gtk_theming_engine_get_direction" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p -> GtkTextDirection.FFI.val_;
    val getFont_ = fn x1 & x2 => (_import "gtk_theming_engine_get_font" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p * GtkStateFlags.FFI.val_ -> PangoFontDescriptionRecord.FFI.notnull PangoFontDescriptionRecord.FFI.p;) (x1, x2)
    val getJunctionSides_ = _import "gtk_theming_engine_get_junction_sides" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p -> GtkJunctionSides.FFI.val_;
    val getMargin_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_theming_engine_get_margin" :
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GtkBorderRecord.FFI.notnull GtkBorderRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPath_ = _import "gtk_theming_engine_get_path" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p -> GtkWidgetPathRecord.FFI.notnull GtkWidgetPathRecord.FFI.p;
    val getScreen_ = _import "gtk_theming_engine_get_screen" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;
    val getState_ = _import "gtk_theming_engine_get_state" : GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p -> GtkStateFlags.FFI.val_;
    val getStyleProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_theming_engine_get_style_property" :
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
            _import "mlton_gtk_theming_engine_has_region" :
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkRegionFlags.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GdkRgbaRecord.FFI.notnull GdkRgbaRecord.FFI.p
               -> GBool.FFI.val_;
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
              GtkThemingEngineClass.FFI.notnull GtkThemingEngineClass.FFI.p
               * GtkStateType.FFI.val_
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
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
    fun getStyleProperty self propertyName value =
      (
        GtkThemingEngineClass.FFI.withPtr
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
