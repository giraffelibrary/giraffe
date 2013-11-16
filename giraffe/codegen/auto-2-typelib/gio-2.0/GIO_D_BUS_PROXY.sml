signature GIO_D_BUS_PROXY =
  sig
    type 'a class_t
    type dbusinterfaceinforecord_t
    type dbusproxyflags_t
    type 'a dbusconnectionclass_t
    type bustype_t
    type dbuscallflags_t
    type 'a unixfdlistclass_t
    type 'a cancellableclass_t
    type 'a asyncresultclass_t
    type 'a initableclass_t
    type 'a dbusinterfaceclass_t
    type 'a asyncinitableclass_t
    val asAsyncInitable : 'a class_t -> base asyncinitableclass_t
    val asDBusInterface : 'a class_t -> base dbusinterfaceclass_t
    val asInitable : 'a class_t -> base initableclass_t
    val getType : unit -> GObject.Type.t
    val newFinish : 'a asyncresultclass_t -> base class_t
    val newForBusFinish : 'a asyncresultclass_t -> base class_t
    val newForBusSync :
      bustype_t
       -> dbusproxyflags_t
       -> dbusinterfaceinforecord_t option
       -> string
       -> string
       -> string
       -> 'a cancellableclass_t option
       -> base class_t
    val newSync :
      'a dbusconnectionclass_t
       -> dbusproxyflags_t
       -> dbusinterfaceinforecord_t option
       -> string option
       -> string
       -> string
       -> 'b cancellableclass_t option
       -> base class_t
    val callFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> GLib.VariantRecord.t
    val callSync :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> dbuscallflags_t
       -> LargeInt.int
       -> 'b cancellableclass_t option
       -> GLib.VariantRecord.t
    val callWithUnixFdListFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> GLib.VariantRecord.t * base unixfdlistclass_t
    val callWithUnixFdListSync :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> dbuscallflags_t
       -> LargeInt.int
       -> 'b unixfdlistclass_t option
       -> 'c cancellableclass_t option
       -> GLib.VariantRecord.t * base unixfdlistclass_t
    val getCachedProperty :
      'a class_t
       -> string
       -> GLib.VariantRecord.t
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val getDefaultTimeout : 'a class_t -> LargeInt.int
    val getFlags : 'a class_t -> dbusproxyflags_t
    val getInterfaceInfo : 'a class_t -> dbusinterfaceinforecord_t
    val getInterfaceName : 'a class_t -> string
    val getName : 'a class_t -> string
    val getNameOwner : 'a class_t -> string
    val getObjectPath : 'a class_t -> string
    val setCachedProperty :
      'a class_t
       -> string
       -> GLib.VariantRecord.t option
       -> unit
    val setDefaultTimeout :
      'a class_t
       -> LargeInt.int
       -> unit
    val setInterfaceInfo :
      'a class_t
       -> dbusinterfaceinforecord_t option
       -> unit
    val gSignalSig :
      (string
        -> string
        -> GLib.VariantRecord.t
        -> unit)
       -> 'a class_t Signal.signal
    val gBusTypeProp : ('a class_t, bustype_t) Property.writeonly
    val gConnectionProp : ('a class_t, base dbusconnectionclass_t option, 'b dbusconnectionclass_t option) Property.readwrite
    val gDefaultTimeoutProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val gFlagsProp : ('a class_t, dbusproxyflags_t, dbusproxyflags_t) Property.readwrite
    val gInterfaceInfoProp : ('a class_t, dbusinterfaceinforecord_t option, dbusinterfaceinforecord_t option) Property.readwrite
    val gInterfaceNameProp : ('a class_t, string option, string option) Property.readwrite
    val gNameProp : ('a class_t, string option, string option) Property.readwrite
    val gNameOwnerProp : ('a class_t, string option) Property.readonly
    val gObjectPathProp : ('a class_t, string option, string option) Property.readwrite
  end
