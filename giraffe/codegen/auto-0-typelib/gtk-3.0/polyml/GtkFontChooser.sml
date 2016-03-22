structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class = 'a GtkFontChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (load_sym libgtk "gtk_font_chooser_get_font") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getFontDesc_ = call (load_sym libgtk "gtk_font_chooser_get_font_desc") (GtkFontChooserClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cPtr)
      val getFontFace_ = call (load_sym libgtk "gtk_font_chooser_get_font_face") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFaceClass.PolyML.cPtr)
      val getFontFamily_ = call (load_sym libgtk "gtk_font_chooser_get_font_family") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFamilyClass.PolyML.cPtr)
      val getFontSize_ = call (load_sym libgtk "gtk_font_chooser_get_font_size") (GtkFontChooserClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getPreviewText_ = call (load_sym libgtk "gtk_font_chooser_get_preview_text") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_get_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setFont_ = call (load_sym libgtk "gtk_font_chooser_set_font") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setFontDesc_ = call (load_sym libgtk "gtk_font_chooser_set_font_desc") (GtkFontChooserClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setPreviewText_ = call (load_sym libgtk "gtk_font_chooser_set_preview_text") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_set_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkFontChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self = (GtkFontChooserClass.C.withPtr ---> Utf8.C.fromPtr true) getFont_ self
    fun getFontDesc self = (GtkFontChooserClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) getFontDesc_ self
    fun getFontFace self = (GtkFontChooserClass.C.withPtr ---> PangoFontFaceClass.C.fromPtr false) getFontFace_ self
    fun getFontFamily self = (GtkFontChooserClass.C.withPtr ---> PangoFontFamilyClass.C.fromPtr false) getFontFamily_ self
    fun getFontSize self = (GtkFontChooserClass.C.withPtr ---> FFI.Int32.C.fromVal) getFontSize_ self
    fun getPreviewText self = (GtkFontChooserClass.C.withPtr ---> Utf8.C.fromPtr true) getPreviewText_ self
    fun getShowPreviewEntry self = (GtkFontChooserClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowPreviewEntry_ self
    fun setFont self fontname = (GtkFontChooserClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setFont_ (self & fontname)
    fun setFontDesc self fontDesc = (GtkFontChooserClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> I) setFontDesc_ (self & fontDesc)
    fun setPreviewText self text = (GtkFontChooserClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPreviewText_ (self & text)
    fun setShowPreviewEntry self showPreviewEntry = (GtkFontChooserClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowPreviewEntry_ (self & showPreviewEntry)
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
