signature GTK_ENTRY_BUFFER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : string option * LargeInt.int -> base class
    val deleteText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val emitDeletedText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val emitInsertedText :
      'a class
       -> LargeInt.int
           * string
           * LargeInt.int
       -> unit
    val getBytes : 'a class -> int
    val getLength : 'a class -> LargeInt.int
    val getMaxLength : 'a class -> LargeInt.int
    val getText : 'a class -> string
    val insertText :
      'a class
       -> LargeInt.int
           * string
           * LargeInt.int
       -> LargeInt.int
    val setMaxLength :
      'a class
       -> LargeInt.int
       -> unit
    val setText :
      'a class
       -> string * LargeInt.int
       -> unit
    val deletedTextSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val insertedTextSig :
      (LargeInt.int
        * string
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val lengthProp : ('a class, unit -> LargeInt.int, unit, unit) Property.t
    val maxLengthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
  end
