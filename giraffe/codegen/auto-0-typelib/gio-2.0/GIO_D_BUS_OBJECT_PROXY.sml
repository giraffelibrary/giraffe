signature GIO_D_BUS_OBJECT_PROXY =
  sig
    type 'a class_t
    type 'a d_bus_object_class_t
    type 'a d_bus_connection_class_t
    type t = base class_t
    val asDBusObject : 'a class_t -> base d_bus_object_class_t
    val getType : unit -> GObject.Type.t
    val new :
      'a d_bus_connection_class_t
       -> string
       -> base class_t
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val connectionProp : ('a class_t, base d_bus_connection_class_t option, 'b d_bus_connection_class_t option) Property.readwrite
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
