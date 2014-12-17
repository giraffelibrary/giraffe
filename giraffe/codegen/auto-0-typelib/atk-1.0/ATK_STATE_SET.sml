signature ATK_STATE_SET =
  sig
    type 'a class_t
    type statetype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val addState :
      'a class_t
       -> statetype_t
       -> bool
    val andSets :
      'a class_t
       -> 'b class_t
       -> base class_t
    val clearStates : 'a class_t -> unit
    val containsState :
      'a class_t
       -> statetype_t
       -> bool
    val isEmpty : 'a class_t -> bool
    val orSets :
      'a class_t
       -> 'b class_t
       -> base class_t
    val removeState :
      'a class_t
       -> statetype_t
       -> bool
    val xorSets :
      'a class_t
       -> 'b class_t
       -> base class_t
  end
