structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class = 'a GtkFontChooserClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_font_chooser_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getFont_ = call (getSymbol "gtk_font_chooser_get_font") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getFontDesc_ = call (getSymbol "gtk_font_chooser_get_font_desc") (GtkFontChooserClass.PolyML.cPtr --> PangoFontDescriptionRecord.PolyML.cOptPtr)
      val getFontFace_ = call (getSymbol "gtk_font_chooser_get_font_face") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFaceClass.PolyML.cOptPtr)
      val getFontFamily_ = call (getSymbol "gtk_font_chooser_get_font_family") (GtkFontChooserClass.PolyML.cPtr --> PangoFontFamilyClass.PolyML.cOptPtr)
      val getFontMap_ = call (getSymbol "gtk_font_chooser_get_font_map") (GtkFontChooserClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cOptPtr)
      val getFontSize_ = call (getSymbol "gtk_font_chooser_get_font_size") (GtkFontChooserClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPreviewText_ = call (getSymbol "gtk_font_chooser_get_preview_text") (GtkFontChooserClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getShowPreviewEntry_ = call (getSymbol "gtk_font_chooser_get_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setFont_ = call (getSymbol "gtk_font_chooser_set_font") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setFontDesc_ = call (getSymbol "gtk_font_chooser_set_font_desc") (GtkFontChooserClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cPtr --> cVoid)
      val setFontMap_ = call (getSymbol "gtk_font_chooser_set_font_map") (GtkFontChooserClass.PolyML.cPtr &&> PangoFontMapClass.PolyML.cOptPtr --> cVoid)
      val setPreviewText_ = call (getSymbol "gtk_font_chooser_set_preview_text") (GtkFontChooserClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setShowPreviewEntry_ = call (getSymbol "gtk_font_chooser_set_show_preview_entry") (GtkFontChooserClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkFontChooserClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getFont self = (GtkFontChooserClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getFont_ self
    fun getFontDesc self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontDescriptionRecord.FFI.fromOptPtr true) getFontDesc_ self
    fun getFontFace self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontFaceClass.FFI.fromOptPtr false) getFontFace_ self
    fun getFontFamily self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontFamilyClass.FFI.fromOptPtr false) getFontFamily_ self
    fun getFontMap self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromOptPtr true) getFontMap_ self
    fun getFontSize self = (GtkFontChooserClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFontSize_ self
    fun getPreviewText self = (GtkFontChooserClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getPreviewText_ self
    fun getShowPreviewEntry self = (GtkFontChooserClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowPreviewEntry_ self
    fun setFont self fontname = (GtkFontChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setFont_ (self & fontname)
    fun setFontDesc self fontDesc = (GtkFontChooserClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withPtr false ---> I) setFontDesc_ (self & fontDesc)
    fun setFontMap self fontmap = (GtkFontChooserClass.FFI.withPtr false &&&> PangoFontMapClass.FFI.withOptPtr false ---> I) setFontMap_ (self & fontmap)
    fun setPreviewText self text = (GtkFontChooserClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setPreviewText_ (self & text)
    fun setShowPreviewEntry self showPreviewEntry = (GtkFontChooserClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowPreviewEntry_ (self & showPreviewEntry)
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
          set = fn x => set "font" stringOpt x,
          new = fn x => new "font" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x,
          new = fn x => new "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val previewTextProp =
        {
          get = fn x => get "preview-text" stringOpt x,
          set = fn x => set "preview-text" stringOpt x,
          new = fn x => new "preview-text" stringOpt x
        }
      val showPreviewEntryProp =
        {
          get = fn x => get "show-preview-entry" boolean x,
          set = fn x => set "show-preview-entry" boolean x,
          new = fn x => new "show-preview-entry" boolean x
        }
    end
  end
