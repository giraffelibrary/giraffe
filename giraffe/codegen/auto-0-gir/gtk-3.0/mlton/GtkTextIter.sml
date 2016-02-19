structure GtkTextIter :>
  GTK_TEXT_ITER
    where type record_t = GtkTextIterRecord.t
    where type text_search_flags_t = GtkTextSearchFlags.t
    where type text_attributes_record_t = GtkTextAttributesRecord.t
    where type 'a text_buffer_class_t = 'a GtkTextBufferClass.t
    where type 'a text_child_anchor_class_t = 'a GtkTextChildAnchorClass.t
    where type 'a text_tag_class_t = 'a GtkTextTagClass.t =
  struct
    val getType_ = _import "gtk_text_iter_get_type" : unit -> GObjectType.C.val_;
    val assign_ = fn x1 & x2 => (_import "gtk_text_iter_assign" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val backwardChar_ = _import "gtk_text_iter_backward_char" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardChars_ = fn x1 & x2 => (_import "gtk_text_iter_backward_chars" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardCursorPosition_ = _import "gtk_text_iter_backward_cursor_position" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_backward_cursor_positions" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardLine_ = _import "gtk_text_iter_backward_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardLines_ = fn x1 & x2 => (_import "gtk_text_iter_backward_lines" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardSearch_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_text_iter_backward_search" :
              GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkTextSearchFlags.C.val_
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * unit GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val backwardSentenceStart_ = _import "gtk_text_iter_backward_sentence_start" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardSentenceStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_sentence_starts" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardToTagToggle_ = fn x1 & x2 => (_import "gtk_text_iter_backward_to_tag_toggle" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val backwardVisibleCursorPosition_ = _import "gtk_text_iter_backward_visible_cursor_position" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardVisibleCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_cursor_positions" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardVisibleLine_ = _import "gtk_text_iter_backward_visible_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardVisibleLines_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_lines" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardVisibleWordStart_ = _import "gtk_text_iter_backward_visible_word_start" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardVisibleWordStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_word_starts" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val backwardWordStart_ = _import "gtk_text_iter_backward_word_start" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val backwardWordStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_word_starts" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val beginsTag_ = fn x1 & x2 => (_import "gtk_text_iter_begins_tag" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val canInsert_ = fn x1 & x2 => (_import "gtk_text_iter_can_insert" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Bool.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val compare_ = fn x1 & x2 => (_import "gtk_text_iter_compare" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;) (x1, x2)
    val copy_ = _import "gtk_text_iter_copy" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p;
    val editable_ = fn x1 & x2 => (_import "gtk_text_iter_editable" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Bool.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val endsLine_ = _import "gtk_text_iter_ends_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val endsSentence_ = _import "gtk_text_iter_ends_sentence" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val endsTag_ = fn x1 & x2 => (_import "gtk_text_iter_ends_tag" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val endsWord_ = _import "gtk_text_iter_ends_word" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val equal_ = fn x1 & x2 => (_import "gtk_text_iter_equal" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val forwardChar_ = _import "gtk_text_iter_forward_char" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardChars_ = fn x1 & x2 => (_import "gtk_text_iter_forward_chars" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardCursorPosition_ = _import "gtk_text_iter_forward_cursor_position" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_forward_cursor_positions" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardLine_ = _import "gtk_text_iter_forward_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardLines_ = fn x1 & x2 => (_import "gtk_text_iter_forward_lines" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardSearch_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_text_iter_forward_search" :
              GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkTextSearchFlags.C.val_
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * unit GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val forwardSentenceEnd_ = _import "gtk_text_iter_forward_sentence_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardSentenceEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_sentence_ends" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardToEnd_ = _import "gtk_text_iter_forward_to_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;
    val forwardToLineEnd_ = _import "gtk_text_iter_forward_to_line_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardToTagToggle_ = fn x1 & x2 => (_import "gtk_text_iter_forward_to_tag_toggle" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val forwardVisibleCursorPosition_ = _import "gtk_text_iter_forward_visible_cursor_position" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardVisibleCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_cursor_positions" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardVisibleLine_ = _import "gtk_text_iter_forward_visible_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardVisibleLines_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_lines" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardVisibleWordEnd_ = _import "gtk_text_iter_forward_visible_word_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardVisibleWordEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_word_ends" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val forwardWordEnd_ = _import "gtk_text_iter_forward_word_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val forwardWordEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_word_ends" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getAttributes_ = fn x1 & x2 => (_import "gtk_text_iter_get_attributes" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextAttributesRecord.C.notnull GtkTextAttributesRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getBuffer_ = _import "gtk_text_iter_get_buffer" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getBytesInLine_ = _import "gtk_text_iter_get_bytes_in_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getChar_ = _import "gtk_text_iter_get_char" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Char.C.val_;
    val getCharsInLine_ = _import "gtk_text_iter_get_chars_in_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getChildAnchor_ = _import "gtk_text_iter_get_child_anchor" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLanguage_ = _import "gtk_text_iter_get_language" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> PangoLanguageRecord.C.notnull PangoLanguageRecord.C.p;
    val getLine_ = _import "gtk_text_iter_get_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getLineIndex_ = _import "gtk_text_iter_get_line_index" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getLineOffset_ = _import "gtk_text_iter_get_line_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getOffset_ = _import "gtk_text_iter_get_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getPixbuf_ = _import "gtk_text_iter_get_pixbuf" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSlice_ = fn x1 & x2 => (_import "gtk_text_iter_get_slice" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getText_ = fn x1 & x2 => (_import "gtk_text_iter_get_text" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getVisibleLineIndex_ = _import "gtk_text_iter_get_visible_line_index" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getVisibleLineOffset_ = _import "gtk_text_iter_get_visible_line_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Int.C.val_;
    val getVisibleSlice_ = fn x1 & x2 => (_import "gtk_text_iter_get_visible_slice" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getVisibleText_ = fn x1 & x2 => (_import "gtk_text_iter_get_visible_text" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val hasTag_ = fn x1 & x2 => (_import "gtk_text_iter_has_tag" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val inRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_iter_in_range" :
              GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val insideSentence_ = _import "gtk_text_iter_inside_sentence" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val insideWord_ = _import "gtk_text_iter_inside_word" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val isCursorPosition_ = _import "gtk_text_iter_is_cursor_position" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val isEnd_ = _import "gtk_text_iter_is_end" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val isStart_ = _import "gtk_text_iter_is_start" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val order_ = fn x1 & x2 => (_import "gtk_text_iter_order" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> unit;) (x1, x2)
    val setLine_ = fn x1 & x2 => (_import "gtk_text_iter_set_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setLineIndex_ = fn x1 & x2 => (_import "gtk_text_iter_set_line_index" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setLineOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_line_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setVisibleLineIndex_ = fn x1 & x2 => (_import "gtk_text_iter_set_visible_line_index" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setVisibleLineOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_visible_line_offset" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val startsLine_ = _import "gtk_text_iter_starts_line" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val startsSentence_ = _import "gtk_text_iter_starts_sentence" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val startsWord_ = _import "gtk_text_iter_starts_word" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p -> FFI.Bool.C.val_;
    val togglesTag_ = fn x1 & x2 => (_import "gtk_text_iter_toggles_tag" : GtkTextIterRecord.C.notnull GtkTextIterRecord.C.p * unit GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    type record_t = GtkTextIterRecord.t
    type text_search_flags_t = GtkTextSearchFlags.t
    type text_attributes_record_t = GtkTextAttributesRecord.t
    type 'a text_buffer_class_t = 'a GtkTextBufferClass.t
    type 'a text_child_anchor_class_t = 'a GtkTextChildAnchorClass.t
    type 'a text_tag_class_t = 'a GtkTextTagClass.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun assign self other = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) assign_ (self & other)
    fun backwardChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardChar_ self
    fun backwardChars self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardChars_ (self & count)
    fun backwardCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardCursorPosition_ self
    fun backwardCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardCursorPositions_ (self & count)
    fun backwardLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardLine_ self
    fun backwardLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardLines_ (self & count)
    fun backwardSearch self str flags limit =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GtkTextSearchFlags.C.withVal
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withOptPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            backwardSearch_
            (
              self
               & str
               & flags
               & ()
               & ()
               & limit
            )
      in
        if retVal then SOME (matchStart, matchEnd) else NONE
      end
    fun backwardSentenceStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardSentenceStart_ self
    fun backwardSentenceStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardSentenceStarts_ (self & count)
    fun backwardToTagToggle self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) backwardToTagToggle_ (self & tag)
    fun backwardVisibleCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardVisibleCursorPosition_ self
    fun backwardVisibleCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardVisibleCursorPositions_ (self & count)
    fun backwardVisibleLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardVisibleLine_ self
    fun backwardVisibleLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardVisibleLines_ (self & count)
    fun backwardVisibleWordStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardVisibleWordStart_ self
    fun backwardVisibleWordStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardVisibleWordStarts_ (self & count)
    fun backwardWordStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) backwardWordStart_ self
    fun backwardWordStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) backwardWordStarts_ (self & count)
    fun beginsTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) beginsTag_ (self & tag)
    fun canInsert self defaultEditability = (GtkTextIterRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) canInsert_ (self & defaultEditability)
    fun compare self rhs = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) compare_ (self & rhs)
    fun copy self = (GtkTextIterRecord.C.withPtr ---> GtkTextIterRecord.C.fromPtr true) copy_ self
    fun editable self defaultSetting = (GtkTextIterRecord.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) editable_ (self & defaultSetting)
    fun endsLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) endsLine_ self
    fun endsSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) endsSentence_ self
    fun endsTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) endsTag_ (self & tag)
    fun endsWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) endsWord_ self
    fun equal self rhs = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & rhs)
    fun forwardChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardChar_ self
    fun forwardChars self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardChars_ (self & count)
    fun forwardCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardCursorPosition_ self
    fun forwardCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardCursorPositions_ (self & count)
    fun forwardLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardLine_ self
    fun forwardLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardLines_ (self & count)
    fun forwardSearch self str flags limit =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.C.withPtr
             &&&> Utf8.C.withPtr
             &&&> GtkTextSearchFlags.C.withVal
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withOptPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
          )
            forwardSearch_
            (
              self
               & str
               & flags
               & ()
               & ()
               & limit
            )
      in
        if retVal then SOME (matchStart, matchEnd) else NONE
      end
    fun forwardSentenceEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardSentenceEnd_ self
    fun forwardSentenceEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardSentenceEnds_ (self & count)
    fun forwardToEnd self = (GtkTextIterRecord.C.withPtr ---> I) forwardToEnd_ self
    fun forwardToLineEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardToLineEnd_ self
    fun forwardToTagToggle self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) forwardToTagToggle_ (self & tag)
    fun forwardVisibleCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardVisibleCursorPosition_ self
    fun forwardVisibleCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardVisibleCursorPositions_ (self & count)
    fun forwardVisibleLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardVisibleLine_ self
    fun forwardVisibleLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardVisibleLines_ (self & count)
    fun forwardVisibleWordEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardVisibleWordEnd_ self
    fun forwardVisibleWordEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardVisibleWordEnds_ (self & count)
    fun forwardWordEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) forwardWordEnd_ self
    fun forwardWordEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) forwardWordEnds_ (self & count)
    fun getAttributes self =
      let
        val values & retVal = (GtkTextIterRecord.C.withPtr &&&> GtkTextAttributesRecord.C.withNewPtr ---> GtkTextAttributesRecord.C.fromPtr true && FFI.Bool.C.fromVal) getAttributes_ (self & ())
      in
        if retVal then SOME values else NONE
      end
    fun getBuffer self = (GtkTextIterRecord.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getBytesInLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getBytesInLine_ self
    fun getChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Char.C.fromVal) getChar_ self
    fun getCharsInLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getCharsInLine_ self
    fun getChildAnchor self = (GtkTextIterRecord.C.withPtr ---> GtkTextChildAnchorClass.C.fromPtr false) getChildAnchor_ self
    fun getLanguage self = (GtkTextIterRecord.C.withPtr ---> PangoLanguageRecord.C.fromPtr true) getLanguage_ self
    fun getLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getLine_ self
    fun getLineIndex self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getLineIndex_ self
    fun getLineOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getLineOffset_ self
    fun getOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getOffset_ self
    fun getPixbuf self = (GtkTextIterRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getSlice self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getSlice_ (self & end')
    fun getText self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getText_ (self & end')
    fun getVisibleLineIndex self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getVisibleLineIndex_ self
    fun getVisibleLineOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int.C.fromVal) getVisibleLineOffset_ self
    fun getVisibleSlice self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getVisibleSlice_ (self & end')
    fun getVisibleText self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> Utf8.C.fromPtr true) getVisibleText_ (self & end')
    fun hasTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasTag_ (self & tag)
    fun inRange self start end' =
      (
        GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        inRange_
        (
          self
           & start
           & end'
        )
    fun insideSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) insideSentence_ self
    fun insideWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) insideWord_ self
    fun isCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) isCursorPosition_ self
    fun isEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) isEnd_ self
    fun isStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) isStart_ self
    fun order self second = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) order_ (self & second)
    fun setLine self lineNumber = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLine_ (self & lineNumber)
    fun setLineIndex self byteOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLineIndex_ (self & byteOnLine)
    fun setLineOffset self charOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLineOffset_ (self & charOnLine)
    fun setOffset self charOffset = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setOffset_ (self & charOffset)
    fun setVisibleLineIndex self byteOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setVisibleLineIndex_ (self & byteOnLine)
    fun setVisibleLineOffset self charOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int.C.withVal ---> I) setVisibleLineOffset_ (self & charOnLine)
    fun startsLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) startsLine_ self
    fun startsSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) startsSentence_ self
    fun startsWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.C.fromVal) startsWord_ self
    fun togglesTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.C.fromVal) togglesTag_ (self & tag)
  end
