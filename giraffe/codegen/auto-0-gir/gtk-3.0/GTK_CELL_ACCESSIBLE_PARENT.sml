signature GTK_CELL_ACCESSIBLE_PARENT =
  sig
    type 'a class
    type cell_renderer_state_t
    type 'a cell_accessible_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val activate :
      'a class
       -> 'b cell_accessible_class
       -> unit
    val edit :
      'a class
       -> 'b cell_accessible_class
       -> unit
    val expandCollapse :
      'a class
       -> 'b cell_accessible_class
       -> unit
    val getCellArea :
      'a class
       -> 'b cell_accessible_class * Gdk.RectangleRecord.t
       -> unit
    val getChildIndex :
      'a class
       -> 'b cell_accessible_class
       -> LargeInt.int
    val getRendererState :
      'a class
       -> 'b cell_accessible_class
       -> cell_renderer_state_t
    val grabFocus :
      'a class
       -> 'b cell_accessible_class
       -> bool
    val updateRelationset :
      'a class
       -> 'b cell_accessible_class * 'c Atk.RelationSetClass.class
       -> unit
  end
