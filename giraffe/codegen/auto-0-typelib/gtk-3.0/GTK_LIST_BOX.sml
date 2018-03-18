signature GTK_LIST_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a adjustment_class
    type 'a widget_class
    type movement_step_t
    type 'a list_box_row_class
    type selection_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val dragHighlightRow :
      'a class
       -> 'b list_box_row_class
       -> unit
    val dragUnhighlightRow : 'a class -> unit
    val getActivateOnSingleClick : 'a class -> bool
    val getAdjustment : 'a class -> base adjustment_class
    val getRowAtIndex :
      'a class
       -> LargeInt.int
       -> base list_box_row_class option
    val getRowAtY :
      'a class
       -> LargeInt.int
       -> base list_box_row_class option
    val getSelectedRow : 'a class -> base list_box_row_class
    val getSelectionMode : 'a class -> selection_mode_t
    val insert :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val invalidateFilter : 'a class -> unit
    val invalidateHeaders : 'a class -> unit
    val invalidateSort : 'a class -> unit
    val prepend :
      'a class
       -> 'b widget_class
       -> unit
    val selectAll : 'a class -> unit
    val selectRow :
      'a class
       -> 'b list_box_row_class option
       -> unit
    val setActivateOnSingleClick :
      'a class
       -> bool
       -> unit
    val setAdjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setPlaceholder :
      'a class
       -> 'b widget_class option
       -> unit
    val setSelectionMode :
      'a class
       -> selection_mode_t
       -> unit
    val unselectAll : 'a class -> unit
    val unselectRow :
      'a class
       -> 'b list_box_row_class
       -> unit
    val activateCursorRowSig : (unit -> unit) -> 'a class Signal.t
    val moveCursorSig : (movement_step_t * LargeInt.int -> unit) -> 'a class Signal.t
    val rowActivatedSig : (base list_box_row_class -> unit) -> 'a class Signal.t
    val rowSelectedSig : (base list_box_row_class option -> unit) -> 'a class Signal.t
    val selectAllSig : (unit -> unit) -> 'a class Signal.t
    val selectedRowsChangedSig : (unit -> unit) -> 'a class Signal.t
    val toggleCursorRowSig : (unit -> unit) -> 'a class Signal.t
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
