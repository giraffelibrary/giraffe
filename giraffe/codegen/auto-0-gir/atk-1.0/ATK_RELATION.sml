signature ATK_RELATION =
  sig
    type 'a class_t
    type 'a objectclass_t
    type relationtype_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a objectclass_t
       -> LargeInt.int
       -> relationtype_t
       -> base class_t
    val addTarget :
      'a class_t
       -> 'b objectclass_t
       -> unit
    val getRelationType : 'a class_t -> relationtype_t
    val removeTarget :
      'a class_t
       -> 'b objectclass_t
       -> bool
    val relationTypeProp : ('a class_t, relationtype_t, relationtype_t) Property.readwrite
    val targetProp : ('a class_t, GObject.ValueArrayRecord.t option, GObject.ValueArrayRecord.t option) Property.readwrite
  end
