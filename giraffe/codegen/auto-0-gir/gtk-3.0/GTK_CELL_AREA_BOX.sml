signature GTK_CELL_AREA_BOX =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_layout_class_t
    type 'a orientable_class_t
    type 'a cell_renderer_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getSpacing : 'a class_t -> LargeInt.int
    val packEnd :
      'a class_t
       -> 'b cell_renderer_class_t
       -> bool
       -> bool
       -> bool
       -> unit
    val packStart :
      'a class_t
       -> 'b cell_renderer_class_t
       -> bool
       -> bool
       -> bool
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val spacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
