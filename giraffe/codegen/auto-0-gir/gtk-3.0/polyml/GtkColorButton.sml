structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_button_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_color_button_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithColor_ = call (load_sym libgtk "gtk_color_button_new_with_color") (GdkColorRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithRgba_ = call (load_sym libgtk "gtk_color_button_new_with_rgba") (GdkRgbaRecord.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAlpha_ = call (load_sym libgtk "gtk_color_button_get_alpha") (GtkColorButtonClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getColor_ = call (load_sym libgtk "gtk_color_button_get_color") (GtkColorButtonClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getRgba_ = call (load_sym libgtk "gtk_color_button_get_rgba") (GtkColorButtonClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getTitle_ = call (load_sym libgtk "gtk_color_button_get_title") (GtkColorButtonClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseAlpha_ = call (load_sym libgtk "gtk_color_button_get_use_alpha") (GtkColorButtonClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAlpha_ = call (load_sym libgtk "gtk_color_button_set_alpha") (GtkColorButtonClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> PolyMLFFI.cVoid)
      val setColor_ = call (load_sym libgtk "gtk_color_button_set_color") (GtkColorButtonClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setRgba_ = call (load_sym libgtk "gtk_color_button_set_rgba") (GtkColorButtonClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_color_button_set_title") (GtkColorButtonClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setUseAlpha_ = call (load_sym libgtk "gtk_color_button_set_use_alpha") (GtkColorButtonClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkColorButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkColorButtonClass.C.fromPtr false) new_ ()
    fun newWithColor color = (GdkColorRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithColor_ color
    fun newWithRgba rgba = (GdkRgbaRecord.C.withPtr ---> GtkColorButtonClass.C.fromPtr false) newWithRgba_ rgba
    fun getAlpha self = (GtkColorButtonClass.C.withPtr ---> FFI.UInt16.C.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GtkColorButtonClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getRgba self =
      let
        val rgba & () = (GtkColorButtonClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getRgba_ (self & ())
      in
        rgba
      end
    fun getTitle self = (GtkColorButtonClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getUseAlpha self = (GtkColorButtonClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GtkColorButtonClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GtkColorButtonClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColor_ (self & color)
    fun setRgba self rgba = (GtkColorButtonClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setRgba_ (self & rgba)
    fun setTitle self title = (GtkColorButtonClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GtkColorButtonClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseAlpha_ (self & useAlpha)
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
