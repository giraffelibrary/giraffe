signature G_OBJECT_BINDING =
  sig
    type 'a class_t
    type type_t
    type bindingflags_t
    type 'a objectclass_t
    type t = base class_t
    type ('object, 'a) property_readonly
    type ('object, 'a) property_writeonly
    type ('object, 'a, 'b) property_readwrite
    val getType : unit -> type_t
    val getFlags : 'a class_t -> bindingflags_t
    val getSource : 'a class_t -> base objectclass_t
    val getSourceProperty : 'a class_t -> string
    val getTarget : 'a class_t -> base objectclass_t
    val getTargetProperty : 'a class_t -> string
    val flagsProp : ('a class_t, bindingflags_t, bindingflags_t) property_readwrite
    val sourceProp : ('a class_t, base objectclass_t option, 'b objectclass_t option) property_readwrite
    val sourcePropertyProp : ('a class_t, string option, string option) property_readwrite
    val targetProp : ('a class_t, base objectclass_t option, 'b objectclass_t option) property_readwrite
    val targetPropertyProp : ('a class_t, string option, string option) property_readwrite
  end
