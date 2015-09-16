signature GTK_CELL_RENDERER_ACCEL =
  sig
    type 'a class_t
    type cell_renderer_accel_mode_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val accelClearedSig : (string -> unit) -> 'a class_t Signal.signal
    val accelEditedSig :
      (string
        -> LargeInt.int
        -> Gdk.ModifierType.t
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val accelKeyProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val accelModeProp : ('a class_t, cell_renderer_accel_mode_t, cell_renderer_accel_mode_t) Property.readwrite
    val accelModsProp : ('a class_t, Gdk.ModifierType.t, Gdk.ModifierType.t) Property.readwrite
    val keycodeProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
