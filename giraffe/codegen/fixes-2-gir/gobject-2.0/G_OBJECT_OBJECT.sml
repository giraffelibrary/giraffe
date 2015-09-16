signature G_OBJECT_OBJECT =
  sig
    type 'a class_t
    type type_t
    type value_record_t
    type closure_record_t
    type 'a param_spec_class_t
    type t = base class_t
    val getType : unit -> type_t
(*
    val forceFloating : 'a class_t -> unit
    val freezeNotify : 'a class_t -> unit
*)
    val getProperty :
      'a class_t
       -> string
       -> value_record_t
       -> unit
(*
    val isFloating : 'a class_t -> bool
    val notify :
      'a class_t
       -> string
       -> unit
    val notifyByPspec :
      'a class_t
       -> 'b param_spec_class_t
       -> unit
    val runDispose : 'a class_t -> unit
*)
    val setProperty :
      'a class_t
       -> string
       -> value_record_t
       -> unit
(*
    val thawNotify : 'a class_t -> unit
    val watchClosure :
      'a class_t
       -> closure_record_t
       -> unit
    val notifySig : (base param_spec_class_t -> unit) -> 'a class_t Signal.signal
*)
  end
