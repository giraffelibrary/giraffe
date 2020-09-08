structure GtkTextTag :>
  GTK_TEXT_TAG
    where type 'a class = 'a GtkTextTagClass.class
    where type text_iter_t = GtkTextIterRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type justification_t = GtkJustification.t
    where type wrap_mode_t = GtkWrapMode.t =
  struct
    val getType_ = _import "gtk_text_tag_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_text_tag_new" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p;
    val changed_ = fn x1 & x2 => (_import "gtk_text_tag_changed" : GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val event_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_tag_event" :
              GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               * GdkEvent.FFI.non_opt GdkEvent.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPriority_ = _import "gtk_text_tag_get_priority" : GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p -> GInt.FFI.val_;
    val setPriority_ = fn x1 & x2 => (_import "gtk_text_tag_set_priority" : GtkTextTagClass.FFI.non_opt GtkTextTagClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTextTagClass.class
    type text_iter_t = GtkTextIterRecord.t
    type text_direction_t = GtkTextDirection.t
    type justification_t = GtkJustification.t
    type wrap_mode_t = GtkWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr 0 ---> GtkTextTagClass.FFI.fromPtr true) new_ name
    fun changed self sizeChanged = (GtkTextTagClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) changed_ (self & sizeChanged)
    fun event
      self
      (
        eventObject,
        event,
        iter
      ) =
      (
        GtkTextTagClass.FFI.withPtr false
         &&&> GObjectObjectClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        event_
        (
          self
           & eventObject
           & event
           & iter
        )
    fun getPriority self = (GtkTextTagClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPriority_ self
    fun setPriority self priority = (GtkTextTagClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPriority_ (self & priority)
    local
      open ClosureMarshal Signal
    in
      fun eventSig f =
        signal "event"
          (
            get 0w1 GObjectObjectClass.t
             &&&> get 0w2 GdkEvent.t
             &&&> get 0w3 GtkTextIterRecord.t
             ---> ret boolean
          )
          (
            fn
              object
               & event
               & iter =>
                f
                  (
                    object,
                    event,
                    iter
                  )
          )
    end
    local
      open ValueAccessor
    in
      val accumulativeMarginProp =
        {
          name = "accumulative-margin",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backgroundProp =
        {
          name = "background",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val backgroundFullHeightProp =
        {
          name = "background-full-height",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val backgroundFullHeightSetProp =
        {
          name = "background-full-height-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
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
      val directionProp =
        {
          name = "direction",
          gtype = fn () => C.gtype GtkTextDirection.t (),
          get = fn x => fn () => C.get GtkTextDirection.t x,
          set = fn x => C.set GtkTextDirection.t x,
          init = fn x => C.set GtkTextDirection.t x
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
      val fallbackProp =
        {
          name = "fallback",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val fallbackSetProp =
        {
          name = "fallback-set",
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
      val fontFeaturesProp =
        {
          name = "font-features",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val fontFeaturesSetProp =
        {
          name = "font-features-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
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
      val indentProp =
        {
          name = "indent",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val indentSetProp =
        {
          name = "indent-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val invisibleProp =
        {
          name = "invisible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val invisibleSetProp =
        {
          name = "invisible-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val justificationProp =
        {
          name = "justification",
          gtype = fn () => C.gtype GtkJustification.t (),
          get = fn x => fn () => C.get GtkJustification.t x,
          set = fn x => C.set GtkJustification.t x,
          init = fn x => C.set GtkJustification.t x
        }
      val justificationSetProp =
        {
          name = "justification-set",
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
      val leftMarginProp =
        {
          name = "left-margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val leftMarginSetProp =
        {
          name = "left-margin-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val letterSpacingProp =
        {
          name = "letter-spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val letterSpacingSetProp =
        {
          name = "letter-spacing-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val paragraphBackgroundProp =
        {
          name = "paragraph-background",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val paragraphBackgroundGdkProp =
        {
          name = "paragraph-background-gdk",
          gtype = fn () => C.gtype GdkColorRecord.tOpt (),
          get = fn x => fn () => C.get GdkColorRecord.tOpt x,
          set = fn x => C.set GdkColorRecord.tOpt x,
          init = fn x => C.set GdkColorRecord.tOpt x
        }
      val paragraphBackgroundRgbaProp =
        {
          name = "paragraph-background-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val paragraphBackgroundSetProp =
        {
          name = "paragraph-background-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pixelsAboveLinesProp =
        {
          name = "pixels-above-lines",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val pixelsAboveLinesSetProp =
        {
          name = "pixels-above-lines-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pixelsBelowLinesProp =
        {
          name = "pixels-below-lines",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val pixelsBelowLinesSetProp =
        {
          name = "pixels-below-lines-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pixelsInsideWrapProp =
        {
          name = "pixels-inside-wrap",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val pixelsInsideWrapSetProp =
        {
          name = "pixels-inside-wrap-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rightMarginProp =
        {
          name = "right-margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val rightMarginSetProp =
        {
          name = "right-margin-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
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
      val strikethroughRgbaProp =
        {
          name = "strikethrough-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val strikethroughRgbaSetProp =
        {
          name = "strikethrough-rgba-set",
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
      val tabsProp =
        {
          name = "tabs",
          gtype = fn () => C.gtype PangoTabArrayRecord.tOpt (),
          get = fn x => fn () => C.get PangoTabArrayRecord.tOpt x,
          set = fn x => C.set PangoTabArrayRecord.tOpt x,
          init = fn x => C.set PangoTabArrayRecord.tOpt x
        }
      val tabsSetProp =
        {
          name = "tabs-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val underlineProp =
        {
          name = "underline",
          gtype = fn () => C.gtype PangoUnderline.t (),
          get = fn x => fn () => C.get PangoUnderline.t x,
          set = fn x => C.set PangoUnderline.t x,
          init = fn x => C.set PangoUnderline.t x
        }
      val underlineRgbaProp =
        {
          name = "underline-rgba",
          gtype = fn () => C.gtype GdkRgbaRecord.tOpt (),
          get = fn x => fn () => C.get GdkRgbaRecord.tOpt x,
          set = fn x => C.set GdkRgbaRecord.tOpt x,
          init = fn x => C.set GdkRgbaRecord.tOpt x
        }
      val underlineRgbaSetProp =
        {
          name = "underline-rgba-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
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
      val wrapModeProp =
        {
          name = "wrap-mode",
          gtype = fn () => C.gtype GtkWrapMode.t (),
          get = fn x => fn () => C.get GtkWrapMode.t x,
          set = fn x => C.set GtkWrapMode.t x,
          init = fn x => C.set GtkWrapMode.t x
        }
      val wrapModeSetProp =
        {
          name = "wrap-mode-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
