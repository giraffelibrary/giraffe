signature GTK_ENTRY_BUFFER =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      string option
       -> LargeInt.int
       -> base class_t
    val deleteText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val emitDeletedText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val emitInsertedText :
      'a class_t
       -> LargeInt.int
       -> string
       -> LargeInt.int
       -> unit
    val getBytes : 'a class_t -> LargeInt.int
    val getLength : 'a class_t -> LargeInt.int
    val getMaxLength : 'a class_t -> LargeInt.int
    val getText : 'a class_t -> string
    val insertText :
      'a class_t
       -> LargeInt.int
       -> string
       -> LargeInt.int
       -> LargeInt.int
    val setMaxLength :
      'a class_t
       -> LargeInt.int
       -> unit
    val setText :
      'a class_t
       -> string
       -> LargeInt.int
       -> unit
    val deletedTextSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val insertedTextSig :
      (LargeInt.int
        -> string
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val lengthProp : ('a class_t, LargeInt.int) Property.readonly
    val maxLengthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
  end
