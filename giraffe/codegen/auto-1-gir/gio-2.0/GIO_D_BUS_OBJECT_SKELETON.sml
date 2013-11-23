signature GIO_D_BUS_OBJECT_SKELETON =
  sig
    type 'a class_t
    type 'a dbusinterfaceskeletonclass_t
    type 'a dbusmethodinvocationclass_t
    type 'a dbusobjectclass_t
    val asDBusObject : 'a class_t -> base dbusobjectclass_t
    val getType : unit -> GObject.Type.t
    val new : string -> base class_t
    val addInterface :
      'a class_t
       -> 'b dbusinterfaceskeletonclass_t
       -> unit
    val flush : 'a class_t -> unit
    val removeInterface :
      'a class_t
       -> 'b dbusinterfaceskeletonclass_t
       -> unit
    val removeInterfaceByName :
      'a class_t
       -> string
       -> unit
    val setObjectPath :
      'a class_t
       -> string
       -> unit
    val authorizeMethodSig :
      (base dbusinterfaceskeletonclass_t
        -> base dbusmethodinvocationclass_t
        -> bool)
       -> 'a class_t Signal.signal
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
