structure GtkColorButton :>
  GTK_COLOR_BUTTON
    where type 'a class_t = 'a GtkColorButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_color_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_color_button_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithColor_ = call (load_sym libgtk "gtk_color_button_new_with_color") (GdkColorRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val newWithRgba_ = call (load_sym libgtk "gtk_color_button_new_with_rgba") (GdkRgbaRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAlpha_ = call (load_sym libgtk "gtk_color_button_get_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.UInt16.PolyML.VAL)
      val getColor_ = call (load_sym libgtk "gtk_color_button_get_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getRgba_ = call (load_sym libgtk "gtk_color_button_get_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val getTitle_ = call (load_sym libgtk "gtk_color_button_get_title") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getUseAlpha_ = call (load_sym libgtk "gtk_color_button_get_use_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setAlpha_ = call (load_sym libgtk "gtk_color_button_set_alpha") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt16.PolyML.VAL --> FFI.PolyML.VOID)
      val setColor_ = call (load_sym libgtk "gtk_color_button_set_color") (GObjectObjectClass.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setRgba_ = call (load_sym libgtk "gtk_color_button_set_rgba") (GObjectObjectClass.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setTitle_ = call (load_sym libgtk "gtk_color_button_set_title") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setUseAlpha_ = call (load_sym libgtk "gtk_color_button_set_use_alpha") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkColorButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type t = base class_t
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
