signature GIO_VOLUME =
  sig
    type 'a class_t
    type 'a file_class_t
    type 'a drive_class_t
    type 'a icon_class_t
    type 'a mount_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val canEject : 'a class_t -> bool
    val canMount : 'a class_t -> bool
    val ejectWithOperationFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val getActivationRoot : 'a class_t -> base file_class_t
    val getDrive : 'a class_t -> base drive_class_t
    val getIcon : 'a class_t -> base icon_class_t
    val getIdentifier :
      'a class_t
       -> string
       -> string
    val getMount : 'a class_t -> base mount_class_t
    val getName : 'a class_t -> string
    val getUuid : 'a class_t -> string
    val mountFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val shouldAutomount : 'a class_t -> bool
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val removedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
