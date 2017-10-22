signature GIO_SIMPLE_ACTION_GROUP =
  sig
    type 'a class
    type 'a action_group_class
    type 'a action_map_class
    type 'a action_class
    type t = base class
    val asActionGroup : 'a class -> base action_group_class
    val asActionMap : 'a class -> base action_map_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val insert :
      'a class
       -> 'b action_class
       -> unit
    val lookup :
      'a class
       -> string
       -> base action_class
    val remove :
      'a class
       -> string
       -> unit
  end
