signature GTK_TEXT_ITER =
  sig
    type t
    type text_search_flags_t
    type text_attributes_t
    type 'a text_buffer_class
    type 'a text_child_anchor_class
    type 'a text_tag_class
    val getType : unit -> GObject.Type.t
    val assign :
      t
       -> t
       -> unit
    val backwardChar : t -> bool
    val backwardChars :
      t
       -> LargeInt.int
       -> bool
    val backwardCursorPosition : t -> bool
    val backwardCursorPositions :
      t
       -> LargeInt.int
       -> bool
    val backwardLine : t -> bool
    val backwardLines :
      t
       -> LargeInt.int
       -> bool
    val backwardSearch :
      t
       -> string
       -> text_search_flags_t
       -> t option
       -> (t * t) option
    val backwardSentenceStart : t -> bool
    val backwardSentenceStarts :
      t
       -> LargeInt.int
       -> bool
    val backwardToTagToggle :
      t
       -> 'a text_tag_class option
       -> bool
    val backwardVisibleCursorPosition : t -> bool
    val backwardVisibleCursorPositions :
      t
       -> LargeInt.int
       -> bool
    val backwardVisibleLine : t -> bool
    val backwardVisibleLines :
      t
       -> LargeInt.int
       -> bool
    val backwardVisibleWordStart : t -> bool
    val backwardVisibleWordStarts :
      t
       -> LargeInt.int
       -> bool
    val backwardWordStart : t -> bool
    val backwardWordStarts :
      t
       -> LargeInt.int
       -> bool
    val beginsTag :
      t
       -> 'a text_tag_class option
       -> bool
    val canInsert :
      t
       -> bool
       -> bool
    val compare :
      t
       -> t
       -> LargeInt.int
    val copy : t -> t
    val editable :
      t
       -> bool
       -> bool
    val endsLine : t -> bool
    val endsSentence : t -> bool
    val endsTag :
      t
       -> 'a text_tag_class option
       -> bool
    val endsWord : t -> bool
    val equal :
      t
       -> t
       -> bool
    val forwardChar : t -> bool
    val forwardChars :
      t
       -> LargeInt.int
       -> bool
    val forwardCursorPosition : t -> bool
    val forwardCursorPositions :
      t
       -> LargeInt.int
       -> bool
    val forwardLine : t -> bool
    val forwardLines :
      t
       -> LargeInt.int
       -> bool
    val forwardSearch :
      t
       -> string
       -> text_search_flags_t
       -> t option
       -> (t * t) option
    val forwardSentenceEnd : t -> bool
    val forwardSentenceEnds :
      t
       -> LargeInt.int
       -> bool
    val forwardToEnd : t -> unit
    val forwardToLineEnd : t -> bool
    val forwardToTagToggle :
      t
       -> 'a text_tag_class option
       -> bool
    val forwardVisibleCursorPosition : t -> bool
    val forwardVisibleCursorPositions :
      t
       -> LargeInt.int
       -> bool
    val forwardVisibleLine : t -> bool
    val forwardVisibleLines :
      t
       -> LargeInt.int
       -> bool
    val forwardVisibleWordEnd : t -> bool
    val forwardVisibleWordEnds :
      t
       -> LargeInt.int
       -> bool
    val forwardWordEnd : t -> bool
    val forwardWordEnds :
      t
       -> LargeInt.int
       -> bool
    val getAttributes :
      t
       -> text_attributes_t
       -> bool
    val getBuffer : t -> base text_buffer_class
    val getBytesInLine : t -> LargeInt.int
    val getChar : t -> char
    val getCharsInLine : t -> LargeInt.int
    val getChildAnchor : t -> base text_child_anchor_class
    val getLanguage : t -> Pango.LanguageRecord.t
    val getLine : t -> LargeInt.int
    val getLineIndex : t -> LargeInt.int
    val getLineOffset : t -> LargeInt.int
    val getOffset : t -> LargeInt.int
    val getPixbuf : t -> base GdkPixbuf.PixbufClass.class
    val getSlice :
      t
       -> t
       -> string
    val getText :
      t
       -> t
       -> string
    val getVisibleLineIndex : t -> LargeInt.int
    val getVisibleLineOffset : t -> LargeInt.int
    val getVisibleSlice :
      t
       -> t
       -> string
    val getVisibleText :
      t
       -> t
       -> string
    val hasTag :
      t
       -> 'a text_tag_class
       -> bool
    val inRange :
      t
       -> t
       -> t
       -> bool
    val insideSentence : t -> bool
    val insideWord : t -> bool
    val isCursorPosition : t -> bool
    val isEnd : t -> bool
    val isStart : t -> bool
    val order :
      t
       -> t
       -> unit
    val setLine :
      t
       -> LargeInt.int
       -> unit
    val setLineIndex :
      t
       -> LargeInt.int
       -> unit
    val setLineOffset :
      t
       -> LargeInt.int
       -> unit
    val setOffset :
      t
       -> LargeInt.int
       -> unit
    val setVisibleLineIndex :
      t
       -> LargeInt.int
       -> unit
    val setVisibleLineOffset :
      t
       -> LargeInt.int
       -> unit
    val startsLine : t -> bool
    val startsSentence : t -> bool
    val startsWord : t -> bool
    val togglesTag :
      t
       -> 'a text_tag_class option
       -> bool
  end
