signature GTK_TREE_VIEW =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a scrollable_class_t
    type 'a tree_selection_class_t
    type tree_view_drop_position_t
    type 'a entry_class_t
    type 'a cell_renderer_class_t
    type 'a tooltip_class_t
    type movement_step_t
    type tree_path_record_t
    type tree_iter_record_t
    type tree_view_grid_lines_t
    type 'a tree_view_column_class_t
    type 'a tree_model_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asScrollable : 'a class_t -> base scrollable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithModel : 'a tree_model_class_t -> base class_t
    val appendColumn :
      'a class_t
       -> 'b tree_view_column_class_t
       -> LargeInt.int
    val collapseAll : 'a class_t -> unit
    val collapseRow :
      'a class_t
       -> tree_path_record_t
       -> bool
    val columnsAutosize : 'a class_t -> unit
    val convertBinWindowToTreeCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertBinWindowToWidgetCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertTreeToBinWindowCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertTreeToWidgetCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertWidgetToBinWindowCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val convertWidgetToTreeCoords :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val createRowDragIcon :
      'a class_t
       -> tree_path_record_t
       -> Cairo.SurfaceRecord.t
    val expandAll : 'a class_t -> unit
    val expandRow :
      'a class_t
       -> tree_path_record_t
       -> bool
       -> bool
    val expandToPath :
      'a class_t
       -> tree_path_record_t
       -> unit
    val getBackgroundArea :
      'a class_t
       -> tree_path_record_t option
       -> 'b tree_view_column_class_t option
       -> Cairo.RectangleIntRecord.t
    val getBinWindow : 'a class_t -> base Gdk.WindowClass.t
    val getCellArea :
      'a class_t
       -> tree_path_record_t option
       -> 'b tree_view_column_class_t option
       -> Cairo.RectangleIntRecord.t
    val getColumn :
      'a class_t
       -> LargeInt.int
       -> base tree_view_column_class_t
    val getCursor : 'a class_t -> tree_path_record_t * base tree_view_column_class_t
    val getDestRowAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (tree_path_record_t * tree_view_drop_position_t) option
    val getDragDestRow : 'a class_t -> tree_path_record_t * tree_view_drop_position_t
    val getEnableSearch : 'a class_t -> bool
    val getEnableTreeLines : 'a class_t -> bool
    val getExpanderColumn : 'a class_t -> base tree_view_column_class_t
    val getFixedHeightMode : 'a class_t -> bool
    val getGridLines : 'a class_t -> tree_view_grid_lines_t
    val getHeadersClickable : 'a class_t -> bool
    val getHeadersVisible : 'a class_t -> bool
    val getHoverExpand : 'a class_t -> bool
    val getHoverSelection : 'a class_t -> bool
    val getLevelIndentation : 'a class_t -> LargeInt.int
    val getModel : 'a class_t -> base tree_model_class_t
    val getPathAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (tree_path_record_t
            * base tree_view_column_class_t
            * LargeInt.int
            * LargeInt.int)
            option
    val getReorderable : 'a class_t -> bool
    val getRubberBanding : 'a class_t -> bool
    val getRulesHint : 'a class_t -> bool
    val getSearchColumn : 'a class_t -> LargeInt.int
    val getSearchEntry : 'a class_t -> base entry_class_t
    val getSelection : 'a class_t -> base tree_selection_class_t
    val getShowExpanders : 'a class_t -> bool
    val getTooltipColumn : 'a class_t -> LargeInt.int
    val getTooltipContext :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
       -> (base tree_model_class_t
            * tree_path_record_t
            * tree_iter_record_t)
            option
           * LargeInt.int
           * LargeInt.int
    val getVisibleRange : 'a class_t -> (tree_path_record_t * tree_path_record_t) option
    val getVisibleRect : 'a class_t -> Cairo.RectangleIntRecord.t
    val insertColumn :
      'a class_t
       -> 'b tree_view_column_class_t
       -> LargeInt.int
       -> LargeInt.int
    val isBlankAtPos :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> (tree_path_record_t
            * base tree_view_column_class_t
            * LargeInt.int
            * LargeInt.int)
            option
    val isRubberBandingActive : 'a class_t -> bool
    val moveColumnAfter :
      'a class_t
       -> 'b tree_view_column_class_t
       -> 'c tree_view_column_class_t option
       -> unit
    val removeColumn :
      'a class_t
       -> 'b tree_view_column_class_t
       -> LargeInt.int
    val rowActivated :
      'a class_t
       -> tree_path_record_t
       -> 'b tree_view_column_class_t
       -> unit
    val rowExpanded :
      'a class_t
       -> tree_path_record_t
       -> bool
    val scrollToCell :
      'a class_t
       -> tree_path_record_t option
       -> 'b tree_view_column_class_t option
       -> bool
       -> real
       -> real
       -> unit
    val scrollToPoint :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setCursor :
      'a class_t
       -> tree_path_record_t
       -> 'b tree_view_column_class_t option
       -> bool
       -> unit
    val setCursorOnCell :
      'a class_t
       -> tree_path_record_t
       -> 'b tree_view_column_class_t option
       -> 'c cell_renderer_class_t option
       -> bool
       -> unit
    val setDragDestRow :
      'a class_t
       -> tree_path_record_t option
       -> tree_view_drop_position_t
       -> unit
    val setEnableSearch :
      'a class_t
       -> bool
       -> unit
    val setEnableTreeLines :
      'a class_t
       -> bool
       -> unit
    val setExpanderColumn :
      'a class_t
       -> 'b tree_view_column_class_t
       -> unit
    val setFixedHeightMode :
      'a class_t
       -> bool
       -> unit
    val setGridLines :
      'a class_t
       -> tree_view_grid_lines_t
       -> unit
    val setHeadersClickable :
      'a class_t
       -> bool
       -> unit
    val setHeadersVisible :
      'a class_t
       -> bool
       -> unit
    val setHoverExpand :
      'a class_t
       -> bool
       -> unit
    val setHoverSelection :
      'a class_t
       -> bool
       -> unit
    val setLevelIndentation :
      'a class_t
       -> LargeInt.int
       -> unit
    val setModel :
      'a class_t
       -> 'b tree_model_class_t option
       -> unit
    val setReorderable :
      'a class_t
       -> bool
       -> unit
    val setRubberBanding :
      'a class_t
       -> bool
       -> unit
    val setRulesHint :
      'a class_t
       -> bool
       -> unit
    val setSearchColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSearchEntry :
      'a class_t
       -> 'b entry_class_t option
       -> unit
    val setShowExpanders :
      'a class_t
       -> bool
       -> unit
    val setTooltipCell :
      'a class_t
       -> 'b tooltip_class_t
       -> tree_path_record_t option
       -> 'c tree_view_column_class_t option
       -> 'd cell_renderer_class_t option
       -> unit
    val setTooltipColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTooltipRow :
      'a class_t
       -> 'b tooltip_class_t
       -> tree_path_record_t
       -> unit
    val unsetRowsDragDest : 'a class_t -> unit
    val unsetRowsDragSource : 'a class_t -> unit
    val columnsChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val cursorChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val expandCollapseCursorRowSig :
      (bool
        -> bool
        -> bool
        -> bool)
       -> 'a class_t Signal.signal
    val moveCursorSig :
      (movement_step_t
        -> LargeInt.int
        -> bool)
       -> 'a class_t Signal.signal
    val rowActivatedSig :
      (tree_path_record_t
        -> base tree_view_column_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowCollapsedSig :
      (tree_iter_record_t
        -> tree_path_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val rowExpandedSig :
      (tree_iter_record_t
        -> tree_path_record_t
        -> unit)
       -> 'a class_t Signal.signal
    val selectAllSig : (unit -> bool) -> 'a class_t Signal.signal
    val selectCursorParentSig : (unit -> bool) -> 'a class_t Signal.signal
    val selectCursorRowSig : (bool -> bool) -> 'a class_t Signal.signal
    val startInteractiveSearchSig : (unit -> bool) -> 'a class_t Signal.signal
    val testCollapseRowSig :
      (tree_iter_record_t
        -> tree_path_record_t
        -> bool)
       -> 'a class_t Signal.signal
    val testExpandRowSig :
      (tree_iter_record_t
        -> tree_path_record_t
        -> bool)
       -> 'a class_t Signal.signal
    val toggleCursorRowSig : (unit -> bool) -> 'a class_t Signal.signal
    val unselectAllSig : (unit -> bool) -> 'a class_t Signal.signal
    val enableGridLinesProp : ('a class_t, tree_view_grid_lines_t, tree_view_grid_lines_t) Property.readwrite
    val enableSearchProp : ('a class_t, bool, bool) Property.readwrite
    val enableTreeLinesProp : ('a class_t, bool, bool) Property.readwrite
    val expanderColumnProp : ('a class_t, base tree_view_column_class_t option, 'b tree_view_column_class_t option) Property.readwrite
    val fixedHeightModeProp : ('a class_t, bool, bool) Property.readwrite
    val headersClickableProp : ('a class_t, bool, bool) Property.readwrite
    val headersVisibleProp : ('a class_t, bool, bool) Property.readwrite
    val hoverExpandProp : ('a class_t, bool, bool) Property.readwrite
    val hoverSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val levelIndentationProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
    val reorderableProp : ('a class_t, bool, bool) Property.readwrite
    val rubberBandingProp : ('a class_t, bool, bool) Property.readwrite
    val rulesHintProp : ('a class_t, bool, bool) Property.readwrite
    val searchColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val showExpandersProp : ('a class_t, bool, bool) Property.readwrite
    val tooltipColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
