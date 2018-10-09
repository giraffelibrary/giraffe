signature GTK_FLOW_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type 'a widget_class
    type 'a adjustment_class
    type 'a flow_box_child_class
    type movement_step_t
    type selection_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getActivateOnSingleClick : 'a class -> bool
    val getChildAtIndex :
      'a class
       -> LargeInt.int
       -> base flow_box_child_class option
    val getChildAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base flow_box_child_class option
    val getColumnSpacing : 'a class -> LargeInt.int
    val getHomogeneous : 'a class -> bool
    val getMaxChildrenPerLine : 'a class -> LargeInt.int
    val getMinChildrenPerLine : 'a class -> LargeInt.int
    val getRowSpacing : 'a class -> LargeInt.int
    val getSelectionMode : 'a class -> selection_mode_t
    val insert :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val invalidateFilter : 'a class -> unit
    val invalidateSort : 'a class -> unit
    val selectAll : 'a class -> unit
    val selectChild :
      'a class
       -> 'b flow_box_child_class
       -> unit
    val setActivateOnSingleClick :
      'a class
       -> bool
       -> unit
    val setColumnSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setHadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val setHomogeneous :
      'a class
       -> bool
       -> unit
    val setMaxChildrenPerLine :
      'a class
       -> LargeInt.int
       -> unit
    val setMinChildrenPerLine :
      'a class
       -> LargeInt.int
       -> unit
    val setRowSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setSelectionMode :
      'a class
       -> selection_mode_t
       -> unit
    val setVadjustment :
      'a class
       -> 'b adjustment_class
       -> unit
    val unselectAll : 'a class -> unit
    val unselectChild :
      'a class
       -> 'b flow_box_child_class
       -> unit
    val activateCursorChildSig : (unit -> unit) -> 'a class Signal.t
    val childActivatedSig : (base flow_box_child_class -> unit) -> 'a class Signal.t
    val moveCursorSig : (movement_step_t * LargeInt.int -> bool) -> 'a class Signal.t
    val selectAllSig : (unit -> unit) -> 'a class Signal.t
    val selectedChildrenChangedSig : (unit -> unit) -> 'a class Signal.t
    val toggleCursorChildSig : (unit -> unit) -> 'a class Signal.t
    val unselectAllSig : (unit -> unit) -> 'a class Signal.t
    val activateOnSingleClickProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val columnSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val homogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val maxChildrenPerLineProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val minChildrenPerLineProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rowSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val selectionModeProp :
      {
        get : 'a class -> selection_mode_t,
        set :
          selection_mode_t
           -> 'a class
           -> unit,
        new : selection_mode_t -> 'a class Property.t
      }
  end
