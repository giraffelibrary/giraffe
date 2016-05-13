structure GtkColorSelection :>
  GTK_COLOR_SELECTION
    where type 'a class = 'a GtkColorSelectionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_selection_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_color_selection_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getCurrentAlpha_ = call (load_sym libgtk "gtk_color_selection_get_current_alpha") (GtkColorSelectionClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getCurrentColor_ = call (load_sym libgtk "gtk_color_selection_get_current_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getCurrentRgba_ = call (load_sym libgtk "gtk_color_selection_get_current_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getHasOpacityControl_ = call (load_sym libgtk "gtk_color_selection_get_has_opacity_control") (GtkColorSelectionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHasPalette_ = call (load_sym libgtk "gtk_color_selection_get_has_palette") (GtkColorSelectionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPreviousAlpha_ = call (load_sym libgtk "gtk_color_selection_get_previous_alpha") (GtkColorSelectionClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getPreviousColor_ = call (load_sym libgtk "gtk_color_selection_get_previous_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getPreviousRgba_ = call (load_sym libgtk "gtk_color_selection_get_previous_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val isAdjusting_ = call (load_sym libgtk "gtk_color_selection_is_adjusting") (GtkColorSelectionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setCurrentAlpha_ = call (load_sym libgtk "gtk_color_selection_set_current_alpha") (GtkColorSelectionClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> PolyMLFFI.cVoid)
      val setCurrentColor_ = call (load_sym libgtk "gtk_color_selection_set_current_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setCurrentRgba_ = call (load_sym libgtk "gtk_color_selection_set_current_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setHasOpacityControl_ = call (load_sym libgtk "gtk_color_selection_set_has_opacity_control") (GtkColorSelectionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHasPalette_ = call (load_sym libgtk "gtk_color_selection_set_has_palette") (GtkColorSelectionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPreviousAlpha_ = call (load_sym libgtk "gtk_color_selection_set_previous_alpha") (GtkColorSelectionClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPreviousColor_ = call (load_sym libgtk "gtk_color_selection_set_previous_color") (GtkColorSelectionClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setPreviousRgba_ = call (load_sym libgtk "gtk_color_selection_set_previous_rgba") (GtkColorSelectionClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkColorSelectionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.C.withPtr ---> GtkOrientableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkColorSelectionClass.C.fromPtr false) new_ ()
    fun getCurrentAlpha self = (GtkColorSelectionClass.C.withPtr ---> FFI.UInt16.C.fromVal) getCurrentAlpha_ self
    fun getCurrentColor self =
      let
        val color & () = (GtkColorSelectionClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getCurrentColor_ (self & ())
      in
        color
      end
    fun getCurrentRgba self =
      let
        val rgba & () = (GtkColorSelectionClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getCurrentRgba_ (self & ())
      in
        rgba
      end
    fun getHasOpacityControl self = (GtkColorSelectionClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasOpacityControl_ self
    fun getHasPalette self = (GtkColorSelectionClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasPalette_ self
    fun getPreviousAlpha self = (GtkColorSelectionClass.C.withPtr ---> FFI.UInt16.C.fromVal) getPreviousAlpha_ self
    fun getPreviousColor self =
      let
        val color & () = (GtkColorSelectionClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getPreviousColor_ (self & ())
      in
        color
      end
    fun getPreviousRgba self =
      let
        val rgba & () = (GtkColorSelectionClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getPreviousRgba_ (self & ())
      in
        rgba
      end
    fun isAdjusting self = (GtkColorSelectionClass.C.withPtr ---> FFI.Bool.C.fromVal) isAdjusting_ self
    fun setCurrentAlpha self alpha = (GtkColorSelectionClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setCurrentAlpha_ (self & alpha)
    fun setCurrentColor self color = (GtkColorSelectionClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setCurrentColor_ (self & color)
    fun setCurrentRgba self rgba = (GtkColorSelectionClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setCurrentRgba_ (self & rgba)
    fun setHasOpacityControl self hasOpacity = (GtkColorSelectionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasOpacityControl_ (self & hasOpacity)
    fun setHasPalette self hasPalette = (GtkColorSelectionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasPalette_ (self & hasPalette)
    fun setPreviousAlpha self alpha = (GtkColorSelectionClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setPreviousAlpha_ (self & alpha)
    fun setPreviousColor self color = (GtkColorSelectionClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setPreviousColor_ (self & color)
    fun setPreviousRgba self rgba = (GtkColorSelectionClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setPreviousRgba_ (self & rgba)
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
          set = fn x => set "current-alpha" uint x
        }
      val currentColorProp =
        {
          get = fn x => get "current-color" GdkColorRecord.tOpt x,
          set = fn x => set "current-color" GdkColorRecord.tOpt x
        }
      val currentRgbaProp =
        {
          get = fn x => get "current-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "current-rgba" GdkRgbaRecord.tOpt x
        }
      val hasOpacityControlProp =
        {
          get = fn x => get "has-opacity-control" boolean x,
          set = fn x => set "has-opacity-control" boolean x
        }
      val hasPaletteProp =
        {
          get = fn x => get "has-palette" boolean x,
          set = fn x => set "has-palette" boolean x
        }
    end
  end
