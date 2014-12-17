signature GIO_VOLUME_MONITOR =
  sig
    type 'a class_t
    type 'a driveclass_t
    type 'a mountclass_t
    type 'a volumeclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val get : unit -> base class_t
    val getMountForUuid :
      'a class_t
       -> string
       -> base mountclass_t
    val getVolumeForUuid :
      'a class_t
       -> string
       -> base volumeclass_t
    val driveChangedSig : (base driveclass_t -> unit) -> 'a class_t Signal.signal
    val driveConnectedSig : (base driveclass_t -> unit) -> 'a class_t Signal.signal
    val driveDisconnectedSig : (base driveclass_t -> unit) -> 'a class_t Signal.signal
    val driveEjectButtonSig : (base driveclass_t -> unit) -> 'a class_t Signal.signal
    val driveStopButtonSig : (base driveclass_t -> unit) -> 'a class_t Signal.signal
    val mountAddedSig : (base mountclass_t -> unit) -> 'a class_t Signal.signal
    val mountChangedSig : (base mountclass_t -> unit) -> 'a class_t Signal.signal
    val mountPreUnmountSig : (base mountclass_t -> unit) -> 'a class_t Signal.signal
    val mountRemovedSig : (base mountclass_t -> unit) -> 'a class_t Signal.signal
    val volumeAddedSig : (base volumeclass_t -> unit) -> 'a class_t Signal.signal
    val volumeChangedSig : (base volumeclass_t -> unit) -> 'a class_t Signal.signal
    val volumeRemovedSig : (base volumeclass_t -> unit) -> 'a class_t Signal.signal
  end
