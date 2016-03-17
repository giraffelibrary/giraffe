structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class = 'a GtkColorButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_color_button_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithColor_ = call (load_sym libgtk "gtk_color_button_new_with_color") (GdkColorRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithRgba_ = call (load_sym libgtk "gtk_color_button_new_with_rgba") (GdkRgbaRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAlpha_ = call (load_sym libgtk "gtk_color_button_get_alpha") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getColor_ = call (load_sym libgtk "gtk_color_button_get_color") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getRgba_ = call (load_sym libgtk "gtk_color_button_get_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getTitle_ = call (load_sym libgtk "gtk_color_button_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseAlpha_ = call (load_sym libgtk "gtk_color_button_get_use_alpha") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAlpha_ = call (load_sym libgtk "gtk_color_button_set_alpha") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt16.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColor_ = call (load_sym libgtk "gtk_color_button_set_color") (GObjectObjectClass.PolyML.cPtr &&> GdkColorRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setRgba_ = call (load_sym libgtk "gtk_color_button_set_rgba") (GObjectObjectClass.PolyML.cPtr &&> GdkRgbaRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_color_button_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setUseAlpha_ = call (load_sym libgtk "gtk_color_button_set_use_alpha") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
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
    fun getAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getAlpha_ self
    fun getColor self =
      let
        val color & () = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && I) getColor_ (self & ())
      in
        color
      end
    fun getRgba self =
      let
        val rgba & () = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withNewPtr ---> GdkRgbaRecord.C.fromPtr true && I) getRgba_ (self & ())
      in
        rgba
      end
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getUseAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseAlpha_ self
    fun setAlpha self alpha = (GObjectObjectClass.C.withPtr &&&> FFI.UInt16.C.withVal ---> I) setAlpha_ (self & alpha)
    fun setColor self color = (GObjectObjectClass.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) setColor_ (self & color)
    fun setRgba self rgba = (GObjectObjectClass.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) setRgba_ (self & rgba)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setUseAlpha self useAlpha = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseAlpha_ (self & useAlpha)
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
