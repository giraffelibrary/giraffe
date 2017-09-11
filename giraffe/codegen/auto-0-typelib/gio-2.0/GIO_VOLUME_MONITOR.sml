signature GIO_VOLUME_MONITOR =
  sig
    type 'a class
    type 'a drive_class
    type 'a mount_class
    type 'a volume_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val get : unit -> base class
    val getMountForUuid :
      'a class
       -> string
       -> base mount_class
    val getVolumeForUuid :
      'a class
       -> string
       -> base volume_class
    val driveChangedSig : (base drive_class -> unit) -> 'a class Signal.t
    val driveConnectedSig : (base drive_class -> unit) -> 'a class Signal.t
    val driveDisconnectedSig : (base drive_class -> unit) -> 'a class Signal.t
    val driveEjectButtonSig : (base drive_class -> unit) -> 'a class Signal.t
    val driveStopButtonSig : (base drive_class -> unit) -> 'a class Signal.t
    val mountAddedSig : (base mount_class -> unit) -> 'a class Signal.t
    val mountChangedSig : (base mount_class -> unit) -> 'a class Signal.t
    val mountPreUnmountSig : (base mount_class -> unit) -> 'a class Signal.t
    val mountRemovedSig : (base mount_class -> unit) -> 'a class Signal.t
    val volumeAddedSig : (base volume_class -> unit) -> 'a class Signal.t
    val volumeChangedSig : (base volume_class -> unit) -> 'a class Signal.t
    val volumeRemovedSig : (base volume_class -> unit) -> 'a class Signal.t
  end
