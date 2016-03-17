signature GDK_DEVICE_MANAGER =
  sig
    type 'a class
    type 'a device_class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getClientPointer : 'a class -> base device_class
    val getDisplay : 'a class -> base display_class
    val deviceAddedSig : (base device_class -> unit) -> 'a class Signal.signal
    val deviceChangedSig : (base device_class -> unit) -> 'a class Signal.signal
    val deviceRemovedSig : (base device_class -> unit) -> 'a class Signal.signal
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
  end
