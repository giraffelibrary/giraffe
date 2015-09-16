signature ATK_RELATION_SET =
  sig
    type 'a class_t
    type 'a object_class_t
    type relation_type_t
    type 'a relation_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val add :
      'a class_t
       -> 'b relation_class_t
       -> unit
    val addRelationByType :
      'a class_t
       -> relation_type_t
       -> 'b object_class_t
       -> unit
    val contains :
      'a class_t
       -> relation_type_t
       -> bool
    val getNRelations : 'a class_t -> LargeInt.int
    val getRelation :
      'a class_t
       -> LargeInt.int
       -> base relation_class_t
    val getRelationByType :
      'a class_t
       -> relation_type_t
       -> base relation_class_t
    val remove :
      'a class_t
       -> 'b relation_class_t
       -> unit
  end
