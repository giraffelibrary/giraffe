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
    fun getFontFace self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontFaceClass.FFI.fromOptPtr false) getFontFace_ self before GtkFontChooserClass.FFI.touchPtr self
    fun getFontFamily self = (GtkFontChooserClass.FFI.withPtr false ---> PangoFontFamilyClass.FFI.fromOptPtr false) getFontFamily_ self before GtkFontChooserClass.FFI.touchPtr self
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
      open ValueAccessor
    in
      val fontProp =
        {
          name = "font",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val fontDescProp =
        {
          name = "font-desc",
          gtype = fn () => C.gtype PangoFontDescriptionRecord.tOpt (),
          get = fn x => fn () => C.get PangoFontDescriptionRecord.tOpt x,
          set = fn x => C.set PangoFontDescriptionRecord.tOpt x,
          init = fn x => C.set PangoFontDescriptionRecord.tOpt x
        }
      val previewTextProp =
        {
          name = "preview-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val showPreviewEntryProp =
        {
          name = "show-preview-entry",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
