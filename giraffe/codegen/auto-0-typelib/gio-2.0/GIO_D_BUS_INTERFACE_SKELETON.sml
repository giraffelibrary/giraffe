signature GIO_D_BUS_INTERFACE_SKELETON =
  sig
    type 'a class_t
    type 'a dbusinterfaceclass_t
    type 'a dbusconnectionclass_t
    type dbusinterfaceinforecord_t
    type 'a dbusmethodinvocationclass_t
    type dbusinterfaceskeletonflags_t
    type t = base class_t
    val asDBusInterface : 'a class_t -> base dbusinterfaceclass_t
    val getType : unit -> GObject.Type.t
    val export :
      'a class_t
       -> 'b dbusconnectionclass_t
       -> string
       -> bool
    val flush : 'a class_t -> unit
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val getFlags : 'a class_t -> dbusinterfaceskeletonflags_t
    val getInfo : 'a class_t -> dbusinterfaceinforecord_t
    val getObjectPath : 'a class_t -> string
    val getProperties : 'a class_t -> GLib.VariantRecord.t
    val setFlags :
      'a class_t
       -> dbusinterfaceskeletonflags_t
       -> unit
    val unexport : 'a class_t -> unit
    val gAuthorizeMethodSig : (base dbusmethodinvocationclass_t -> bool) -> 'a class_t Signal.signal
    val gFlagsProp : ('a class_t, dbusinterfaceskeletonflags_t, dbusinterfaceskeletonflags_t) Property.readwrite
  end
