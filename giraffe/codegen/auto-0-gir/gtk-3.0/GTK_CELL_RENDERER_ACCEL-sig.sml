signature GTK_CELL_RENDERER_ACCEL =
  sig
    type 'a class
    type cell_renderer_accel_mode_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val accelClearedSig : (string -> unit) -> 'a class Signal.t
    val accelEditedSig :
      (string
        * LargeInt.int
        * Gdk.ModifierType.t
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
    val accelKeyProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val accelModeProp : ('a class, unit -> cell_renderer_accel_mode_t, cell_renderer_accel_mode_t -> unit, cell_renderer_accel_mode_t -> unit) Property.t
    val accelModsProp : ('a class, unit -> Gdk.ModifierType.t, Gdk.ModifierType.t -> unit, Gdk.ModifierType.t -> unit) Property.t
    val keycodeProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
