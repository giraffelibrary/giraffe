signature ATK_RELATION =
  sig
    type 'a class_t
    type 'a object_class_t
    type relation_type_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a object_class_t
       -> LargeInt.int
       -> relation_type_t
       -> base class_t
    val addTarget :
      'a class_t
       -> 'b object_class_t
       -> unit
    val getRelationType : 'a class_t -> relation_type_t
    val removeTarget :
      'a class_t
       -> 'b object_class_t
       -> bool
    val relationTypeProp : ('a class_t, relation_type_t, relation_type_t) Property.readwrite
    val targetProp : ('a class_t, GObject.ValueArrayRecord.t option, GObject.ValueArrayRecord.t option) Property.readwrite
  end
