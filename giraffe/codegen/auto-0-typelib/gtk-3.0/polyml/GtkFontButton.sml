structure GtkFontButton :>
  GTK_FONT_BUTTON
    where type 'a class_t = 'a GtkFontButtonClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a font_chooser_class_t = 'a GtkFontChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_font_button_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithFont_ = call (load_sym libgtk "gtk_font_button_new_with_font") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getFontName_ = call (load_sym libgtk "gtk_font_button_get_font_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowSize_ = call (load_sym libgtk "gtk_font_button_get_show_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShowStyle_ = call (load_sym libgtk "gtk_font_button_get_show_style") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_font_button_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUseFont_ = call (load_sym libgtk "gtk_font_button_get_use_font") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getUseSize_ = call (load_sym libgtk "gtk_font_button_get_use_size") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setFontName_ = call (load_sym libgtk "gtk_font_button_set_font_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val setShowSize_ = call (load_sym libgtk "gtk_font_button_set_show_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setShowStyle_ = call (load_sym libgtk "gtk_font_button_set_show_style") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_font_button_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setUseFont_ = call (load_sym libgtk "gtk_font_button_set_use_font") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setUseSize_ = call (load_sym libgtk "gtk_font_button_set_use_size") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkFontButtonClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a font_chooser_class_t = 'a GtkFontChooserClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asFontChooser self = (GObjectObjectClass.C.withPtr ---> GtkFontChooserClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkFontButtonClass.C.fromPtr false) new_ ()
    fun newWithFont fontname = (Utf8.C.withPtr ---> GtkFontButtonClass.C.fromPtr false) newWithFont_ fontname
    fun getFontName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getFontName_ self
    fun getShowSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowSize_ self
    fun getShowStyle self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowStyle_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getUseFont self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseFont_ self
    fun getUseSize self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseSize_ self
    fun setFontName self fontname = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) setFontName_ (self & fontname)
    fun setShowSize self showSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowSize_ (self & showSize)
    fun setShowStyle self showStyle = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowStyle_ (self & showStyle)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setUseFont self useFont = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseFont_ (self & useFont)
    fun setUseSize self useSize = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseSize_ (self & useSize)
    local
      open ClosureMarshal Signal
    in
      fun fontSetSig f = signal "font-set" (void ---> ret_void) f
    end
    local
      open Property
    in
      val fontNameProp =
        {
          get = fn x => get "font-name" stringOpt x,
          set = fn x => set "font-name" stringOpt x
        }
      val showSizeProp =
        {
          get = fn x => get "show-size" boolean x,
          set = fn x => set "show-size" boolean x
        }
      val showStyleProp =
        {
          get = fn x => get "show-style" boolean x,
          set = fn x => set "show-style" boolean x
        }
      val titleProp =
        {
          get = fn x => get "title" stringOpt x,
          set = fn x => set "title" stringOpt x
        }
      val useFontProp =
        {
          get = fn x => get "use-font" boolean x,
          set = fn x => set "use-font" boolean x
        }
      val useSizeProp =
        {
          get = fn x => get "use-size" boolean x,
          set = fn x => set "use-size" boolean x
        }
    end
  end
