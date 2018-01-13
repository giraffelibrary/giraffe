signature ATK_OBJECT_FACTORY =
  sig
    type 'a class
    type 'a object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val createAccessible :
      'a class
       -> 'b GObject.ObjectClass.class
       -> base object_class
    val getAccessibleType : 'a class -> GObject.Type.t
    val invalidate : 'a class -> unit
  end
