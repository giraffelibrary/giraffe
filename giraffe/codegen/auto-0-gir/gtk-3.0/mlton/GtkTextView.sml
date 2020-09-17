structure GtkTextView :>
  GTK_TEXT_VIEW
    where type 'a class = 'a GtkTextViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    where type text_attributes_t = GtkTextAttributesRecord.t
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type 'a text_mark_class = 'a GtkTextMarkClass.class
    where type text_window_type_t = GtkTextWindowType.t
    where type delete_type_t = GtkDeleteType.t
    where type text_iter_t = GtkTextIterRecord.t
    where type text_extend_selection_t = GtkTextExtendSelection.t
    where type movement_step_t = GtkMovementStep.t
    where type scroll_step_t = GtkScrollStep.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type input_hints_t = GtkInputHints.t
    where type input_purpose_t = GtkInputPurpose.t
    where type justification_t = GtkJustification.t
    where type wrap_mode_t = GtkWrapMode.t =
  struct
    val getType_ = _import "gtk_text_view_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_text_view_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithBuffer_ = _import "gtk_text_view_new_with_buffer" : GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addChildAtAnchor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_view_add_child_at_anchor" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkTextChildAnchorClass.FFI.non_opt GtkTextChildAnchorClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addChildInWindow_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_text_view_add_child_in_window" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkTextWindowType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val backwardDisplayLine_ = fn x1 & x2 => (_import "gtk_text_view_backward_display_line" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val backwardDisplayLineStart_ = fn x1 & x2 => (_import "gtk_text_view_backward_display_line_start" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val bufferToWindowCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_text_view_buffer_to_window_coords" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextWindowType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val forwardDisplayLine_ = fn x1 & x2 => (_import "gtk_text_view_forward_display_line" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val forwardDisplayLineEnd_ = fn x1 & x2 => (_import "gtk_text_view_forward_display_line_end" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getAcceptsTab_ = _import "gtk_text_view_get_accepts_tab" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val getBorderWindowSize_ = fn x1 & x2 => (_import "gtk_text_view_get_border_window_size" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextWindowType.FFI.val_ -> GInt.FFI.val_;) (x1, x2)
    val getBottomMargin_ = _import "gtk_text_view_get_bottom_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getBuffer_ = _import "gtk_text_view_get_buffer" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkTextBufferClass.FFI.non_opt GtkTextBufferClass.FFI.p;
    val getCursorLocations_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_view_get_cursor_locations" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.opt GtkTextIterRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getCursorVisible_ = _import "gtk_text_view_get_cursor_visible" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val getDefaultAttributes_ = _import "gtk_text_view_get_default_attributes" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkTextAttributesRecord.FFI.non_opt GtkTextAttributesRecord.FFI.p;
    val getEditable_ = _import "gtk_text_view_get_editable" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val getHadjustment_ = _import "gtk_text_view_get_hadjustment" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getIndent_ = _import "gtk_text_view_get_indent" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getInputHints_ = _import "gtk_text_view_get_input_hints" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkInputHints.FFI.val_;
    val getInputPurpose_ = _import "gtk_text_view_get_input_purpose" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkInputPurpose.FFI.val_;
    val getIterAtLocation_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_view_get_iter_at_location" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getIterAtPosition_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_text_view_get_iter_at_position" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getIterLocation_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_view_get_iter_location" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getJustification_ = _import "gtk_text_view_get_justification" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkJustification.FFI.val_;
    val getLeftMargin_ = _import "gtk_text_view_get_left_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getLineAtY_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_view_get_line_at_y" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getLineYrange_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_view_get_line_yrange" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMonospace_ = _import "gtk_text_view_get_monospace" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val getOverwrite_ = _import "gtk_text_view_get_overwrite" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val getPixelsAboveLines_ = _import "gtk_text_view_get_pixels_above_lines" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getPixelsBelowLines_ = _import "gtk_text_view_get_pixels_below_lines" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getPixelsInsideWrap_ = _import "gtk_text_view_get_pixels_inside_wrap" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getRightMargin_ = _import "gtk_text_view_get_right_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getTabs_ = _import "gtk_text_view_get_tabs" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> PangoTabArrayRecord.FFI.opt PangoTabArrayRecord.FFI.p;
    val getTopMargin_ = _import "gtk_text_view_get_top_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GInt.FFI.val_;
    val getVadjustment_ = _import "gtk_text_view_get_vadjustment" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkAdjustmentClass.FFI.non_opt GtkAdjustmentClass.FFI.p;
    val getVisibleRect_ = fn x1 & x2 => (_import "gtk_text_view_get_visible_rect" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getWindow_ = fn x1 & x2 => (_import "gtk_text_view_get_window" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextWindowType.FFI.val_ -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;) (x1, x2)
    val getWindowType_ = fn x1 & x2 => (_import "gtk_text_view_get_window_type" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GtkTextWindowType.FFI.val_;) (x1, x2)
    val getWrapMode_ = _import "gtk_text_view_get_wrap_mode" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GtkWrapMode.FFI.val_;
    val imContextFilterKeypress_ = fn x1 & x2 => (_import "gtk_text_view_im_context_filter_keypress" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GdkEventKeyRecord.FFI.non_opt GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val moveChild_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_text_view_move_child" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moveMarkOnscreen_ = fn x1 & x2 => (_import "gtk_text_view_move_mark_onscreen" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val moveVisually_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_view_move_visually" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val placeCursorOnscreen_ = _import "gtk_text_view_place_cursor_onscreen" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> GBool.FFI.val_;
    val resetCursorBlink_ = _import "gtk_text_view_reset_cursor_blink" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> unit;
    val resetImContext_ = _import "gtk_text_view_reset_im_context" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p -> unit;
    val scrollMarkOnscreen_ = fn x1 & x2 => (_import "gtk_text_view_scroll_mark_onscreen" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p -> unit;) (x1, x2)
    val scrollToIter_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_text_view_scroll_to_iter" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p
               * GDouble.FFI.val_
               * GBool.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val scrollToMark_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_text_view_scroll_to_mark" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextMarkClass.FFI.non_opt GtkTextMarkClass.FFI.p
               * GDouble.FFI.val_
               * GBool.FFI.val_
               * GDouble.FFI.val_
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val setAcceptsTab_ = fn x1 & x2 => (_import "gtk_text_view_set_accepts_tab" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setBorderWindowSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_view_set_border_window_size" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextWindowType.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setBottomMargin_ = fn x1 & x2 => (_import "gtk_text_view_set_bottom_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setBuffer_ = fn x1 & x2 => (_import "gtk_text_view_set_buffer" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextBufferClass.FFI.opt GtkTextBufferClass.FFI.p -> unit;) (x1, x2)
    val setCursorVisible_ = fn x1 & x2 => (_import "gtk_text_view_set_cursor_visible" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEditable_ = fn x1 & x2 => (_import "gtk_text_view_set_editable" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIndent_ = fn x1 & x2 => (_import "gtk_text_view_set_indent" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setInputHints_ = fn x1 & x2 => (_import "gtk_text_view_set_input_hints" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkInputHints.FFI.val_ -> unit;) (x1, x2)
    val setInputPurpose_ = fn x1 & x2 => (_import "gtk_text_view_set_input_purpose" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkInputPurpose.FFI.val_ -> unit;) (x1, x2)
    val setJustification_ = fn x1 & x2 => (_import "gtk_text_view_set_justification" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkJustification.FFI.val_ -> unit;) (x1, x2)
    val setLeftMargin_ = fn x1 & x2 => (_import "gtk_text_view_set_left_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMonospace_ = fn x1 & x2 => (_import "gtk_text_view_set_monospace" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOverwrite_ = fn x1 & x2 => (_import "gtk_text_view_set_overwrite" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPixelsAboveLines_ = fn x1 & x2 => (_import "gtk_text_view_set_pixels_above_lines" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setPixelsBelowLines_ = fn x1 & x2 => (_import "gtk_text_view_set_pixels_below_lines" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setPixelsInsideWrap_ = fn x1 & x2 => (_import "gtk_text_view_set_pixels_inside_wrap" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setRightMargin_ = fn x1 & x2 => (_import "gtk_text_view_set_right_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTabs_ = fn x1 & x2 => (_import "gtk_text_view_set_tabs" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * PangoTabArrayRecord.FFI.non_opt PangoTabArrayRecord.FFI.p -> unit;) (x1, x2)
    val setTopMargin_ = fn x1 & x2 => (_import "gtk_text_view_set_top_margin" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setWrapMode_ = fn x1 & x2 => (_import "gtk_text_view_set_wrap_mode" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkWrapMode.FFI.val_ -> unit;) (x1, x2)
    val startsDisplayLine_ = fn x1 & x2 => (_import "gtk_text_view_starts_display_line" : GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p * GtkTextIterRecord.FFI.non_opt GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val windowToBufferCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_text_view_window_to_buffer_coords" :
              GtkTextViewClass.FFI.non_opt GtkTextViewClass.FFI.p
               * GtkTextWindowType.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    type 'a class = 'a GtkTextViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type text_attributes_t = GtkTextAttributesRecord.t
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type 'a text_mark_class = 'a GtkTextMarkClass.class
    type text_window_type_t = GtkTextWindowType.t
    type delete_type_t = GtkDeleteType.t
    type text_iter_t = GtkTextIterRecord.t
    type text_extend_selection_t = GtkTextExtendSelection.t
    type movement_step_t = GtkMovementStep.t
    type scroll_step_t = GtkScrollStep.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type input_hints_t = GtkInputHints.t
    type input_purpose_t = GtkInputPurpose.t
    type justification_t = GtkJustification.t
    type wrap_mode_t = GtkWrapMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTextViewClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkTextBufferClass.FFI.withPtr false ---> GtkTextViewClass.FFI.fromPtr false) newWithBuffer_ buffer before GtkTextBufferClass.FFI.touchPtr buffer
    fun addChildAtAnchor self (child, anchor) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkTextChildAnchorClass.FFI.withPtr false
         ---> I
      )
        addChildAtAnchor_
        (
          self
           & child
           & anchor
        )
    fun addChildInWindow
      self
      (
        child,
        whichWindow,
        xpos,
        ypos
      ) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkTextWindowType.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        addChildInWindow_
        (
          self
           & child
           & whichWindow
           & xpos
           & ypos
        )
    fun backwardDisplayLine self iter = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) backwardDisplayLine_ (self & iter)
    fun backwardDisplayLineStart self iter = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) backwardDisplayLineStart_ (self & iter)
    fun bufferToWindowCoords
      self
      (
        win,
        bufferX,
        bufferY
      ) =
      let
        val windowX
         & windowY
         & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextWindowType.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            bufferToWindowCoords_
            (
              self
               & win
               & bufferX
               & bufferY
               & GInt.null
               & GInt.null
            )
      in
        (windowX, windowY)
      end
    fun forwardDisplayLine self iter = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) forwardDisplayLine_ (self & iter)
    fun forwardDisplayLineEnd self iter = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) forwardDisplayLineEnd_ (self & iter)
    fun getAcceptsTab self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAcceptsTab_ self
    fun getBorderWindowSize self type' = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextWindowType.FFI.withVal ---> GInt.FFI.fromVal) getBorderWindowSize_ (self & type')
    fun getBottomMargin self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getBottomMargin_ self
    fun getBuffer self = (GtkTextViewClass.FFI.withPtr false ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self before GtkTextViewClass.FFI.touchPtr self
    fun getCursorLocations self iter =
      let
        val strong
         & weak
         & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withOptPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true
                   && GdkRectangleRecord.FFI.fromPtr true
                   && I
          )
            getCursorLocations_
            (
              self
               & iter
               & ()
               & ()
            )
      in
        (strong, weak)
      end
    fun getCursorVisible self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCursorVisible_ self
    fun getDefaultAttributes self = (GtkTextViewClass.FFI.withPtr false ---> GtkTextAttributesRecord.FFI.fromPtr true) getDefaultAttributes_ self
    fun getEditable self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEditable_ self
    fun getHadjustment self = (GtkTextViewClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self before GtkTextViewClass.FFI.touchPtr self
    fun getIndent self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getIndent_ self
    fun getInputHints self = (GtkTextViewClass.FFI.withPtr false ---> GtkInputHints.FFI.fromVal) getInputHints_ self
    fun getInputPurpose self = (GtkTextViewClass.FFI.withPtr false ---> GtkInputPurpose.FFI.fromVal) getInputPurpose_ self
    fun getIterAtLocation self (x, y) =
      let
        val iter & retVal =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            getIterAtLocation_
            (
              self
               & ()
               & x
               & y
            )
      in
        if retVal then SOME iter else NONE
      end
    fun getIterAtPosition self (x, y) =
      let
        val iter
         & trailing
         & retVal =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getIterAtPosition_
            (
              self
               & ()
               & GInt.null
               & x
               & y
            )
      in
        if retVal then SOME (iter, trailing) else NONE
      end
    fun getIterLocation self iter =
      let
        val location & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getIterLocation_
            (
              self
               & iter
               & ()
            )
      in
        location
      end
    fun getJustification self = (GtkTextViewClass.FFI.withPtr false ---> GtkJustification.FFI.fromVal) getJustification_ self
    fun getLeftMargin self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getLeftMargin_ self
    fun getLineAtY self y =
      let
        val targetIter
         & lineTop
         & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && I
          )
            getLineAtY_
            (
              self
               & ()
               & y
               & GInt.null
            )
      in
        (targetIter, lineTop)
      end
    fun getLineYrange self iter =
      let
        val y
         & height
         & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextIterRecord.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLineYrange_
            (
              self
               & iter
               & GInt.null
               & GInt.null
            )
      in
        (y, height)
      end
    fun getMonospace self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMonospace_ self
    fun getOverwrite self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getOverwrite_ self
    fun getPixelsAboveLines self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPixelsAboveLines_ self
    fun getPixelsBelowLines self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPixelsBelowLines_ self
    fun getPixelsInsideWrap self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPixelsInsideWrap_ self
    fun getRightMargin self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRightMargin_ self
    fun getTabs self = (GtkTextViewClass.FFI.withPtr false ---> PangoTabArrayRecord.FFI.fromOptPtr true) getTabs_ self
    fun getTopMargin self = (GtkTextViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getTopMargin_ self
    fun getVadjustment self = (GtkTextViewClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self before GtkTextViewClass.FFI.touchPtr self
    fun getVisibleRect self =
      let
        val visibleRect & () = (GtkTextViewClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun getWindow self win = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextWindowType.FFI.withVal ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ (self & win) before GtkTextViewClass.FFI.touchPtr self
    fun getWindowType self window = (GtkTextViewClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> GtkTextWindowType.FFI.fromVal) getWindowType_ (self & window)
    fun getWrapMode self = (GtkTextViewClass.FFI.withPtr false ---> GtkWrapMode.FFI.fromVal) getWrapMode_ self
    fun imContextFilterKeypress self event = (GtkTextViewClass.FFI.withPtr false &&&> GdkEventKeyRecord.FFI.withPtr false ---> GBool.FFI.fromVal) imContextFilterKeypress_ (self & event)
    fun moveChild
      self
      (
        child,
        xpos,
        ypos
      ) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        moveChild_
        (
          self
           & child
           & xpos
           & ypos
        )
    fun moveMarkOnscreen self mark = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextMarkClass.FFI.withPtr false ---> GBool.FFI.fromVal) moveMarkOnscreen_ (self & mark)
    fun moveVisually self (iter, count) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        moveVisually_
        (
          self
           & iter
           & count
        )
    fun placeCursorOnscreen self = (GtkTextViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) placeCursorOnscreen_ self
    fun resetCursorBlink self = (GtkTextViewClass.FFI.withPtr false ---> I) resetCursorBlink_ self
    fun resetImContext self = (GtkTextViewClass.FFI.withPtr false ---> I) resetImContext_ self
    fun scrollMarkOnscreen self mark = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextMarkClass.FFI.withPtr false ---> I) scrollMarkOnscreen_ (self & mark)
    fun scrollToIter
      self
      (
        iter,
        withinMargin,
        useAlign,
        xalign,
        yalign
      ) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkTextIterRecord.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        scrollToIter_
        (
          self
           & iter
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun scrollToMark
      self
      (
        mark,
        withinMargin,
        useAlign,
        xalign,
        yalign
      ) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkTextMarkClass.FFI.withPtr false
         &&&> GDouble.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GDouble.FFI.withVal
         &&&> GDouble.FFI.withVal
         ---> I
      )
        scrollToMark_
        (
          self
           & mark
           & withinMargin
           & useAlign
           & xalign
           & yalign
        )
    fun setAcceptsTab self acceptsTab = (GtkTextViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAcceptsTab_ (self & acceptsTab)
    fun setBorderWindowSize self (type', size) =
      (
        GtkTextViewClass.FFI.withPtr false
         &&&> GtkTextWindowType.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setBorderWindowSize_
        (
          self
           & type'
           & size
        )
    fun setBottomMargin self bottomMargin = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setBottomMargin_ (self & bottomMargin)
    fun setBuffer self buffer = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextBufferClass.FFI.withOptPtr false ---> I) setBuffer_ (self & buffer)
    fun setCursorVisible self setting = (GtkTextViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCursorVisible_ (self & setting)
    fun setEditable self setting = (GtkTextViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEditable_ (self & setting)
    fun setIndent self indent = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setIndent_ (self & indent)
    fun setInputHints self hints = (GtkTextViewClass.FFI.withPtr false &&&> GtkInputHints.FFI.withVal ---> I) setInputHints_ (self & hints)
    fun setInputPurpose self purpose = (GtkTextViewClass.FFI.withPtr false &&&> GtkInputPurpose.FFI.withVal ---> I) setInputPurpose_ (self & purpose)
    fun setJustification self justification = (GtkTextViewClass.FFI.withPtr false &&&> GtkJustification.FFI.withVal ---> I) setJustification_ (self & justification)
    fun setLeftMargin self leftMargin = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setLeftMargin_ (self & leftMargin)
    fun setMonospace self monospace = (GtkTextViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMonospace_ (self & monospace)
    fun setOverwrite self overwrite = (GtkTextViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setOverwrite_ (self & overwrite)
    fun setPixelsAboveLines self pixelsAboveLines = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPixelsAboveLines_ (self & pixelsAboveLines)
    fun setPixelsBelowLines self pixelsBelowLines = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPixelsBelowLines_ (self & pixelsBelowLines)
    fun setPixelsInsideWrap self pixelsInsideWrap = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPixelsInsideWrap_ (self & pixelsInsideWrap)
    fun setRightMargin self rightMargin = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setRightMargin_ (self & rightMargin)
    fun setTabs self tabs = (GtkTextViewClass.FFI.withPtr false &&&> PangoTabArrayRecord.FFI.withPtr false ---> I) setTabs_ (self & tabs)
    fun setTopMargin self topMargin = (GtkTextViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setTopMargin_ (self & topMargin)
    fun setWrapMode self wrapMode = (GtkTextViewClass.FFI.withPtr false &&&> GtkWrapMode.FFI.withVal ---> I) setWrapMode_ (self & wrapMode)
    fun startsDisplayLine self iter = (GtkTextViewClass.FFI.withPtr false &&&> GtkTextIterRecord.FFI.withPtr false ---> GBool.FFI.fromVal) startsDisplayLine_ (self & iter)
    fun windowToBufferCoords
      self
      (
        win,
        windowX,
        windowY
      ) =
      let
        val bufferX
         & bufferY
         & () =
          (
            GtkTextViewClass.FFI.withPtr false
             &&&> GtkTextWindowType.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            windowToBufferCoords_
            (
              self
               & win
               & windowX
               & windowY
               & GInt.null
               & GInt.null
            )
      in
        (bufferX, bufferY)
      end
    local
      open ClosureMarshal Signal
    in
      fun backspaceSig f = signal "backspace" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cutClipboardSig f = signal "cut-clipboard" (void ---> ret_void) f
      fun deleteFromCursorSig f = signal "delete-from-cursor" (get 0w1 GtkDeleteType.t &&&> get 0w2 int ---> ret_void) (fn type' & count => f (type', count))
      fun extendSelectionSig f =
        signal "extend-selection"
          (
            get 0w1 GtkTextExtendSelection.t
             &&&> get 0w2 GtkTextIterRecord.t
             &&&> get 0w3 GtkTextIterRecord.t
             &&&> get 0w4 GtkTextIterRecord.t
             ---> ret boolean
          )
          (
            fn
              granularity
               & location
               & start
               & end' =>
                f
                  (
                    granularity,
                    location,
                    start,
                    end'
                  )
          )
      fun insertAtCursorSig f = signal "insert-at-cursor" (get 0w1 string ---> ret_void) f
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
      fun moveViewportSig f = signal "move-viewport" (get 0w1 GtkScrollStep.t &&&> get 0w2 int ---> ret_void) (fn step & count => f (step, count))
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun preeditChangedSig f = signal "preedit-changed" (get 0w1 string ---> ret_void) f
      fun selectAllSig f = signal "select-all" (get 0w1 boolean ---> ret_void) f
      fun setAnchorSig f = signal "set-anchor" (void ---> ret_void) f
      fun toggleCursorVisibleSig f = signal "toggle-cursor-visible" (void ---> ret_void) f
      fun toggleOverwriteSig f = signal "toggle-overwrite" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val acceptsTabProp =
        {
          name = "accepts-tab",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val bottomMarginProp =
        {
          name = "bottom-margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkTextBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkTextBufferClass.tOpt x,
          set = fn x => C.set GtkTextBufferClass.tOpt x,
          init = fn x => C.set GtkTextBufferClass.tOpt x
        }
      val cursorVisibleProp =
        {
          name = "cursor-visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val editableProp =
        {
          name = "editable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val imModuleProp =
        {
          name = "im-module",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val indentProp =
        {
          name = "indent",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val inputHintsProp =
        {
          name = "input-hints",
          gtype = fn () => C.gtype GtkInputHints.t (),
          get = fn x => fn () => C.get GtkInputHints.t x,
          set = fn x => C.set GtkInputHints.t x,
          init = fn x => C.set GtkInputHints.t x
        }
      val inputPurposeProp =
        {
          name = "input-purpose",
          gtype = fn () => C.gtype GtkInputPurpose.t (),
          get = fn x => fn () => C.get GtkInputPurpose.t x,
          set = fn x => C.set GtkInputPurpose.t x,
          init = fn x => C.set GtkInputPurpose.t x
        }
      val justificationProp =
        {
          name = "justification",
          gtype = fn () => C.gtype GtkJustification.t (),
          get = fn x => fn () => C.get GtkJustification.t x,
          set = fn x => C.set GtkJustification.t x,
          init = fn x => C.set GtkJustification.t x
        }
      val leftMarginProp =
        {
          name = "left-margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val monospaceProp =
        {
          name = "monospace",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val overwriteProp =
        {
          name = "overwrite",
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
      val pixelsBelowLinesProp =
        {
          name = "pixels-below-lines",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val pixelsInsideWrapProp =
        {
          name = "pixels-inside-wrap",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val populateAllProp =
        {
          name = "populate-all",
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
      val tabsProp =
        {
          name = "tabs",
          gtype = fn () => C.gtype PangoTabArrayRecord.tOpt (),
          get = fn x => fn () => C.get PangoTabArrayRecord.tOpt x,
          set = fn x => C.set PangoTabArrayRecord.tOpt x,
          init = fn x => C.set PangoTabArrayRecord.tOpt x
        }
      val topMarginProp =
        {
          name = "top-margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val wrapModeProp =
        {
          name = "wrap-mode",
          gtype = fn () => C.gtype GtkWrapMode.t (),
          get = fn x => fn () => C.get GtkWrapMode.t x,
          set = fn x => C.set GtkWrapMode.t x,
          init = fn x => C.set GtkWrapMode.t x
        }
    end
  end
