structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class_t = 'a GtkFontChooserClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_font_chooser_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getFont_ = call (load_sym libgtk "gtk_font_chooser_get_font") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getFontDesc_ = call (load_sym libgtk "gtk_font_chooser_get_font_desc") (GObjectObjectClass.PolyML.PTR --> PangoFontDescriptionRecord.PolyML.PTR)
      val getFontFace_ = call (load_sym libgtk "gtk_font_chooser_get_font_face") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFontFamily_ = call (load_sym libgtk "gtk_font_chooser_get_font_family") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getFontSize_ = call (load_sym libgtk "gtk_font_chooser_get_font_size") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getPreviewText_ = call (load_sym libgtk "gtk_font_chooser_get_preview_text") (GObjectObjectClass.PolyML.PTR --> Utf8.PolyML.RETPTR)
      val getShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_get_show_preview_entry") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setFont_ = call (load_sym libgtk "gtk_font_chooser_set_font") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setFontDesc_ = call (load_sym libgtk "gtk_font_chooser_set_font_desc") (GObjectObjectClass.PolyML.PTR &&> PangoFontDescriptionRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setPreviewText_ = call (load_sym libgtk "gtk_font_chooser_set_preview_text") (GObjectObjectClass.PolyML.PTR &&> Utf8.PolyML.INPTR --> FFI.PolyML.VOID)
      val setShowPreviewEntry_ = call (load_sym libgtk "gtk_font_chooser_set_show_preview_entry") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkFontChooserClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getFont self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getFont_ self
    fun getFontDesc self = (GObjectObjectClass.C.withPtr ---> PangoFontDescriptionRecord.C.fromPtr true) getFontDesc_ self
    fun getFontFace self = (GObjectObjectClass.C.withPtr ---> PangoFontFaceClass.C.fromPtr false) getFontFace_ self
    fun getFontFamily self = (GObjectObjectClass.C.withPtr ---> PangoFontFamilyClass.C.fromPtr false) getFontFamily_ self
    fun getFontSize self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getFontSize_ self
    fun getPreviewText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getPreviewText_ self
    fun getShowPreviewEntry self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowPreviewEntry_ self
    fun setFont self fontname = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setFont_ (self & fontname)
    fun setFontDesc self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withPtr ---> I) setFontDesc_ (self & fontDesc)
    fun setPreviewText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setPreviewText_ (self & text)
    fun setShowPreviewEntry self showPreviewEntry = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowPreviewEntry_ (self & showPreviewEntry)
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
