signature GDK_DEVICE_MANAGER =
  sig
    type 'a class_t
    type 'a device_class_t
    type 'a display_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getClientPointer : 'a class_t -> base device_class_t
    val getDisplay : 'a class_t -> base display_class_t
    val deviceAddedSig : (base device_class_t -> unit) -> 'a class_t Signal.signal
    val deviceChangedSig : (base device_class_t -> unit) -> 'a class_t Signal.signal
    val deviceRemovedSig : (base device_class_t -> unit) -> 'a class_t Signal.signal
    val displayProp : ('a class_t, base display_class_t option, 'b display_class_t option) Property.readwrite
  end
