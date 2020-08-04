structure GtkColorSelection :>
  GTK_COLOR_SELECTION
    where type 'a class = 'a GtkColorSelectionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_color_selection_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_color_selection_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val paletteFromString_ =
        call (getSymbol "gtk_color_selection_palette_from_string")
          (
            Utf8.PolyML.cInPtr
             &&> GdkColorRecordCArrayN.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val paletteToString_ = call (getSymbol "gtk_color_selection_palette_to_string") (GdkColorRecordCArrayN.PolyML.cInPtr &&> GInt.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getCurrentAlpha_ = call (getSymbol "gtk_color_selection_get_current_alpha") (GtkColorSelectionClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getCurrentColor_ = call (getSymbol "gtk_color_selection_get_current_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val getCurrentRgba_ = call (getSymbol "gtk_color_selection_get_current_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val getHasOpacityControl_ = call (getSymbol "gtk_color_selection_get_has_opacity_control") (GtkColorSelectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHasPalette_ = call (getSymbol "gtk_color_selection_get_has_palette") (GtkColorSelectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPreviousAlpha_ = call (getSymbol "gtk_color_selection_get_previous_alpha") (GtkColorSelectionClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getPreviousColor_ = call (getSymbol "gtk_color_selection_get_previous_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val getPreviousRgba_ = call (getSymbol "gtk_color_selection_get_previous_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val isAdjusting_ = call (getSymbol "gtk_color_selection_is_adjusting") (GtkColorSelectionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setCurrentAlpha_ = call (getSymbol "gtk_color_selection_set_current_alpha") (GtkColorSelectionClass.PolyML.cPtr &&> GUInt16.PolyML.cVal --> cVoid)
      val setCurrentColor_ = call (getSymbol "gtk_color_selection_set_current_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setCurrentRgba_ = call (getSymbol "gtk_color_selection_set_current_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setHasOpacityControl_ = call (getSymbol "gtk_color_selection_set_has_opacity_control") (GtkColorSelectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHasPalette_ = call (getSymbol "gtk_color_selection_set_has_palette") (GtkColorSelectionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPreviousAlpha_ = call (getSymbol "gtk_color_selection_set_previous_alpha") (GtkColorSelectionClass.PolyML.cPtr &&> GUInt16.PolyML.cVal --> cVoid)
      val setPreviousColor_ = call (getSymbol "gtk_color_selection_set_previous_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setPreviousRgba_ = call (getSymbol "gtk_color_selection_set_previous_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkColorSelectionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr false ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkColorSelectionClass.FFI.fromPtr false) new_ ()
    fun paletteFromString str =
      let
        val colors
         & nColors
         & retVal =
          (
            Utf8.FFI.withPtr 0
             &&&> GdkColorRecordCArrayN.FFI.withRefOptPtr 0
             &&&> GInt.FFI.withRefVal
             ---> GdkColorRecordCArrayN.FFI.fromPtr ~1
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            paletteFromString_
            (
              str
               & NONE
               & GInt.null
            )
      in
        if retVal then SOME (colors (LargeInt.toInt nColors)) else NONE
      end
    fun paletteToString colors =
      let
        val nColors = LargeInt.fromInt (GdkColorRecordCArrayN.length colors)
        val retVal = (GdkColorRecordCArrayN.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> Utf8.FFI.fromPtr ~1) paletteToString_ (colors & nColors)
      in
        retVal
      end
    fun getCurrentAlpha self = (GtkColorSelectionClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getCurrentAlpha_ self
    fun getCurrentColor self =
      let
        val color & () = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && I) getCurrentColor_ (self & ())
      in
        color
      end
    fun getCurrentRgba self =
      let
        val rgba & () = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) getCurrentRgba_ (self & ())
      in
        rgba
      end
    fun getHasOpacityControl self = (GtkColorSelectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasOpacityControl_ self
    fun getHasPalette self = (GtkColorSelectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasPalette_ self
    fun getPreviousAlpha self = (GtkColorSelectionClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getPreviousAlpha_ self
    fun getPreviousColor self =
      let
        val color & () = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && I) getPreviousColor_ (self & ())
      in
        color
      end
    fun getPreviousRgba self =
      let
        val rgba & () = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) getPreviousRgba_ (self & ())
      in
        rgba
      end
    fun isAdjusting self = (GtkColorSelectionClass.FFI.withPtr false ---> GBool.FFI.fromVal) isAdjusting_ self
    fun setCurrentAlpha self alpha = (GtkColorSelectionClass.FFI.withPtr false &&&> GUInt16.FFI.withVal ---> I) setCurrentAlpha_ (self & alpha)
    fun setCurrentColor self color = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setCurrentColor_ (self & color)
    fun setCurrentRgba self rgba = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setCurrentRgba_ (self & rgba)
    fun setHasOpacityControl self hasOpacity = (GtkColorSelectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasOpacityControl_ (self & hasOpacity)
    fun setHasPalette self hasPalette = (GtkColorSelectionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasPalette_ (self & hasPalette)
    fun setPreviousAlpha self alpha = (GtkColorSelectionClass.FFI.withPtr false &&&> GUInt16.FFI.withVal ---> I) setPreviousAlpha_ (self & alpha)
    fun setPreviousColor self color = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkColorRecord.FFI.withPtr false ---> I) setPreviousColor_ (self & color)
    fun setPreviousRgba self rgba = (GtkColorSelectionClass.FFI.withPtr false &&&> GdkRgbaRecord.FFI.withPtr false ---> I) setPreviousRgba_ (self & rgba)
    local
      open ClosureMarshal Signal
    in
      fun colorChangedSig f = signal "color-changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val currentAlphaProp =
        {
          get = fn x => get "current-alpha" uint x,
          set = fn x => set "current-alpha" uint x,
          new = fn x => new "current-alpha" uint x
        }
      val currentColorProp =
        {
          get = fn x => get "current-color" GdkColorRecord.tOpt x,
          set = fn x => set "current-color" GdkColorRecord.tOpt x,
          new = fn x => new "current-color" GdkColorRecord.tOpt x
        }
      val currentRgbaProp =
        {
          get = fn x => get "current-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "current-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "current-rgba" GdkRgbaRecord.tOpt x
        }
      val hasOpacityControlProp =
        {
          get = fn x => get "has-opacity-control" boolean x,
          set = fn x => set "has-opacity-control" boolean x,
          new = fn x => new "has-opacity-control" boolean x
        }
      val hasPaletteProp =
        {
          get = fn x => get "has-palette" boolean x,
          set = fn x => set "has-palette" boolean x,
          new = fn x => new "has-palette" boolean x
        }
    end
  end
