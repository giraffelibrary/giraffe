signature ATK_PLUG =
  sig
    type 'a class
    type 'a component_class
    type t = base class
    val asComponent : 'a class -> base component_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getId : 'a class -> string
  end
