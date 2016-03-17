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
    val event :
      'a class
       -> 'b GObject.ObjectClass.class
       -> 'c Gdk.Event.union
       -> text_iter_t
       -> bool
    val getPriority : 'a class -> LargeInt.int
    val setPriority :
      'a class
       -> LargeInt.int
       -> unit
    val eventSig :
      (base GObject.ObjectClass.class
        -> base Gdk.Event.union
        -> text_iter_t
        -> bool)
       -> 'a class Signal.signal
    val accumulativeMarginProp : ('a class, bool, bool) Property.readwrite
    val backgroundProp : ('a class, string option) Property.writeonly
    val backgroundFullHeightProp : ('a class, bool, bool) Property.readwrite
    val backgroundFullHeightSetProp : ('a class, bool, bool) Property.readwrite
    val backgroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class, bool, bool) Property.readwrite
    val directionProp : ('a class, text_direction_t, text_direction_t) Property.readwrite
    val editableProp : ('a class, bool, bool) Property.readwrite
    val editableSetProp : ('a class, bool, bool) Property.readwrite
    val familyProp : ('a class, string option, string option) Property.readwrite
    val familySetProp : ('a class, bool, bool) Property.readwrite
    val fontProp : ('a class, string option, string option) Property.readwrite
    val fontDescProp : ('a class, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val foregroundProp : ('a class, string option) Property.writeonly
    val foregroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val foregroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val foregroundSetProp : ('a class, bool, bool) Property.readwrite
    val indentProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val indentSetProp : ('a class, bool, bool) Property.readwrite
    val invisibleProp : ('a class, bool, bool) Property.readwrite
    val invisibleSetProp : ('a class, bool, bool) Property.readwrite
    val justificationProp : ('a class, justification_t, justification_t) Property.readwrite
    val justificationSetProp : ('a class, bool, bool) Property.readwrite
    val languageProp : ('a class, string option, string option) Property.readwrite
    val languageSetProp : ('a class, bool, bool) Property.readwrite
    val leftMarginProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val leftMarginSetProp : ('a class, bool, bool) Property.readwrite
    val nameProp : ('a class, string option, string option) Property.readwrite
    val paragraphBackgroundProp : ('a class, string option) Property.writeonly
    val paragraphBackgroundGdkProp : ('a class, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val paragraphBackgroundRgbaProp : ('a class, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val paragraphBackgroundSetProp : ('a class, bool, bool) Property.readwrite
    val pixelsAboveLinesProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsAboveLinesSetProp : ('a class, bool, bool) Property.readwrite
    val pixelsBelowLinesProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsBelowLinesSetProp : ('a class, bool, bool) Property.readwrite
    val pixelsInsideWrapProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsInsideWrapSetProp : ('a class, bool, bool) Property.readwrite
    val rightMarginProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val rightMarginSetProp : ('a class, bool, bool) Property.readwrite
    val riseProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val riseSetProp : ('a class, bool, bool) Property.readwrite
    val scaleProp : ('a class, real, real) Property.readwrite
    val scaleSetProp : ('a class, bool, bool) Property.readwrite
    val sizeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val sizePointsProp : ('a class, real, real) Property.readwrite
    val sizeSetProp : ('a class, bool, bool) Property.readwrite
    val stretchProp : ('a class, Pango.Stretch.t, Pango.Stretch.t) Property.readwrite
    val stretchSetProp : ('a class, bool, bool) Property.readwrite
    val strikethroughProp : ('a class, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class, bool, bool) Property.readwrite
    val styleProp : ('a class, Pango.Style.t, Pango.Style.t) Property.readwrite
    val styleSetProp : ('a class, bool, bool) Property.readwrite
    val tabsProp : ('a class, Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option) Property.readwrite
    val tabsSetProp : ('a class, bool, bool) Property.readwrite
    val underlineProp : ('a class, Pango.Underline.t, Pango.Underline.t) Property.readwrite
    val underlineSetProp : ('a class, bool, bool) Property.readwrite
    val variantProp : ('a class, Pango.Variant.t, Pango.Variant.t) Property.readwrite
    val variantSetProp : ('a class, bool, bool) Property.readwrite
    val weightProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val weightSetProp : ('a class, bool, bool) Property.readwrite
    val wrapModeProp : ('a class, wrap_mode_t, wrap_mode_t) Property.readwrite
    val wrapModeSetProp : ('a class, bool, bool) Property.readwrite
  end
