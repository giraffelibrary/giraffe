signature ATK_G_OBJECT_ACCESSIBLE =
  sig
    type 'a class_t
    type 'a objectclass_t
    val getType : unit -> GObject.Type.t
    val forObject : 'a GObject.ObjectClass.t -> base objectclass_t
    val getObject : 'a class_t -> base GObject.ObjectClass.t
  end
