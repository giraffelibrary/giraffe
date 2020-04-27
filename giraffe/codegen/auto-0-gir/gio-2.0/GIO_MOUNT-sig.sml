signature GIO_MOUNT =
  sig
    type 'a class
    type 'a drive_class
    type 'a file_class
    type 'a icon_class
    type 'a volume_class
    type 'a cancellable_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canEject : 'a class -> bool
    val canUnmount : 'a class -> bool
    val ejectFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val ejectWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val getDefaultLocation : 'a class -> base file_class
    val getDrive : 'a class -> base drive_class
    val getIcon : 'a class -> base icon_class
    val getName : 'a class -> string
    val getRoot : 'a class -> base file_class
    val getSortKey : 'a class -> string
    val getSymbolicIcon : 'a class -> base icon_class
    val getUuid : 'a class -> string
    val getVolume : 'a class -> base volume_class
    val guessContentTypeFinish :
      'a class
       -> 'b async_result_class
       -> Utf8CPtrArray.t
    val guessContentTypeSync :
      'a class
       -> bool * 'b cancellable_class option
       -> Utf8CPtrArray.t
    val isShadowed : 'a class -> bool
    val remountFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val shadow : 'a class -> unit
    val unmountFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val unmountWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val unshadow : 'a class -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val preUnmountSig : (unit -> unit) -> 'a class Signal.t
    val unmountedSig : (unit -> unit) -> 'a class Signal.t
  end
