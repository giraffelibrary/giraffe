signature ATK_PLUG =
  sig
    type 'a class_t
    type 'a component_class_t
    type t = base class_t
    val asComponent : 'a class_t -> base component_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getId : 'a class_t -> string
  end
