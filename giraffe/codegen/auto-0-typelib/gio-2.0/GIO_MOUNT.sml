signature GIO_MOUNT =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    type 'a volumeclass_t
    type 'a fileclass_t
    type 'a iconclass_t
    type 'a driveclass_t
    val getType : unit -> GObject.Type.t
    val canEject : 'a class_t -> bool
    val canUnmount : 'a class_t -> bool
    val ejectWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val getDefaultLocation : 'a class_t -> base fileclass_t
    val getDrive : 'a class_t -> base driveclass_t
    val getIcon : 'a class_t -> base iconclass_t
    val getName : 'a class_t -> string
    val getRoot : 'a class_t -> base fileclass_t
    val getUuid : 'a class_t -> string
    val getVolume : 'a class_t -> base volumeclass_t
    val isShadowed : 'a class_t -> bool
    val remountFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val shadow : 'a class_t -> unit
    val unmountWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val unshadow : 'a class_t -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val preUnmountSig : (unit -> unit) -> 'a class_t Signal.signal
    val unmountedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
