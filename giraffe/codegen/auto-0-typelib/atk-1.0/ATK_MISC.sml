signature ATK_MISC =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getInstance : unit -> base class
    val threadsEnter : 'a class -> unit
    val threadsLeave : 'a class -> unit
  end
