signature GIO_D_BUS_OBJECT_MANAGER =
  sig
    type 'a class_t
    type 'a dbusobjectclass_t
    type 'a dbusinterfaceclass_t
    val getType : unit -> GObject.Type.t
    val getInterface :
      'a class_t
       -> string
       -> string
       -> base dbusinterfaceclass_t
    val getObject :
      'a class_t
       -> string
       -> base dbusobjectclass_t
    val getObjectPath : 'a class_t -> string
    val interfaceAddedSig :
      (base dbusobjectclass_t
        -> base dbusinterfaceclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val interfaceRemovedSig :
      (base dbusobjectclass_t
        -> base dbusinterfaceclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val objectAddedSig : (base dbusobjectclass_t -> unit) -> 'a class_t Signal.signal
    val objectRemovedSig : (base dbusobjectclass_t -> unit) -> 'a class_t Signal.signal
  end
