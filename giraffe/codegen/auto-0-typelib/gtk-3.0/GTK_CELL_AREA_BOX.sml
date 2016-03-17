signature GTK_CELL_AREA_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type 'a orientable_class
    type 'a cell_renderer_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getSpacing : 'a class -> LargeInt.int
    val packEnd :
      'a class
       -> 'b cell_renderer_class
       -> bool
       -> bool
       -> bool
       -> unit
    val packStart :
      'a class
       -> 'b cell_renderer_class
       -> bool
       -> bool
       -> bool
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
