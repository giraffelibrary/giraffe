signature GDK_DEVICE_MANAGER =
  sig
    type 'a class_t
    type 'a deviceclass_t
    type 'a displayclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getClientPointer : 'a class_t -> base deviceclass_t
    val getDisplay : 'a class_t -> base displayclass_t
    val deviceAddedSig : (base deviceclass_t -> unit) -> 'a class_t Signal.signal
    val deviceChangedSig : (base deviceclass_t -> unit) -> 'a class_t Signal.signal
    val deviceRemovedSig : (base deviceclass_t -> unit) -> 'a class_t Signal.signal
    val displayProp : ('a class_t, base displayclass_t option, 'b displayclass_t option) Property.readwrite
  end
