signature GTK_CELL_AREA_BOX =
  sig
    type 'a class_t
    type 'a cellrendererclass_t
    type 'a orientableclass_t
    type 'a celllayoutclass_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val asOrientable : 'a class_t -> base orientableclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val getSpacing : 'a class_t -> LargeInt.int
    val packEnd :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
       -> bool
       -> bool
       -> unit
    val packStart :
      'a class_t
       -> 'b cellrendererclass_t
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
