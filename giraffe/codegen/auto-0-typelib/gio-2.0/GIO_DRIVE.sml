signature GIO_DRIVE =
  sig
    type 'a class_t
    type 'a iconclass_t
    type drivestartstoptype_t
    type 'a asyncresultclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val canEject : 'a class_t -> bool
    val canPollForMedia : 'a class_t -> bool
    val canStart : 'a class_t -> bool
    val canStartDegraded : 'a class_t -> bool
    val canStop : 'a class_t -> bool
    val ejectWithOperationFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val getIcon : 'a class_t -> base iconclass_t
    val getIdentifier :
      'a class_t
       -> string
       -> string
    val getName : 'a class_t -> string
    val getStartStopType : 'a class_t -> drivestartstoptype_t
    val hasMedia : 'a class_t -> bool
    val hasVolumes : 'a class_t -> bool
    val isMediaCheckAutomatic : 'a class_t -> bool
    val isMediaRemovable : 'a class_t -> bool
    val pollForMediaFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val startFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val stopFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val disconnectedSig : (unit -> unit) -> 'a class_t Signal.signal
    val ejectButtonSig : (unit -> unit) -> 'a class_t Signal.signal
    val stopButtonSig : (unit -> unit) -> 'a class_t Signal.signal
  end
