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
    val alignSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val alignmentProp :
      {
        get : 'a class -> Pango.Alignment.t,
        set :
          Pango.Alignment.t
           -> 'a class
           -> unit,
        new : Pango.Alignment.t -> 'a class Property.t
      }
    val attributesProp :
      {
        get : 'a class -> Pango.AttrListRecord.t option,
        set :
          Pango.AttrListRecord.t option
           -> 'a class
           -> unit,
        new : Pango.AttrListRecord.t option -> 'a class Property.t
      }
    val backgroundProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val backgroundGdkProp :
      {
        get : 'a class -> Gdk.ColorRecord.t option,
        set :
          Gdk.ColorRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.ColorRecord.t option -> 'a class Property.t
      }
    val backgroundRgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val backgroundSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val editableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val editableSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val ellipsizeProp :
      {
        get : 'a class -> Pango.EllipsizeMode.t,
        set :
          Pango.EllipsizeMode.t
           -> 'a class
           -> unit,
        new : Pango.EllipsizeMode.t -> 'a class Property.t
      }
    val ellipsizeSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val familyProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val familySetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val fontProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val fontDescProp :
      {
        get : 'a class -> Pango.FontDescriptionRecord.t option,
        set :
          Pango.FontDescriptionRecord.t option
           -> 'a class
           -> unit,
        new : Pango.FontDescriptionRecord.t option -> 'a class Property.t
      }
    val foregroundProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val foregroundGdkProp :
      {
        get : 'a class -> Gdk.ColorRecord.t option,
        set :
          Gdk.ColorRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.ColorRecord.t option -> 'a class Property.t
      }
    val foregroundRgbaProp :
      {
        get : 'a class -> Gdk.RgbaRecord.t option,
        set :
          Gdk.RgbaRecord.t option
           -> 'a class
           -> unit,
        new : Gdk.RgbaRecord.t option -> 'a class Property.t
      }
    val foregroundSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val languageProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val languageSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val markupProp :
      {
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val maxWidthCharsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val placeholderTextProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val riseProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val riseSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val scaleProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val scaleSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val singleParagraphModeProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val sizeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val sizePointsProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val sizeSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val stretchProp :
      {
        get : 'a class -> Pango.Stretch.t,
        set :
          Pango.Stretch.t
           -> 'a class
           -> unit,
        new : Pango.Stretch.t -> 'a class Property.t
      }
    val stretchSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val strikethroughProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val strikethroughSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val styleProp :
      {
        get : 'a class -> Pango.Style.t,
        set :
          Pango.Style.t
           -> 'a class
           -> unit,
        new : Pango.Style.t -> 'a class Property.t
      }
    val styleSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
    val underlineProp :
      {
        get : 'a class -> Pango.Underline.t,
        set :
          Pango.Underline.t
           -> 'a class
           -> unit,
        new : Pango.Underline.t -> 'a class Property.t
      }
    val underlineSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val variantProp :
      {
        get : 'a class -> Pango.Variant.t,
        set :
          Pango.Variant.t
           -> 'a class
           -> unit,
        new : Pango.Variant.t -> 'a class Property.t
      }
    val variantSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val weightProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val weightSetProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val widthCharsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val wrapModeProp :
      {
        get : 'a class -> Pango.WrapMode.t,
        set :
          Pango.WrapMode.t
           -> 'a class
           -> unit,
        new : Pango.WrapMode.t -> 'a class Property.t
      }
    val wrapWidthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
