structure GtkLabel :>
  GTK_LABEL
    where type 'a class = 'a GtkLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type movement_step_t = GtkMovementStep.t
    where type 'a menu_class = 'a GtkMenuClass.class
    where type justification_t = GtkJustification.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_label_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_label_new" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_label_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getAngle_ = _import "gtk_label_get_angle" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Double.C.val_;
    val getAttributes_ = _import "gtk_label_get_attributes" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val getCurrentUri_ = _import "gtk_label_get_current_uri" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEllipsize_ = _import "gtk_label_get_ellipsize" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> PangoEllipsizeMode.C.val_;
    val getJustify_ = _import "gtk_label_get_justify" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> GtkJustification.C.val_;
    val getLabel_ = _import "gtk_label_get_label" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLayout_ = _import "gtk_label_get_layout" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_layout_offsets" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineWrap_ = _import "gtk_label_get_line_wrap" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getLineWrapMode_ = _import "gtk_label_get_line_wrap_mode" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> PangoWrapMode.C.val_;
    val getMaxWidthChars_ = _import "gtk_label_get_max_width_chars" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Int.C.val_;
    val getMnemonicKeyval_ = _import "gtk_label_get_mnemonic_keyval" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.UInt.C.val_;
    val getMnemonicWidget_ = _import "gtk_label_get_mnemonic_widget" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getSelectable_ = _import "gtk_label_get_selectable" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_selection_bounds" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleLineMode_ = _import "gtk_label_get_single_line_mode" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getText_ = _import "gtk_label_get_text" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTrackVisitedLinks_ = _import "gtk_label_get_track_visited_links" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getUseMarkup_ = _import "gtk_label_get_use_markup" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getUseUnderline_ = _import "gtk_label_get_use_underline" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Bool.C.val_;
    val getWidthChars_ = _import "gtk_label_get_width_chars" : GtkLabelClass.C.notnull GtkLabelClass.C.p -> FFI.Int.C.val_;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_select_region" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAngle_ = fn x1 & x2 => (_import "gtk_label_set_angle" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setAttributes_ = fn x1 & x2 => (_import "gtk_label_set_attributes" : GtkLabelClass.C.notnull GtkLabelClass.C.p * PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_label_set_ellipsize" : GtkLabelClass.C.notnull GtkLabelClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "gtk_label_set_justify" : GtkLabelClass.C.notnull GtkLabelClass.C.p * GtkJustification.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_label" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLineWrap_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLineWrapMode_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap_mode" : GtkLabelClass.C.notnull GtkLabelClass.C.p * PangoWrapMode.C.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_markup" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMarkupWithMnemonic_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_markup_with_mnemonic" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMaxWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_max_width_chars" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMnemonicWidget_ = fn x1 & x2 => (_import "gtk_label_set_mnemonic_widget" : GtkLabelClass.C.notnull GtkLabelClass.C.p * unit GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setPattern_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_pattern" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSelectable_ = fn x1 & x2 => (_import "gtk_label_set_selectable" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSingleLineMode_ = fn x1 & x2 => (_import "gtk_label_set_single_line_mode" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_text" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTextWithMnemonic_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_text_with_mnemonic" :
              GtkLabelClass.C.notnull GtkLabelClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTrackVisitedLinks_ = fn x1 & x2 => (_import "gtk_label_set_track_visited_links" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_label_set_use_markup" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_label_set_use_underline" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_width_chars" : GtkLabelClass.C.notnull GtkLabelClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type movement_step_t = GtkMovementStep.t
    type 'a menu_class = 'a GtkMenuClass.class
    type justification_t = GtkJustification.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new str = (Utf8.C.withPtr ---> GtkLabelClass.C.fromPtr false) new_ str
    fun newWithMnemonic str = (Utf8.C.withPtr ---> GtkLabelClass.C.fromPtr false) newWithMnemonic_ str
    fun getAngle self = (GtkLabelClass.C.withPtr ---> FFI.Double.C.fromVal) getAngle_ self
    fun getAttributes self = (GtkLabelClass.C.withPtr ---> PangoAttrListRecord.C.fromPtr false) getAttributes_ self
    fun getCurrentUri self = (GtkLabelClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentUri_ self
    fun getEllipsize self = (GtkLabelClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getJustify self = (GtkLabelClass.C.withPtr ---> GtkJustification.C.fromVal) getJustify_ self
    fun getLabel self = (GtkLabelClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLayout self = (GtkLabelClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkLabelClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (x, y)
      end
    fun getLineWrap self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getLineWrap_ self
    fun getLineWrapMode self = (GtkLabelClass.C.withPtr ---> PangoWrapMode.C.fromVal) getLineWrapMode_ self
    fun getMaxWidthChars self = (GtkLabelClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxWidthChars_ self
    fun getMnemonicKeyval self = (GtkLabelClass.C.withPtr ---> FFI.UInt.C.fromVal) getMnemonicKeyval_ self
    fun getMnemonicWidget self = (GtkLabelClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMnemonicWidget_ self
    fun getSelectable self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectable_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkLabelClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSelectionBounds_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getSingleLineMode self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getSingleLineMode_ self
    fun getText self = (GtkLabelClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun getTrackVisitedLinks self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getTrackVisitedLinks_ self
    fun getUseMarkup self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkLabelClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun getWidthChars self = (GtkLabelClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthChars_ self
    fun selectRegion self startOffset endOffset =
      (
        GtkLabelClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startOffset
           & endOffset
        )
    fun setAngle self angle = (GtkLabelClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setAngle_ (self & angle)
    fun setAttributes self attrs = (GtkLabelClass.C.withPtr &&&> PangoAttrListRecord.C.withPtr ---> I) setAttributes_ (self & attrs)
    fun setEllipsize self mode = (GtkLabelClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setJustify self jtype = (GtkLabelClass.C.withPtr &&&> GtkJustification.C.withVal ---> I) setJustify_ (self & jtype)
    fun setLabel self str = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & str)
    fun setLineWrap self wrap = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLineWrap_ (self & wrap)
    fun setLineWrapMode self wrapMode = (GtkLabelClass.C.withPtr &&&> PangoWrapMode.C.withVal ---> I) setLineWrapMode_ (self & wrapMode)
    fun setMarkup self str = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMarkup_ (self & str)
    fun setMarkupWithMnemonic self str = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setMarkupWithMnemonic_ (self & str)
    fun setMaxWidthChars self nChars = (GtkLabelClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setMnemonicWidget self widget = (GtkLabelClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setMnemonicWidget_ (self & widget)
    fun setPattern self pattern = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPattern_ (self & pattern)
    fun setSelectable self setting = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectable_ (self & setting)
    fun setSingleLineMode self singleLineMode = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSingleLineMode_ (self & singleLineMode)
    fun setText self str = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setText_ (self & str)
    fun setTextWithMnemonic self str = (GtkLabelClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTextWithMnemonic_ (self & str)
    fun setTrackVisitedLinks self trackLinks = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTrackVisitedLinks_ (self & trackLinks)
    fun setUseMarkup self setting = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseMarkup_ (self & setting)
    fun setUseUnderline self setting = (GtkLabelClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & setting)
    fun setWidthChars self nChars = (GtkLabelClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWidthChars_ (self & nChars)
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
