signature GIO_VOLUME =
  sig
    type 'a class
    type 'a file_class
    type 'a drive_class
    type 'a icon_class
    type 'a mount_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canEject : 'a class -> bool
    val canMount : 'a class -> bool
    val ejectWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> bool
    val enumerateIdentifiers : 'a class -> string list
    val getActivationRoot : 'a class -> base file_class
    val getDrive : 'a class -> base drive_class
    val getIcon : 'a class -> base icon_class
    val getIdentifier :
      'a class
       -> string
       -> string
    val getMount : 'a class -> base mount_class
    val getName : 'a class -> string
    val getUuid : 'a class -> string
    val mountFinish :
      'a class
       -> 'b async_result_class
       -> bool
    val shouldAutomount : 'a class -> bool
    val changedSig : (unit -> unit) -> 'a class Signal.signal
    val removedSig : (unit -> unit) -> 'a class Signal.signal
  end
