signature ATK_EDITABLE_TEXT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val copyText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val cutText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val deleteText :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val pasteText :
      'a class
       -> LargeInt.int
       -> unit
    val setTextContents :
      'a class
       -> string
       -> unit
  end
