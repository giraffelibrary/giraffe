signature GTK_CELL_RENDERER_SPIN =
  sig
    type 'a class
    type 'a adjustment_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val adjustmentProp : ('a class, base adjustment_class option, 'b adjustment_class option) Property.readwrite
    val climbRateProp : ('a class, real, real) Property.readwrite
    val digitsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
