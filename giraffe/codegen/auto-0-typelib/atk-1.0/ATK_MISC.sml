signature ATK_MISC =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getInstance : unit -> base class_t
    val threadsEnter : 'a class_t -> unit
    val threadsLeave : 'a class_t -> unit
  end
