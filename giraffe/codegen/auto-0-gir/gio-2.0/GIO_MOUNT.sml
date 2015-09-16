signature GIO_MOUNT =
  sig
    type 'a class_t
    type 'a drive_class_t
    type 'a icon_class_t
    type 'a file_class_t
    type 'a volume_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val canEject : 'a class_t -> bool
    val canUnmount : 'a class_t -> bool
    val ejectWithOperationFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val getDefaultLocation : 'a class_t -> base file_class_t
    val getDrive : 'a class_t -> base drive_class_t
    val getIcon : 'a class_t -> base icon_class_t
    val getName : 'a class_t -> string
    val getRoot : 'a class_t -> base file_class_t
    val getUuid : 'a class_t -> string
    val getVolume : 'a class_t -> base volume_class_t
    val isShadowed : 'a class_t -> bool
    val remountFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val shadow : 'a class_t -> unit
    val unmountWithOperationFinish :
      'a class_t
       -> 'b async_result_class_t
       -> bool
    val unshadow : 'a class_t -> unit
    val changedSig : (unit -> unit) -> 'a class_t Signal.signal
    val preUnmountSig : (unit -> unit) -> 'a class_t Signal.signal
    val unmountedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
