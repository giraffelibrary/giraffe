signature GTK_ENTRY_BUFFER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      string option
       -> LargeInt.int
       -> base class
    val deleteText :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val emitDeletedText :
      'a class
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val emitInsertedText :
      'a class
       -> LargeInt.int
       -> string
       -> LargeInt.int
       -> unit
    val getBytes : 'a class -> LargeInt.int
    val getLength : 'a class -> LargeInt.int
    val getMaxLength : 'a class -> LargeInt.int
    val getText : 'a class -> string
    val insertText :
      'a class
       -> LargeInt.int
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val setMaxLength :
      'a class
       -> LargeInt.int
       -> unit
    val setText :
      'a class
       -> string
       -> LargeInt.int
       -> unit
    val deletedTextSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val insertedTextSig :
      (LargeInt.int
        -> string
        -> LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val lengthProp : ('a class, LargeInt.int) Property.readonly
    val maxLengthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
  end
