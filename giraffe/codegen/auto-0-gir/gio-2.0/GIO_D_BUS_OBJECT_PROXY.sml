signature GIO_D_BUS_OBJECT_PROXY =
  sig
    type 'a class_t
    type 'a dbusobjectclass_t
    type 'a dbusconnectionclass_t
    type t = base class_t
    val asDBusObject : 'a class_t -> base dbusobjectclass_t
    val getType : unit -> GObject.Type.t
    val new :
      'a dbusconnectionclass_t
       -> string
       -> base class_t
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val connectionProp : ('a class_t, base dbusconnectionclass_t option, 'b dbusconnectionclass_t option) Property.readwrite
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
