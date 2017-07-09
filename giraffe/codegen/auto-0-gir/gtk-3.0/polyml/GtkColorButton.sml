structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_color_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_color_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithColor_ = call (getSymbol "gtk_color_button_new_with_color") (GdkColorRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithRgba_ = call (getSymbol "gtk_color_button_new_with_rgba") (GdkRgbaRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAlpha_ = call (getSymbol "gtk_color_button_get_alpha") (GtkColorButtonClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getColor_ = call (getSymbol "gtk_color_button_get_color") (GtkColorButtonClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val getRgba_ = call (getSymbol "gtk_color_button_get_rgba") (GtkColorButtonClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val getTitle_ = call (getSymbol "gtk_color_button_get_title") (GtkColorButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseAlpha_ = call (getSymbol "gtk_color_button_get_use_alpha") (GtkColorButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAlpha_ = call (getSymbol "gtk_color_button_set_alpha") (GtkColorButtonClass.PolyML.cPtr &&> GUInt16.PolyML.cVal --> cVoid)
      val setColor_ = call (getSymbol "gtk_color_button_set_color") (GtkColorButtonClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> cVoid)
      val setRgba_ = call (getSymbol "gtk_color_button_set_rgba") (GtkColorButtonClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> cVoid)
      val setTitle_ = call (getSymbol "gtk_color_button_set_title") (GtkColorButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setUseAlpha_ = call (getSymbol "gtk_color_button_set_use_alpha") (GtkColorButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkColorButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.FFI.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.FFI.withPtr ---> GtkColorButtonClass.FFI.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.FFI.withPtr ---> GtkColorButtonClass.FFI.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GtkColorButtonClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GtkColorButtonClass.FFI.withPtr &&&> GdkColorRecord.FFI.withNewPtr ---> GdkColorRecord.FFI.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getRgba self =
      let
        val rgba & () = (GtkColorButtonClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withNewPtr ---> GdkRgbaRecord.FFI.fromPtr true && I) getRgba_ (self & ())
      in
        rgba
      end
    fun getTitle self = (GtkColorButtonClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getUseAlpha self = (GtkColorButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GtkColorButtonClass.FFI.withPtr &&&> GUInt16.FFI.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GtkColorButtonClass.FFI.withPtr &&&> GdkColorRecord.FFI.withPtr ---> I) setColor_ (self & color)
    fun setRgba self rgba = (GtkColorButtonClass.FFI.withPtr &&&> GdkRgbaRecord.FFI.withPtr ---> I) setRgba_ (self & rgba)
    fun setTitle self title = (GtkColorButtonClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GtkColorButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseAlpha_ (self & useAlpha)
    local
      open ClosureMarshal Signal
    in
      fun colorSetSig f = signal "color-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val alphaProp =
        {
          get = fn x => get "alpha" uint x,
          set = fn x => set "alpha" uint x
        }
      val colorProp =
        {
          get = fn x => get "color" GdkColorRecord.tOpt x,
          set = fn x => set "color" GdkColorRecord.tOpt x
        }
      val rgbaProp =
        {
          get = fn x => get "rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "rgba" GdkRgbaRecord.tOpt x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val useAlphaProp =
        {
          get = fn x => get "use-alpha" boolean x,
          set = fn x => set "use-alpha" boolean x
        }
    end
  end
