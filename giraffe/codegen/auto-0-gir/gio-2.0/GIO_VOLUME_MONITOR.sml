signature GIO_VOLUME_MONITOR =
  sig
    type 'a class_t
    type 'a drive_class_t
    type 'a mount_class_t
    type 'a volume_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val get : unit -> base class_t
    val getMountForUuid :
      'a class_t
       -> string
       -> base mount_class_t
    val getVolumeForUuid :
      'a class_t
       -> string
       -> base volume_class_t
    val driveChangedSig : (base drive_class_t -> unit) -> 'a class_t Signal.signal
    val driveConnectedSig : (base drive_class_t -> unit) -> 'a class_t Signal.signal
    val driveDisconnectedSig : (base drive_class_t -> unit) -> 'a class_t Signal.signal
    val driveEjectButtonSig : (base drive_class_t -> unit) -> 'a class_t Signal.signal
    val driveStopButtonSig : (base drive_class_t -> unit) -> 'a class_t Signal.signal
    val mountAddedSig : (base mount_class_t -> unit) -> 'a class_t Signal.signal
    val mountChangedSig : (base mount_class_t -> unit) -> 'a class_t Signal.signal
    val mountPreUnmountSig : (base mount_class_t -> unit) -> 'a class_t Signal.signal
    val mountRemovedSig : (base mount_class_t -> unit) -> 'a class_t Signal.signal
    val volumeAddedSig : (base volume_class_t -> unit) -> 'a class_t Signal.signal
    val volumeChangedSig : (base volume_class_t -> unit) -> 'a class_t Signal.signal
    val volumeRemovedSig : (base volume_class_t -> unit) -> 'a class_t Signal.signal
  end
