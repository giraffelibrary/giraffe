signature G_OBJECT_BINDING =
  sig
    type 'a class
    type type_t
    type binding_flags_t
    type 'a object_class
    type 'object_class property_t
    type t = base class
    val getType : unit -> type_t
    val getFlags : 'a class -> binding_flags_t
    val getSource : 'a class -> base object_class
    val getSourceProperty : 'a class -> string
    val getTarget : 'a class -> base object_class
    val getTargetProperty : 'a class -> string
    val unbind : 'a class -> unit
    val flagsProp :
      {
        get : 'a class -> binding_flags_t,
        new : binding_flags_t -> 'a class property_t
      }
    val sourceProp :
      {
        get : 'a class -> base object_class option,
        new : 'b object_class option -> 'a class property_t
      }
    val sourcePropertyProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class property_t
      }
    val targetProp :
      {
        get : 'a class -> base object_class option,
        new : 'b object_class option -> 'a class property_t
      }
    val targetPropertyProp :
      {
        get : 'a class -> string option,
        new : string option -> 'a class property_t
      }
  end
