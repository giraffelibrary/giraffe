structure GtkTextIter :>
  GTK_TEXT_ITER
    where type t = GtkTextIterRecord.t
    where type text_search_flags_t = GtkTextSearchFlags.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    where type 'a text_tag_class = 'a GtkTextTagClass.class =
  struct
    val getType_ = _import "gtk_text_iter_get_type" : unit -> GObjectType.FFI.val_;
    val assign_ = fn x1 & x2 => (_import "gtk_text_iter_assign" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val backwardChar_ = _import "gtk_text_iter_backward_char" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardChars_ = fn x1 & x2 => (_import "gtk_text_iter_backward_chars" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardCursorPosition_ = _import "gtk_text_iter_backward_cursor_position" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_backward_cursor_positions" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardLine_ = _import "gtk_text_iter_backward_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardLines_ = fn x1 & x2 => (_import "gtk_text_iter_backward_lines" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
              GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextSearchFlags.FFI.val_
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * unit GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
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
    val backwardSentenceStart_ = _import "gtk_text_iter_backward_sentence_start" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardSentenceStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_sentence_starts" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardToTagToggle_ = fn x1 & x2 => (_import "gtk_text_iter_backward_to_tag_toggle" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * unit GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val backwardVisibleCursorPosition_ = _import "gtk_text_iter_backward_visible_cursor_position" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardVisibleCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_cursor_positions" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardVisibleLine_ = _import "gtk_text_iter_backward_visible_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardVisibleLines_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_lines" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardVisibleWordStart_ = _import "gtk_text_iter_backward_visible_word_start" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardVisibleWordStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_visible_word_starts" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val backwardWordStart_ = _import "gtk_text_iter_backward_word_start" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val backwardWordStarts_ = fn x1 & x2 => (_import "gtk_text_iter_backward_word_starts" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val beginsTag_ = fn x1 & x2 => (_import "gtk_text_iter_begins_tag" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * unit GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val canInsert_ = fn x1 & x2 => (_import "gtk_text_iter_can_insert" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val compare_ = fn x1 & x2 => (_import "gtk_text_iter_compare" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val copy_ = _import "gtk_text_iter_copy" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p;
    val editable_ = fn x1 & x2 => (_import "gtk_text_iter_editable" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val endsLine_ = _import "gtk_text_iter_ends_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val endsSentence_ = _import "gtk_text_iter_ends_sentence" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val endsTag_ = fn x1 & x2 => (_import "gtk_text_iter_ends_tag" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * unit GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val endsWord_ = _import "gtk_text_iter_ends_word" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val equal_ = fn x1 & x2 => (_import "gtk_text_iter_equal" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val forwardChar_ = _import "gtk_text_iter_forward_char" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardChars_ = fn x1 & x2 => (_import "gtk_text_iter_forward_chars" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardCursorPosition_ = _import "gtk_text_iter_forward_cursor_position" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_forward_cursor_positions" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardLine_ = _import "gtk_text_iter_forward_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardLines_ = fn x1 & x2 => (_import "gtk_text_iter_forward_lines" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
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
              GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GtkTextSearchFlags.FFI.val_
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * unit GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
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
    val forwardSentenceEnd_ = _import "gtk_text_iter_forward_sentence_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardSentenceEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_sentence_ends" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardToEnd_ = _import "gtk_text_iter_forward_to_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;
    val forwardToLineEnd_ = _import "gtk_text_iter_forward_to_line_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardToTagToggle_ = fn x1 & x2 => (_import "gtk_text_iter_forward_to_tag_toggle" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * unit GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val forwardVisibleCursorPosition_ = _import "gtk_text_iter_forward_visible_cursor_position" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardVisibleCursorPositions_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_cursor_positions" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardVisibleLine_ = _import "gtk_text_iter_forward_visible_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardVisibleLines_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_lines" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardVisibleWordEnd_ = _import "gtk_text_iter_forward_visible_word_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardVisibleWordEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_visible_word_ends" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val forwardWordEnd_ = _import "gtk_text_iter_forward_word_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val forwardWordEnds_ = fn x1 & x2 => (_import "gtk_text_iter_forward_word_ends" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getBuffer_ = _import "gtk_text_iter_get_buffer" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GtkTextBufferClass.FFI.notnull GtkTextBufferClass.FFI.p;
    val getBytesInLine_ = _import "gtk_text_iter_get_bytes_in_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getChar_ = _import "gtk_text_iter_get_char" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GChar.FFI.val_;
    val getCharsInLine_ = _import "gtk_text_iter_get_chars_in_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getChildAnchor_ = _import "gtk_text_iter_get_child_anchor" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GtkTextChildAnchorClass.FFI.notnull GtkTextChildAnchorClass.FFI.p;
    val getLanguage_ = _import "gtk_text_iter_get_language" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> PangoLanguageRecord.FFI.notnull PangoLanguageRecord.FFI.p;
    val getLine_ = _import "gtk_text_iter_get_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getLineIndex_ = _import "gtk_text_iter_get_line_index" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getLineOffset_ = _import "gtk_text_iter_get_line_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getOffset_ = _import "gtk_text_iter_get_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getPixbuf_ = _import "gtk_text_iter_get_pixbuf" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GdkPixbufPixbufClass.FFI.notnull GdkPixbufPixbufClass.FFI.p;
    val getSlice_ = fn x1 & x2 => (_import "gtk_text_iter_get_slice" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getText_ = fn x1 & x2 => (_import "gtk_text_iter_get_text" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getVisibleLineIndex_ = _import "gtk_text_iter_get_visible_line_index" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getVisibleLineOffset_ = _import "gtk_text_iter_get_visible_line_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GInt32.FFI.val_;
    val getVisibleSlice_ = fn x1 & x2 => (_import "gtk_text_iter_get_visible_slice" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getVisibleText_ = fn x1 & x2 => (_import "gtk_text_iter_get_visible_text" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val hasTag_ = fn x1 & x2 => (_import "gtk_text_iter_has_tag" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextTagClass.FFI.notnull GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val inRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_text_iter_in_range" :
              GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val insideSentence_ = _import "gtk_text_iter_inside_sentence" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val insideWord_ = _import "gtk_text_iter_inside_word" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val isCursorPosition_ = _import "gtk_text_iter_is_cursor_position" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val isEnd_ = _import "gtk_text_iter_is_end" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val isStart_ = _import "gtk_text_iter_is_start" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val order_ = fn x1 & x2 => (_import "gtk_text_iter_order" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> unit;) (x1, x2)
    val setLine_ = fn x1 & x2 => (_import "gtk_text_iter_set_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setLineIndex_ = fn x1 & x2 => (_import "gtk_text_iter_set_line_index" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setLineOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_line_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setVisibleLineIndex_ = fn x1 & x2 => (_import "gtk_text_iter_set_visible_line_index" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setVisibleLineOffset_ = fn x1 & x2 => (_import "gtk_text_iter_set_visible_line_offset" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val startsLine_ = _import "gtk_text_iter_starts_line" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val startsSentence_ = _import "gtk_text_iter_starts_sentence" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val startsWord_ = _import "gtk_text_iter_starts_word" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p -> GBool.FFI.val_;
    val togglesTag_ = fn x1 & x2 => (_import "gtk_text_iter_toggles_tag" : GtkTextIterRecord.FFI.notnull GtkTextIterRecord.FFI.p * unit GtkTextTagClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = GtkTextIterRecord.t
    type text_search_flags_t = GtkTextSearchFlags.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun assign self other = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) assign_ (self & other)
    fun backwardChar self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardChar_ self
    fun backwardChars self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardChars_ (self & count)
    fun backwardCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardCursorPosition_ self
    fun backwardCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardCursorPositions_ (self & count)
    fun backwardLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardLine_ self
    fun backwardLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardLines_ (self & count)
    fun backwardSearch
      self
      (
        str,
        flags,
        limit
      ) =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GtkTextSearchFlags.FFI.withVal
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withOptPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
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
    fun backwardSentenceStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardSentenceStart_ self
    fun backwardSentenceStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardSentenceStarts_ (self & count)
    fun backwardToTagToggle self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) backwardToTagToggle_ (self & tag)
    fun backwardVisibleCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleCursorPosition_ self
    fun backwardVisibleCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleCursorPositions_ (self & count)
    fun backwardVisibleLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleLine_ self
    fun backwardVisibleLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleLines_ (self & count)
    fun backwardVisibleWordStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleWordStart_ self
    fun backwardVisibleWordStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleWordStarts_ (self & count)
    fun backwardWordStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardWordStart_ self
    fun backwardWordStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) backwardWordStarts_ (self & count)
    fun beginsTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) beginsTag_ (self & tag)
    fun canInsert self defaultEditability = (GtkTextIterRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) canInsert_ (self & defaultEditability)
    fun compare self rhs = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) compare_ (self & rhs)
    fun copy self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextIterRecord.FFI.fromPtr true) copy_ self
    fun editable self defaultSetting = (GtkTextIterRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) editable_ (self & defaultSetting)
    fun endsLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsLine_ self
    fun endsSentence self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsSentence_ self
    fun endsTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) endsTag_ (self & tag)
    fun endsWord self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsWord_ self
    fun equal self rhs = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & rhs)
    fun forwardChar self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardChar_ self
    fun forwardChars self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardChars_ (self & count)
    fun forwardCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardCursorPosition_ self
    fun forwardCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardCursorPositions_ (self & count)
    fun forwardLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardLine_ self
    fun forwardLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardLines_ (self & count)
    fun forwardSearch
      self
      (
        str,
        flags,
        limit
      ) =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> GtkTextSearchFlags.FFI.withVal
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withNewPtr
             &&&> GtkTextIterRecord.FFI.withOptPtr
             ---> GtkTextIterRecord.FFI.fromPtr true
                   && GtkTextIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
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
    fun forwardSentenceEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardSentenceEnd_ self
    fun forwardSentenceEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardSentenceEnds_ (self & count)
    fun forwardToEnd self = (GtkTextIterRecord.FFI.withPtr ---> I) forwardToEnd_ self
    fun forwardToLineEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardToLineEnd_ self
    fun forwardToTagToggle self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) forwardToTagToggle_ (self & tag)
    fun forwardVisibleCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleCursorPosition_ self
    fun forwardVisibleCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleCursorPositions_ (self & count)
    fun forwardVisibleLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleLine_ self
    fun forwardVisibleLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleLines_ (self & count)
    fun forwardVisibleWordEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleWordEnd_ self
    fun forwardVisibleWordEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleWordEnds_ (self & count)
    fun forwardWordEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardWordEnd_ self
    fun forwardWordEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) forwardWordEnds_ (self & count)
    fun getBuffer self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getBytesInLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getBytesInLine_ self
    fun getChar self = (GtkTextIterRecord.FFI.withPtr ---> GChar.FFI.fromVal) getChar_ self
    fun getCharsInLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getCharsInLine_ self
    fun getChildAnchor self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextChildAnchorClass.FFI.fromPtr false) getChildAnchor_ self
    fun getLanguage self = (GtkTextIterRecord.FFI.withPtr ---> PangoLanguageRecord.FFI.fromPtr true) getLanguage_ self
    fun getLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getLine_ self
    fun getLineIndex self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getLineIndex_ self
    fun getLineOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getLineOffset_ self
    fun getOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getOffset_ self
    fun getPixbuf self = (GtkTextIterRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getSlice self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getSlice_ (self & end')
    fun getText self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getText_ (self & end')
    fun getVisibleLineIndex self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getVisibleLineIndex_ self
    fun getVisibleLineOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getVisibleLineOffset_ self
    fun getVisibleSlice self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getVisibleSlice_ (self & end')
    fun getVisibleText self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getVisibleText_ (self & end')
    fun hasTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withPtr ---> GBool.FFI.fromVal) hasTag_ (self & tag)
    fun inRange self (start, end') =
      (
        GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         &&&> GtkTextIterRecord.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        inRange_
        (
          self
           & start
           & end'
        )
    fun insideSentence self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) insideSentence_ self
    fun insideWord self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) insideWord_ self
    fun isCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) isCursorPosition_ self
    fun isEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) isEnd_ self
    fun isStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) isStart_ self
    fun order self second = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) order_ (self & second)
    fun setLine self lineNumber = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setLine_ (self & lineNumber)
    fun setLineIndex self byteOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setLineIndex_ (self & byteOnLine)
    fun setLineOffset self charOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setLineOffset_ (self & charOnLine)
    fun setOffset self charOffset = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setOffset_ (self & charOffset)
    fun setVisibleLineIndex self byteOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setVisibleLineIndex_ (self & byteOnLine)
    fun setVisibleLineOffset self charOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setVisibleLineOffset_ (self & charOnLine)
    fun startsLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsLine_ self
    fun startsSentence self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsSentence_ self
    fun startsWord self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsWord_ self
    fun togglesTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) togglesTag_ (self & tag)
  end
