signature GTK_CELL_LAYOUT =
  sig
    type 'a class
    type 'a cell_area_class
    type 'a cell_renderer_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addAttribute :
      'a class
       -> 'b cell_renderer_class
       -> string
       -> LargeInt.int
       -> unit
    val clear : 'a class -> unit
    val clearAttributes :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val getArea : 'a class -> base cell_area_class
    val packEnd :
      'a class
       -> 'b cell_renderer_class
       -> bool
       -> unit
    val packStart :
      'a class
       -> 'b cell_renderer_class
       -> bool
       -> unit
    val reorder :
      'a class
       -> 'b cell_renderer_class
       -> LargeInt.int
       -> unit
  end
