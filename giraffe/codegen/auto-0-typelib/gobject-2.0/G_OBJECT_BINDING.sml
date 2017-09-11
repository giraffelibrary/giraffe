signature G_OBJECT_BINDING =
  sig
    type 'a class
    type type_t
    type binding_flags_t
    type 'a object_class
    type ('object, 'a) property_readonly
    type ('object, 'a) property_writeonly
    type ('object, 'a, 'b) property_readwrite
    type t = base class
    val getType : unit -> type_t
    val getFlags : 'a class -> binding_flags_t
    val getSource : 'a class -> base object_class
    val getSourceProperty : 'a class -> string
    val getTarget : 'a class -> base object_class
    val getTargetProperty : 'a class -> string
    val flagsProp : ('a class, binding_flags_t, binding_flags_t) property_readwrite
    val sourceProp : ('a class, base object_class option, 'b object_class option) property_readwrite
    val sourcePropertyProp : ('a class, string option, string option) property_readwrite
    val targetProp : ('a class, base object_class option, 'b object_class option) property_readwrite
    val targetPropertyProp : ('a class, string option, string option) property_readwrite
  end
