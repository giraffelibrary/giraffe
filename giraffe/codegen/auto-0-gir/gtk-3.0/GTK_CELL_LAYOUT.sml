signature GTK_CELL_LAYOUT =
  sig
    type 'a class_t
    type 'a cell_area_class_t
    type 'a cell_renderer_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val addAttribute :
      'a class_t
       -> 'b cell_renderer_class_t
       -> string
       -> LargeInt.int
       -> unit
    val clear : 'a class_t -> unit
    val clearAttributes :
      'a class_t
       -> 'b cell_renderer_class_t
       -> unit
    val getArea : 'a class_t -> base cell_area_class_t
    val packEnd :
      'a class_t
       -> 'b cell_renderer_class_t
       -> bool
       -> unit
    val packStart :
      'a class_t
       -> 'b cell_renderer_class_t
       -> bool
       -> unit
    val reorder :
      'a class_t
       -> 'b cell_renderer_class_t
       -> LargeInt.int
       -> unit
  end
