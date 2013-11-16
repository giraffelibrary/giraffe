signature GTK_CELL_RENDERER_TEXT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val setFixedHeightFromFont :
      'a class_t
       -> LargeInt.int
       -> unit
    val editedSig :
      (string
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val alignSetProp : ('a class_t, bool, bool) Property.readwrite
    val alignmentProp : ('a class_t, Pango.Alignment.t, Pango.Alignment.t) Property.readwrite
    val attributesProp : ('a class_t, Pango.AttrListRecord.t option, Pango.AttrListRecord.t option) Property.readwrite
    val backgroundProp : ('a class_t, string option) Property.writeonly
    val backgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val editableProp : ('a class_t, bool, bool) Property.readwrite
    val editableSetProp : ('a class_t, bool, bool) Property.readwrite
    val ellipsizeProp : ('a class_t, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val ellipsizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val familyProp : ('a class_t, string option, string option) Property.readwrite
    val familySetProp : ('a class_t, bool, bool) Property.readwrite
    val fontProp : ('a class_t, string option, string option) Property.readwrite
    val fontDescProp : ('a class_t, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val foregroundProp : ('a class_t, string option) Property.writeonly
    val foregroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val foregroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val foregroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val languageProp : ('a class_t, string option, string option) Property.readwrite
    val languageSetProp : ('a class_t, bool, bool) Property.readwrite
    val markupProp : ('a class_t, string option) Property.writeonly
    val maxWidthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val riseProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val riseSetProp : ('a class_t, bool, bool) Property.readwrite
    val scaleProp : ('a class_t, real, real) Property.readwrite
    val scaleSetProp : ('a class_t, bool, bool) Property.readwrite
    val singleParagraphModeProp : ('a class_t, bool, bool) Property.readwrite
    val sizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val sizePointsProp : ('a class_t, real, real) Property.readwrite
    val sizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val stretchProp : ('a class_t, Pango.Stretch.t, Pango.Stretch.t) Property.readwrite
    val stretchSetProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class_t, bool, bool) Property.readwrite
    val styleProp : ('a class_t, Pango.Style.t, Pango.Style.t) Property.readwrite
    val styleSetProp : ('a class_t, bool, bool) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
    val underlineProp : ('a class_t, Pango.Underline.t, Pango.Underline.t) Property.readwrite
    val underlineSetProp : ('a class_t, bool, bool) Property.readwrite
    val variantProp : ('a class_t, Pango.Variant.t, Pango.Variant.t) Property.readwrite
    val variantSetProp : ('a class_t, bool, bool) Property.readwrite
    val weightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val weightSetProp : ('a class_t, bool, bool) Property.readwrite
    val widthCharsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val wrapModeProp : ('a class_t, Pango.WrapMode.t, Pango.WrapMode.t) Property.readwrite
    val wrapWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
