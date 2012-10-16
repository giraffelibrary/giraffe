structure GtkTextIter :>
  GTK_TEXT_ITER
    where type record_t = GtkTextIterRecord.t
    where type textsearchflags_t = GtkTextSearchFlags.t
    where type textattributesrecord_t = GtkTextAttributesRecord.t
    where type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    where type 'a textchildanchorclass_t = 'a GtkTextChildAnchorClass.t
    where type 'a texttagclass_t = 'a GtkTextTagClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_text_iter_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val assign_ = call (load_sym libgtk "gtk_text_iter_assign") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val backwardChar_ = call (load_sym libgtk "gtk_text_iter_backward_char") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardChars_ = call (load_sym libgtk "gtk_text_iter_backward_chars") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardCursorPosition_ = call (load_sym libgtk "gtk_text_iter_backward_cursor_position") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardCursorPositions_ = call (load_sym libgtk "gtk_text_iter_backward_cursor_positions") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardLine_ = call (load_sym libgtk "gtk_text_iter_backward_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardLines_ = call (load_sym libgtk "gtk_text_iter_backward_lines") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardSearch_ =
        call (load_sym libgtk "gtk_text_iter_backward_search")
          (
            GtkTextIterRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GtkTextSearchFlags.PolyML.VAL
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.Bool.VAL
          )
      val backwardSentenceStart_ = call (load_sym libgtk "gtk_text_iter_backward_sentence_start") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardSentenceStarts_ = call (load_sym libgtk "gtk_text_iter_backward_sentence_starts") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardToTagToggle_ = call (load_sym libgtk "gtk_text_iter_backward_to_tag_toggle") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
      val backwardVisibleCursorPosition_ = call (load_sym libgtk "gtk_text_iter_backward_visible_cursor_position") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardVisibleCursorPositions_ = call (load_sym libgtk "gtk_text_iter_backward_visible_cursor_positions") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardVisibleLine_ = call (load_sym libgtk "gtk_text_iter_backward_visible_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardVisibleLines_ = call (load_sym libgtk "gtk_text_iter_backward_visible_lines") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardVisibleWordStart_ = call (load_sym libgtk "gtk_text_iter_backward_visible_word_start") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardVisibleWordStarts_ = call (load_sym libgtk "gtk_text_iter_backward_visible_word_starts") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val backwardWordStart_ = call (load_sym libgtk "gtk_text_iter_backward_word_start") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val backwardWordStarts_ = call (load_sym libgtk "gtk_text_iter_backward_word_starts") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val beginsTag_ = call (load_sym libgtk "gtk_text_iter_begins_tag") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
      val canInsert_ = call (load_sym libgtk "gtk_text_iter_can_insert") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.Bool.VAL)
      val compare_ = call (load_sym libgtk "gtk_text_iter_compare") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val copy_ = call (load_sym libgtk "gtk_text_iter_copy") (GtkTextIterRecord.PolyML.PTR --> GtkTextIterRecord.PolyML.PTR)
      val editable_ = call (load_sym libgtk "gtk_text_iter_editable") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.Bool.VAL)
      val endsLine_ = call (load_sym libgtk "gtk_text_iter_ends_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val endsSentence_ = call (load_sym libgtk "gtk_text_iter_ends_sentence") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val endsTag_ = call (load_sym libgtk "gtk_text_iter_ends_tag") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
      val endsWord_ = call (load_sym libgtk "gtk_text_iter_ends_word") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val equal_ = call (load_sym libgtk "gtk_text_iter_equal") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardChar_ = call (load_sym libgtk "gtk_text_iter_forward_char") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardChars_ = call (load_sym libgtk "gtk_text_iter_forward_chars") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardCursorPosition_ = call (load_sym libgtk "gtk_text_iter_forward_cursor_position") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardCursorPositions_ = call (load_sym libgtk "gtk_text_iter_forward_cursor_positions") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardLine_ = call (load_sym libgtk "gtk_text_iter_forward_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardLines_ = call (load_sym libgtk "gtk_text_iter_forward_lines") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardSearch_ =
        call (load_sym libgtk "gtk_text_iter_forward_search")
          (
            GtkTextIterRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GtkTextSearchFlags.PolyML.VAL
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.OPTPTR
             --> FFI.PolyML.Bool.VAL
          )
      val forwardSentenceEnd_ = call (load_sym libgtk "gtk_text_iter_forward_sentence_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardSentenceEnds_ = call (load_sym libgtk "gtk_text_iter_forward_sentence_ends") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardToEnd_ = call (load_sym libgtk "gtk_text_iter_forward_to_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val forwardToLineEnd_ = call (load_sym libgtk "gtk_text_iter_forward_to_line_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardToTagToggle_ = call (load_sym libgtk "gtk_text_iter_forward_to_tag_toggle") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
      val forwardVisibleCursorPosition_ = call (load_sym libgtk "gtk_text_iter_forward_visible_cursor_position") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardVisibleCursorPositions_ = call (load_sym libgtk "gtk_text_iter_forward_visible_cursor_positions") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardVisibleLine_ = call (load_sym libgtk "gtk_text_iter_forward_visible_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardVisibleLines_ = call (load_sym libgtk "gtk_text_iter_forward_visible_lines") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardVisibleWordEnd_ = call (load_sym libgtk "gtk_text_iter_forward_visible_word_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardVisibleWordEnds_ = call (load_sym libgtk "gtk_text_iter_forward_visible_word_ends") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val forwardWordEnd_ = call (load_sym libgtk "gtk_text_iter_forward_word_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val forwardWordEnds_ = call (load_sym libgtk "gtk_text_iter_forward_word_ends") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.Bool.VAL)
      val getAttributes_ = call (load_sym libgtk "gtk_text_iter_get_attributes") (GtkTextIterRecord.PolyML.PTR &&> GtkTextAttributesRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getBuffer_ = call (load_sym libgtk "gtk_text_iter_get_buffer") (GtkTextIterRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getBytesInLine_ = call (load_sym libgtk "gtk_text_iter_get_bytes_in_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getChar_ = call (load_sym libgtk "gtk_text_iter_get_char") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Char.VAL)
      val getCharsInLine_ = call (load_sym libgtk "gtk_text_iter_get_chars_in_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getChildAnchor_ = call (load_sym libgtk "gtk_text_iter_get_child_anchor") (GtkTextIterRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getLanguage_ = call (load_sym libgtk "gtk_text_iter_get_language") (GtkTextIterRecord.PolyML.PTR --> PangoLanguageRecord.PolyML.PTR)
      val getLine_ = call (load_sym libgtk "gtk_text_iter_get_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getLineIndex_ = call (load_sym libgtk "gtk_text_iter_get_line_index") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getLineOffset_ = call (load_sym libgtk "gtk_text_iter_get_line_offset") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getOffset_ = call (load_sym libgtk "gtk_text_iter_get_offset") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getPixbuf_ = call (load_sym libgtk "gtk_text_iter_get_pixbuf") (GtkTextIterRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getSlice_ = call (load_sym libgtk "gtk_text_iter_get_slice") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getText_ = call (load_sym libgtk "gtk_text_iter_get_text") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getVisibleLineIndex_ = call (load_sym libgtk "gtk_text_iter_get_visible_line_index") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getVisibleLineOffset_ = call (load_sym libgtk "gtk_text_iter_get_visible_line_offset") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getVisibleSlice_ = call (load_sym libgtk "gtk_text_iter_get_visible_slice") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getVisibleText_ = call (load_sym libgtk "gtk_text_iter_get_visible_text") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val hasTag_ = call (load_sym libgtk "gtk_text_iter_has_tag") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val inRange_ =
        call (load_sym libgtk "gtk_text_iter_in_range")
          (
            GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             &&> GtkTextIterRecord.PolyML.PTR
             --> FFI.PolyML.Bool.VAL
          )
      val insideSentence_ = call (load_sym libgtk "gtk_text_iter_inside_sentence") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val insideWord_ = call (load_sym libgtk "gtk_text_iter_inside_word") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isCursorPosition_ = call (load_sym libgtk "gtk_text_iter_is_cursor_position") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isEnd_ = call (load_sym libgtk "gtk_text_iter_is_end") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val isStart_ = call (load_sym libgtk "gtk_text_iter_is_start") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val order_ = call (load_sym libgtk "gtk_text_iter_order") (GtkTextIterRecord.PolyML.PTR &&> GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val setLine_ = call (load_sym libgtk "gtk_text_iter_set_line") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setLineIndex_ = call (load_sym libgtk "gtk_text_iter_set_line_index") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setLineOffset_ = call (load_sym libgtk "gtk_text_iter_set_line_offset") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setOffset_ = call (load_sym libgtk "gtk_text_iter_set_offset") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setVisibleLineIndex_ = call (load_sym libgtk "gtk_text_iter_set_visible_line_index") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val setVisibleLineOffset_ = call (load_sym libgtk "gtk_text_iter_set_visible_line_offset") (GtkTextIterRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
      val startsLine_ = call (load_sym libgtk "gtk_text_iter_starts_line") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val startsSentence_ = call (load_sym libgtk "gtk_text_iter_starts_sentence") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val startsWord_ = call (load_sym libgtk "gtk_text_iter_starts_word") (GtkTextIterRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val togglesTag_ = call (load_sym libgtk "gtk_text_iter_toggles_tag") (GtkTextIterRecord.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.Bool.VAL)
    end
    type record_t = GtkTextIterRecord.t
    type textsearchflags_t = GtkTextSearchFlags.t
    type textattributesrecord_t = GtkTextAttributesRecord.t
    type 'a textbufferclass_t = 'a GtkTextBufferClass.t
    type 'a textchildanchorclass_t = 'a GtkTextChildAnchorClass.t
    type 'a texttagclass_t = 'a GtkTextTagClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun assign self other = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) assign_ (self & other)
    fun backwardChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardChar_ self
    fun backwardChars self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardChars_ (self & count)
    fun backwardCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardCursorPosition_ self
    fun backwardCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardCursorPositions_ (self & count)
    fun backwardLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardLine_ self
    fun backwardLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardLines_ (self & count)
    fun backwardSearch self str flags limit =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GtkTextSearchFlags.C.withVal
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withOptPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
                   && FFI.Bool.fromVal
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
    fun backwardSentenceStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardSentenceStart_ self
    fun backwardSentenceStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardSentenceStarts_ (self & count)
    fun backwardToTagToggle self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) backwardToTagToggle_ (self & tag)
    fun backwardVisibleCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardVisibleCursorPosition_ self
    fun backwardVisibleCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardVisibleCursorPositions_ (self & count)
    fun backwardVisibleLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardVisibleLine_ self
    fun backwardVisibleLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardVisibleLines_ (self & count)
    fun backwardVisibleWordStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardVisibleWordStart_ self
    fun backwardVisibleWordStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardVisibleWordStarts_ (self & count)
    fun backwardWordStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) backwardWordStart_ self
    fun backwardWordStarts self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) backwardWordStarts_ (self & count)
    fun beginsTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) beginsTag_ (self & tag)
    fun canInsert self defaultEditability = (GtkTextIterRecord.C.withPtr &&&> FFI.Bool.withVal ---> FFI.Bool.fromVal) canInsert_ (self & defaultEditability)
    fun compare self rhs = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) compare_ (self & rhs)
    fun copy self = (GtkTextIterRecord.C.withPtr ---> GtkTextIterRecord.C.fromPtr true) copy_ self
    fun editable self defaultSetting = (GtkTextIterRecord.C.withPtr &&&> FFI.Bool.withVal ---> FFI.Bool.fromVal) editable_ (self & defaultSetting)
    fun endsLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) endsLine_ self
    fun endsSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) endsSentence_ self
    fun endsTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) endsTag_ (self & tag)
    fun endsWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) endsWord_ self
    fun equal self rhs = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & rhs)
    fun forwardChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardChar_ self
    fun forwardChars self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardChars_ (self & count)
    fun forwardCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardCursorPosition_ self
    fun forwardCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardCursorPositions_ (self & count)
    fun forwardLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardLine_ self
    fun forwardLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardLines_ (self & count)
    fun forwardSearch self str flags limit =
      let
        val matchStart
         & matchEnd
         & retVal =
          (
            GtkTextIterRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> GtkTextSearchFlags.C.withVal
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withNewPtr
             &&&> GtkTextIterRecord.C.withOptPtr
             ---> GtkTextIterRecord.C.fromPtr true
                   && GtkTextIterRecord.C.fromPtr true
                   && FFI.Bool.fromVal
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
    fun forwardSentenceEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardSentenceEnd_ self
    fun forwardSentenceEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardSentenceEnds_ (self & count)
    fun forwardToEnd self = (GtkTextIterRecord.C.withPtr ---> I) forwardToEnd_ self
    fun forwardToLineEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardToLineEnd_ self
    fun forwardToTagToggle self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) forwardToTagToggle_ (self & tag)
    fun forwardVisibleCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardVisibleCursorPosition_ self
    fun forwardVisibleCursorPositions self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardVisibleCursorPositions_ (self & count)
    fun forwardVisibleLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardVisibleLine_ self
    fun forwardVisibleLines self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardVisibleLines_ (self & count)
    fun forwardVisibleWordEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardVisibleWordEnd_ self
    fun forwardVisibleWordEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardVisibleWordEnds_ (self & count)
    fun forwardWordEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) forwardWordEnd_ self
    fun forwardWordEnds self count = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> FFI.Bool.fromVal) forwardWordEnds_ (self & count)
    fun getAttributes self =
      let
        val values & retVal = (GtkTextIterRecord.C.withPtr &&&> GtkTextAttributesRecord.C.withNewPtr ---> GtkTextAttributesRecord.C.fromPtr true && FFI.Bool.fromVal) getAttributes_ (self & ())
      in
        if retVal then SOME values else NONE
      end
    fun getBuffer self = (GtkTextIterRecord.C.withPtr ---> GtkTextBufferClass.C.fromPtr false) getBuffer_ self
    fun getBytesInLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getBytesInLine_ self
    fun getChar self = (GtkTextIterRecord.C.withPtr ---> FFI.Char.fromVal) getChar_ self
    fun getCharsInLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getCharsInLine_ self
    fun getChildAnchor self = (GtkTextIterRecord.C.withPtr ---> GtkTextChildAnchorClass.C.fromPtr false) getChildAnchor_ self
    fun getLanguage self = (GtkTextIterRecord.C.withPtr ---> PangoLanguageRecord.C.fromPtr true) getLanguage_ self
    fun getLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getLine_ self
    fun getLineIndex self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getLineIndex_ self
    fun getLineOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getLineOffset_ self
    fun getOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getOffset_ self
    fun getPixbuf self = (GtkTextIterRecord.C.withPtr ---> GdkPixbufPixbufClass.C.fromPtr false) getPixbuf_ self
    fun getSlice self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.String.fromPtr true) getSlice_ (self & end')
    fun getText self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.String.fromPtr true) getText_ (self & end')
    fun getVisibleLineIndex self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getVisibleLineIndex_ self
    fun getVisibleLineOffset self = (GtkTextIterRecord.C.withPtr ---> FFI.Int32.fromVal) getVisibleLineOffset_ self
    fun getVisibleSlice self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.String.fromPtr true) getVisibleSlice_ (self & end')
    fun getVisibleText self end' = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> FFI.String.fromPtr true) getVisibleText_ (self & end')
    fun hasTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) hasTag_ (self & tag)
    fun inRange self start end' =
      (
        GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         &&&> GtkTextIterRecord.C.withPtr
         ---> FFI.Bool.fromVal
      )
        inRange_
        (
          self
           & start
           & end'
        )
    fun insideSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) insideSentence_ self
    fun insideWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) insideWord_ self
    fun isCursorPosition self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) isCursorPosition_ self
    fun isEnd self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) isEnd_ self
    fun isStart self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) isStart_ self
    fun order self second = (GtkTextIterRecord.C.withPtr &&&> GtkTextIterRecord.C.withPtr ---> I) order_ (self & second)
    fun setLine self lineNumber = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setLine_ (self & lineNumber)
    fun setLineIndex self byteOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setLineIndex_ (self & byteOnLine)
    fun setLineOffset self charOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setLineOffset_ (self & charOnLine)
    fun setOffset self charOffset = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setOffset_ (self & charOffset)
    fun setVisibleLineIndex self byteOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setVisibleLineIndex_ (self & byteOnLine)
    fun setVisibleLineOffset self charOnLine = (GtkTextIterRecord.C.withPtr &&&> FFI.Int32.withVal ---> I) setVisibleLineOffset_ (self & charOnLine)
    fun startsLine self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) startsLine_ self
    fun startsSentence self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) startsSentence_ self
    fun startsWord self = (GtkTextIterRecord.C.withPtr ---> FFI.Bool.fromVal) startsWord_ self
    fun togglesTag self tag = (GtkTextIterRecord.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> FFI.Bool.fromVal) togglesTag_ (self & tag)
  end
