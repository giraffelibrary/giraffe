signature GTK_CELL_RENDERER_TEXT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val setFixedHeightFromFont :
      'a class
       -> LargeInt.int
       -> unit
    val editedSig :
      (string
        -> string
        -> unit)
       -> 'a class Signal.signal
    val alignSetProp : ('a class, bool, bool) Property.readwrite
    val alignmentProp : ('a class, Pango.Alignment.t, Pango.Alignment.t) Property.readwrite
    val attributesProp : ('a class, Pango.AttrListRecord.t option, Pango.AttrListRecord.t option) Property.readwrite
    val backgroundProp : ('a class, string option) Property.writeonly
    val backgroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class, bool, bool) Property.readwrite
    val editableProp : ('a class, bool, bool) Property.readwrite
    val editableSetProp : ('a class, bool, bool) Property.readwrite
    val ellipsizeProp : ('a class, Pango.EllipsizeMode.t, Pango.EllipsizeMode.t) Property.readwrite
    val ellipsizeSetProp : ('a class, bool, bool) Property.readwrite
    val familyProp : ('a class, string option, string option) Property.readwrite
    val familySetProp : ('a class, bool, bool) Property.readwrite
    val fontProp : ('a class, string option, string option) Property.readwrite
    val fontDescProp : ('a class, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val foregroundProp : ('a class, string option) Property.writeonly
    val foregroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val foregroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val foregroundSetProp : ('a class, bool, bool) Property.readwrite
    val languageProp : ('a class, string option, string option) Property.readwrite
    val languageSetProp : ('a class, bool, bool) Property.readwrite
    val markupProp : ('a class, string option) Property.writeonly
    val maxWidthCharsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val riseProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val riseSetProp : ('a class, bool, bool) Property.readwrite
    val scaleProp : ('a class, real, real) Property.readwrite
    val scaleSetProp : ('a class, bool, bool) Property.readwrite
    val singleParagraphModeProp : ('a class, bool, bool) Property.readwrite
    val sizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val sizePointsProp : ('a class, real, real) Property.readwrite
    val sizeSetProp : ('a class, bool, bool) Property.readwrite
    val stretchProp : ('a class, Pango.Stretch.t, Pango.Stretch.t) Property.readwrite
    val stretchSetProp : ('a class, bool, bool) Property.readwrite
    val strikethroughProp : ('a class, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class, bool, bool) Property.readwrite
    val styleProp : ('a class, Pango.Style.t, Pango.Style.t) Property.readwrite
    val styleSetProp : ('a class, bool, bool) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
    val underlineProp : ('a class, Pango.Underline.t, Pango.Underline.t) Property.readwrite
    val underlineSetProp : ('a class, bool, bool) Property.readwrite
    val variantProp : ('a class, Pango.Variant.t, Pango.Variant.t) Property.readwrite
    val variantSetProp : ('a class, bool, bool) Property.readwrite
    val weightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val weightSetProp : ('a class, bool, bool) Property.readwrite
    val widthCharsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val wrapModeProp : ('a class, Pango.WrapMode.t, Pango.WrapMode.t) Property.readwrite
    val wrapWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
