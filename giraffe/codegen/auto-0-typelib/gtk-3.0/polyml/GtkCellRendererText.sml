structure GtkCellRendererText :>
  GTK_CELL_RENDERER_TEXT
    where type 'a class = 'a GtkCellRendererTextClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_text_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_cell_renderer_text_new") (cVoid --> GtkCellRendererClass.PolyML.cPtr)
      val setFixedHeightFromFont_ = call (getSymbol "gtk_cell_renderer_text_set_fixed_height_from_font") (GtkCellRendererTextClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkCellRendererTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkCellRendererTextClass.FFI.fromPtr false) new_ ()
    fun setFixedHeightFromFont self numberOfRows = (GtkCellRendererTextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setFixedHeightFromFont_ (self & numberOfRows)
    local
      open ClosureMarshal Signal
    in
      fun editedSig f = signal "edited" (get 0w1 string &&&> get 0w2 string ---> ret_void) (fn path & newText => f (path, newText))
    end
    local
      open Property
    in
      val alignSetProp =
        {
          get = fn x => get "align-set" boolean x,
          set = fn x => set "align-set" boolean x,
          new = fn x => new "align-set" boolean x
        }
      val alignmentProp =
        {
          get = fn x => get "alignment" PangoAlignment.t x,
          set = fn x => set "alignment" PangoAlignment.t x,
          new = fn x => new "alignment" PangoAlignment.t x
        }
      val attributesProp =
        {
          get = fn x => get "attributes" PangoAttrListRecord.tOpt x,
          set = fn x => set "attributes" PangoAttrListRecord.tOpt x,
          new = fn x => new "attributes" PangoAttrListRecord.tOpt x
        }
      val backgroundProp =
        {
          set = fn x => set "background" stringOpt x,
          new = fn x => new "background" stringOpt x
        }
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x,
          new = fn x => new "background-set" boolean x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x,
          new = fn x => new "editable" boolean x
        }
      val editableSetProp =
        {
          get = fn x => get "editable-set" boolean x,
          set = fn x => set "editable-set" boolean x,
          new = fn x => new "editable-set" boolean x
        }
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x,
          new = fn x => new "ellipsize" PangoEllipsizeMode.t x
        }
      val ellipsizeSetProp =
        {
          get = fn x => get "ellipsize-set" boolean x,
          set = fn x => set "ellipsize-set" boolean x,
          new = fn x => new "ellipsize-set" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" stringOpt x,
          set = fn x => set "family" stringOpt x,
          new = fn x => new "family" stringOpt x
        }
      val familySetProp =
        {
          get = fn x => get "family-set" boolean x,
          set = fn x => set "family-set" boolean x,
          new = fn x => new "family-set" boolean x
        }
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
      val foregroundProp =
        {
          set = fn x => set "foreground" stringOpt x,
          new = fn x => new "foreground" stringOpt x
        }
      val foregroundGdkProp =
        {
          get = fn x => get "foreground-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "foreground-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "foreground-gdk" GdkColorRecord.tOpt x
        }
      val foregroundRgbaProp =
        {
          get = fn x => get "foreground-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "foreground-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "foreground-rgba" GdkRgbaRecord.tOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x,
          new = fn x => new "foreground-set" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" stringOpt x,
          set = fn x => set "language" stringOpt x,
          new = fn x => new "language" stringOpt x
        }
      val languageSetProp =
        {
          get = fn x => get "language-set" boolean x,
          set = fn x => set "language-set" boolean x,
          new = fn x => new "language-set" boolean x
        }
      val markupProp =
        {
          set = fn x => set "markup" stringOpt x,
          new = fn x => new "markup" stringOpt x
        }
      val maxWidthCharsProp =
        {
          get = fn x => get "max-width-chars" int x,
          set = fn x => set "max-width-chars" int x,
          new = fn x => new "max-width-chars" int x
        }
      val placeholderTextProp =
        {
          get = fn x => get "placeholder-text" stringOpt x,
          set = fn x => set "placeholder-text" stringOpt x,
          new = fn x => new "placeholder-text" stringOpt x
        }
      val riseProp =
        {
          get = fn x => get "rise" int x,
          set = fn x => set "rise" int x,
          new = fn x => new "rise" int x
        }
      val riseSetProp =
        {
          get = fn x => get "rise-set" boolean x,
          set = fn x => set "rise-set" boolean x,
          new = fn x => new "rise-set" boolean x
        }
      val scaleProp =
        {
          get = fn x => get "scale" double x,
          set = fn x => set "scale" double x,
          new = fn x => new "scale" double x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          set = fn x => set "scale-set" boolean x,
          new = fn x => new "scale-set" boolean x
        }
      val singleParagraphModeProp =
        {
          get = fn x => get "single-paragraph-mode" boolean x,
          set = fn x => set "single-paragraph-mode" boolean x,
          new = fn x => new "single-paragraph-mode" boolean x
        }
      val sizeProp =
        {
          get = fn x => get "size" int x,
          set = fn x => set "size" int x,
          new = fn x => new "size" int x
        }
      val sizePointsProp =
        {
          get = fn x => get "size-points" double x,
          set = fn x => set "size-points" double x,
          new = fn x => new "size-points" double x
        }
      val sizeSetProp =
        {
          get = fn x => get "size-set" boolean x,
          set = fn x => set "size-set" boolean x,
          new = fn x => new "size-set" boolean x
        }
      val stretchProp =
        {
          get = fn x => get "stretch" PangoStretch.t x,
          set = fn x => set "stretch" PangoStretch.t x,
          new = fn x => new "stretch" PangoStretch.t x
        }
      val stretchSetProp =
        {
          get = fn x => get "stretch-set" boolean x,
          set = fn x => set "stretch-set" boolean x,
          new = fn x => new "stretch-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x,
          new = fn x => new "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x,
          new = fn x => new "strikethrough-set" boolean x
        }
      val styleProp =
        {
          get = fn x => get "style" PangoStyle.t x,
          set = fn x => set "style" PangoStyle.t x,
          new = fn x => new "style" PangoStyle.t x
        }
      val styleSetProp =
        {
          get = fn x => get "style-set" boolean x,
          set = fn x => set "style-set" boolean x,
          new = fn x => new "style-set" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
      val underlineProp =
        {
          get = fn x => get "underline" PangoUnderline.t x,
          set = fn x => set "underline" PangoUnderline.t x,
          new = fn x => new "underline" PangoUnderline.t x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x,
          new = fn x => new "underline-set" boolean x
        }
      val variantProp =
        {
          get = fn x => get "variant" PangoVariant.t x,
          set = fn x => set "variant" PangoVariant.t x,
          new = fn x => new "variant" PangoVariant.t x
        }
      val variantSetProp =
        {
          get = fn x => get "variant-set" boolean x,
          set = fn x => set "variant-set" boolean x,
          new = fn x => new "variant-set" boolean x
        }
      val weightProp =
        {
          get = fn x => get "weight" int x,
          set = fn x => set "weight" int x,
          new = fn x => new "weight" int x
        }
      val weightSetProp =
        {
          get = fn x => get "weight-set" boolean x,
          set = fn x => set "weight-set" boolean x,
          new = fn x => new "weight-set" boolean x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x,
          new = fn x => new "width-chars" int x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" PangoWrapMode.t x,
          set = fn x => set "wrap-mode" PangoWrapMode.t x,
          new = fn x => new "wrap-mode" PangoWrapMode.t x
        }
      val wrapWidthProp =
        {
          get = fn x => get "wrap-width" int x,
          set = fn x => set "wrap-width" int x,
          new = fn x => new "wrap-width" int x
        }
    end
  end
