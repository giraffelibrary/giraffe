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
    val accelKeyProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val accelModeProp :
      {
        get : 'a class -> cell_renderer_accel_mode_t,
        set :
          cell_renderer_accel_mode_t
           -> 'a class
           -> unit,
        new : cell_renderer_accel_mode_t -> 'a class Property.t
      }
    val accelModsProp :
      {
        get : 'a class -> Gdk.ModifierType.t,
        set :
          Gdk.ModifierType.t
           -> 'a class
           -> unit,
        new : Gdk.ModifierType.t -> 'a class Property.t
      }
    val keycodeProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
