structure GtkLabel :>
  GTK_LABEL
    where type 'a class = 'a GtkLabelClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type movement_step_t = GtkMovementStep.t
    where type 'a menu_class = 'a GtkMenuClass.class
    where type justification_t = GtkJustification.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_label_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "mlton_gtk_label_new" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_label_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getAngle_ = _import "gtk_label_get_angle" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GDouble.FFI.val_;
    val getAttributes_ = _import "gtk_label_get_attributes" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> PangoAttrListRecord.FFI.opt PangoAttrListRecord.FFI.p;
    val getCurrentUri_ = _import "gtk_label_get_current_uri" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getEllipsize_ = _import "gtk_label_get_ellipsize" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> PangoEllipsizeMode.FFI.val_;
    val getJustify_ = _import "gtk_label_get_justify" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GtkJustification.FFI.val_;
    val getLabel_ = _import "gtk_label_get_label" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getLayout_ = _import "gtk_label_get_layout" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_layout_offsets" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getLineWrap_ = _import "gtk_label_get_line_wrap" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getLineWrapMode_ = _import "gtk_label_get_line_wrap_mode" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> PangoWrapMode.FFI.val_;
    val getLines_ = _import "gtk_label_get_lines" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GInt.FFI.val_;
    val getMaxWidthChars_ = _import "gtk_label_get_max_width_chars" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GInt.FFI.val_;
    val getMnemonicKeyval_ = _import "gtk_label_get_mnemonic_keyval" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GUInt.FFI.val_;
    val getMnemonicWidget_ = _import "gtk_label_get_mnemonic_widget" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getSelectable_ = _import "gtk_label_get_selectable" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getSelectionBounds_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_get_selection_bounds" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getSingleLineMode_ = _import "gtk_label_get_single_line_mode" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getText_ = _import "gtk_label_get_text" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getTrackVisitedLinks_ = _import "gtk_label_get_track_visited_links" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getUseMarkup_ = _import "gtk_label_get_use_markup" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getUseUnderline_ = _import "gtk_label_get_use_underline" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GBool.FFI.val_;
    val getWidthChars_ = _import "gtk_label_get_width_chars" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GInt.FFI.val_;
    val getXalign_ = _import "gtk_label_get_xalign" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GFloat.FFI.val_;
    val getYalign_ = _import "gtk_label_get_yalign" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p -> GFloat.FFI.val_;
    val selectRegion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_label_select_region" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setAngle_ = fn x1 & x2 => (_import "gtk_label_set_angle" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setAttributes_ = fn x1 & x2 => (_import "gtk_label_set_attributes" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * PangoAttrListRecord.FFI.opt PangoAttrListRecord.FFI.p -> unit;) (x1, x2)
    val setEllipsize_ = fn x1 & x2 => (_import "gtk_label_set_ellipsize" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * PangoEllipsizeMode.FFI.val_ -> unit;) (x1, x2)
    val setJustify_ = fn x1 & x2 => (_import "gtk_label_set_justify" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GtkJustification.FFI.val_ -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_label" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLineWrap_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLineWrapMode_ = fn x1 & x2 => (_import "gtk_label_set_line_wrap_mode" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * PangoWrapMode.FFI.val_ -> unit;) (x1, x2)
    val setLines_ = fn x1 & x2 => (_import "gtk_label_set_lines" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_markup" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setMaxWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_max_width_chars" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMnemonicWidget_ = fn x1 & x2 => (_import "gtk_label_set_mnemonic_widget" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setPattern_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_pattern" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setSelectable_ = fn x1 & x2 => (_import "gtk_label_set_selectable" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSingleLineMode_ = fn x1 & x2 => (_import "gtk_label_set_single_line_mode" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_label_set_text" :
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
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
              GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTrackVisitedLinks_ = fn x1 & x2 => (_import "gtk_label_set_track_visited_links" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseMarkup_ = fn x1 & x2 => (_import "gtk_label_set_use_markup" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_label_set_use_underline" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_label_set_width_chars" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setXalign_ = fn x1 & x2 => (_import "gtk_label_set_xalign" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GFloat.FFI.val_ -> unit;) (x1, x2)
    val setYalign_ = fn x1 & x2 => (_import "gtk_label_set_yalign" : GtkLabelClass.FFI.non_opt GtkLabelClass.FFI.p * GFloat.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkLabelClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type movement_step_t = GtkMovementStep.t
    type 'a menu_class = 'a GtkMenuClass.class
    type justification_t = GtkJustification.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new str = (Utf8.FFI.withOptPtr 0 ---> GtkLabelClass.FFI.fromPtr false) new_ str before Utf8.FFI.touchOptPtr str
    fun newWithMnemonic str = (Utf8.FFI.withOptPtr 0 ---> GtkLabelClass.FFI.fromPtr false) newWithMnemonic_ str before Utf8.FFI.touchOptPtr str
    fun getAngle self = (GtkLabelClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getAngle_ self
    fun getAttributes self = (GtkLabelClass.FFI.withPtr false ---> PangoAttrListRecord.FFI.fromOptPtr false) getAttributes_ self before GtkLabelClass.FFI.touchPtr self
    fun getCurrentUri self = (GtkLabelClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentUri_ self before GtkLabelClass.FFI.touchPtr self
    fun getEllipsize self = (GtkLabelClass.FFI.withPtr false ---> PangoEllipsizeMode.FFI.fromVal) getEllipsize_ self
    fun getJustify self = (GtkLabelClass.FFI.withPtr false ---> GtkJustification.FFI.fromVal) getJustify_ self
    fun getLabel self = (GtkLabelClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getLabel_ self before GtkLabelClass.FFI.touchPtr self
    fun getLayout self = (GtkLabelClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self before GtkLabelClass.FFI.touchPtr self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkLabelClass.FFI.withPtr false
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
    fun getLineWrap self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getLineWrap_ self
    fun getLineWrapMode self = (GtkLabelClass.FFI.withPtr false ---> PangoWrapMode.FFI.fromVal) getLineWrapMode_ self
    fun getLines self = (GtkLabelClass.FFI.withPtr false ---> GInt.FFI.fromVal) getLines_ self
    fun getMaxWidthChars self = (GtkLabelClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMaxWidthChars_ self
    fun getMnemonicKeyval self = (GtkLabelClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getMnemonicKeyval_ self
    fun getMnemonicWidget self = (GtkLabelClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getMnemonicWidget_ self before GtkLabelClass.FFI.touchPtr self
    fun getSelectable self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSelectable_ self
    fun getSelectionBounds self =
      let
        val start
         & end'
         & retVal =
          (
            GtkLabelClass.FFI.withPtr false
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
    fun getSingleLineMode self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSingleLineMode_ self
    fun getText self = (GtkLabelClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getText_ self before GtkLabelClass.FFI.touchPtr self
    fun getTrackVisitedLinks self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTrackVisitedLinks_ self
    fun getUseMarkup self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseMarkup_ self
    fun getUseUnderline self = (GtkLabelClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun getWidthChars self = (GtkLabelClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidthChars_ self
    fun getXalign self = (GtkLabelClass.FFI.withPtr false ---> GFloat.FFI.fromVal) getXalign_ self
    fun getYalign self = (GtkLabelClass.FFI.withPtr false ---> GFloat.FFI.fromVal) getYalign_ self
    fun selectRegion self (startOffset, endOffset) =
      (
        GtkLabelClass.FFI.withPtr false
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
    fun setAngle self angle = (GtkLabelClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setAngle_ (self & angle)
    fun setAttributes self attrs = (GtkLabelClass.FFI.withPtr false &&&> PangoAttrListRecord.FFI.withOptPtr false ---> I) setAttributes_ (self & attrs)
    fun setEllipsize self mode = (GtkLabelClass.FFI.withPtr false &&&> PangoEllipsizeMode.FFI.withVal ---> I) setEllipsize_ (self & mode)
    fun setJustify self jtype = (GtkLabelClass.FFI.withPtr false &&&> GtkJustification.FFI.withVal ---> I) setJustify_ (self & jtype)
    fun setLabel self str = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setLabel_ (self & str)
    fun setLineWrap self wrap = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setLineWrap_ (self & wrap)
    fun setLineWrapMode self wrapMode = (GtkLabelClass.FFI.withPtr false &&&> PangoWrapMode.FFI.withVal ---> I) setLineWrapMode_ (self & wrapMode)
    fun setLines self lines = (GtkLabelClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setLines_ (self & lines)
    fun setMarkup self str = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setMarkup_ (self & str)
    fun setMarkupWithMnemonic self str = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setMarkupWithMnemonic_ (self & str)
    fun setMaxWidthChars self nChars = (GtkLabelClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setMnemonicWidget self widget = (GtkLabelClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setMnemonicWidget_ (self & widget)
    fun setPattern self pattern = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setPattern_ (self & pattern)
    fun setSelectable self setting = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSelectable_ (self & setting)
    fun setSingleLineMode self singleLineMode = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSingleLineMode_ (self & singleLineMode)
    fun setText self str = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setText_ (self & str)
    fun setTextWithMnemonic self str = (GtkLabelClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTextWithMnemonic_ (self & str)
    fun setTrackVisitedLinks self trackLinks = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTrackVisitedLinks_ (self & trackLinks)
    fun setUseMarkup self setting = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseMarkup_ (self & setting)
    fun setUseUnderline self setting = (GtkLabelClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & setting)
    fun setWidthChars self nChars = (GtkLabelClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    fun setXalign self xalign = (GtkLabelClass.FFI.withPtr false &&&> GFloat.FFI.withVal ---> I) setXalign_ (self & xalign)
    fun setYalign self yalign = (GtkLabelClass.FFI.withPtr false &&&> GFloat.FFI.withVal ---> I) setYalign_ (self & yalign)
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
      open ValueAccessor
    in
      val angleProp =
        {
          name = "angle",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val attributesProp =
        {
          name = "attributes",
          gtype = fn () => C.gtype PangoAttrListRecord.tOpt (),
          get = fn x => fn () => C.get PangoAttrListRecord.tOpt x,
          set = fn x => C.set PangoAttrListRecord.tOpt x,
          init = fn x => C.set PangoAttrListRecord.tOpt x
        }
      val cursorPositionProp =
        {
          name = "cursor-position",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val ellipsizeProp =
        {
          name = "ellipsize",
          gtype = fn () => C.gtype PangoEllipsizeMode.t (),
          get = fn x => fn () => C.get PangoEllipsizeMode.t x,
          set = fn x => C.set PangoEllipsizeMode.t x,
          init = fn x => C.set PangoEllipsizeMode.t x
        }
      val justifyProp =
        {
          name = "justify",
          gtype = fn () => C.gtype GtkJustification.t (),
          get = fn x => fn () => C.get GtkJustification.t x,
          set = fn x => C.set GtkJustification.t x,
          init = fn x => C.set GtkJustification.t x
        }
      val labelProp =
        {
          name = "label",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val linesProp =
        {
          name = "lines",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val maxWidthCharsProp =
        {
          name = "max-width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val mnemonicKeyvalProp =
        {
          name = "mnemonic-keyval",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = ignore
        }
      val mnemonicWidgetProp =
        {
          name = "mnemonic-widget",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val patternProp =
        {
          name = "pattern",
          gtype = fn () => C.gtype stringOpt (),
          get = ignore,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val selectableProp =
        {
          name = "selectable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val selectionBoundProp =
        {
          name = "selection-bound",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val singleLineModeProp =
        {
          name = "single-line-mode",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val trackVisitedLinksProp =
        {
          name = "track-visited-links",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val useMarkupProp =
        {
          name = "use-markup",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val useUnderlineProp =
        {
          name = "use-underline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val widthCharsProp =
        {
          name = "width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val wrapProp =
        {
          name = "wrap",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val wrapModeProp =
        {
          name = "wrap-mode",
          gtype = fn () => C.gtype PangoWrapMode.t (),
          get = fn x => fn () => C.get PangoWrapMode.t x,
          set = fn x => C.set PangoWrapMode.t x,
          init = fn x => C.set PangoWrapMode.t x
        }
      val xalignProp =
        {
          name = "xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
      val yalignProp =
        {
          name = "yalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
    end
  end
