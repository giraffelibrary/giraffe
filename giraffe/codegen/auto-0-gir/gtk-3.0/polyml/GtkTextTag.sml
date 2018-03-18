structure GtkTextTag :>
  GTK_TEXT_TAG
    where type 'a class = 'a GtkTextTagClass.class
    where type text_iter_t = GtkTextIterRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type justification_t = GtkJustification.t
    where type wrap_mode_t = GtkWrapMode.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_text_tag_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_text_tag_new") (Utf8.PolyML.cInOptPtr --> GtkTextTagClass.PolyML.cPtr)
      val changed_ = call (getSymbol "gtk_text_tag_changed") (GtkTextTagClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val event_ =
        call (getSymbol "gtk_text_tag_event")
          (
            GtkTextTagClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getPriority_ = call (getSymbol "gtk_text_tag_get_priority") (GtkTextTagClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val setPriority_ = call (getSymbol "gtk_text_tag_set_priority") (GtkTextTagClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkTextTagClass.class
    type text_iter_t = GtkTextIterRecord.t
    type text_direction_t = GtkTextDirection.t
    type justification_t = GtkJustification.t
    type wrap_mode_t = GtkWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr ---> GtkTextTagClass.FFI.fromPtr true) new_ name
    fun changed self sizeChanged = (GtkTextTagClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) changed_ (self & sizeChanged)
    fun event
      self
      (
        eventObject,
        event,
        iter
      ) =
      (
        GtkTextTagClass.FFI.withPtr
         &&&> GObjectObjectClass.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        event_
        (
          self
           & eventObject
           & event
           & iter
        )
    fun getPriority self = (GtkTextTagClass.FFI.withPtr ---> GInt.FFI.fromVal) getPriority_ self
    fun setPriority self priority = (GtkTextTagClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPriority_ (self & priority)
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
      open Property
    in
      val accumulativeMarginProp =
        {
          get = fn x => get "accumulative-margin" boolean x,
          set = fn x => set "accumulative-margin" boolean x,
          new = fn x => new "accumulative-margin" boolean x
        }
      val backgroundProp =
        {
          set = fn x => set "background" stringOpt x,
          new = fn x => new "background" stringOpt x
        }
      val backgroundFullHeightProp =
        {
          get = fn x => get "background-full-height" boolean x,
          set = fn x => set "background-full-height" boolean x,
          new = fn x => new "background-full-height" boolean x
        }
      val backgroundFullHeightSetProp =
        {
          get = fn x => get "background-full-height-set" boolean x,
          set = fn x => set "background-full-height-set" boolean x,
          new = fn x => new "background-full-height-set" boolean x
        }
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x,
          new = fn x => new "background-set" boolean x
        }
      val directionProp =
        {
          get = fn x => get "direction" GtkTextDirection.t x,
          set = fn x => set "direction" GtkTextDirection.t x,
          new = fn x => new "direction" GtkTextDirection.t x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x,
          new = fn x => new "editable" boolean x
        }
      val editableSetProp =
        {
          get = fn x => get "editable-set" boolean x,
          set = fn x => set "editable-set" boolean x,
          new = fn x => new "editable-set" boolean x
        }
      val fallbackProp =
        {
          get = fn x => get "fallback" boolean x,
          set = fn x => set "fallback" boolean x,
          new = fn x => new "fallback" boolean x
        }
      val fallbackSetProp =
        {
          get = fn x => get "fallback-set" boolean x,
          set = fn x => set "fallback-set" boolean x,
          new = fn x => new "fallback-set" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" stringOpt x,
          set = fn x => set "family" stringOpt x,
          new = fn x => new "family" stringOpt x
        }
      val familySetProp =
        {
          get = fn x => get "family-set" boolean x,
          set = fn x => set "family-set" boolean x,
          new = fn x => new "family-set" boolean x
        }
      val fontProp =
        {
          get = fn x => get "font" stringOpt x,
          set = fn x => set "font" stringOpt x,
          new = fn x => new "font" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x,
          new = fn x => new "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val fontFeaturesProp =
        {
          get = fn x => get "font-features" stringOpt x,
          set = fn x => set "font-features" stringOpt x,
          new = fn x => new "font-features" stringOpt x
        }
      val fontFeaturesSetProp =
        {
          get = fn x => get "font-features-set" boolean x,
          set = fn x => set "font-features-set" boolean x,
          new = fn x => new "font-features-set" boolean x
        }
      val foregroundProp =
        {
          set = fn x => set "foreground" stringOpt x,
          new = fn x => new "foreground" stringOpt x
        }
      val foregroundGdkProp =
        {
          get = fn x => get "foreground-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "foreground-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "foreground-gdk" GdkColorRecord.tOpt x
        }
      val foregroundRgbaProp =
        {
          get = fn x => get "foreground-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "foreground-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "foreground-rgba" GdkRgbaRecord.tOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x,
          new = fn x => new "foreground-set" boolean x
        }
      val indentProp =
        {
          get = fn x => get "indent" int x,
          set = fn x => set "indent" int x,
          new = fn x => new "indent" int x
        }
      val indentSetProp =
        {
          get = fn x => get "indent-set" boolean x,
          set = fn x => set "indent-set" boolean x,
          new = fn x => new "indent-set" boolean x
        }
      val invisibleProp =
        {
          get = fn x => get "invisible" boolean x,
          set = fn x => set "invisible" boolean x,
          new = fn x => new "invisible" boolean x
        }
      val invisibleSetProp =
        {
          get = fn x => get "invisible-set" boolean x,
          set = fn x => set "invisible-set" boolean x,
          new = fn x => new "invisible-set" boolean x
        }
      val justificationProp =
        {
          get = fn x => get "justification" GtkJustification.t x,
          set = fn x => set "justification" GtkJustification.t x,
          new = fn x => new "justification" GtkJustification.t x
        }
      val justificationSetProp =
        {
          get = fn x => get "justification-set" boolean x,
          set = fn x => set "justification-set" boolean x,
          new = fn x => new "justification-set" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" stringOpt x,
          set = fn x => set "language" stringOpt x,
          new = fn x => new "language" stringOpt x
        }
      val languageSetProp =
        {
          get = fn x => get "language-set" boolean x,
          set = fn x => set "language-set" boolean x,
          new = fn x => new "language-set" boolean x
        }
      val leftMarginProp =
        {
          get = fn x => get "left-margin" int x,
          set = fn x => set "left-margin" int x,
          new = fn x => new "left-margin" int x
        }
      val leftMarginSetProp =
        {
          get = fn x => get "left-margin-set" boolean x,
          set = fn x => set "left-margin-set" boolean x,
          new = fn x => new "left-margin-set" boolean x
        }
      val letterSpacingProp =
        {
          get = fn x => get "letter-spacing" int x,
          set = fn x => set "letter-spacing" int x,
          new = fn x => new "letter-spacing" int x
        }
      val letterSpacingSetProp =
        {
          get = fn x => get "letter-spacing-set" boolean x,
          set = fn x => set "letter-spacing-set" boolean x,
          new = fn x => new "letter-spacing-set" boolean x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          new = fn x => new "name" stringOpt x
        }
      val paragraphBackgroundProp =
        {
          set = fn x => set "paragraph-background" stringOpt x,
          new = fn x => new "paragraph-background" stringOpt x
        }
      val paragraphBackgroundGdkProp =
        {
          get = fn x => get "paragraph-background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "paragraph-background-gdk" GdkColorRecord.tOpt x,
          new = fn x => new "paragraph-background-gdk" GdkColorRecord.tOpt x
        }
      val paragraphBackgroundRgbaProp =
        {
          get = fn x => get "paragraph-background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "paragraph-background-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "paragraph-background-rgba" GdkRgbaRecord.tOpt x
        }
      val paragraphBackgroundSetProp =
        {
          get = fn x => get "paragraph-background-set" boolean x,
          set = fn x => set "paragraph-background-set" boolean x,
          new = fn x => new "paragraph-background-set" boolean x
        }
      val pixelsAboveLinesProp =
        {
          get = fn x => get "pixels-above-lines" int x,
          set = fn x => set "pixels-above-lines" int x,
          new = fn x => new "pixels-above-lines" int x
        }
      val pixelsAboveLinesSetProp =
        {
          get = fn x => get "pixels-above-lines-set" boolean x,
          set = fn x => set "pixels-above-lines-set" boolean x,
          new = fn x => new "pixels-above-lines-set" boolean x
        }
      val pixelsBelowLinesProp =
        {
          get = fn x => get "pixels-below-lines" int x,
          set = fn x => set "pixels-below-lines" int x,
          new = fn x => new "pixels-below-lines" int x
        }
      val pixelsBelowLinesSetProp =
        {
          get = fn x => get "pixels-below-lines-set" boolean x,
          set = fn x => set "pixels-below-lines-set" boolean x,
          new = fn x => new "pixels-below-lines-set" boolean x
        }
      val pixelsInsideWrapProp =
        {
          get = fn x => get "pixels-inside-wrap" int x,
          set = fn x => set "pixels-inside-wrap" int x,
          new = fn x => new "pixels-inside-wrap" int x
        }
      val pixelsInsideWrapSetProp =
        {
          get = fn x => get "pixels-inside-wrap-set" boolean x,
          set = fn x => set "pixels-inside-wrap-set" boolean x,
          new = fn x => new "pixels-inside-wrap-set" boolean x
        }
      val rightMarginProp =
        {
          get = fn x => get "right-margin" int x,
          set = fn x => set "right-margin" int x,
          new = fn x => new "right-margin" int x
        }
      val rightMarginSetProp =
        {
          get = fn x => get "right-margin-set" boolean x,
          set = fn x => set "right-margin-set" boolean x,
          new = fn x => new "right-margin-set" boolean x
        }
      val riseProp =
        {
          get = fn x => get "rise" int x,
          set = fn x => set "rise" int x,
          new = fn x => new "rise" int x
        }
      val riseSetProp =
        {
          get = fn x => get "rise-set" boolean x,
          set = fn x => set "rise-set" boolean x,
          new = fn x => new "rise-set" boolean x
        }
      val scaleProp =
        {
          get = fn x => get "scale" double x,
          set = fn x => set "scale" double x,
          new = fn x => new "scale" double x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          set = fn x => set "scale-set" boolean x,
          new = fn x => new "scale-set" boolean x
        }
      val sizeProp =
        {
          get = fn x => get "size" int x,
          set = fn x => set "size" int x,
          new = fn x => new "size" int x
        }
      val sizePointsProp =
        {
          get = fn x => get "size-points" double x,
          set = fn x => set "size-points" double x,
          new = fn x => new "size-points" double x
        }
      val sizeSetProp =
        {
          get = fn x => get "size-set" boolean x,
          set = fn x => set "size-set" boolean x,
          new = fn x => new "size-set" boolean x
        }
      val stretchProp =
        {
          get = fn x => get "stretch" PangoStretch.t x,
          set = fn x => set "stretch" PangoStretch.t x,
          new = fn x => new "stretch" PangoStretch.t x
        }
      val stretchSetProp =
        {
          get = fn x => get "stretch-set" boolean x,
          set = fn x => set "stretch-set" boolean x,
          new = fn x => new "stretch-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x,
          new = fn x => new "strikethrough" boolean x
        }
      val strikethroughRgbaProp =
        {
          get = fn x => get "strikethrough-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "strikethrough-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "strikethrough-rgba" GdkRgbaRecord.tOpt x
        }
      val strikethroughRgbaSetProp =
        {
          get = fn x => get "strikethrough-rgba-set" boolean x,
          set = fn x => set "strikethrough-rgba-set" boolean x,
          new = fn x => new "strikethrough-rgba-set" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x,
          new = fn x => new "strikethrough-set" boolean x
        }
      val styleProp =
        {
          get = fn x => get "style" PangoStyle.t x,
          set = fn x => set "style" PangoStyle.t x,
          new = fn x => new "style" PangoStyle.t x
        }
      val styleSetProp =
        {
          get = fn x => get "style-set" boolean x,
          set = fn x => set "style-set" boolean x,
          new = fn x => new "style-set" boolean x
        }
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x,
          new = fn x => new "tabs" PangoTabArrayRecord.tOpt x
        }
      val tabsSetProp =
        {
          get = fn x => get "tabs-set" boolean x,
          set = fn x => set "tabs-set" boolean x,
          new = fn x => new "tabs-set" boolean x
        }
      val underlineProp =
        {
          get = fn x => get "underline" PangoUnderline.t x,
          set = fn x => set "underline" PangoUnderline.t x,
          new = fn x => new "underline" PangoUnderline.t x
        }
      val underlineRgbaProp =
        {
          get = fn x => get "underline-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "underline-rgba" GdkRgbaRecord.tOpt x,
          new = fn x => new "underline-rgba" GdkRgbaRecord.tOpt x
        }
      val underlineRgbaSetProp =
        {
          get = fn x => get "underline-rgba-set" boolean x,
          set = fn x => set "underline-rgba-set" boolean x,
          new = fn x => new "underline-rgba-set" boolean x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x,
          new = fn x => new "underline-set" boolean x
        }
      val variantProp =
        {
          get = fn x => get "variant" PangoVariant.t x,
          set = fn x => set "variant" PangoVariant.t x,
          new = fn x => new "variant" PangoVariant.t x
        }
      val variantSetProp =
        {
          get = fn x => get "variant-set" boolean x,
          set = fn x => set "variant-set" boolean x,
          new = fn x => new "variant-set" boolean x
        }
      val weightProp =
        {
          get = fn x => get "weight" int x,
          set = fn x => set "weight" int x,
          new = fn x => new "weight" int x
        }
      val weightSetProp =
        {
          get = fn x => get "weight-set" boolean x,
          set = fn x => set "weight-set" boolean x,
          new = fn x => new "weight-set" boolean x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x,
          new = fn x => new "wrap-mode" GtkWrapMode.t x
        }
      val wrapModeSetProp =
        {
          get = fn x => get "wrap-mode-set" boolean x,
          set = fn x => set "wrap-mode-set" boolean x,
          new = fn x => new "wrap-mode-set" boolean x
        }
    end
  end
