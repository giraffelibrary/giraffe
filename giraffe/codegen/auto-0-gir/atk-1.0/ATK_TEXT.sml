signature ATK_TEXT =
  sig
    type 'a class_t
    type text_range_record_t
    type text_rectangle_record_t
    type coord_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val freeRanges : text_range_record_t -> unit
    val addSelection :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val getCaretOffset : 'a class_t -> LargeInt.int
    val getCharacterAtOffset :
      'a class_t
       -> LargeInt.int
       -> char
    val getCharacterCount : 'a class_t -> LargeInt.int
    val getNSelections : 'a class_t -> LargeInt.int
    val getOffsetAtPoint :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coord_type_t
       -> LargeInt.int
    val getRangeExtents :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> coord_type_t
       -> text_rectangle_record_t
       -> unit
    val getText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val removeSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val setCaretOffset :
      'a class_t
       -> LargeInt.int
       -> bool
    val setSelection :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val textAttributesChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textCaretMovedSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val textChangedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val textInsertSig :
      (LargeInt.int
        -> LargeInt.int
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val textRemoveSig :
      (LargeInt.int
        -> LargeInt.int
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val textSelectionChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val textUpdateSig :
      (LargeInt.int
        -> LargeInt.int
        -> LargeInt.int
        -> string
        -> unit)
       -> 'a class_t Signal.signal
  end
