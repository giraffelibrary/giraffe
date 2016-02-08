structure GtkLabel :>
  GTK_LABEL
    where type 'a class_t = 'a GtkLabelClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type movement_step_t = GtkMovementStep.t
    where type 'a menu_class_t = 'a GtkMenuClass.t
    where type justification_t = GtkJustification.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    val getType_ = _import "gtk_label_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "mlton_gtk_label_new" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_label_new_with_mnemonic" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAngle_ = _import "gtk_label_get_angle" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getAttributes_ = _import "gtk_label_get_attributes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p;
    val getCurrentUri_ = _import "gtk_label_get_current_uri" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEllipsize_ = _import "gtk_label_get_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoEllipsizeMode.C.val_;
    val getJustify_ = _import "gtk_label_get_justify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkJustification.C.val_;
    val getLabel_ = _import "gtk_label_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getLayout_ = _import "gtk_label_get_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_layout_offsets" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineWrap_ = _import "gtk_label_get_line_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getLineWrapMode_ = _import "gtk_label_get_line_wrap_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> PangoWrapMode.C.val_;
    val getMaxWidthChars_ = _import "gtk_label_get_max_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getMnemonicKeyval_ = _import "gtk_label_get_mnemonic_keyval" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getMnemonicWidget_ = _import "gtk_label_get_mnemonic_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSelectable_ = _import "gtk_label_get_selectable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_selection_bounds" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleLineMode_ = _import "gtk_label_get_single_line_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getText_ = _import "gtk_label_get_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTrackVisitedLinks_ = _import "gtk_label_get_track_visited_links" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUseMarkup_ = _import "gtk_label_get_use_markup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getUseUnderline_ = _import "gtk_label_get_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getWidthChars_ = _import "gtk_label_get_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_select_region" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAngle_ = fn x1 & x2 => (_import "gtk_label_set_angle" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setAttributes_ = fn x1 & x2 => (_import "gtk_label_set_attributes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoAttrListRecord.C.notnull PangoAttrListRecord.C.p -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_label_set_ellipsize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoEllipsizeMode.C.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "gtk_label_set_justify" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkJustification.C.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLineWrap_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLineWrapMode_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * PangoWrapMode.C.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_markup" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMaxWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_max_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setMnemonicWidget_ = fn x1 & x2 => (_import "gtk_label_set_mnemonic_widget" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setPattern_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_pattern" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSelectable_ = fn x1 & x2 => (_import "gtk_label_set_selectable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSingleLineMode_ = fn x1 & x2 => (_import "gtk_label_set_single_line_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTrackVisitedLinks_ = fn x1 & x2 => (_import "gtk_label_set_track_visited_links" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_label_set_use_markup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_label_set_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class_t = 'a GtkLabelClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type movement_step_t = GtkMovementStep.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type justification_t = GtkJustification.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new str = (Utf8.C.withConstPtr ---> GtkLabelClass.C.fromPtr false) new_ str
    fun newWithMnemonic str = (Utf8.C.withConstPtr ---> GtkLabelClass.C.fromPtr false) newWithMnemonic_ str
    fun getAngle self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getAngle_ self
    fun getAttributes self = (GObjectObjectClass.C.withPtr ---> PangoAttrListRecord.C.fromPtr false) getAttributes_ self
    fun getCurrentUri self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentUri_ self
    fun getEllipsize self = (GObjectObjectClass.C.withPtr ---> PangoEllipsizeMode.C.fromVal) getEllipsize_ self
    fun getJustify self = (GObjectObjectClass.C.withPtr ---> GtkJustification.C.fromVal) getJustify_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (x, y)
      end
    fun getLineWrap self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getLineWrap_ self
    fun getLineWrapMode self = (GObjectObjectClass.C.withPtr ---> PangoWrapMode.C.fromVal) getLineWrapMode_ self
    fun getMaxWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxWidthChars_ self
    fun getMnemonicKeyval self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getMnemonicKeyval_ self
    fun getMnemonicWidget self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getMnemonicWidget_ self
    fun getSelectable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSelectable_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSelectionBounds_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (start, end') else NONE
      end
    fun getSingleLineMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSingleLineMode_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun getTrackVisitedLinks self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getTrackVisitedLinks_ self
    fun getUseMarkup self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun getWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidthChars_ self
    fun selectRegion self startOffset endOffset =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        selectRegion_
        (
          self
           & startOffset
           & endOffset
        )
    fun setAngle self angle = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setAngle_ (self & angle)
    fun setAttributes self attrs = (GObjectObjectClass.C.withPtr &&&> PangoAttrListRecord.C.withPtr ---> I) setAttributes_ (self & attrs)
    fun setEllipsize self mode = (GObjectObjectClass.C.withPtr &&&> PangoEllipsizeMode.C.withVal ---> I) setEllipsize_ (self & mode)
    fun setJustify self jtype = (GObjectObjectClass.C.withPtr &&&> GtkJustification.C.withVal ---> I) setJustify_ (self & jtype)
    fun setLabel self str = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setLabel_ (self & str)
    fun setLineWrap self wrap = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setLineWrap_ (self & wrap)
    fun setLineWrapMode self wrapMode = (GObjectObjectClass.C.withPtr &&&> PangoWrapMode.C.withVal ---> I) setLineWrapMode_ (self & wrapMode)
    fun setMarkup self str = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setMarkup_ (self & str)
    fun setMarkupWithMnemonic self str = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setMarkupWithMnemonic_ (self & str)
    fun setMaxWidthChars self nChars = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setMnemonicWidget self widget = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setMnemonicWidget_ (self & widget)
    fun setPattern self pattern = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setPattern_ (self & pattern)
    fun setSelectable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSelectable_ (self & setting)
    fun setSingleLineMode self singleLineMode = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSingleLineMode_ (self & singleLineMode)
    fun setText self str = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setText_ (self & str)
    fun setTextWithMnemonic self str = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setTextWithMnemonic_ (self & str)
    fun setTrackVisitedLinks self trackLinks = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setTrackVisitedLinks_ (self & trackLinks)
    fun setUseMarkup self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseMarkup_ (self & setting)
    fun setUseUnderline self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & setting)
    fun setWidthChars self nChars = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setWidthChars_ (self & nChars)
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
