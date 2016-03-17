signature GTK_CELL_RENDERER_PROGRESS =
  sig
    type 'a class
    type 'a orientable_class
    type t = base class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val invertedProp : ('a class, bool, bool) Property.readwrite
    val pulseProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val textProp : ('a class, string option, string option) Property.readwrite
    val textXalignProp : ('a class, real, real) Property.readwrite
    val textYalignProp : ('a class, real, real) Property.readwrite
    val valueProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
