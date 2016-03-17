signature GTK_CELL_RENDERER_SPINNER =
  sig
    type 'a class
    type icon_size_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val activeProp : ('a class, bool, bool) Property.readwrite
    val pulseProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val sizeProp : ('a class, icon_size_t, icon_size_t) Property.readwrite
  end
