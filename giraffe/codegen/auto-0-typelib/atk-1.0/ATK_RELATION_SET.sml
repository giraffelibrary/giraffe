signature ATK_RELATION_SET =
  sig
    type 'a class
    type 'a object_class
    type relation_type_t
    type 'a relation_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val add :
      'a class
       -> 'b relation_class
       -> unit
    val addRelationByType :
      'a class
       -> relation_type_t * 'b object_class
       -> unit
    val contains :
      'a class
       -> relation_type_t
       -> bool
    val containsTarget :
      'a class
       -> relation_type_t * 'b object_class
       -> bool
    val getNRelations : 'a class -> LargeInt.int
    val getRelation :
      'a class
       -> LargeInt.int
       -> base relation_class
    val getRelationByType :
      'a class
       -> relation_type_t
       -> base relation_class
    val remove :
      'a class
       -> 'b relation_class
       -> unit
  end
