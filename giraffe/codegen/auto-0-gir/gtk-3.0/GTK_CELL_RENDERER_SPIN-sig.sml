signature GTK_CELL_RENDERER_SPIN =
  sig
    type 'a class
    type 'a adjustment_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val adjustmentProp :
      {
        get : 'a class -> base adjustment_class option,
        set :
          'b adjustment_class option
           -> 'a class
           -> unit,
        new : 'b adjustment_class option -> 'a class Property.t
      }
    val climbRateProp :
      {
        get : 'a class -> real,
        set :
          real
           -> 'a class
           -> unit,
        new : real -> 'a class Property.t
      }
    val digitsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
