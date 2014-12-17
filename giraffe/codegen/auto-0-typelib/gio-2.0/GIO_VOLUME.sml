signature GIO_VOLUME =
  sig
    type 'a class_t
    type 'a fileclass_t
    type 'a driveclass_t
    type 'a iconclass_t
    type 'a mountclass_t
    type 'a asyncresultclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val canEject : 'a class_t -> bool
    val canMount : 'a class_t -> bool
    val ejectWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val getActivationRoot : 'a class_t -> base fileclass_t
    val getDrive : 'a class_t -> base driveclass_t
    val getIcon : 'a class_t -> base iconclass_t
    val getIdentifier :
      'a class_t
       -> string
       -> string
    val getMount : 'a class_t -> base mountclass_t
    val getName : 'a class_t -> string
    val getUuid : 'a class_t -> string
    val mountFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val shouldAutomount : 'a class_t -> bool
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val removedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
