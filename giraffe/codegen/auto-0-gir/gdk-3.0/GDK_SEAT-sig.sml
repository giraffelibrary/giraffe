signature GDK_SEAT =
  sig
    type 'a class
    type seat_capabilities_t
    type 'a device_class
    type 'a device_tool_class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getCapabilities : 'a class -> seat_capabilities_t
    val getDisplay : 'a class -> base display_class
    val getKeyboard : 'a class -> base device_class option
    val getPointer : 'a class -> base device_class option
    val ungrab : 'a class -> unit
    val deviceAddedSig : (base device_class -> unit) -> 'a class Signal.t
    val deviceRemovedSig : (base device_class -> unit) -> 'a class Signal.t
    val toolAddedSig : (base device_tool_class -> unit) -> 'a class Signal.t
    val toolRemovedSig : (base device_tool_class -> unit) -> 'a class Signal.t
    val displayProp : ('a class, unit -> base display_class option, unit, 'b display_class option -> unit) Property.t
  end
