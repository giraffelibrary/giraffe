signature GIO_D_BUS_OBJECT_PROXY =
  sig
    type 'a class
    type 'a d_bus_object_class
    type 'a d_bus_connection_class
    type t = base class
    val asDBusObject : 'a class -> base d_bus_object_class
    val getType : unit -> GObject.Type.t
    val new : 'a d_bus_connection_class * string -> base class
    val getConnection : 'a class -> base d_bus_connection_class
    val gConnectionProp : ('a class, unit -> base d_bus_connection_class option, unit, 'b d_bus_connection_class option -> unit) Property.t
    val gObjectPathProp : ('a class, unit -> string option, unit, string option -> unit) Property.t
  end
