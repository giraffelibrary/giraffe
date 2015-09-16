signature GIO_D_BUS_OBJECT_MANAGER =
  sig
    type 'a class_t
    type 'a d_bus_interface_class_t
    type 'a d_bus_object_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getInterface :
      'a class_t
       -> string
       -> string
       -> base d_bus_interface_class_t
    val getObject :
      'a class_t
       -> string
       -> base d_bus_object_class_t
    val getObjectPath : 'a class_t -> string
    val interfaceAddedSig :
      (base d_bus_object_class_t
        -> base d_bus_interface_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val interfaceRemovedSig :
      (base d_bus_object_class_t
        -> base d_bus_interface_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val objectAddedSig : (base d_bus_object_class_t -> unit) -> 'a class_t Signal.signal
    val objectRemovedSig : (base d_bus_object_class_t -> unit) -> 'a class_t Signal.signal
  end
