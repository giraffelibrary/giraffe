signature GTK_CELL_RENDERER_SPIN =
  sig
    type 'a class_t
    type 'a adjustmentclass_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val adjustmentProp : ('a class_t, base adjustmentclass_t option, 'b adjustmentclass_t option) Property.readwrite
    val climbRateProp : ('a class_t, real, real) Property.readwrite
    val digitsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
