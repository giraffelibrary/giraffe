signature GTK_CELL_LAYOUT =
  sig
    type 'a class_t
    type 'a cellrendererclass_t
    type 'a cellareaclass_t
    val getType : unit -> GObject.Type.t
    val addAttribute :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> LargeInt.int
       -> unit
    val clear : 'a class_t -> unit
    val clearAttributes :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val getArea : 'a class_t -> base cellareaclass_t
    val packEnd :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
       -> unit
    val packStart :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
       -> unit
    val reorder :
      'a class_t
       -> 'b cellrendererclass_t
       -> LargeInt.int
       -> unit
  end
