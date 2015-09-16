signature GTK_CELL_RENDERER_PROGRESS =
  sig
    type 'a class_t
    type 'a orientable_class_t
    type t = base class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val invertedProp : ('a class_t, bool, bool) Property.readwrite
    val pulseProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val textProp : ('a class_t, string option, string option) Property.readwrite
    val textXalignProp : ('a class_t, real, real) Property.readwrite
    val textYalignProp : ('a class_t, real, real) Property.readwrite
    val valueProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
