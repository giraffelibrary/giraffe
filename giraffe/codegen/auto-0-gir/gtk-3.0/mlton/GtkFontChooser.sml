structure GtkFontChooser :>
  GTK_FONT_CHOOSER
    where type 'a class = 'a GtkFontChooserClass.class =
  struct
    val getType_ = _import "gtk_font_chooser_get_type" : unit -> GObjectType.FFI.val_;
    val getFont_ = _import "gtk_font_chooser_get_font" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getFontDesc_ = _import "gtk_font_chooser_get_font_desc" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p;
    val getFontFace_ = _import "gtk_font_chooser_get_font_face" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> PangoFontFaceClass.FFI.opt PangoFontFaceClass.FFI.p;
    val getFontFamily_ = _import "gtk_font_chooser_get_font_family" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> PangoFontFamilyClass.FFI.opt PangoFontFamilyClass.FFI.p;
    val getFontMap_ = _import "gtk_font_chooser_get_font_map" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> PangoFontMapClass.FFI.opt PangoFontMapClass.FFI.p;
    val getFontSize_ = _import "gtk_font_chooser_get_font_size" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> GInt.FFI.val_;
    val getPreviewText_ = _import "gtk_font_chooser_get_preview_text" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getShowPreviewEntry_ = _import "gtk_font_chooser_get_show_preview_entry" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p -> GBool.FFI.val_;
    val setFont_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_chooser_set_font" :
              GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setFontDesc_ = fn x1 & x2 => (_import "gtk_font_chooser_set_font_desc" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p * PangoFontDescriptionRecord.FFI.non_opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val setFontMap_ = fn x1 & x2 => (_import "gtk_font_chooser_set_font_map" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p * PangoFontMapClass.FFI.opt PangoFontMapClass.FFI.p -> unit;) (x1, x2)
    val setPreviewText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_font_chooser_set_preview_text" :
              GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setShowPreviewEntry_ = fn x1 & x2 => (_import "gtk_font_chooser_set_show_preview_entry" : GtkFontChooserClass.FFI.non_opt GtkFontChooserClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
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
