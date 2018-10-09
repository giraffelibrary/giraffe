signature GTK_TEXT_CHILD_ANCHOR =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDeleted : 'a class -> bool
  end
