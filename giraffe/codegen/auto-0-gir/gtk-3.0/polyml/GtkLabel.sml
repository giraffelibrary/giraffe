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
      val getType_ = call (load_sym libgtk "gtk_label_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_label_new") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_label_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAngle_ = call (load_sym libgtk "gtk_label_get_angle") (GtkLabelClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getAttributes_ = call (load_sym libgtk "gtk_label_get_attributes") (GtkLabelClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cPtr)
      val getCurrentUri_ = call (load_sym libgtk "gtk_label_get_current_uri") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEllipsize_ = call (load_sym libgtk "gtk_label_get_ellipsize") (GtkLabelClass.PolyML.cPtr --> PangoEllipsizeMode.PolyML.cVal)
      val getJustify_ = call (load_sym libgtk "gtk_label_get_justify") (GtkLabelClass.PolyML.cPtr --> GtkJustification.PolyML.cVal)
      val getLabel_ = call (load_sym libgtk "gtk_label_get_label") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLayout_ = call (load_sym libgtk "gtk_label_get_layout") (GtkLabelClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (load_sym libgtk "gtk_label_get_layout_offsets")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getLineWrap_ = call (load_sym libgtk "gtk_label_get_line_wrap") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLineWrapMode_ = call (load_sym libgtk "gtk_label_get_line_wrap_mode") (GtkLabelClass.PolyML.cPtr --> PangoWrapMode.PolyML.cVal)
      val getMaxWidthChars_ = call (load_sym libgtk "gtk_label_get_max_width_chars") (GtkLabelClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMnemonicKeyval_ = call (load_sym libgtk "gtk_label_get_mnemonic_keyval") (GtkLabelClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getMnemonicWidget_ = call (load_sym libgtk "gtk_label_get_mnemonic_widget") (GtkLabelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getSelectable_ = call (load_sym libgtk "gtk_label_get_selectable") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSelectionBounds_ =
        call (load_sym libgtk "gtk_label_get_selection_bounds")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getSingleLineMode_ = call (load_sym libgtk "gtk_label_get_single_line_mode") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_label_get_text") (GtkLabelClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTrackVisitedLinks_ = call (load_sym libgtk "gtk_label_get_track_visited_links") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseMarkup_ = call (load_sym libgtk "gtk_label_get_use_markup") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getUseUnderline_ = call (load_sym libgtk "gtk_label_get_use_underline") (GtkLabelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWidthChars_ = call (load_sym libgtk "gtk_label_get_width_chars") (GtkLabelClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val selectRegion_ =
        call (load_sym libgtk "gtk_label_select_region")
          (
            GtkLabelClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setAngle_ = call (load_sym libgtk "gtk_label_set_angle") (GtkLabelClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> PolyMLFFI.cVoid)
      val setAttributes_ = call (load_sym libgtk "gtk_label_set_attributes") (GtkLabelClass.PolyML.cPtr &&> PangoAttrListRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setEllipsize_ = call (load_sym libgtk "gtk_label_set_ellipsize") (GtkLabelClass.PolyML.cPtr &&> PangoEllipsizeMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setJustify_ = call (load_sym libgtk "gtk_label_set_justify") (GtkLabelClass.PolyML.cPtr &&> GtkJustification.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_label_set_label") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setLineWrap_ = call (load_sym libgtk "gtk_label_set_line_wrap") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLineWrapMode_ = call (load_sym libgtk "gtk_label_set_line_wrap_mode") (GtkLabelClass.PolyML.cPtr &&> PangoWrapMode.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMarkup_ = call (load_sym libgtk "gtk_label_set_markup") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setMarkupWithMnemonic_ = call (load_sym libgtk "gtk_label_set_markup_with_mnemonic") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setMaxWidthChars_ = call (load_sym libgtk "gtk_label_set_max_width_chars") (GtkLabelClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMnemonicWidget_ = call (load_sym libgtk "gtk_label_set_mnemonic_widget") (GtkLabelClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setPattern_ = call (load_sym libgtk "gtk_label_set_pattern") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setSelectable_ = call (load_sym libgtk "gtk_label_set_selectable") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSingleLineMode_ = call (load_sym libgtk "gtk_label_set_single_line_mode") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setText_ = call (load_sym libgtk "gtk_label_set_text") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTextWithMnemonic_ = call (load_sym libgtk "gtk_label_set_text_with_mnemonic") (GtkLabelClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setTrackVisitedLinks_ = call (load_sym libgtk "gtk_label_set_track_visited_links") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setUseMarkup_ = call (load_sym libgtk "gtk_label_set_use_markup") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setUseUnderline_ = call (load_sym libgtk "gtk_label_set_use_underline") (GtkLabelClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setWidthChars_ = call (load_sym libgtk "gtk_label_set_width_chars") (GtkLabelClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
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
    fun new str = (Utf8.FFI.withPtr ---> GtkLabelClass.FFI.fromPtr false) new_ str
    fun newWithMnemonic str = (Utf8.FFI.withPtr ---> GtkLabelClass.FFI.fromPtr false) newWithMnemonic_ str
    fun getAngle self = (GtkLabelClass.FFI.withPtr ---> GDouble.FFI.fromVal) getAngle_ self
    fun getAttributes self = (GtkLabelClass.FFI.withPtr ---> PangoAttrListRecord.FFI.fromPtr false) getAttributes_ self
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
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (x, y)
      end
    fun getLineWrap self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getLineWrap_ self
    fun getLineWrapMode self = (GtkLabelClass.FFI.withPtr ---> PangoWrapMode.FFI.fromVal) getLineWrapMode_ self
    fun getMaxWidthChars self = (GtkLabelClass.FFI.withPtr ---> GInt.FFI.fromVal) getMaxWidthChars_ self
    fun getMnemonicKeyval self = (GtkLabelClass.FFI.withPtr ---> GUInt.FFI.fromVal) getMnemonicKeyval_ self
    fun getMnemonicWidget self = (GtkLabelClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getMnemonicWidget_ self
    fun getSelectable self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getSelectable_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkLabelClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSelectionBounds_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getSingleLineMode self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getSingleLineMode_ self
    fun getText self = (GtkLabelClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun getTrackVisitedLinks self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getTrackVisitedLinks_ self
    fun getUseMarkup self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkLabelClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun getWidthChars self = (GtkLabelClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidthChars_ self
    fun selectRegion self startOffset endOffset =
      (
        GtkLabelClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startOffset
           & endOffset
        )
    fun setAngle self angle = (GtkLabelClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setAngle_ (self & angle)
    fun setAttributes self attrs = (GtkLabelClass.FFI.withPtr &&&> PangoAttrListRecord.FFI.withPtr ---> I) setAttributes_ (self & attrs)
    fun setEllipsize self mode = (GtkLabelClass.FFI.withPtr &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & mode)
    fun setJustify self jtype = (GtkLabelClass.FFI.withPtr &&&> GtkJustification.FFI.withVal ---> I) setJustify_ (self & jtype)
    fun setLabel self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & str)
    fun setLineWrap self wrap = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setLineWrap_ (self & wrap)
    fun setLineWrapMode self wrapMode = (GtkLabelClass.FFI.withPtr &&&> PangoWrapMode.FFI.withVal ---> I) setLineWrapMode_ (self & wrapMode)
    fun setMarkup self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMarkup_ (self & str)
    fun setMarkupWithMnemonic self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setMarkupWithMnemonic_ (self & str)
    fun setMaxWidthChars self nChars = (GtkLabelClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setMnemonicWidget self widget = (GtkLabelClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setMnemonicWidget_ (self & widget)
    fun setPattern self pattern = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setPattern_ (self & pattern)
    fun setSelectable self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSelectable_ (self & setting)
    fun setSingleLineMode self singleLineMode = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setSingleLineMode_ (self & singleLineMode)
    fun setText self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setText_ (self & str)
    fun setTextWithMnemonic self str = (GtkLabelClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTextWithMnemonic_ (self & str)
    fun setTrackVisitedLinks self trackLinks = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTrackVisitedLinks_ (self & trackLinks)
    fun setUseMarkup self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & setting)
    fun setUseUnderline self setting = (GtkLabelClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & setting)
    fun setWidthChars self nChars = (GtkLabelClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
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
                f step count extendSelection
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
    end
  end
