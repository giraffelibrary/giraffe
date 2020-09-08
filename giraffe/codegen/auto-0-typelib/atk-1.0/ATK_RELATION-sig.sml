signature ATK_RELATION =
  sig
    type 'a class
    type object_class_c_ptr_array_n_t
    type 'a object_class
    type relation_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : object_class_c_ptr_array_n_t * relation_type_t -> base class
    val addTarget :
      'a class
       -> 'b object_class
       -> unit
    val getRelationType : 'a class -> relation_type_t
    val removeTarget :
      'a class
       -> 'b object_class
       -> bool
    val relationTypeProp : ('a class, unit -> relation_type_t, relation_type_t -> unit, relation_type_t -> unit) Property.t
    val targetProp : ('a class, unit -> GObject.ValueArrayRecord.t option, GObject.ValueArrayRecord.t option -> unit, GObject.ValueArrayRecord.t option -> unit) Property.t
  end
