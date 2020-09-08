signature GTK_TEXT_TAG =
  sig
    type 'a class
    type text_iter_t
    type text_direction_t
    type justification_t
    type wrap_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option -> base class
    val changed :
      'a class
       -> bool
       -> unit
    val event :
      'a class
       -> 'b GObject.ObjectClass.class
           * 'c Gdk.Event.union
           * text_iter_t
       -> bool
    val getPriority : 'a class -> LargeInt.int
    val setPriority :
      'a class
       -> LargeInt.int
       -> unit
    val eventSig :
      (base GObject.ObjectClass.class
        * base Gdk.Event.union
        * text_iter_t
        -> bool)
       -> 'a class Signal.t
    val accumulativeMarginProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backgroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val backgroundFullHeightProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backgroundFullHeightSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val backgroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val backgroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val backgroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val directionProp : ('a class, unit -> text_direction_t, text_direction_t -> unit, text_direction_t -> unit) Property.t
    val editableProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val editableSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val fallbackProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val fallbackSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val familyProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val familySetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val fontProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontDescProp : ('a class, unit -> Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option -> unit, Pango.FontDescriptionRecord.t option -> unit) Property.t
    val fontFeaturesProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val fontFeaturesSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val foregroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val foregroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val foregroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val foregroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val indentProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val indentSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val invisibleProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val invisibleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val justificationProp : ('a class, unit -> justification_t, justification_t -> unit, justification_t -> unit) Property.t
    val justificationSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val languageProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val languageSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val leftMarginProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val leftMarginSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val letterSpacingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val letterSpacingSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val nameProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
    val paragraphBackgroundProp : ('a class, unit, string option -> unit, string option -> unit) Property.t
    val paragraphBackgroundGdkProp : ('a class, unit -> Gdk.ColorRecord.t option, Gdk.ColorRecord.t option -> unit, Gdk.ColorRecord.t option -> unit) Property.t
    val paragraphBackgroundRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val paragraphBackgroundSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pixelsAboveLinesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val pixelsAboveLinesSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pixelsBelowLinesProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val pixelsBelowLinesSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pixelsInsideWrapProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val pixelsInsideWrapSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val rightMarginProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val rightMarginSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val riseProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val riseSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val scaleProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val scaleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val sizeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val sizePointsProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val sizeSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val stretchProp : ('a class, unit -> Pango.Stretch.t, Pango.Stretch.t -> unit, Pango.Stretch.t -> unit) Property.t
    val stretchSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val strikethroughProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val strikethroughRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val strikethroughRgbaSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val strikethroughSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val styleProp : ('a class, unit -> Pango.Style.t, Pango.Style.t -> unit, Pango.Style.t -> unit) Property.t
    val styleSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val tabsProp : ('a class, unit -> Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option -> unit, Pango.TabArrayRecord.t option -> unit) Property.t
    val tabsSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val underlineProp : ('a class, unit -> Pango.Underline.t, Pango.Underline.t -> unit, Pango.Underline.t -> unit) Property.t
    val underlineRgbaProp : ('a class, unit -> Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option -> unit, Gdk.RgbaRecord.t option -> unit) Property.t
    val underlineRgbaSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val underlineSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val variantProp : ('a class, unit -> Pango.Variant.t, Pango.Variant.t -> unit, Pango.Variant.t -> unit) Property.t
    val variantSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val weightProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val weightSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val wrapModeProp : ('a class, unit -> wrap_mode_t, wrap_mode_t -> unit, wrap_mode_t -> unit) Property.t
    val wrapModeSetProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
