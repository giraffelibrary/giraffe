signature GIO_SIMPLE_ACTION_GROUP =
  sig
    type 'a class_t
    type 'a action_group_class_t
    type 'a action_class_t
    type t = base class_t
    val asActionGroup : 'a class_t -> base action_group_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val insert :
      'a class_t
       -> 'b action_class_t
       -> unit
    val lookup :
      'a class_t
       -> string
       -> base action_class_t
    val remove :
      'a class_t
       -> string
       -> unit
  end
