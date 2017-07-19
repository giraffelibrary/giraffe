signature ATK_RELATION =
  sig
    type 'a class
    type 'a object_class
    type relation_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new :
      'a object_class
       * LargeInt.int
       * relation_type_t
       -> base class
    val addTarget :
      'a class
       -> 'b object_class
       -> unit
    val getRelationType : 'a class -> relation_type_t
    val removeTarget :
      'a class
       -> 'b object_class
       -> bool
    val relationTypeProp : ('a class, relation_type_t, relation_type_t) Property.readwrite
    val targetProp : ('a class, GObject.ValueArrayRecord.t option, GObject.ValueArrayRecord.t option) Property.readwrite
  end
