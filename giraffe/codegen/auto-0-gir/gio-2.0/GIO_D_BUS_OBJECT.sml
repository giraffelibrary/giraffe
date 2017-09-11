signature GIO_D_BUS_OBJECT =
  sig
    type 'a class
    type 'a d_bus_interface_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getInterface :
      'a class
       -> string
       -> base d_bus_interface_class
    val getObjectPath : 'a class -> string
    val interfaceAddedSig : (base d_bus_interface_class -> unit) -> 'a class Signal.t
    val interfaceRemovedSig : (base d_bus_interface_class -> unit) -> 'a class Signal.t
  end
