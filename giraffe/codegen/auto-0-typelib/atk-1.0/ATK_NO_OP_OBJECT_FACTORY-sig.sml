signature ATK_NO_OP_OBJECT_FACTORY =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
  end
