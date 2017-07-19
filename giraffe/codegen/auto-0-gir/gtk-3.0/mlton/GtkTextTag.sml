structure GtkTextTag :>
  GTK_TEXT_TAG
    where type 'a class = 'a GtkTextTagClass.class
    where type text_iter_t = GtkTextIterRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type justification_t = GtkJustification.t
    where type wrap_mode_t = GtkWrapMode.t =
  struct
    val getType_ = _import "gtk_text_tag_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_text_tag_new" : Utf8.MLton.p1 * unit Utf8.MLton.p2 -> GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p;
    val event_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_tag_event" :
              GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               * GdkEvent.FFI.notnull GdkEvent.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPriority_ = _import "gtk_text_tag_get_priority" : GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p -> GInt.FFI.val_;
    val setPriority_ = fn x1 & x2 => (_import "gtk_text_tag_set_priority" : GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkTextTagClass.class
    type text_iter_t = GtkTextIterRecord.t
    type text_direction_t = GtkTextDirection.t
    type justification_t = GtkJustification.t
    type wrap_mode_t = GtkWrapMode.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new name = (Utf8.FFI.withOptPtr ---> GtkTextTagClass.FFI.fromPtr true) new_ name
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
          set = fn x => set "accumulative-margin" boolean x
        }
      val backgroundProp = {set = fn x => set "background" stringOpt x}
      val backgroundFullHeightProp =
        {
          get = fn x => get "background-full-height" boolean x,
          set = fn x => set "background-full-height" boolean x
        }
      val backgroundFullHeightSetProp =
        {
          get = fn x => get "background-full-height-set" boolean x,
          set = fn x => set "background-full-height-set" boolean x
        }
      val backgroundGdkProp =
        {
          get = fn x => get "background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "background-gdk" GdkColorRecord.tOpt x
        }
      val backgroundRgbaProp =
        {
          get = fn x => get "background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "background-rgba" GdkRgbaRecord.tOpt x
        }
      val backgroundSetProp =
        {
          get = fn x => get "background-set" boolean x,
          set = fn x => set "background-set" boolean x
        }
      val directionProp =
        {
          get = fn x => get "direction" GtkTextDirection.t x,
          set = fn x => set "direction" GtkTextDirection.t x
        }
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x
        }
      val editableSetProp =
        {
          get = fn x => get "editable-set" boolean x,
          set = fn x => set "editable-set" boolean x
        }
      val familyProp =
        {
          get = fn x => get "family" stringOpt x,
          set = fn x => set "family" stringOpt x
        }
      val familySetProp =
        {
          get = fn x => get "family-set" boolean x,
          set = fn x => set "family-set" boolean x
        }
      val fontProp =
        {
          get = fn x => get "font" stringOpt x,
          set = fn x => set "font" stringOpt x
        }
      val fontDescProp =
        {
          get = fn x => get "font-desc" PangoFontDescriptionRecord.tOpt x,
          set = fn x => set "font-desc" PangoFontDescriptionRecord.tOpt x
        }
      val foregroundProp = {set = fn x => set "foreground" stringOpt x}
      val foregroundGdkProp =
        {
          get = fn x => get "foreground-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "foreground-gdk" GdkColorRecord.tOpt x
        }
      val foregroundRgbaProp =
        {
          get = fn x => get "foreground-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "foreground-rgba" GdkRgbaRecord.tOpt x
        }
      val foregroundSetProp =
        {
          get = fn x => get "foreground-set" boolean x,
          set = fn x => set "foreground-set" boolean x
        }
      val indentProp =
        {
          get = fn x => get "indent" int x,
          set = fn x => set "indent" int x
        }
      val indentSetProp =
        {
          get = fn x => get "indent-set" boolean x,
          set = fn x => set "indent-set" boolean x
        }
      val invisibleProp =
        {
          get = fn x => get "invisible" boolean x,
          set = fn x => set "invisible" boolean x
        }
      val invisibleSetProp =
        {
          get = fn x => get "invisible-set" boolean x,
          set = fn x => set "invisible-set" boolean x
        }
      val justificationProp =
        {
          get = fn x => get "justification" GtkJustification.t x,
          set = fn x => set "justification" GtkJustification.t x
        }
      val justificationSetProp =
        {
          get = fn x => get "justification-set" boolean x,
          set = fn x => set "justification-set" boolean x
        }
      val languageProp =
        {
          get = fn x => get "language" stringOpt x,
          set = fn x => set "language" stringOpt x
        }
      val languageSetProp =
        {
          get = fn x => get "language-set" boolean x,
          set = fn x => set "language-set" boolean x
        }
      val leftMarginProp =
        {
          get = fn x => get "left-margin" int x,
          set = fn x => set "left-margin" int x
        }
      val leftMarginSetProp =
        {
          get = fn x => get "left-margin-set" boolean x,
          set = fn x => set "left-margin-set" boolean x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val paragraphBackgroundProp = {set = fn x => set "paragraph-background" stringOpt x}
      val paragraphBackgroundGdkProp =
        {
          get = fn x => get "paragraph-background-gdk" GdkColorRecord.tOpt x,
          set = fn x => set "paragraph-background-gdk" GdkColorRecord.tOpt x
        }
      val paragraphBackgroundRgbaProp =
        {
          get = fn x => get "paragraph-background-rgba" GdkRgbaRecord.tOpt x,
          set = fn x => set "paragraph-background-rgba" GdkRgbaRecord.tOpt x
        }
      val paragraphBackgroundSetProp =
        {
          get = fn x => get "paragraph-background-set" boolean x,
          set = fn x => set "paragraph-background-set" boolean x
        }
      val pixelsAboveLinesProp =
        {
          get = fn x => get "pixels-above-lines" int x,
          set = fn x => set "pixels-above-lines" int x
        }
      val pixelsAboveLinesSetProp =
        {
          get = fn x => get "pixels-above-lines-set" boolean x,
          set = fn x => set "pixels-above-lines-set" boolean x
        }
      val pixelsBelowLinesProp =
        {
          get = fn x => get "pixels-below-lines" int x,
          set = fn x => set "pixels-below-lines" int x
        }
      val pixelsBelowLinesSetProp =
        {
          get = fn x => get "pixels-below-lines-set" boolean x,
          set = fn x => set "pixels-below-lines-set" boolean x
        }
      val pixelsInsideWrapProp =
        {
          get = fn x => get "pixels-inside-wrap" int x,
          set = fn x => set "pixels-inside-wrap" int x
        }
      val pixelsInsideWrapSetProp =
        {
          get = fn x => get "pixels-inside-wrap-set" boolean x,
          set = fn x => set "pixels-inside-wrap-set" boolean x
        }
      val rightMarginProp =
        {
          get = fn x => get "right-margin" int x,
          set = fn x => set "right-margin" int x
        }
      val rightMarginSetProp =
        {
          get = fn x => get "right-margin-set" boolean x,
          set = fn x => set "right-margin-set" boolean x
        }
      val riseProp =
        {
          get = fn x => get "rise" int x,
          set = fn x => set "rise" int x
        }
      val riseSetProp =
        {
          get = fn x => get "rise-set" boolean x,
          set = fn x => set "rise-set" boolean x
        }
      val scaleProp =
        {
          get = fn x => get "scale" double x,
          set = fn x => set "scale" double x
        }
      val scaleSetProp =
        {
          get = fn x => get "scale-set" boolean x,
          set = fn x => set "scale-set" boolean x
        }
      val sizeProp =
        {
          get = fn x => get "size" int x,
          set = fn x => set "size" int x
        }
      val sizePointsProp =
        {
          get = fn x => get "size-points" double x,
          set = fn x => set "size-points" double x
        }
      val sizeSetProp =
        {
          get = fn x => get "size-set" boolean x,
          set = fn x => set "size-set" boolean x
        }
      val stretchProp =
        {
          get = fn x => get "stretch" PangoStretch.t x,
          set = fn x => set "stretch" PangoStretch.t x
        }
      val stretchSetProp =
        {
          get = fn x => get "stretch-set" boolean x,
          set = fn x => set "stretch-set" boolean x
        }
      val strikethroughProp =
        {
          get = fn x => get "strikethrough" boolean x,
          set = fn x => set "strikethrough" boolean x
        }
      val strikethroughSetProp =
        {
          get = fn x => get "strikethrough-set" boolean x,
          set = fn x => set "strikethrough-set" boolean x
        }
      val styleProp =
        {
          get = fn x => get "style" PangoStyle.t x,
          set = fn x => set "style" PangoStyle.t x
        }
      val styleSetProp =
        {
          get = fn x => get "style-set" boolean x,
          set = fn x => set "style-set" boolean x
        }
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x
        }
      val tabsSetProp =
        {
          get = fn x => get "tabs-set" boolean x,
          set = fn x => set "tabs-set" boolean x
        }
      val underlineProp =
        {
          get = fn x => get "underline" PangoUnderline.t x,
          set = fn x => set "underline" PangoUnderline.t x
        }
      val underlineSetProp =
        {
          get = fn x => get "underline-set" boolean x,
          set = fn x => set "underline-set" boolean x
        }
      val variantProp =
        {
          get = fn x => get "variant" PangoVariant.t x,
          set = fn x => set "variant" PangoVariant.t x
        }
      val variantSetProp =
        {
          get = fn x => get "variant-set" boolean x,
          set = fn x => set "variant-set" boolean x
        }
      val weightProp =
        {
          get = fn x => get "weight" int x,
          set = fn x => set "weight" int x
        }
      val weightSetProp =
        {
          get = fn x => get "weight-set" boolean x,
          set = fn x => set "weight-set" boolean x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" GtkWrapMode.t x,
          set = fn x => set "wrap-mode" GtkWrapMode.t x
        }
      val wrapModeSetProp =
        {
          get = fn x => get "wrap-mode-set" boolean x,
          set = fn x => set "wrap-mode-set" boolean x
        }
    end
  end
