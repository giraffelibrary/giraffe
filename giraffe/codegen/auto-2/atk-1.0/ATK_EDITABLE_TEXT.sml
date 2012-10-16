signature ATK_EDITABLE_TEXT =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val copyText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val cutText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val deleteText :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val pasteText :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTextContents :
      'a class_t
       -> string
       -> unit
  end
