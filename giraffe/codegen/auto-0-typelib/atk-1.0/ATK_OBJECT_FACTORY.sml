signature ATK_OBJECT_FACTORY =
  sig
    type 'a class_t
    type 'a objectclass_t
    val getType : unit -> GObject.Type.t
    val createAccessible :
      'a class_t
       -> 'b GObject.ObjectClass.t
       -> base objectclass_t
    val invalidate : 'a class_t -> unit
  end
