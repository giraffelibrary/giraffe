signature GTK_EDITABLE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val copyClipboard : 'a class -> unit
    val cutClipboard : 'a class -> unit
    val deleteSelection : 'a class -> unit
    val deleteText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val getChars :
      'a class
       -> LargeInt.int * LargeInt.int
       -> string
    val getEditable : 'a class -> bool
    val getPosition : 'a class -> LargeInt.int
    val getSelectionBounds : 'a class -> (LargeInt.int * LargeInt.int) option
    val insertText :
      'a class
       -> string
           * LargeInt.int
           * LargeInt.int
       -> LargeInt.int
    val pasteClipboard : 'a class -> unit
    val selectRegion :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setEditable :
      'a class
       -> bool
       -> unit
    val setPosition :
      'a class
       -> LargeInt.int
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.signal
    val deleteTextSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.signal
    val insertTextSig :
      (string
        * LargeInt.int
        * LargeInt.int
        -> LargeInt.int)
       -> 'a class Signal.signal
  end
