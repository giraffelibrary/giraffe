signature ATK_RELATION_SET =
  sig
    type 'a class_t
    type 'a objectclass_t
    type relationtype_t
    type 'a relationclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val add :
      'a class_t
       -> 'b relationclass_t
       -> unit
    val addRelationByType :
      'a class_t
       -> relationtype_t
       -> 'b objectclass_t
       -> unit
    val contains :
      'a class_t
       -> relationtype_t
       -> bool
    val getNRelations : 'a class_t -> LargeInt.int
    val getRelation :
      'a class_t
       -> LargeInt.int
       -> base relationclass_t
    val getRelationByType :
      'a class_t
       -> relationtype_t
       -> base relationclass_t
    val remove :
      'a class_t
       -> 'b relationclass_t
       -> unit
  end
