signature GIO_D_BUS_OBJECT_MANAGER =
  sig
    type 'a class
    type 'a d_bus_interface_class
    type 'a d_bus_object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getInterface :
      'a class
       -> string * string
       -> base d_bus_interface_class
    val getObject :
      'a class
       -> string
       -> base d_bus_object_class
    val getObjectPath : 'a class -> string
    val interfaceAddedSig : (base d_bus_object_class * base d_bus_interface_class -> unit) -> 'a class Signal.t
    val interfaceRemovedSig : (base d_bus_object_class * base d_bus_interface_class -> unit) -> 'a class Signal.t
    val objectAddedSig : (base d_bus_object_class -> unit) -> 'a class Signal.t
    val objectRemovedSig : (base d_bus_object_class -> unit) -> 'a class Signal.t
  end
