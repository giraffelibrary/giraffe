signature ATK_STATE_SET =
  sig
    type 'a class
    type state_type_c_array_n_t
    type state_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val addState :
      'a class
       -> state_type_t
       -> bool
    val addStates :
      'a class
       -> state_type_c_array_n_t
       -> unit
    val andSets :
      'a class
       -> 'b class
       -> base class
    val clearStates : 'a class -> unit
    val containsState :
      'a class
       -> state_type_t
       -> bool
    val containsStates :
      'a class
       -> state_type_c_array_n_t
       -> bool
    val isEmpty : 'a class -> bool
    val orSets :
      'a class
       -> 'b class
       -> base class option
    val removeState :
      'a class
       -> state_type_t
       -> bool
    val xorSets :
      'a class
       -> 'b class
       -> base class
  end
