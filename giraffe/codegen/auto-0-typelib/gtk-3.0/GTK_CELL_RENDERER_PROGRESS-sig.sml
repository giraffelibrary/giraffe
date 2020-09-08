signature GTK_CELL_RENDERER_PROGRESS =
  sig
    type 'a class
    type 'a orientable_class
    type t = base class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val invertedProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pulseProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val textProp : ('a class, unit -> string option, string option -> unit, string option -> unit) Property.t
    val textXalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val textYalignProp : ('a class, unit -> real, real -> unit, real -> unit) Property.t
    val valueProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
