signature GIO_D_BUS_OBJECT_MANAGER_CLIENT =
  sig
    type 'a class_t
    type 'a asyncinitableclass_t
    type 'a dbusobjectmanagerclass_t
    type 'a initableclass_t
    type 'a asyncresultclass_t
    type 'a dbusproxyclass_t
    type 'a dbusobjectproxyclass_t
    type bustype_t
    type 'a dbusconnectionclass_t
    type dbusobjectmanagerclientflags_t
    type t = base class_t
    val asAsyncInitable : 'a class_t -> base asyncinitableclass_t
    val asDBusObjectManager : 'a class_t -> base dbusobjectmanagerclass_t
    val asInitable : 'a class_t -> base initableclass_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a asyncresultclass_t -> base class_t
    val newForBusFinish : 'a asyncresultclass_t -> base class_t
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val getFlags : 'a class_t -> dbusobjectmanagerclientflags_t
    val getName : 'a class_t -> string
    val getNameOwner : 'a class_t -> string
    val interfaceProxySignalSig :
      (base dbusobjectproxyclass_t
        -> base dbusproxyclass_t
        -> string
        -> string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val busTypeProp : ('a class_t, bustype_t) Property.writeonly
    val connectionProp : ('a class_t, base dbusconnectionclass_t option, 'b dbusconnectionclass_t option) Property.readwrite
    val flagsProp : ('a class_t, dbusobjectmanagerclientflags_t, dbusobjectmanagerclientflags_t) Property.readwrite
    val nameProp : ('a class_t, string option, string option) Property.readwrite
    val nameOwnerProp : ('a class_t, string option) Property.readonly
    val objectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
