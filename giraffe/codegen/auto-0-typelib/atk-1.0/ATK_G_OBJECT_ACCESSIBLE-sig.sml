signature ATK_G_OBJECT_ACCESSIBLE =
  sig
    type 'a class
    type 'a object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val forObject : 'a GObject.ObjectClass.class -> base object_class
    val getObject : 'a class -> base GObject.ObjectClass.class
  end
