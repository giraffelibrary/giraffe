signature GTK_CELL_RENDERER_SPIN =
  sig
    type 'a class
    type 'a adjustment_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val adjustmentProp : ('a class, unit -> base adjustment_class option, 'b adjustment_class option -> unit, 'b adjustment_class option -> unit) Property.t
    val climbRateProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val digitsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
