signature GDK_DEVICE_MANAGER =
  sig
    type 'a class
    type 'a device_class
    type 'a display_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getClientPointer : 'a class -> base device_class
    val getDisplay : 'a class -> base display_class option
    val deviceAddedSig : (base device_class -> unit) -> 'a class Signal.t
    val deviceChangedSig : (base device_class -> unit) -> 'a class Signal.t
    val deviceRemovedSig : (base device_class -> unit) -> 'a class Signal.t
    val displayProp : ('a class, base display_class option, 'b display_class option) Property.readwrite
  end
