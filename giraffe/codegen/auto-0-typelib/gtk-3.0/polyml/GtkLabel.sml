structure GtkLabel :>
  GTK_LABEL
    where type 'a class = 'a GtkLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type movement_step_t = GtkMovementStep.t
    where type 'a menu_class = 'a GtkMenuClass.class
    where type justification_t = GtkJustification.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_label_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_label_new") (Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_label_new_with_mnemonic") (Utf8.PolyML.cInOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAngle_ = call (getSymbol "gtk_label_get_angle") (GtkLabelClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getAttributes_ = call (getSymbol "gtk_label_get_attributes") (GtkLabelClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cOptPtr)
      val getCurrentUri_ = call (getSymbol "gtk_label_get_current_uri") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEllipsize_ = call (getSymbol "gtk_label_get_ellipsize") (GtkLabelClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getJustify_ = call (getSymbol "gtk_label_get_justify") (GtkLabelClass.PolyML.cPtr --> GtkJustification.PolyML.cVal)
      val getLabel_ = call (getSymbol "gtk_label_get_label") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLayout_ = call (getSymbol "gtk_label_get_layout") (GtkLabelClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (getSymbol "gtk_label_get_layout_offsets")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getLineWrap_ = call (getSymbol "gtk_label_get_line_wrap") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLineWrapMode_ = call (getSymbol "gtk_label_get_line_wrap_mode") (GtkLabelClass.PolyML.cPtr --> PangoWrapMode.PolyML.cVal)
      val getLines_ = call (getSymbol "gtk_label_get_lines") (GtkLabelClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMaxWidthChars_ = call (getSymbol "gtk_label_get_max_width_chars") (GtkLabelClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getMnemonicKeyval_ = call (getSymbol "gtk_label_get_mnemonic_keyval") (GtkLabelClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getMnemonicWidget_ = call (getSymbol "gtk_label_get_mnemonic_widget") (GtkLabelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getSelectable_ = call (getSymbol "gtk_label_get_selectable") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSelectionBounds_ =
        call (getSymbol "gtk_label_get_selection_bounds")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getSingleLineMode_ = call (getSymbol "gtk_label_get_single_line_mode") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getText_ = call (getSymbol "gtk_label_get_text") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTrackVisitedLinks_ = call (getSymbol "gtk_label_get_track_visited_links") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseMarkup_ = call (getSymbol "gtk_label_get_use_markup") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseUnderline_ = call (getSymbol "gtk_label_get_use_underline") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWidthChars_ = call (getSymbol "gtk_label_get_width_chars") (GtkLabelClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getXalign_ = call (getSymbol "gtk_label_get_xalign") (GtkLabelClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getYalign_ = call (getSymbol "gtk_label_get_yalign") (GtkLabelClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val selectRegion_ =
        call (getSymbol "gtk_label_select_region")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setAngle_ = call (getSymbol "gtk_label_set_angle") (GtkLabelClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setAttributes_ = call (getSymbol "gtk_label_set_attributes") (GtkLabelClass.PolyML.cPtr &&> PangoAttrListRecord.PolyML.cOptPtr --> cVoid)
      val setEllipsize_ = call (getSymbol "gtk_label_set_ellipsize") (GtkLabelClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> cVoid)
      val setJustify_ = call (getSymbol "gtk_label_set_justify") (GtkLabelClass.PolyML.cPtr &&> GtkJustification.PolyML.cVal --> cVoid)
      val setLabel_ = call (getSymbol "gtk_label_set_label") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setLineWrap_ = call (getSymbol "gtk_label_set_line_wrap") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLineWrapMode_ = call (getSymbol "gtk_label_set_line_wrap_mode") (GtkLabelClass.PolyML.cPtr &&> PangoWrapMode.PolyML.cVal --> cVoid)
      val setLines_ = call (getSymbol "gtk_label_set_lines") (GtkLabelClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setMarkup_ = call (getSymbol "gtk_label_set_markup") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMarkupWithMnemonic_ = call (getSymbol "gtk_label_set_markup_with_mnemonic") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setMaxWidthChars_ = call (getSymbol "gtk_label_set_max_width_chars") (GtkLabelClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setMnemonicWidget_ = call (getSymbol "gtk_label_set_mnemonic_widget") (GtkLabelClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setPattern_ = call (getSymbol "gtk_label_set_pattern") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setSelectable_ = call (getSymbol "gtk_label_set_selectable") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSingleLineMode_ = call (getSymbol "gtk_label_set_single_line_mode") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setText_ = call (getSymbol "gtk_label_set_text") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTextWithMnemonic_ = call (getSymbol "gtk_label_set_text_with_mnemonic") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setTrackVisitedLinks_ = call (getSymbol "gtk_label_set_track_visited_links") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseMarkup_ = call (getSymbol "gtk_label_set_use_markup") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_label_set_use_underline") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWidthChars_ = call (getSymbol "gtk_label_set_width_chars") (GtkLabelClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setXalign_ = call (getSymbol "gtk_label_set_xalign") (GtkLabelClass.PolyML.cPtr &&> GFloat.PolyML.cVal --> cVoid)
      val setYalign_ = call (getSymbol "gtk_label_set_yalign") (GtkLabelClass.PolyML.cPtr &&> GFloat.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type movement_step_t = GtkMovementStep.t
    type 'a menu_class = 'a GtkMenuClass.class
    type justification_t = GtkJustification.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new str = (Utf8.FFI.withOptPtr ---> GtkLabelClass.FFI.fromPtr false) new_ str
    fun newWithMnemonic str = (Utf8.FFI.withOptPtr ---> GtkLabelClass.FFI.fromPtr false) newWithMnemonic_ str
    fun getAngle self = (GtkLabelClass.FFI.withPtr ---> GDouble.FFI.fromVal) getAngle_ self
    fun getAttributes self = (GtkLabelClass.FFI.withPtr ---> PangoAttrListRecord.FFI.fromOptPtr false) getAttributes_ self
    fun getCurrentUri self = (GtkLabelClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentUri_ self
    fun getEllipsize self = (GtkLabelClass.FFI.withPtr ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getJustify self = (GtkLabelClass.FFI.withPtr ---> GtkJustification.FFI.fromVal) getJustify_ self
    fun getLabel self = (GtkLabelClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getLayout self = (GtkLabelClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkLabelClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getLineWrap self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getLineWrap_ self
    fun getLineWrapMode self = (GtkLabelClass.FFI.withPtr ---> PangoWrapMode.FFI.fromVal) getLineWrapMode_ self
    fun getLines self = (GtkLabelClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLines_ self
    fun getMaxWidthChars self = (GtkLabelClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxWidthChars_ self
    fun getMnemonicKeyval self = (GtkLabelClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getMnemonicKeyval_ self
    fun getMnemonicWidget self = (GtkLabelClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getMnemonicWidget_ self
    fun getSelectable self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getSelectable_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkLabelClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSelectionBounds_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getSingleLineMode self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getSingleLineMode_ self
    fun getText self = (GtkLabelClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun getTrackVisitedLinks self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getTrackVisitedLinks_ self
    fun getUseMarkup self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun getWidthChars self = (GtkLabelClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidthChars_ self
    fun getXalign self = (GtkLabelClass.FFI.withPtr ---> GFloat.FFI.fromVal) getXalign_ self
    fun getYalign self = (GtkLabelClass.FFI.withPtr ---> GFloat.FFI.fromVal) getYalign_ self
    fun selectRegion self (startOffset, endOffset) =
      (
        GtkLabelClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startOffset
           & endOffset
        )
    fun setAngle self angle = (GtkLabelClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setAngle_ (self & angle)
    fun setAttributes self attrs = (GtkLabelClass.FFI.withPtr &&&> PangoAttrListRecord.FFI.withOptPtr ---> I) setAttributes_ (self & attrs)
    fun setEllipsize self mode = (GtkLabelClass.FFI.withPtr &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & mode)
    fun setJustify self jtype = (GtkLabelClass.FFI.withPtr &&&> GtkJustification.FFI.withVal ---> I) setJustify_ (self & jtype)
    fun setLabel self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & str)
    fun setLineWrap self wrap = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLineWrap_ (self & wrap)
    fun setLineWrapMode self wrapMode = (GtkLabelClass.FFI.withPtr &&&> PangoWrapMode.FFI.withVal ---> I) setLineWrapMode_ (self & wrapMode)
    fun setLines self lines = (GtkLabelClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setLines_ (self & lines)
    fun setMarkup self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMarkup_ (self & str)
    fun setMarkupWithMnemonic self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMarkupWithMnemonic_ (self & str)
    fun setMaxWidthChars self nChars = (GtkLabelClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setMnemonicWidget self widget = (GtkLabelClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setMnemonicWidget_ (self & widget)
    fun setPattern self pattern = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPattern_ (self & pattern)
    fun setSelectable self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSelectable_ (self & setting)
    fun setSingleLineMode self singleLineMode = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSingleLineMode_ (self & singleLineMode)
    fun setText self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setText_ (self & str)
    fun setTextWithMnemonic self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTextWithMnemonic_ (self & str)
    fun setTrackVisitedLinks self trackLinks = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTrackVisitedLinks_ (self & trackLinks)
    fun setUseMarkup self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & setting)
    fun setUseUnderline self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & setting)
    fun setWidthChars self nChars = (GtkLabelClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    fun setXalign self xalign = (GtkLabelClass.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setXalign_ (self & xalign)
    fun setYalign self yalign = (GtkLabelClass.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setYalign_ (self & yalign)
    local
      open ClosureMarshal Signal
    in
      fun activateCurrentLinkSig f = signal "activate-current-link" (void ---> ret_void) f
      fun activateLinkSig f = signal "activate-link" (get 0w1 string ---> ret boolean) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun moveCursorSig f =
        signal "move-cursor"
          (
            get 0w1 GtkMovementStep.t
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             ---> ret_void
          )
          (
            fn
              step
               & count
               & extendSelection =>
                f
                  (
                    step,
                    count,
                    extendSelection
                  )
          )
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val angleProp =
        {
          get = fn x => get "angle" double x,
          set = fn x => set "angle" double x
        }
      val attributesProp =
        {
          get = fn x => get "attributes" PangoAttrListRecord.tOpt x,
          set = fn x => set "attributes" PangoAttrListRecord.tOpt x
        }
      val cursorPositionProp = {get = fn x => get "cursor-position" int x}
      val ellipsizeProp =
        {
          get = fn x => get "ellipsize" PangoEllipsizeMode.t x,
          set = fn x => set "ellipsize" PangoEllipsizeMode.t x
        }
      val justifyProp =
        {
          get = fn x => get "justify" GtkJustification.t x,
          set = fn x => set "justify" GtkJustification.t x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val linesProp =
        {
          get = fn x => get "lines" int x,
          set = fn x => set "lines" int x
        }
      val maxWidthCharsProp =
        {
          get = fn x => get "max-width-chars" int x,
          set = fn x => set "max-width-chars" int x
        }
      val mnemonicKeyvalProp = {get = fn x => get "mnemonic-keyval" uint x}
      val mnemonicWidgetProp =
        {
          get = fn x => get "mnemonic-widget" GtkWidgetClass.tOpt x,
          set = fn x => set "mnemonic-widget" GtkWidgetClass.tOpt x
        }
      val patternProp = {set = fn x => set "pattern" stringOpt x}
      val selectableProp =
        {
          get = fn x => get "selectable" boolean x,
          set = fn x => set "selectable" boolean x
        }
      val selectionBoundProp = {get = fn x => get "selection-bound" int x}
      val singleLineModeProp =
        {
          get = fn x => get "single-line-mode" boolean x,
          set = fn x => set "single-line-mode" boolean x
        }
      val trackVisitedLinksProp =
        {
          get = fn x => get "track-visited-links" boolean x,
          set = fn x => set "track-visited-links" boolean x
        }
      val useMarkupProp =
        {
          get = fn x => get "use-markup" boolean x,
          set = fn x => set "use-markup" boolean x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x
        }
      val wrapProp =
        {
          get = fn x => get "wrap" boolean x,
          set = fn x => set "wrap" boolean x
        }
      val wrapModeProp =
        {
          get = fn x => get "wrap-mode" PangoWrapMode.t x,
          set = fn x => set "wrap-mode" PangoWrapMode.t x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
      val yalignProp =
        {
          get = fn x => get "yalign" float x,
          set = fn x => set "yalign" float x
        }
    end
  end
