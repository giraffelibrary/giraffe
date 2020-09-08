signature G_OBJECT_BINDING =
  sig
    type 'a class
    type type_t
    type binding_flags_t
    type 'a object_class
    type ('object_class, 'get, 'set, 'init) property_t
    type t = base class
    val getType : unit -> type_t
    val getFlags : 'a class -> binding_flags_t
    val getSource : 'a class -> base object_class
    val getSourceProperty : 'a class -> string
    val getTarget : 'a class -> base object_class
    val getTargetProperty : 'a class -> string
    val unbind : 'a class -> unit
    val flagsProp : ('a class, unit -> binding_flags_t, unit, binding_flags_t -> unit) property_t
    val sourceProp : ('a class, unit -> base object_class option, unit, 'b object_class option -> unit) property_t
    val sourcePropertyProp : ('a class, unit -> string option, unit, string option -> unit) property_t
    val targetProp : ('a class, unit -> base object_class option, unit, 'b object_class option -> unit) property_t
    val targetPropertyProp : ('a class, unit -> string option, unit, string option -> unit) property_t
  end
