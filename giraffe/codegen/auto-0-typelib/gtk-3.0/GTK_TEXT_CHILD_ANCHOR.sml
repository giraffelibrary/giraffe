signature GTK_TEXT_CHILD_ANCHOR =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getDeleted : 'a class_t -> bool
  end
