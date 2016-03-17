signature G_OBJECT_OBJECT =
  sig
    type 'a class
    type type_t
    type value_t
    type closure_t
    type 'a param_spec_class
    type t = base class
    val getType : unit -> type_t
(*
    val forceFloating : 'a class -> unit
    val freezeNotify : 'a class -> unit
*)
    val getProperty :
      'a class
       -> string
       -> value_t
       -> unit
(*
    val isFloating : 'a class -> bool
    val notify :
      'a class
       -> string
       -> unit
    val notifyByPspec :
      'a class
       -> 'b param_spec_class
       -> unit
    val runDispose : 'a class -> unit
*)
    val setProperty :
      'a class
       -> string
       -> value_t
       -> unit
(*
    val thawNotify : 'a class -> unit
    val watchClosure :
      'a class
       -> closure_t
       -> unit
    val notifySig : (base param_spec_class -> unit) -> 'a class Signal.signal
*)
  end
