signature GTK_CELL_RENDERER_SPINNER =
  sig
    type 'a class_t
    type icon_size_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val activeProp : ('a class_t, bool, bool) Property.readwrite
    val pulseProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val sizeProp : ('a class_t, icon_size_t, icon_size_t) Property.readwrite
  end
