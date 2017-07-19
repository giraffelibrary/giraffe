signature GTK_CELL_RENDERER_ACCEL =
  sig
    type 'a class
    type cell_renderer_accel_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val accelClearedSig : (string -> unit) -> 'a class Signal.signal
    val accelEditedSig :
      (string
        * LargeInt.int
        * Gdk.ModifierType.t
        * LargeInt.int
        -> unit)
       -> 'a class Signal.signal
    val accelKeyProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val accelModeProp : ('a class, cell_renderer_accel_mode_t, cell_renderer_accel_mode_t) Property.readwrite
    val accelModsProp : ('a class, Gdk.ModifierType.t, Gdk.ModifierType.t) Property.readwrite
    val keycodeProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
