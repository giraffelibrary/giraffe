signature ATK_TEXT =
  sig
    type 'a class
    type text_range_t
    type text_clip_type_t
    type text_rectangle_t
    type coord_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val freeRanges : text_range_t -> unit
    val addSelection :
      'a class
       -> LargeInt.int * LargeInt.int
       -> bool
    val getBoundedRanges :
      'a class
       -> text_rectangle_t
           * coord_type_t
           * text_clip_type_t
           * text_clip_type_t
       -> text_range_t vector
    val getCaretOffset : 'a class -> LargeInt.int
    val getCharacterAtOffset :
      'a class
       -> LargeInt.int
       -> char
    val getCharacterCount : 'a class -> LargeInt.int
    val getNSelections : 'a class -> LargeInt.int
    val getOffsetAtPoint :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * coord_type_t
       -> LargeInt.int
    val getRangeExtents :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * coord_type_t
           * text_rectangle_t
       -> unit
    val getText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> string
    val removeSelection :
      'a class
       -> LargeInt.int
       -> bool
    val setCaretOffset :
      'a class
       -> LargeInt.int
       -> bool
    val setSelection :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> bool
    val textAttributesChangedSig : (unit -> unit) -> 'a class Signal.t
    val textCaretMovedSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val textChangedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val textInsertSig :
      (LargeInt.int
        * LargeInt.int
        * string
        -> unit)
       -> 'a class Signal.t
    val textRemoveSig :
      (LargeInt.int
        * LargeInt.int
        * string
        -> unit)
       -> 'a class Signal.t
    val textSelectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val textUpdateSig :
      (LargeInt.int
        * LargeInt.int
        * LargeInt.int
        * string
        -> unit)
       -> 'a class Signal.t
  end
