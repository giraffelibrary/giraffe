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
    val editedSig : (string * string -> unit) -> 'a class Signal.t
    val alignSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val alignmentProp : ('a class, unit -> Pango.Alignment.t, Pango.Alignment.t -> unit, Pango.Alignment.t -> unit) Property.t
    val attributesProp : ('a class, unit -> Pango.AttrListRecord.t option, Pango.AttrListRecord.t option -> unit, Pango.AttrListRecord.t option -> unit) Property.t
    val backgroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val backgroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val backgroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val backgroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val editableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val editableSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val ellipsizeProp : ('a class, unit -> Pango.EllipsizeMode.t, Pango.EllipsizeMode.t -> unit, Pango.EllipsizeMode.t -> unit) Property.t
    val ellipsizeSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val familyProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val familySetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val fontProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val foregroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val foregroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val foregroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val foregroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val languageProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val languageSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val markupProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val maxWidthCharsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val placeholderTextProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val riseProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val riseSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val scaleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val singleParagraphModeProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val sizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val sizePointsProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val sizeSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val stretchProp : ('a class, unit -> Pango.Stretch.t, Pango.Stretch.t -> unit, Pango.Stretch.t -> unit) Property.t
    val stretchSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val strikethroughProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val strikethroughSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val styleProp : ('a class, unit -> Pango.Style.t, Pango.Style.t -> unit, Pango.Style.t -> unit) Property.t
    val styleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val underlineProp : ('a class, unit -> Pango.Underline.t, Pango.Underline.t -> unit, Pango.Underline.t -> unit) Property.t
    val underlineSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val variantProp : ('a class, unit -> Pango.Variant.t, Pango.Variant.t -> unit, Pango.Variant.t -> unit) Property.t
    val variantSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val weightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val weightSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val widthCharsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val wrapModeProp : ('a class, unit -> Pango.WrapMode.t, Pango.WrapMode.t -> unit, Pango.WrapMode.t -> unit) Property.t
    val wrapWidthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
