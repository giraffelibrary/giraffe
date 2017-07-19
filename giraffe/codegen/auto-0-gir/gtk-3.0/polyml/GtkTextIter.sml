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
      val getType_ = call (getSymbol "gtk_text_iter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val assign_ = call (getSymbol "gtk_text_iter_assign") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val backwardChar_ = call (getSymbol "gtk_text_iter_backward_char") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardChars_ = call (getSymbol "gtk_text_iter_backward_chars") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardCursorPosition_ = call (getSymbol "gtk_text_iter_backward_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardCursorPositions_ = call (getSymbol "gtk_text_iter_backward_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardLine_ = call (getSymbol "gtk_text_iter_backward_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardLines_ = call (getSymbol "gtk_text_iter_backward_lines") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardSearch_ =
        call (getSymbol "gtk_text_iter_backward_search")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextSearchFlags.PolyML.cVal
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> GBool.PolyML.cVal
          )
      val backwardSentenceStart_ = call (getSymbol "gtk_text_iter_backward_sentence_start") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardSentenceStarts_ = call (getSymbol "gtk_text_iter_backward_sentence_starts") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardToTagToggle_ = call (getSymbol "gtk_text_iter_backward_to_tag_toggle") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val backwardVisibleCursorPosition_ = call (getSymbol "gtk_text_iter_backward_visible_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardVisibleCursorPositions_ = call (getSymbol "gtk_text_iter_backward_visible_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardVisibleLine_ = call (getSymbol "gtk_text_iter_backward_visible_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardVisibleLines_ = call (getSymbol "gtk_text_iter_backward_visible_lines") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardVisibleWordStart_ = call (getSymbol "gtk_text_iter_backward_visible_word_start") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardVisibleWordStarts_ = call (getSymbol "gtk_text_iter_backward_visible_word_starts") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val backwardWordStart_ = call (getSymbol "gtk_text_iter_backward_word_start") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val backwardWordStarts_ = call (getSymbol "gtk_text_iter_backward_word_starts") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val beginsTag_ = call (getSymbol "gtk_text_iter_begins_tag") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val canInsert_ = call (getSymbol "gtk_text_iter_can_insert") (GtkTextIterRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val compare_ = call (getSymbol "gtk_text_iter_compare") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val copy_ = call (getSymbol "gtk_text_iter_copy") (GtkTextIterRecord.PolyML.cPtr --> GtkTextIterRecord.PolyML.cPtr)
      val editable_ = call (getSymbol "gtk_text_iter_editable") (GtkTextIterRecord.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val endsLine_ = call (getSymbol "gtk_text_iter_ends_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val endsSentence_ = call (getSymbol "gtk_text_iter_ends_sentence") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val endsTag_ = call (getSymbol "gtk_text_iter_ends_tag") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val endsWord_ = call (getSymbol "gtk_text_iter_ends_word") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val equal_ = call (getSymbol "gtk_text_iter_equal") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardChar_ = call (getSymbol "gtk_text_iter_forward_char") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardChars_ = call (getSymbol "gtk_text_iter_forward_chars") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardCursorPosition_ = call (getSymbol "gtk_text_iter_forward_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardCursorPositions_ = call (getSymbol "gtk_text_iter_forward_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardLine_ = call (getSymbol "gtk_text_iter_forward_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardLines_ = call (getSymbol "gtk_text_iter_forward_lines") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardSearch_ =
        call (getSymbol "gtk_text_iter_forward_search")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkTextSearchFlags.PolyML.cVal
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cOptPtr
             --> GBool.PolyML.cVal
          )
      val forwardSentenceEnd_ = call (getSymbol "gtk_text_iter_forward_sentence_end") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardSentenceEnds_ = call (getSymbol "gtk_text_iter_forward_sentence_ends") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardToEnd_ = call (getSymbol "gtk_text_iter_forward_to_end") (GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val forwardToLineEnd_ = call (getSymbol "gtk_text_iter_forward_to_line_end") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardToTagToggle_ = call (getSymbol "gtk_text_iter_forward_to_tag_toggle") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
      val forwardVisibleCursorPosition_ = call (getSymbol "gtk_text_iter_forward_visible_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardVisibleCursorPositions_ = call (getSymbol "gtk_text_iter_forward_visible_cursor_positions") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardVisibleLine_ = call (getSymbol "gtk_text_iter_forward_visible_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardVisibleLines_ = call (getSymbol "gtk_text_iter_forward_visible_lines") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardVisibleWordEnd_ = call (getSymbol "gtk_text_iter_forward_visible_word_end") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardVisibleWordEnds_ = call (getSymbol "gtk_text_iter_forward_visible_word_ends") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val forwardWordEnd_ = call (getSymbol "gtk_text_iter_forward_word_end") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val forwardWordEnds_ = call (getSymbol "gtk_text_iter_forward_word_ends") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GBool.PolyML.cVal)
      val getAttributes_ = call (getSymbol "gtk_text_iter_get_attributes") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextAttributesRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBuffer_ = call (getSymbol "gtk_text_iter_get_buffer") (GtkTextIterRecord.PolyML.cPtr --> GtkTextBufferClass.PolyML.cPtr)
      val getBytesInLine_ = call (getSymbol "gtk_text_iter_get_bytes_in_line") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getChar_ = call (getSymbol "gtk_text_iter_get_char") (GtkTextIterRecord.PolyML.cPtr --> GChar.PolyML.cVal)
      val getCharsInLine_ = call (getSymbol "gtk_text_iter_get_chars_in_line") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getChildAnchor_ = call (getSymbol "gtk_text_iter_get_child_anchor") (GtkTextIterRecord.PolyML.cPtr --> GtkTextChildAnchorClass.PolyML.cPtr)
      val getLanguage_ = call (getSymbol "gtk_text_iter_get_language") (GtkTextIterRecord.PolyML.cPtr --> PangoLanguageRecord.PolyML.cPtr)
      val getLine_ = call (getSymbol "gtk_text_iter_get_line") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLineIndex_ = call (getSymbol "gtk_text_iter_get_line_index") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getLineOffset_ = call (getSymbol "gtk_text_iter_get_line_offset") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getOffset_ = call (getSymbol "gtk_text_iter_get_offset") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getPixbuf_ = call (getSymbol "gtk_text_iter_get_pixbuf") (GtkTextIterRecord.PolyML.cPtr --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getSlice_ = call (getSymbol "gtk_text_iter_get_slice") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getText_ = call (getSymbol "gtk_text_iter_get_text") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleLineIndex_ = call (getSymbol "gtk_text_iter_get_visible_line_index") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getVisibleLineOffset_ = call (getSymbol "gtk_text_iter_get_visible_line_offset") (GtkTextIterRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getVisibleSlice_ = call (getSymbol "gtk_text_iter_get_visible_slice") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisibleText_ = call (getSymbol "gtk_text_iter_get_visible_text") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val hasTag_ = call (getSymbol "gtk_text_iter_has_tag") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val inRange_ =
        call (getSymbol "gtk_text_iter_in_range")
          (
            GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             &&> GtkTextIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val insideSentence_ = call (getSymbol "gtk_text_iter_inside_sentence") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val insideWord_ = call (getSymbol "gtk_text_iter_inside_word") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isCursorPosition_ = call (getSymbol "gtk_text_iter_is_cursor_position") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isEnd_ = call (getSymbol "gtk_text_iter_is_end") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val isStart_ = call (getSymbol "gtk_text_iter_is_start") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val order_ = call (getSymbol "gtk_text_iter_order") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextIterRecord.PolyML.cPtr --> cVoid)
      val setLine_ = call (getSymbol "gtk_text_iter_set_line") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setLineIndex_ = call (getSymbol "gtk_text_iter_set_line_index") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setLineOffset_ = call (getSymbol "gtk_text_iter_set_line_offset") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setOffset_ = call (getSymbol "gtk_text_iter_set_offset") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setVisibleLineIndex_ = call (getSymbol "gtk_text_iter_set_visible_line_index") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setVisibleLineOffset_ = call (getSymbol "gtk_text_iter_set_visible_line_offset") (GtkTextIterRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val startsLine_ = call (getSymbol "gtk_text_iter_starts_line") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val startsSentence_ = call (getSymbol "gtk_text_iter_starts_sentence") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val startsWord_ = call (getSymbol "gtk_text_iter_starts_word") (GtkTextIterRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val togglesTag_ = call (getSymbol "gtk_text_iter_toggles_tag") (GtkTextIterRecord.PolyML.cPtr &&> GtkTextTagClass.PolyML.cOptPtr --> GBool.PolyML.cVal)
    end
    type t = GtkTextIterRecord.t
    type text_search_flags_t = GtkTextSearchFlags.t
    type text_attributes_t = GtkTextAttributesRecord.t
    type 'a text_buffer_class = 'a GtkTextBufferClass.class
    type 'a text_child_anchor_class = 'a GtkTextChildAnchorClass.class
    type 'a text_tag_class = 'a GtkTextTagClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun assign self other = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> I) assign_ (self & other)
    fun backwardChar self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardChar_ self
    fun backwardChars self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardChars_ (self & count)
    fun backwardCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardCursorPosition_ self
    fun backwardCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardCursorPositions_ (self & count)
    fun backwardLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardLine_ self
    fun backwardLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardLines_ (self & count)
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
    fun backwardSentenceStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardSentenceStarts_ (self & count)
    fun backwardToTagToggle self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) backwardToTagToggle_ (self & tag)
    fun backwardVisibleCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleCursorPosition_ self
    fun backwardVisibleCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleCursorPositions_ (self & count)
    fun backwardVisibleLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleLine_ self
    fun backwardVisibleLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleLines_ (self & count)
    fun backwardVisibleWordStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardVisibleWordStart_ self
    fun backwardVisibleWordStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardVisibleWordStarts_ (self & count)
    fun backwardWordStart self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) backwardWordStart_ self
    fun backwardWordStarts self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) backwardWordStarts_ (self & count)
    fun beginsTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) beginsTag_ (self & tag)
    fun canInsert self defaultEditability = (GtkTextIterRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) canInsert_ (self & defaultEditability)
    fun compare self rhs = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) compare_ (self & rhs)
    fun copy self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextIterRecord.FFI.fromPtr true) copy_ self
    fun editable self defaultSetting = (GtkTextIterRecord.FFI.withPtr &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) editable_ (self & defaultSetting)
    fun endsLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsLine_ self
    fun endsSentence self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsSentence_ self
    fun endsTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) endsTag_ (self & tag)
    fun endsWord self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) endsWord_ self
    fun equal self rhs = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & rhs)
    fun forwardChar self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardChar_ self
    fun forwardChars self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardChars_ (self & count)
    fun forwardCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardCursorPosition_ self
    fun forwardCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardCursorPositions_ (self & count)
    fun forwardLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardLine_ self
    fun forwardLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardLines_ (self & count)
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
    fun forwardSentenceEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardSentenceEnds_ (self & count)
    fun forwardToEnd self = (GtkTextIterRecord.FFI.withPtr ---> I) forwardToEnd_ self
    fun forwardToLineEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardToLineEnd_ self
    fun forwardToTagToggle self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) forwardToTagToggle_ (self & tag)
    fun forwardVisibleCursorPosition self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleCursorPosition_ self
    fun forwardVisibleCursorPositions self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleCursorPositions_ (self & count)
    fun forwardVisibleLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleLine_ self
    fun forwardVisibleLines self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleLines_ (self & count)
    fun forwardVisibleWordEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardVisibleWordEnd_ self
    fun forwardVisibleWordEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardVisibleWordEnds_ (self & count)
    fun forwardWordEnd self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) forwardWordEnd_ self
    fun forwardWordEnds self count = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GBool.FFI.fromVal) forwardWordEnds_ (self & count)
    fun getAttributes self values = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextAttributesRecord.FFI.withPtr ---> GBool.FFI.fromVal) getAttributes_ (self & values)
    fun getBuffer self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getBytesInLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getBytesInLine_ self
    fun getChar self = (GtkTextIterRecord.FFI.withPtr ---> GChar.FFI.fromVal) getChar_ self
    fun getCharsInLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getCharsInLine_ self
    fun getChildAnchor self = (GtkTextIterRecord.FFI.withPtr ---> GtkTextChildAnchorClass.FFI.fromPtr false) getChildAnchor_ self
    fun getLanguage self = (GtkTextIterRecord.FFI.withPtr ---> PangoLanguageRecord.FFI.fromPtr true) getLanguage_ self
    fun getLine self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getLine_ self
    fun getLineIndex self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getLineIndex_ self
    fun getLineOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getLineOffset_ self
    fun getOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getOffset_ self
    fun getPixbuf self = (GtkTextIterRecord.FFI.withPtr ---> GdkPixbufPixbufClass.FFI.fromPtr false) getPixbuf_ self
    fun getSlice self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getSlice_ (self & end')
    fun getText self end' = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextIterRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getText_ (self & end')
    fun getVisibleLineIndex self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getVisibleLineIndex_ self
    fun getVisibleLineOffset self = (GtkTextIterRecord.FFI.withPtr ---> GInt.FFI.fromVal) getVisibleLineOffset_ self
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
    fun setLine self lineNumber = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLine_ (self & lineNumber)
    fun setLineIndex self byteOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLineIndex_ (self & byteOnLine)
    fun setLineOffset self charOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLineOffset_ (self & charOnLine)
    fun setOffset self charOffset = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setOffset_ (self & charOffset)
    fun setVisibleLineIndex self byteOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setVisibleLineIndex_ (self & byteOnLine)
    fun setVisibleLineOffset self charOnLine = (GtkTextIterRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setVisibleLineOffset_ (self & charOnLine)
    fun startsLine self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsLine_ self
    fun startsSentence self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsSentence_ self
    fun startsWord self = (GtkTextIterRecord.FFI.withPtr ---> GBool.FFI.fromVal) startsWord_ self
    fun togglesTag self tag = (GtkTextIterRecord.FFI.withPtr &&&> GtkTextTagClass.FFI.withOptPtr ---> GBool.FFI.fromVal) togglesTag_ (self & tag)
  end
