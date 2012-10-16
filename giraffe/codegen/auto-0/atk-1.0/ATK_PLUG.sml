signature ATK_PLUG =
  sig
    type 'a class_t
    type 'a componentclass_t
    val asComponent : 'a class_t -> base componentclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getId : 'a class_t -> string
  end
