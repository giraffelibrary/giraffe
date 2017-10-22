signature ATK_TEXT =
  sig
    type 'a class
    type text_range_t
    type text_clip_type_t
    type text_rectangle_t
    type coord_type_t
    type text_granularity_t
    type text_boundary_t
    type t = base class
    val getType : unit -> GObject.Type.t
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
    val getCharacterExtents :
      'a class
       -> LargeInt.int * coord_type_t
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
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
       -> text_rectangle_t
    val getSelection :
      'a class
       -> LargeInt.int
       -> string
           * LargeInt.int
           * LargeInt.int
    val getStringAtOffset :
      'a class
       -> LargeInt.int * text_granularity_t
       -> string
           * LargeInt.int
           * LargeInt.int
    val getText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> string
    val getTextAfterOffset :
      'a class
       -> LargeInt.int * text_boundary_t
       -> string
           * LargeInt.int
           * LargeInt.int
    val getTextAtOffset :
      'a class
       -> LargeInt.int * text_boundary_t
       -> string
           * LargeInt.int
           * LargeInt.int
    val getTextBeforeOffset :
      'a class
       -> LargeInt.int * text_boundary_t
       -> string
           * LargeInt.int
           * LargeInt.int
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
  end
