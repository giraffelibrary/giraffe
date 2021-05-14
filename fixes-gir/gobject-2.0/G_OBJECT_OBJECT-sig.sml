signature G_OBJECT_OBJECT =
  sig
    type 'a class
    type type_t
    type 'a binding_class
    type binding_flags_t
    type value_record_c_array_n_t
    type value_t
    type closure_t
    type 'a param_spec_class
    type 'a value_accessor_t
    type 'object_class property_init_t
    type 'a signal_t
    type t = base class
    val getType : unit -> type_t
    val new : 'a class value_accessor_t * 'a class property_init_t list -> 'a class
    val bindProperty :
      'a class
       -> string
           * 'b class
           * string
           * binding_flags_t
       -> base binding_class
    val bindPropertyFull :
      'a class
       -> string
           * 'b class
           * string
           * binding_flags_t
           * closure_t
           * closure_t
       -> base binding_class
    val freezeNotify : 'a class -> unit
    val getProperty :
      'a class
       -> string * value_t
       -> unit
    val getv :
      'a class
       -> Utf8CPtrArrayN.t * value_record_c_array_n_t
       -> unit
    val notify :
      'a class
       -> string
       -> unit
    val notifyByPspec :
      'a class
       -> 'b param_spec_class
       -> unit
    val runDispose : 'a class -> unit
    val setProperty :
      'a class
       -> string * value_t
       -> unit
    val thawNotify : 'a class -> unit
    val watchClosure :
      'a class
       -> closure_t
       -> unit
    val notifySig : (base param_spec_class -> unit) -> 'a class signal_t
  end
