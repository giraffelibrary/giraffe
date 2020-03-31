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
    val lengthProp : {get : 'a class -> LargeInt.int}
    val maxLengthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val textProp :
      {
        get : 'a class -> string option,
        set :
          string option
           -> 'a class
           -> unit,
        new : string option -> 'a class Property.t
      }
  end
