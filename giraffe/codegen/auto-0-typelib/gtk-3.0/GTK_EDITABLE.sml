signature GTK_EDITABLE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val copyClipboard : 'a class_t -> unit
    val cutClipboard : 'a class_t -> unit
    val deleteSelection : 'a class_t -> unit
    val deleteText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val getChars :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> string
    val getEditable : 'a class_t -> bool
    val getPosition : 'a class_t -> LargeInt.int
    val getSelectionBounds : 'a class_t -> (LargeInt.int * LargeInt.int) option
    val insertText :
      'a class_t
       -> string
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val pasteClipboard : 'a class_t -> unit
    val selectRegion :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setEditable :
      'a class_t
       -> bool
       -> unit
    val setPosition :
      'a class_t
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val deleteTextSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val insertTextSig :
      (string
        -> LargeInt.int
        -> LargeInt.int
        -> LargeInt.int)
       -> 'a class_t Signal.signal
  end
