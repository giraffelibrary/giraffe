signature GTK_TEXT_ITER =
  sig
    type record_t
    type textsearchflags_t
    type textattributesrecord_t
    type 'a textbufferclass_t
    type 'a textchildanchorclass_t
    type 'a texttagclass_t
    type t = record_t
    val getType : unit -> GObject.Type.t
    val assign :
      record_t
       -> record_t
       -> unit
    val backwardChar : record_t -> bool
    val backwardChars :
      record_t
       -> LargeInt.int
       -> bool
    val backwardCursorPosition : record_t -> bool
    val backwardCursorPositions :
      record_t
       -> LargeInt.int
       -> bool
    val backwardLine : record_t -> bool
    val backwardLines :
      record_t
       -> LargeInt.int
       -> bool
    val backwardSearch :
      record_t
       -> string
       -> textsearchflags_t
       -> record_t option
       -> (record_t * record_t) option
    val backwardSentenceStart : record_t -> bool
    val backwardSentenceStarts :
      record_t
       -> LargeInt.int
       -> bool
    val backwardToTagToggle :
      record_t
       -> 'a texttagclass_t option
       -> bool
    val backwardVisibleCursorPosition : record_t -> bool
    val backwardVisibleCursorPositions :
      record_t
       -> LargeInt.int
       -> bool
    val backwardVisibleLine : record_t -> bool
    val backwardVisibleLines :
      record_t
       -> LargeInt.int
       -> bool
    val backwardVisibleWordStart : record_t -> bool
    val backwardVisibleWordStarts :
      record_t
       -> LargeInt.int
       -> bool
    val backwardWordStart : record_t -> bool
    val backwardWordStarts :
      record_t
       -> LargeInt.int
       -> bool
    val beginsTag :
      record_t
       -> 'a texttagclass_t option
       -> bool
    val canInsert :
      record_t
       -> bool
       -> bool
    val compare :
      record_t
       -> record_t
       -> LargeInt.int
    val copy : record_t -> record_t
    val editable :
      record_t
       -> bool
       -> bool
    val endsLine : record_t -> bool
    val endsSentence : record_t -> bool
    val endsTag :
      record_t
       -> 'a texttagclass_t option
       -> bool
    val endsWord : record_t -> bool
    val equal :
      record_t
       -> record_t
       -> bool
    val forwardChar : record_t -> bool
    val forwardChars :
      record_t
       -> LargeInt.int
       -> bool
    val forwardCursorPosition : record_t -> bool
    val forwardCursorPositions :
      record_t
       -> LargeInt.int
       -> bool
    val forwardLine : record_t -> bool
    val forwardLines :
      record_t
       -> LargeInt.int
       -> bool
    val forwardSearch :
      record_t
       -> string
       -> textsearchflags_t
       -> record_t option
       -> (record_t * record_t) option
    val forwardSentenceEnd : record_t -> bool
    val forwardSentenceEnds :
      record_t
       -> LargeInt.int
       -> bool
    val forwardToEnd : record_t -> unit
    val forwardToLineEnd : record_t -> bool
    val forwardToTagToggle :
      record_t
       -> 'a texttagclass_t option
       -> bool
    val forwardVisibleCursorPosition : record_t -> bool
    val forwardVisibleCursorPositions :
      record_t
       -> LargeInt.int
       -> bool
    val forwardVisibleLine : record_t -> bool
    val forwardVisibleLines :
      record_t
       -> LargeInt.int
       -> bool
    val forwardVisibleWordEnd : record_t -> bool
    val forwardVisibleWordEnds :
      record_t
       -> LargeInt.int
       -> bool
    val forwardWordEnd : record_t -> bool
    val forwardWordEnds :
      record_t
       -> LargeInt.int
       -> bool
    val getAttributes : record_t -> textattributesrecord_t option
    val getBuffer : record_t -> base textbufferclass_t
    val getBytesInLine : record_t -> LargeInt.int
    val getChar : record_t -> char
    val getCharsInLine : record_t -> LargeInt.int
    val getChildAnchor : record_t -> base textchildanchorclass_t
    val getLanguage : record_t -> Pango.LanguageRecord.t
    val getLine : record_t -> LargeInt.int
    val getLineIndex : record_t -> LargeInt.int
    val getLineOffset : record_t -> LargeInt.int
    val getOffset : record_t -> LargeInt.int
    val getPixbuf : record_t -> base GdkPixbuf.PixbufClass.t
    val getSlice :
      record_t
       -> record_t
       -> string
    val getText :
      record_t
       -> record_t
       -> string
    val getVisibleLineIndex : record_t -> LargeInt.int
    val getVisibleLineOffset : record_t -> LargeInt.int
    val getVisibleSlice :
      record_t
       -> record_t
       -> string
    val getVisibleText :
      record_t
       -> record_t
       -> string
    val hasTag :
      record_t
       -> 'a texttagclass_t
       -> bool
    val inRange :
      record_t
       -> record_t
       -> record_t
       -> bool
    val insideSentence : record_t -> bool
    val insideWord : record_t -> bool
    val isCursorPosition : record_t -> bool
    val isEnd : record_t -> bool
    val isStart : record_t -> bool
    val order :
      record_t
       -> record_t
       -> unit
    val setLine :
      record_t
       -> LargeInt.int
       -> unit
    val setLineIndex :
      record_t
       -> LargeInt.int
       -> unit
    val setLineOffset :
      record_t
       -> LargeInt.int
       -> unit
    val setOffset :
      record_t
       -> LargeInt.int
       -> unit
    val setVisibleLineIndex :
      record_t
       -> LargeInt.int
       -> unit
    val setVisibleLineOffset :
      record_t
       -> LargeInt.int
       -> unit
    val startsLine : record_t -> bool
    val startsSentence : record_t -> bool
    val startsWord : record_t -> bool
    val togglesTag :
      record_t
       -> 'a texttagclass_t option
       -> bool
  end
