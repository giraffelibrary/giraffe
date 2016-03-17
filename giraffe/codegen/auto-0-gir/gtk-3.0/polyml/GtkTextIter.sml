structure GtkTextIter :>
  GTK_TEXT_ITER
    where type t = GtkTextIterRecord.t
    where type text_search_flags_t = GtkTextSearchFlags.t
    where type text_attributes_t = GtkTextAttributesRecord.t
    where type 'a text_buffer_class = 'a GtkTextBufferClass.class
    where type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    where type 'a text_tag_class = 'a GtkTextTagClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_iter_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val assign_ = call (load_sym libgtk "gtk_text_iter_assign") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val backwardChar_ = call (load_sym libgtk "gtk_text_iter_backward_char") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardChars_ = call (load_sym libgtk "gtk_text_iter_backward_chars") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardCursorPosition_ = call (load_sym libgtk "gtk_text_iter_backward_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardCursorPositions_ = call (load_sym libgtk "gtk_text_iter_backward_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardLine_ = call (load_sym libgtk "gtk_text_iter_backward_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardLines_ = call (load_sym libgtk "gtk_text_iter_backward_lines") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardSearch_ =
        call (load_sym libgtk "gtk_text_iter_backward_search")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextSearchFlags.PolyML.cVal
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val backwardSentenceStart_ = call (load_sym libgtk "gtk_text_iter_backward_sentence_start") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardSentenceStarts_ = call (load_sym libgtk "gtk_text_iter_backward_sentence_starts") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardToTagToggle_ = call (load_sym libgtk "gtk_text_iter_backward_to_tag_toggle") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val backwardVisibleCursorPosition_ = call (load_sym libgtk "gtk_text_iter_backward_visible_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardVisibleCursorPositions_ = call (load_sym libgtk "gtk_text_iter_backward_visible_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardVisibleLine_ = call (load_sym libgtk "gtk_text_iter_backward_visible_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardVisibleLines_ = call (load_sym libgtk "gtk_text_iter_backward_visible_lines") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardVisibleWordStart_ = call (load_sym libgtk "gtk_text_iter_backward_visible_word_start") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardVisibleWordStarts_ = call (load_sym libgtk "gtk_text_iter_backward_visible_word_starts") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val backwardWordStart_ = call (load_sym libgtk "gtk_text_iter_backward_word_start") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val backwardWordStarts_ = call (load_sym libgtk "gtk_text_iter_backward_word_starts") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val beginsTag_ = call (load_sym libgtk "gtk_text_iter_begins_tag") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val canInsert_ = call (load_sym libgtk "gtk_text_iter_can_insert") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val compare_ = call (load_sym libgtk "gtk_text_iter_compare") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val copy_ = call (load_sym libgtk "gtk_text_iter_copy") (GtkTextIterRecord.PolyML.cPtr --> GtkTextIterRecord.PolyML.cPtr)
      val editable_ = call (load_sym libgtk "gtk_text_iter_editable") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val endsLine_ = call (load_sym libgtk "gtk_text_iter_ends_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val endsSentence_ = call (load_sym libgtk "gtk_text_iter_ends_sentence") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val endsTag_ = call (load_sym libgtk "gtk_text_iter_ends_tag") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val endsWord_ = call (load_sym libgtk "gtk_text_iter_ends_word") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val equal_ = call (load_sym libgtk "gtk_text_iter_equal") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardChar_ = call (load_sym libgtk "gtk_text_iter_forward_char") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardChars_ = call (load_sym libgtk "gtk_text_iter_forward_chars") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardCursorPosition_ = call (load_sym libgtk "gtk_text_iter_forward_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardCursorPositions_ = call (load_sym libgtk "gtk_text_iter_forward_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardLine_ = call (load_sym libgtk "gtk_text_iter_forward_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardLines_ = call (load_sym libgtk "gtk_text_iter_forward_lines") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardSearch_ =
        call (load_sym libgtk "gtk_text_iter_forward_search")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextSearchFlags.PolyML.cVal
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> FFI.Bool.PolyML.cVal
          )
      val forwardSentenceEnd_ = call (load_sym libgtk "gtk_text_iter_forward_sentence_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardSentenceEnds_ = call (load_sym libgtk "gtk_text_iter_forward_sentence_ends") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardToEnd_ = call (load_sym libgtk "gtk_text_iter_forward_to_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val forwardToLineEnd_ = call (load_sym libgtk "gtk_text_iter_forward_to_line_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardToTagToggle_ = call (load_sym libgtk "gtk_text_iter_forward_to_tag_toggle") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
      val forwardVisibleCursorPosition_ = call (load_sym libgtk "gtk_text_iter_forward_visible_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardVisibleCursorPositions_ = call (load_sym libgtk "gtk_text_iter_forward_visible_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardVisibleLine_ = call (load_sym libgtk "gtk_text_iter_forward_visible_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardVisibleLines_ = call (load_sym libgtk "gtk_text_iter_forward_visible_lines") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardVisibleWordEnd_ = call (load_sym libgtk "gtk_text_iter_forward_visible_word_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardVisibleWordEnds_ = call (load_sym libgtk "gtk_text_iter_forward_visible_word_ends") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val forwardWordEnd_ = call (load_sym libgtk "gtk_text_iter_forward_word_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val forwardWordEnds_ = call (load_sym libgtk "gtk_text_iter_forward_word_ends") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getAttributes_ = call (load_sym libgtk "gtk_text_iter_get_attributes") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextAttributesRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getBuffer_ = call (load_sym libgtk "gtk_text_iter_get_buffer") (GtkTextIterRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getBytesInLine_ = call (load_sym libgtk "gtk_text_iter_get_bytes_in_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getChar_ = call (load_sym libgtk "gtk_text_iter_get_char") (GtkTextIterRecord.PolyML.cPtr --> FFI.Char.PolyML.cVal)
      val getCharsInLine_ = call (load_sym libgtk "gtk_text_iter_get_chars_in_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getChildAnchor_ = call (load_sym libgtk "gtk_text_iter_get_child_anchor") (GtkTextIterRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getLanguage_ = call (load_sym libgtk "gtk_text_iter_get_language") (GtkTextIterRecord.PolyML.cPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getLine_ = call (load_sym libgtk "gtk_text_iter_get_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getLineIndex_ = call (load_sym libgtk "gtk_text_iter_get_line_index") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getLineOffset_ = call (load_sym libgtk "gtk_text_iter_get_line_offset") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getOffset_ = call (load_sym libgtk "gtk_text_iter_get_offset") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getPixbuf_ = call (load_sym libgtk "gtk_text_iter_get_pixbuf") (GtkTextIterRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSlice_ = call (load_sym libgtk "gtk_text_iter_get_slice") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getText_ = call (load_sym libgtk "gtk_text_iter_get_text") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleLineIndex_ = call (load_sym libgtk "gtk_text_iter_get_visible_line_index") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getVisibleLineOffset_ = call (load_sym libgtk "gtk_text_iter_get_visible_line_offset") (GtkTextIterRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getVisibleSlice_ = call (load_sym libgtk "gtk_text_iter_get_visible_slice") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleText_ = call (load_sym libgtk "gtk_text_iter_get_visible_text") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasTag_ = call (load_sym libgtk "gtk_text_iter_has_tag") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val inRange_ =
        call (load_sym libgtk "gtk_text_iter_in_range")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val insideSentence_ = call (load_sym libgtk "gtk_text_iter_inside_sentence") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val insideWord_ = call (load_sym libgtk "gtk_text_iter_inside_word") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isCursorPosition_ = call (load_sym libgtk "gtk_text_iter_is_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isEnd_ = call (load_sym libgtk "gtk_text_iter_is_end") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isStart_ = call (load_sym libgtk "gtk_text_iter_is_start") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val order_ = call (load_sym libgtk "gtk_text_iter_order") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setLine_ = call (load_sym libgtk "gtk_text_iter_set_line") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLineIndex_ = call (load_sym libgtk "gtk_text_iter_set_line_index") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setLineOffset_ = call (load_sym libgtk "gtk_text_iter_set_line_offset") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOffset_ = call (load_sym libgtk "gtk_text_iter_set_offset") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVisibleLineIndex_ = call (load_sym libgtk "gtk_text_iter_set_visible_line_index") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVisibleLineOffset_ = call (load_sym libgtk "gtk_text_iter_set_visible_line_offset") (GtkTextIterRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val startsLine_ = call (load_sym libgtk "gtk_text_iter_starts_line") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val startsSentence_ = call (load_sym libgtk "gtk_text_iter_starts_sentence") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val startsWord_ = call (load_sym libgtk "gtk_text_iter_starts_word") (GtkTextIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val togglesTag_ = call (load_sym libgtk "gtk_text_iter_toggles_tag") (GtkTextIterRecord.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = GtkTextIterRecord.t
    type text_search_flags_t = GtkTextSearchFlags.t
    type text_attributes_t = GtkTextAttributesRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
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
