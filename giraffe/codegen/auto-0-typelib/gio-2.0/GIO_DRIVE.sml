signature GIO_DRIVE =
  sig
    type 'a class
    type 'a icon_class
    type drive_start_stop_type_t
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val canEject : 'a class -> bool
    val canPollForMedia : 'a class -> bool
    val canStart : 'a class -> bool
    val canStartDegraded : 'a class -> bool
    val canStop : 'a class -> bool
    val ejectFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val ejectWithOperationFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val enumerateIdentifiers : 'a class -> string list
    val getIcon : 'a class -> base icon_class
    val getIdentifier :
      'a class
       -> string
       -> string
    val getName : 'a class -> string
    val getStartStopType : 'a class -> drive_start_stop_type_t
    val hasMedia : 'a class -> bool
    val hasVolumes : 'a class -> bool
    val isMediaCheckAutomatic : 'a class -> bool
    val isMediaRemovable : 'a class -> bool
    val pollForMediaFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val startFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val stopFinish :
      'a class
       -> 'b async_result_class
       -> unit
    val changedSig : (unit -> unit) -> 'a class Signal.t
    val disconnectedSig : (unit -> unit) -> 'a class Signal.t
    val ejectButtonSig : (unit -> unit) -> 'a class Signal.t
    val stopButtonSig : (unit -> unit) -> 'a class Signal.t
  end
