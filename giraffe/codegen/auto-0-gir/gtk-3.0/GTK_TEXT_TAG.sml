signature GTK_TEXT_TAG =
  sig
    type 'a class_t
    type text_iter_record_t
    type text_direction_t
    type justification_t
    type wrap_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : string option -> base class_t
    val event :
      'a class_t
       -> 'b GObject.ObjectClass.t
       -> 'c Gdk.Event.t
       -> text_iter_record_t
       -> bool
    val getPriority : 'a class_t -> LargeInt.int
    val setPriority :
      'a class_t
       -> LargeInt.int
       -> unit
    val eventSig :
      (base GObject.ObjectClass.t
        -> base Gdk.Event.t
        -> text_iter_record_t
        -> bool)
       -> 'a class_t Signal.signal
    val accumulativeMarginProp : ('a class_t, bool, bool) Property.readwrite
    val backgroundProp : ('a class_t, string option) Property.writeonly
    val backgroundFullHeightProp : ('a class_t, bool, bool) Property.readwrite
    val backgroundFullHeightSetProp : ('a class_t, bool, bool) Property.readwrite
    val backgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val backgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val backgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val directionProp : ('a class_t, text_direction_t, text_direction_t) Property.readwrite
    val editableProp : ('a class_t, bool, bool) Property.readwrite
    val editableSetProp : ('a class_t, bool, bool) Property.readwrite
    val familyProp : ('a class_t, string option, string option) Property.readwrite
    val familySetProp : ('a class_t, bool, bool) Property.readwrite
    val fontProp : ('a class_t, string option, string option) Property.readwrite
    val fontDescProp : ('a class_t, Pango.FontDescriptionRecord.t option, Pango.FontDescriptionRecord.t option) Property.readwrite
    val foregroundProp : ('a class_t, string option) Property.writeonly
    val foregroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val foregroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val foregroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val indentProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val indentSetProp : ('a class_t, bool, bool) Property.readwrite
    val invisibleProp : ('a class_t, bool, bool) Property.readwrite
    val invisibleSetProp : ('a class_t, bool, bool) Property.readwrite
    val justificationProp : ('a class_t, justification_t, justification_t) Property.readwrite
    val justificationSetProp : ('a class_t, bool, bool) Property.readwrite
    val languageProp : ('a class_t, string option, string option) Property.readwrite
    val languageSetProp : ('a class_t, bool, bool) Property.readwrite
    val leftMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val leftMarginSetProp : ('a class_t, bool, bool) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val paragraphBackgroundProp : ('a class_t, string option) Property.writeonly
    val paragraphBackgroundGdkProp : ('a class_t, Gdk.ColorRecord.t option, Gdk.ColorRecord.t option) Property.readwrite
    val paragraphBackgroundRgbaProp : ('a class_t, Gdk.RgbaRecord.t option, Gdk.RgbaRecord.t option) Property.readwrite
    val paragraphBackgroundSetProp : ('a class_t, bool, bool) Property.readwrite
    val pixelsAboveLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsAboveLinesSetProp : ('a class_t, bool, bool) Property.readwrite
    val pixelsBelowLinesProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsBelowLinesSetProp : ('a class_t, bool, bool) Property.readwrite
    val pixelsInsideWrapProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val pixelsInsideWrapSetProp : ('a class_t, bool, bool) Property.readwrite
    val rightMarginProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rightMarginSetProp : ('a class_t, bool, bool) Property.readwrite
    val riseProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val riseSetProp : ('a class_t, bool, bool) Property.readwrite
    val scaleProp : ('a class_t, real, real) Property.readwrite
    val scaleSetProp : ('a class_t, bool, bool) Property.readwrite
    val sizeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val sizePointsProp : ('a class_t, real, real) Property.readwrite
    val sizeSetProp : ('a class_t, bool, bool) Property.readwrite
    val stretchProp : ('a class_t, Pango.Stretch.t, Pango.Stretch.t) Property.readwrite
    val stretchSetProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughProp : ('a class_t, bool, bool) Property.readwrite
    val strikethroughSetProp : ('a class_t, bool, bool) Property.readwrite
    val styleProp : ('a class_t, Pango.Style.t, Pango.Style.t) Property.readwrite
    val styleSetProp : ('a class_t, bool, bool) Property.readwrite
    val tabsProp : ('a class_t, Pango.TabArrayRecord.t option, Pango.TabArrayRecord.t option) Property.readwrite
    val tabsSetProp : ('a class_t, bool, bool) Property.readwrite
    val underlineProp : ('a class_t, Pango.Underline.t, Pango.Underline.t) Property.readwrite
    val underlineSetProp : ('a class_t, bool, bool) Property.readwrite
    val variantProp : ('a class_t, Pango.Variant.t, Pango.Variant.t) Property.readwrite
    val variantSetProp : ('a class_t, bool, bool) Property.readwrite
    val weightProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val weightSetProp : ('a class_t, bool, bool) Property.readwrite
    val wrapModeProp : ('a class_t, wrap_mode_t, wrap_mode_t) Property.readwrite
    val wrapModeSetProp : ('a class_t, bool, bool) Property.readwrite
  end
