signature ATK_G_OBJECT_ACCESSIBLE =
  sig
    type 'a class_t
    type 'a object_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val forObject : 'a GObject.ObjectClass.t -> base object_class_t
    val getObject : 'a class_t -> base GObject.ObjectClass.t
  end
