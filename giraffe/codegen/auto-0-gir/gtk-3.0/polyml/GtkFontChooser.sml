structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class = 'a GtkFontChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (load_sym libgtk "gtk_font_chooser_get_font") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFontDesc_ = call (load_sym libgtk "gtk_font_chooser_get_font_desc") (GtkFontChooserClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontFace_ = call (load_sym libgtk "gtk_font_chooser_get_font_face") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFaceClass.PolyML.cPtr)
      val getFontFamily_ = call (load_sym libgtk "gtk_font_chooser_get_font_family") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFamilyClass.PolyML.cPtr)
      val getFontSize_ = call (load_sym libgtk "gtk_font_chooser_get_font_size") (GtkFontChooserClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPreviewText_ = call (load_sym libgtk "gtk_font_chooser_get_preview_text") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_get_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setFont_ = call (load_sym libgtk "gtk_font_chooser_set_font") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setFontDesc_ = call (load_sym libgtk "gtk_font_chooser_set_font_desc") (GtkFontChooserClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setPreviewText_ = call (load_sym libgtk "gtk_font_chooser_set_preview_text") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_set_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkFontChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFont self = (GtkFontChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getFont_ self
    fun getFontDesc self = (GtkFontChooserClass.FFI.withPtr ---> PangoFontDescriptionRecord.FFI.fromPtr true) getFontDesc_ self
    fun getFontFace self = (GtkFontChooserClass.FFI.withPtr ---> PangoFontFaceClass.FFI.fromPtr false) getFontFace_ self
    fun getFontFamily self = (GtkFontChooserClass.FFI.withPtr ---> PangoFontFamilyClass.FFI.fromPtr false) getFontFamily_ self
    fun getFontSize self = (GtkFontChooserClass.FFI.withPtr ---> GInt.FFI.fromVal) getFontSize_ self
    fun getPreviewText self = (GtkFontChooserClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getPreviewText_ self
    fun getShowPreviewEntry self = (GtkFontChooserClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowPreviewEntry_ self
    fun setFont self fontname = (GtkFontChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setFont_ (self & fontname)
    fun setFontDesc self fontDesc = (GtkFontChooserClass.FFI.withPtr &&&> PangoFontDescriptionRecord.FFI.withPtr ---> I) setFontDesc_ (self & fontDesc)
    fun setPreviewText self text = (GtkFontChooserClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPreviewText_ (self & text)
    fun setShowPreviewEntry self showPreviewEntry = (GtkFontChooserClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowPreviewEntry_ (self & showPreviewEntry)
    local
      open ClosureMarshal Signal
    in
      fun fontActivatedSig f = signal "font-activated" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val fontProp =
        {
          get = fn x => get "font" stringOpt x,
          set = fn x => set "font" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val previewTextProp =
        {
          get = fn x => get "preview-text" stringOpt x,
          set = fn x => set "preview-text" stringOpt x
        }
      val showPreviewEntryProp =
        {
          get = fn x => get "show-preview-entry" boolean x,
          set = fn x => set "show-preview-entry" boolean x
        }
    end
  end
