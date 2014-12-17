signature ATK_NO_OP_OBJECT_FACTORY =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
  end
