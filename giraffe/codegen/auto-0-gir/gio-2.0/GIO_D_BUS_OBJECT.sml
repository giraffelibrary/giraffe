signature GIO_D_BUS_OBJECT =
  sig
    type 'a class_t
    type 'a dbusinterfaceclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getInterface :
      'a class_t
       -> string
       -> base dbusinterfaceclass_t
    val getObjectPath : 'a class_t -> string
    val interfaceAddedSig : (base dbusinterfaceclass_t -> unit) -> 'a class_t Signal.signal
    val interfaceRemovedSig : (base dbusinterfaceclass_t -> unit) -> 'a class_t Signal.signal
  end
