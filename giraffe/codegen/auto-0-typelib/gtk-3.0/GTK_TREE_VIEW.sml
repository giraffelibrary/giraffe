signature GTK_TREE_VIEW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a scrollable_class
    type target_entry_t
    type 'a tree_selection_class
    type tree_view_drop_position_t
    type 'a entry_class
    type 'a cell_renderer_class
    type 'a tooltip_class
    type 'a adjustment_class
    type movement_step_t
    type tree_path_t
    type tree_iter_t
    type tree_view_grid_lines_t
    type 'a tree_view_column_class
    type 'a tree_model_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithModel : 'a tree_model_class -> base class
    val appendColumn :
      'a class
       -> 'b tree_view_column_class
       -> LargeInt.int
    val collapseAll : 'a class -> unit
    val collapseRow :
      'a class
       -> tree_path_t
       -> bool
    val columnsAutosize : 'a class -> unit
    val convertBinWindowToTreeCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertBinWindowToWidgetCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertTreeToBinWindowCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertTreeToWidgetCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertWidgetToBinWindowCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertWidgetToTreeCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val createRowDragIcon :
      'a class
       -> tree_path_t
       -> Cairo.SurfaceRecord.t
    val enableModelDragDest :
      'a class
       -> target_entry_t vector * Gdk.DragAction.t
       -> unit
    val enableModelDragSource :
      'a class
       -> Gdk.ModifierType.t
           * target_entry_t vector
           * Gdk.DragAction.t
       -> unit
    val expandAll : 'a class -> unit
    val expandRow :
      'a class
       -> tree_path_t * bool
       -> bool
    val expandToPath :
      'a class
       -> tree_path_t
       -> unit
    val getActivateOnSingleClick : 'a class -> bool
    val getBackgroundArea :
      'a class
       -> tree_path_t option * 'b tree_view_column_class option
       -> Gdk.RectangleRecord.t
    val getBinWindow : 'a class -> base Gdk.WindowClass.class option
    val getCellArea :
      'a class
       -> tree_path_t option * 'b tree_view_column_class option
       -> Gdk.RectangleRecord.t
    val getColumn :
      'a class
       -> LargeInt.int
       -> base tree_view_column_class option
    val getCursor : 'a class -> tree_path_t * base tree_view_column_class
    val getDestRowAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (tree_path_t * tree_view_drop_position_t) option
    val getDragDestRow : 'a class -> tree_path_t * tree_view_drop_position_t
    val getEnableSearch : 'a class -> bool
    val getEnableTreeLines : 'a class -> bool
    val getExpanderColumn : 'a class -> base tree_view_column_class
    val getFixedHeightMode : 'a class -> bool
    val getGridLines : 'a class -> tree_view_grid_lines_t
    val getHadjustment : 'a class -> base adjustment_class
    val getHeadersClickable : 'a class -> bool
    val getHeadersVisible : 'a class -> bool
    val getHoverExpand : 'a class -> bool
    val getHoverSelection : 'a class -> bool
    val getLevelIndentation : 'a class -> LargeInt.int
    val getModel : 'a class -> base tree_model_class option
    val getNColumns : 'a class -> LargeInt.int
    val getPathAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (tree_path_t
            * base tree_view_column_class
            * LargeInt.int
            * LargeInt.int)
            option
    val getReorderable : 'a class -> bool
    val getRubberBanding : 'a class -> bool
    val getRulesHint : 'a class -> bool
    val getSearchColumn : 'a class -> LargeInt.int
    val getSearchEntry : 'a class -> base entry_class
    val getSelection : 'a class -> base tree_selection_class
    val getShowExpanders : 'a class -> bool
    val getTooltipColumn : 'a class -> LargeInt.int
    val getTooltipContext :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * bool
       -> (base tree_model_class
            * tree_path_t
            * tree_iter_t)
            option
           * LargeInt.int
           * LargeInt.int
    val getVadjustment : 'a class -> base adjustment_class
    val getVisibleRange : 'a class -> (tree_path_t * tree_path_t) option
    val getVisibleRect : 'a class -> Gdk.RectangleRecord.t
    val insertColumn :
      'a class
       -> 'b tree_view_column_class * LargeInt.int
       -> LargeInt.int
    val isBlankAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (tree_path_t
            * base tree_view_column_class
            * LargeInt.int
            * LargeInt.int)
            option
    val isRubberBandingActive : 'a class -> bool
    val moveColumnAfter :
      'a class
       -> 'b tree_view_column_class * 'c tree_view_column_class option
       -> unit
    val removeColumn :
      'a class
       -> 'b tree_view_column_class
       -> LargeInt.int
    val rowActivated :
      'a class
       -> tree_path_t * 'b tree_view_column_class
       -> unit
    val rowExpanded :
      'a class
       -> tree_path_t
       -> bool
    val scrollToCell :
      'a class
       -> tree_path_t option
           * 'b tree_view_column_class option
           * bool
           * real
           * real
       -> unit
    val scrollToPoint :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setActivateOnSingleClick :
      'a class
       -> bool
       -> unit
    val setCursor :
      'a class
       -> tree_path_t
           * 'b tree_view_column_class option
           * bool
       -> unit
    val setCursorOnCell :
      'a class
       -> tree_path_t
           * 'b tree_view_column_class option
           * 'c cell_renderer_class option
           * bool
       -> unit
    val setDragDestRow :
      'a class
       -> tree_path_t option * tree_view_drop_position_t
       -> unit
    val setEnableSearch :
      'a class
       -> bool
       -> unit
    val setEnableTreeLines :
      'a class
       -> bool
       -> unit
    val setExpanderColumn :
      'a class
       -> 'b tree_view_column_class
       -> unit
    val setFixedHeightMode :
      'a class
       -> bool
       -> unit
    val setGridLines :
      'a class
       -> tree_view_grid_lines_t
       -> unit
    val setHadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val setHeadersClickable :
      'a class
       -> bool
       -> unit
    val setHeadersVisible :
      'a class
       -> bool
       -> unit
    val setHoverExpand :
      'a class
       -> bool
       -> unit
    val setHoverSelection :
      'a class
       -> bool
       -> unit
    val setLevelIndentation :
      'a class
       -> LargeInt.int
       -> unit
    val setModel :
      'a class
       -> 'b tree_model_class option
       -> unit
    val setReorderable :
      'a class
       -> bool
       -> unit
    val setRubberBanding :
      'a class
       -> bool
       -> unit
    val setRulesHint :
      'a class
       -> bool
       -> unit
    val setSearchColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setSearchEntry :
      'a class
       -> 'b entry_class option
       -> unit
    val setShowExpanders :
      'a class
       -> bool
       -> unit
    val setTooltipCell :
      'a class
       -> 'b tooltip_class
           * tree_path_t option
           * 'c tree_view_column_class option
           * 'd cell_renderer_class option
       -> unit
    val setTooltipColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setTooltipRow :
      'a class
       -> 'b tooltip_class * tree_path_t
       -> unit
    val setVadjustment :
      'a class
       -> 'b adjustment_class option
       -> unit
    val unsetRowsDragDest : 'a class -> unit
    val unsetRowsDragSource : 'a class -> unit
    val columnsChangedSig : (unit -> unit) -> 'a class Signal.t
    val cursorChangedSig : (unit -> unit) -> 'a class Signal.t
    val expandCollapseCursorRowSig :
      (bool
        * bool
        * bool
        -> bool)
       -> 'a class Signal.t
    val moveCursorSig : (movement_step_t * LargeInt.int -> bool) -> 'a class Signal.t
    val rowActivatedSig : (tree_path_t * base tree_view_column_class -> unit) -> 'a class Signal.t
    val rowCollapsedSig : (tree_iter_t * tree_path_t -> unit) -> 'a class Signal.t
    val rowExpandedSig : (tree_iter_t * tree_path_t -> unit) -> 'a class Signal.t
    val selectAllSig : (unit -> bool) -> 'a class Signal.t
    val selectCursorParentSig : (unit -> bool) -> 'a class Signal.t
    val selectCursorRowSig : (bool -> bool) -> 'a class Signal.t
    val startInteractiveSearchSig : (unit -> bool) -> 'a class Signal.t
    val testCollapseRowSig : (tree_iter_t * tree_path_t -> bool) -> 'a class Signal.t
    val testExpandRowSig : (tree_iter_t * tree_path_t -> bool) -> 'a class Signal.t
    val toggleCursorRowSig : (unit -> bool) -> 'a class Signal.t
    val unselectAllSig : (unit -> bool) -> 'a class Signal.t
    val activateOnSingleClickProp : ('a class, bool, bool) Property.readwrite
    val enableGridLinesProp : ('a class, tree_view_grid_lines_t, tree_view_grid_lines_t) Property.readwrite
    val enableSearchProp : ('a class, bool, bool) Property.readwrite
    val enableTreeLinesProp : ('a class, bool, bool) Property.readwrite
    val expanderColumnProp : ('a class, base tree_view_column_class option, 'b tree_view_column_class option) Property.readwrite
    val fixedHeightModeProp : ('a class, bool, bool) Property.readwrite
    val headersClickableProp : ('a class, bool, bool) Property.readwrite
    val headersVisibleProp : ('a class, bool, bool) Property.readwrite
    val hoverExpandProp : ('a class, bool, bool) Property.readwrite
    val hoverSelectionProp : ('a class, bool, bool) Property.readwrite
    val levelIndentationProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
    val reorderableProp : ('a class, bool, bool) Property.readwrite
    val rubberBandingProp : ('a class, bool, bool) Property.readwrite
    val rulesHintProp : ('a class, bool, bool) Property.readwrite
    val searchColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val showExpandersProp : ('a class, bool, bool) Property.readwrite
    val tooltipColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
