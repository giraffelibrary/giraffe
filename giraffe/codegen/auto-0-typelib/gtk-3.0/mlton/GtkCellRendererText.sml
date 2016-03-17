structure GtkCellRendererText :>
  GTK_CELL_RENDERER_TEXT
    where type 'a class = 'a GtkCellRendererTextClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_text_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_cell_renderer_text_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val setFixedHeightFromFont_ = fn x1 & x2 => (_import "gtk_cell_renderer_text_set_fixed_height_from_font" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellRendererTextClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCellRendererTextClass.C.fromPtr false) new_ ()
    fun setFixedHeightFromFont self numberOfRows = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setFixedHeightFromFont_ (self & numberOfRows)
    local
      open ClosureMarshal Signal
    in
      fun editedSig f = signal "edited" (get 0w1 string &&&> get 0w2 string ---> ret_void) (fn path & newText => f path newText)
    end
    local
      open Property
    in
      val alignSetProp =
        {
          get = fn x => get "align-set" boolean x,
          set = fn x => set "align-set" boolean x
        }
      val alignmentProp =
        {
          get = fn x => get "alignment" PangoAlignment.t x,
          set = fn x => set "alignment" PangoAlignment.t x
        }
      val attributesProp =
        {
          get = fn x => get "attributes" PangoAttrListRecord.tOpt x,
          set = fn x => set "attributes" PangoAttrListRecord.tOpt x
        }
      val backgroundProp = {set = fn x => set "background" stringOpt x}
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x
        }
      val editableSetProp =
        {
          get = fn x => get "editable-set" boolean x,
          set = fn x => set "editable-set" boolean x
        }
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x
        }
      val ellipsizeSetProp =
        {
          get = fn x => get "ellipsize-set" boolean x,
          set = fn x => set "ellipsize-set" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" stringOpt x,
          set = fn x => set "family" stringOpt x
        }
      val familySetProp =
        {
          get = fn x => get "family-set" boolean x,
          set = fn x => set "family-set" boolean x
        }
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
      val foregroundProp = {set = fn x => set "foreground" stringOpt x}
      val foregroundGdkProp =
        {
          get = fn x => get "foreground-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "foreground-gdk" GdkColorRecord.tOpt x
        }
      val foregroundRgbaProp =
        {
          get = fn x => get "foreground-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "foreground-rgba" GdkRgbaRecord.tOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" stringOpt x,
          set = fn x => set "language" stringOpt x
        }
      val languageSetProp =
        {
          get = fn x => get "language-set" boolean x,
          set = fn x => set "language-set" boolean x
        }
      val markupProp = {set = fn x => set "markup" stringOpt x}
      val maxWidthCharsProp =
        {
          get = fn x => get "max-width-chars" int x,
          set = fn x => set "max-width-chars" int x
        }
      val riseProp =
        {
          get = fn x => get "rise" int x,
          set = fn x => set "rise" int x
        }
      val riseSetProp =
        {
          get = fn x => get "rise-set" boolean x,
          set = fn x => set "rise-set" boolean x
        }
      val scaleProp =
        {
          get = fn x => get "scale" double x,
          set = fn x => set "scale" double x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          set = fn x => set "scale-set" boolean x
        }
      val singleParagraphModeProp =
        {
          get = fn x => get "single-paragraph-mode" boolean x,
          set = fn x => set "single-paragraph-mode" boolean x
        }
      val sizeProp =
        {
          get = fn x => get "size" int x,
          set = fn x => set "size" int x
        }
      val sizePointsProp =
        {
          get = fn x => get "size-points" double x,
          set = fn x => set "size-points" double x
        }
      val sizeSetProp =
        {
          get = fn x => get "size-set" boolean x,
          set = fn x => set "size-set" boolean x
        }
      val stretchProp =
        {
          get = fn x => get "stretch" PangoStretch.t x,
          set = fn x => set "stretch" PangoStretch.t x
        }
      val stretchSetProp =
        {
          get = fn x => get "stretch-set" boolean x,
          set = fn x => set "stretch-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x
        }
      val styleProp =
        {
          get = fn x => get "style" PangoStyle.t x,
          set = fn x => set "style" PangoStyle.t x
        }
      val styleSetProp =
        {
          get = fn x => get "style-set" boolean x,
          set = fn x => set "style-set" boolean x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
      val underlineProp =
        {
          get = fn x => get "underline" PangoUnderline.t x,
          set = fn x => set "underline" PangoUnderline.t x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x
        }
      val variantProp =
        {
          get = fn x => get "variant" PangoVariant.t x,
          set = fn x => set "variant" PangoVariant.t x
        }
      val variantSetProp =
        {
          get = fn x => get "variant-set" boolean x,
          set = fn x => set "variant-set" boolean x
        }
      val weightProp =
        {
          get = fn x => get "weight" int x,
          set = fn x => set "weight" int x
        }
      val weightSetProp =
        {
          get = fn x => get "weight-set" boolean x,
          set = fn x => set "weight-set" boolean x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" PangoWrapMode.t x,
          set = fn x => set "wrap-mode" PangoWrapMode.t x
        }
      val wrapWidthProp =
        {
          get = fn x => get "wrap-width" int x,
          set = fn x => set "wrap-width" int x
        }
    end
  end
