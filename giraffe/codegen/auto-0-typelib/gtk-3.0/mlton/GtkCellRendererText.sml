structure GtkCellRendererText :>
  GTK_CELL_RENDERER_TEXT
    where type 'a class = 'a GtkCellRendererTextClass.class =
  struct
    val getType_ = _import "gtk_cell_renderer_text_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_cell_renderer_text_new" : unit -> GtkCellRendererClass.FFI.non_opt GtkCellRendererClass.FFI.p;
    val setFixedHeightFromFont_ = fn x1 & x2 => (_import "gtk_cell_renderer_text_set_fixed_height_from_font" : GtkCellRendererTextClass.FFI.non_opt GtkCellRendererTextClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
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
      open ValueAccessor
    in
      val alignSetProp =
        {
          name = "align-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val alignmentProp =
        {
          name = "alignment",
          gtype = fn () => C.gtype PangoAlignment.t (),
          get = fn x => fn () => C.get PangoAlignment.t x,
          set = fn x => C.set PangoAlignment.t x,
          init = fn x => C.set PangoAlignment.t x
        }
      val attributesProp =
        {
          name = "attributes",
          gtype = fn () => C.gtype PangoAttrListRecord.tOpt (),
          get = fn x => fn () => C.get PangoAttrListRecord.tOpt x,
          set = fn x => C.set PangoAttrListRecord.tOpt x,
          init = fn x => C.set PangoAttrListRecord.tOpt x
        }
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val backgroundGdkProp =
        {
          name = "background-gdk",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          name = "background-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          name = "background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val editableProp =
        {
          name = "editable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val editableSetProp =
        {
          name = "editable-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val ellipsizeProp =
        {
          name = "ellipsize",
          gtype = fn () => C.gtype PangoEllipsizeMode.t (),
          get = fn x => fn () => C.get PangoEllipsizeMode.t x,
          set = fn x => C.set PangoEllipsizeMode.t x,
          init = fn x => C.set PangoEllipsizeMode.t x
        }
      val ellipsizeSetProp =
        {
          name = "ellipsize-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val familyProp =
        {
          name = "family",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val familySetProp =
        {
          name = "family-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
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
      val foregroundProp =
        {
          name = "foreground",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val foregroundGdkProp =
        {
          name = "foreground-gdk",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val foregroundRgbaProp =
        {
          name = "foreground-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val foregroundSetProp =
        {
          name = "foreground-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val languageProp =
        {
          name = "language",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val languageSetProp =
        {
          name = "language-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val markupProp =
        {
          name = "markup",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val maxWidthCharsProp =
        {
          name = "max-width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val placeholderTextProp =
        {
          name = "placeholder-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val riseProp =
        {
          name = "rise",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val riseSetProp =
        {
          name = "rise-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scaleProp =
        {
          name = "scale",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val scaleSetProp =
        {
          name = "scale-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val singleParagraphModeProp =
        {
          name = "single-paragraph-mode",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val sizePointsProp =
        {
          name = "size-points",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val sizeSetProp =
        {
          name = "size-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val stretchProp =
        {
          name = "stretch",
          gtype = fn () => C.gtype PangoStretch.t (),
          get = fn x => fn () => C.get PangoStretch.t x,
          set = fn x => C.set PangoStretch.t x,
          init = fn x => C.set PangoStretch.t x
        }
      val stretchSetProp =
        {
          name = "stretch-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val strikethroughProp =
        {
          name = "strikethrough",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val strikethroughSetProp =
        {
          name = "strikethrough-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val styleProp =
        {
          name = "style",
          gtype = fn () => C.gtype PangoStyle.t (),
          get = fn x => fn () => C.get PangoStyle.t x,
          set = fn x => C.set PangoStyle.t x,
          init = fn x => C.set PangoStyle.t x
        }
      val styleSetProp =
        {
          name = "style-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val underlineProp =
        {
          name = "underline",
          gtype = fn () => C.gtype PangoUnderline.t (),
          get = fn x => fn () => C.get PangoUnderline.t x,
          set = fn x => C.set PangoUnderline.t x,
          init = fn x => C.set PangoUnderline.t x
        }
      val underlineSetProp =
        {
          name = "underline-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val variantProp =
        {
          name = "variant",
          gtype = fn () => C.gtype PangoVariant.t (),
          get = fn x => fn () => C.get PangoVariant.t x,
          set = fn x => C.set PangoVariant.t x,
          init = fn x => C.set PangoVariant.t x
        }
      val variantSetProp =
        {
          name = "variant-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val weightProp =
        {
          name = "weight",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val weightSetProp =
        {
          name = "weight-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val widthCharsProp =
        {
          name = "width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val wrapModeProp =
        {
          name = "wrap-mode",
          gtype = fn () => C.gtype PangoWrapMode.t (),
          get = fn x => fn () => C.get PangoWrapMode.t x,
          set = fn x => C.set PangoWrapMode.t x,
          init = fn x => C.set PangoWrapMode.t x
        }
      val wrapWidthProp =
        {
          name = "wrap-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
