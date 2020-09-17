structure GtkTreeView :>
  GTK_TREE_VIEW
    where type 'a class = 'a GtkTreeViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    where type 'a tree_selection_class = 'a GtkTreeSelectionClass.class
    where type tree_view_drop_position_t = GtkTreeViewDropPosition.t
    where type 'a entry_class = 'a GtkEntryClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type movement_step_t = GtkMovementStep.t
    where type tree_path_t = GtkTreePathRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_view_grid_lines_t = GtkTreeViewGridLines.t
    where type 'a tree_view_column_class = 'a GtkTreeViewColumnClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_tree_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_tree_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithModel_ = call (getSymbol "gtk_tree_view_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val appendColumn_ = call (getSymbol "gtk_tree_view_append_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val collapseAll_ = call (getSymbol "gtk_tree_view_collapse_all") (GtkTreeViewClass.PolyML.cPtr --> cVoid)
      val collapseRow_ = call (getSymbol "gtk_tree_view_collapse_row") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val columnsAutosize_ = call (getSymbol "gtk_tree_view_columns_autosize") (GtkTreeViewClass.PolyML.cPtr --> cVoid)
      val convertBinWindowToTreeCoords_ =
        call (getSymbol "gtk_tree_view_convert_bin_window_to_tree_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val convertBinWindowToWidgetCoords_ =
        call (getSymbol "gtk_tree_view_convert_bin_window_to_widget_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val convertTreeToBinWindowCoords_ =
        call (getSymbol "gtk_tree_view_convert_tree_to_bin_window_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val convertTreeToWidgetCoords_ =
        call (getSymbol "gtk_tree_view_convert_tree_to_widget_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val convertWidgetToBinWindowCoords_ =
        call (getSymbol "gtk_tree_view_convert_widget_to_bin_window_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val convertWidgetToTreeCoords_ =
        call (getSymbol "gtk_tree_view_convert_widget_to_tree_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val createRowDragIcon_ = call (getSymbol "gtk_tree_view_create_row_drag_icon") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val enableModelDragDest_ =
        call (getSymbol "gtk_tree_view_enable_model_drag_dest")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val enableModelDragSource_ =
        call (getSymbol "gtk_tree_view_enable_model_drag_source")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GdkModifierType.PolyML.cVal
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val expandAll_ = call (getSymbol "gtk_tree_view_expand_all") (GtkTreeViewClass.PolyML.cPtr --> cVoid)
      val expandRow_ =
        call (getSymbol "gtk_tree_view_expand_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val expandToPath_ = call (getSymbol "gtk_tree_view_expand_to_path") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val getActivateOnSingleClick_ = call (getSymbol "gtk_tree_view_get_activate_on_single_click") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getBackgroundArea_ =
        call (getSymbol "gtk_tree_view_get_background_area")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getBinWindow_ = call (getSymbol "gtk_tree_view_get_bin_window") (GtkTreeViewClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val getCellArea_ =
        call (getSymbol "gtk_tree_view_get_cell_area")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getColumn_ = call (getSymbol "gtk_tree_view_get_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GtkTreeViewColumnClass.PolyML.cOptPtr)
      val getCursor_ =
        call (getSymbol "gtk_tree_view_get_cursor")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             --> cVoid
          )
      val getDestRowAtPos_ =
        call (getSymbol "gtk_tree_view_get_dest_row_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewDropPosition.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getDragDestRow_ =
        call (getSymbol "gtk_tree_view_get_drag_dest_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewDropPosition.PolyML.cRef
             --> cVoid
          )
      val getEnableSearch_ = call (getSymbol "gtk_tree_view_get_enable_search") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEnableTreeLines_ = call (getSymbol "gtk_tree_view_get_enable_tree_lines") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpanderColumn_ = call (getSymbol "gtk_tree_view_get_expander_column") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeViewColumnClass.PolyML.cPtr)
      val getFixedHeightMode_ = call (getSymbol "gtk_tree_view_get_fixed_height_mode") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGridLines_ = call (getSymbol "gtk_tree_view_get_grid_lines") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeViewGridLines.PolyML.cVal)
      val getHadjustment_ = call (getSymbol "gtk_tree_view_get_hadjustment") (GtkTreeViewClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getHeadersClickable_ = call (getSymbol "gtk_tree_view_get_headers_clickable") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHeadersVisible_ = call (getSymbol "gtk_tree_view_get_headers_visible") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHoverExpand_ = call (getSymbol "gtk_tree_view_get_hover_expand") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHoverSelection_ = call (getSymbol "gtk_tree_view_get_hover_selection") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLevelIndentation_ = call (getSymbol "gtk_tree_view_get_level_indentation") (GtkTreeViewClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getModel_ = call (getSymbol "gtk_tree_view_get_model") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cOptPtr)
      val getNColumns_ = call (getSymbol "gtk_tree_view_get_n_columns") (GtkTreeViewClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getPathAtPos_ =
        call (getSymbol "gtk_tree_view_get_path_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getReorderable_ = call (getSymbol "gtk_tree_view_get_reorderable") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRubberBanding_ = call (getSymbol "gtk_tree_view_get_rubber_banding") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRulesHint_ = call (getSymbol "gtk_tree_view_get_rules_hint") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSearchColumn_ = call (getSymbol "gtk_tree_view_get_search_column") (GtkTreeViewClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSearchEntry_ = call (getSymbol "gtk_tree_view_get_search_entry") (GtkTreeViewClass.PolyML.cPtr --> GtkEntryClass.PolyML.cPtr)
      val getSelection_ = call (getSymbol "gtk_tree_view_get_selection") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeSelectionClass.PolyML.cPtr)
      val getShowExpanders_ = call (getSymbol "gtk_tree_view_get_show_expanders") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTooltipColumn_ = call (getSymbol "gtk_tree_view_get_tooltip_column") (GtkTreeViewClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getTooltipContext_ =
        call (getSymbol "gtk_tree_view_get_tooltip_context")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GBool.PolyML.cVal
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getVadjustment_ = call (getSymbol "gtk_tree_view_get_vadjustment") (GtkTreeViewClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cPtr)
      val getVisibleRange_ =
        call (getSymbol "gtk_tree_view_get_visible_range")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getVisibleRect_ = call (getSymbol "gtk_tree_view_get_visible_rect") (GtkTreeViewClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val insertColumn_ =
        call (getSymbol "gtk_tree_view_insert_column")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val isBlankAtPos_ =
        call (getSymbol "gtk_tree_view_is_blank_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val isRubberBandingActive_ = call (getSymbol "gtk_tree_view_is_rubber_banding_active") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveColumnAfter_ =
        call (getSymbol "gtk_tree_view_move_column_after")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             --> cVoid
          )
      val removeColumn_ = call (getSymbol "gtk_tree_view_remove_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val rowActivated_ =
        call (getSymbol "gtk_tree_view_row_activated")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             --> cVoid
          )
      val rowExpanded_ = call (getSymbol "gtk_tree_view_row_expanded") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val scrollToCell_ =
        call (getSymbol "gtk_tree_view_scroll_to_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val scrollToPoint_ =
        call (getSymbol "gtk_tree_view_scroll_to_point")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val setActivateOnSingleClick_ = call (getSymbol "gtk_tree_view_set_activate_on_single_click") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCursor_ =
        call (getSymbol "gtk_tree_view_set_cursor")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setCursorOnCell_ =
        call (getSymbol "gtk_tree_view_set_cursor_on_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setDragDestRow_ =
        call (getSymbol "gtk_tree_view_set_drag_dest_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewDropPosition.PolyML.cVal
             --> cVoid
          )
      val setEnableSearch_ = call (getSymbol "gtk_tree_view_set_enable_search") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEnableTreeLines_ = call (getSymbol "gtk_tree_view_set_enable_tree_lines") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setExpanderColumn_ = call (getSymbol "gtk_tree_view_set_expander_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> cVoid)
      val setFixedHeightMode_ = call (getSymbol "gtk_tree_view_set_fixed_height_mode") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setGridLines_ = call (getSymbol "gtk_tree_view_set_grid_lines") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewGridLines.PolyML.cVal --> cVoid)
      val setHadjustment_ = call (getSymbol "gtk_tree_view_set_hadjustment") (GtkTreeViewClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setHeadersClickable_ = call (getSymbol "gtk_tree_view_set_headers_clickable") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHeadersVisible_ = call (getSymbol "gtk_tree_view_set_headers_visible") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHoverExpand_ = call (getSymbol "gtk_tree_view_set_hover_expand") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHoverSelection_ = call (getSymbol "gtk_tree_view_set_hover_selection") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setLevelIndentation_ = call (getSymbol "gtk_tree_view_set_level_indentation") (GtkTreeViewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setModel_ = call (getSymbol "gtk_tree_view_set_model") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> cVoid)
      val setReorderable_ = call (getSymbol "gtk_tree_view_set_reorderable") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRubberBanding_ = call (getSymbol "gtk_tree_view_set_rubber_banding") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRulesHint_ = call (getSymbol "gtk_tree_view_set_rules_hint") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSearchColumn_ = call (getSymbol "gtk_tree_view_set_search_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setSearchEntry_ = call (getSymbol "gtk_tree_view_set_search_entry") (GtkTreeViewClass.PolyML.cPtr &&> GtkEntryClass.PolyML.cOptPtr --> cVoid)
      val setShowExpanders_ = call (getSymbol "gtk_tree_view_set_show_expanders") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTooltipCell_ =
        call (getSymbol "gtk_tree_view_set_tooltip_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             --> cVoid
          )
      val setTooltipColumn_ = call (getSymbol "gtk_tree_view_set_tooltip_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> cVoid)
      val setTooltipRow_ =
        call (getSymbol "gtk_tree_view_set_tooltip_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> cVoid
          )
      val setVadjustment_ = call (getSymbol "gtk_tree_view_set_vadjustment") (GtkTreeViewClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val unsetRowsDragDest_ = call (getSymbol "gtk_tree_view_unset_rows_drag_dest") (GtkTreeViewClass.PolyML.cPtr --> cVoid)
      val unsetRowsDragSource_ = call (getSymbol "gtk_tree_view_unset_rows_drag_source") (GtkTreeViewClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkTreeViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    type 'a tree_selection_class = 'a GtkTreeSelectionClass.class
    type tree_view_drop_position_t = GtkTreeViewDropPosition.t
    type 'a entry_class = 'a GtkEntryClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type movement_step_t = GtkMovementStep.t
    type tree_path_t = GtkTreePathRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_view_grid_lines_t = GtkTreeViewGridLines.t
    type 'a tree_view_column_class = 'a GtkTreeViewColumnClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreeViewClass.FFI.fromPtr false) new_ ()
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr false ---> GtkTreeViewClass.FFI.fromPtr false) newWithModel_ model before GtkTreeModelClass.FFI.touchPtr model
    fun appendColumn self column = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GtkTreeViewClass.FFI.withPtr false ---> I) collapseAll_ self
    fun collapseRow self path = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GtkTreeViewClass.FFI.withPtr false ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self (bx, by) =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertBinWindowToTreeCoords_
            (
              self
               & bx
               & by
               & GInt32.null
               & GInt32.null
            )
      in
        (tx, ty)
      end
    fun convertBinWindowToWidgetCoords self (bx, by) =
      let
        val wx
         & wy
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertBinWindowToWidgetCoords_
            (
              self
               & bx
               & by
               & GInt32.null
               & GInt32.null
            )
      in
        (wx, wy)
      end
    fun convertTreeToBinWindowCoords self (tx, ty) =
      let
        val bx
         & by
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertTreeToBinWindowCoords_
            (
              self
               & tx
               & ty
               & GInt32.null
               & GInt32.null
            )
      in
        (bx, by)
      end
    fun convertTreeToWidgetCoords self (tx, ty) =
      let
        val wx
         & wy
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertTreeToWidgetCoords_
            (
              self
               & tx
               & ty
               & GInt32.null
               & GInt32.null
            )
      in
        (wx, wy)
      end
    fun convertWidgetToBinWindowCoords self (wx, wy) =
      let
        val bx
         & by
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & GInt32.null
               & GInt32.null
            )
      in
        (bx, by)
      end
    fun convertWidgetToTreeCoords self (wx, wy) =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            convertWidgetToTreeCoords_
            (
              self
               & wx
               & wy
               & GInt32.null
               & GInt32.null
            )
      in
        (tx, ty)
      end
    fun createRowDragIcon self path = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr true) createRowDragIcon_ (self & path)
    fun enableModelDragDest self (targets, actions) =
      let
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
        val () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> GdkDragAction.FFI.withVal
             ---> I
          )
            enableModelDragDest_
            (
              self
               & targets
               & nTargets
               & actions
            )
      in
        ()
      end
    fun enableModelDragSource
      self
      (
        startButtonMask,
        targets,
        actions
      ) =
      let
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
        val () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GdkModifierType.FFI.withVal
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
             &&&> GInt32.FFI.withVal
             &&&> GdkDragAction.FFI.withVal
             ---> I
          )
            enableModelDragSource_
            (
              self
               & startButtonMask
               & targets
               & nTargets
               & actions
            )
      in
        ()
      end
    fun expandAll self = (GtkTreeViewClass.FFI.withPtr false ---> I) expandAll_ self
    fun expandRow self (path, openAll) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        expandRow_
        (
          self
           & path
           & openAll
        )
    fun expandToPath self path = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) expandToPath_ (self & path)
    fun getActivateOnSingleClick self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getBackgroundArea self (path, column) =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withOptPtr false
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getBackgroundArea_
            (
              self
               & path
               & column
               & ()
            )
      in
        rect
      end
    fun getBinWindow self = (GtkTreeViewClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getBinWindow_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getCellArea self (path, column) =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withOptPtr false
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getCellArea_
            (
              self
               & path
               & column
               & ()
            )
      in
        rect
      end
    fun getColumn self n = (GtkTreeViewClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GtkTreeViewColumnClass.FFI.fromOptPtr false) getColumn_ (self & n) before GtkTreeViewClass.FFI.touchPtr self
    fun getCursor self =
      let
        val path
         & focusColumn
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr false
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewColumnClass.FFI.fromPtr false
                   && I
          )
            getCursor_
            (
              self
               & NONE
               & NONE
            )
      in
        (path, focusColumn) before GtkTreeViewClass.FFI.touchPtr self
      end
    fun getDestRowAtPos self (dragX, dragY) =
      let
        val path
         & pos
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeViewDropPosition.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewDropPosition.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getDestRowAtPos_
            (
              self
               & dragX
               & dragY
               & NONE
               & GtkTreeViewDropPosition.null
            )
      in
        if retVal then SOME (path, pos) else NONE
      end
    fun getDragDestRow self =
      let
        val path
         & pos
         & () =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeViewDropPosition.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewDropPosition.FFI.fromVal
                   && I
          )
            getDragDestRow_
            (
              self
               & NONE
               & GtkTreeViewDropPosition.null
            )
      in
        (path, pos)
      end
    fun getEnableSearch self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableSearch_ self
    fun getEnableTreeLines self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getEnableTreeLines_ self
    fun getExpanderColumn self = (GtkTreeViewClass.FFI.withPtr false ---> GtkTreeViewColumnClass.FFI.fromPtr false) getExpanderColumn_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getFixedHeightMode self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFixedHeightMode_ self
    fun getGridLines self = (GtkTreeViewClass.FFI.withPtr false ---> GtkTreeViewGridLines.FFI.fromVal) getGridLines_ self
    fun getHadjustment self = (GtkTreeViewClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getHadjustment_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getHeadersClickable self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHeadersClickable_ self
    fun getHeadersVisible self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHeadersVisible_ self
    fun getHoverExpand self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHoverExpand_ self
    fun getHoverSelection self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHoverSelection_ self
    fun getLevelIndentation self = (GtkTreeViewClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getLevelIndentation_ self
    fun getModel self = (GtkTreeViewClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getNColumns self = (GtkTreeViewClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getNColumns_ self
    fun getPathAtPos self (x, y) =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewColumnClass.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getPathAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & GInt32.null
               & GInt32.null
            )
      in
        (
          if retVal
          then
            SOME
              (
                path,
                column,
                cellX,
                cellY
              )
          else NONE
        )
         before GtkTreeViewClass.FFI.touchPtr self
      end
    fun getReorderable self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReorderable_ self
    fun getRubberBanding self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRubberBanding_ self
    fun getRulesHint self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRulesHint_ self
    fun getSearchColumn self = (GtkTreeViewClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GtkTreeViewClass.FFI.withPtr false ---> GtkEntryClass.FFI.fromPtr false) getSearchEntry_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getSelection self = (GtkTreeViewClass.FFI.withPtr false ---> GtkTreeSelectionClass.FFI.fromPtr false) getSelection_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getShowExpanders self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GtkTreeViewClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getTooltipColumn_ self
    fun getTooltipContext
      self
      (
        x,
        y,
        keyboardTip
      ) =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GBool.FFI.withVal
             &&&> GtkTreeModelClass.FFI.withRefOptPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GtkTreeModelClass.FFI.fromPtr false
                   && GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeIterRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getTooltipContext_
            (
              self
               & x
               & y
               & keyboardTip
               & NONE
               & NONE
               & ()
            )
      in
        (
          if retVal
          then
            SOME
              (
                model,
                path,
                iter
              )
          else NONE,
          x,
          y
        )
         before GtkTreeViewClass.FFI.touchPtr self
      end
    fun getVadjustment self = (GtkTreeViewClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromPtr false) getVadjustment_ self before GtkTreeViewClass.FFI.touchPtr self
    fun getVisibleRange self =
      let
        val startPath
         & endPath
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreePathRecord.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getVisibleRange_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (startPath, endPath) else NONE
      end
    fun getVisibleRect self =
      let
        val visibleRect & () = (GtkTreeViewClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self (column, position) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        insertColumn_
        (
          self
           & column
           & position
        )
    fun isBlankAtPos self (x, y) =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr false
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr true
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewColumnClass.FFI.fromPtr true
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            isBlankAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal
        then
          SOME
            (
              path,
              column,
              cellX,
              cellY
            )
        else NONE
      end
    fun isRubberBandingActive self = (GtkTreeViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) isRubberBandingActive_ self
    fun moveColumnAfter self (column, baseColumn) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
         ---> I
      )
        moveColumnAfter_
        (
          self
           & column
           & baseColumn
        )
    fun removeColumn self column = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreeViewColumnClass.FFI.withPtr false ---> GInt32.FFI.fromVal) removeColumn_ (self & column)
    fun rowActivated self (path, column) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withPtr false
         ---> I
      )
        rowActivated_
        (
          self
           & path
           & column
        )
    fun rowExpanded self path = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) rowExpanded_ (self & path)
    fun scrollToCell
      self
      (
        path,
        column,
        useAlign,
        rowAlign,
        colAlign
      ) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withOptPtr false
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        scrollToCell_
        (
          self
           & path
           & column
           & useAlign
           & rowAlign
           & colAlign
        )
    fun scrollToPoint self (treeX, treeY) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        scrollToPoint_
        (
          self
           & treeX
           & treeY
        )
    fun setActivateOnSingleClick self single = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setCursor
      self
      (
        path,
        focusColumn,
        startEditing
      ) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setCursor_
        (
          self
           & path
           & focusColumn
           & startEditing
        )
    fun setCursorOnCell
      self
      (
        path,
        focusColumn,
        focusCell,
        startEditing
      ) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
         &&&> GtkCellRendererClass.FFI.withOptPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setCursorOnCell_
        (
          self
           & path
           & focusColumn
           & focusCell
           & startEditing
        )
    fun setDragDestRow self (path, pos) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withOptPtr false
         &&&> GtkTreeViewDropPosition.FFI.withVal
         ---> I
      )
        setDragDestRow_
        (
          self
           & path
           & pos
        )
    fun setEnableSearch self enableSearch = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableSearch_ (self & enableSearch)
    fun setEnableTreeLines self enabled = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setEnableTreeLines_ (self & enabled)
    fun setExpanderColumn self column = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreeViewColumnClass.FFI.withPtr false ---> I) setExpanderColumn_ (self & column)
    fun setFixedHeightMode self enable = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFixedHeightMode_ (self & enable)
    fun setGridLines self gridLines = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreeViewGridLines.FFI.withVal ---> I) setGridLines_ (self & gridLines)
    fun setHadjustment self adjustment = (GtkTreeViewClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setHadjustment_ (self & adjustment)
    fun setHeadersClickable self setting = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHeadersClickable_ (self & setting)
    fun setHeadersVisible self headersVisible = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHeadersVisible_ (self & headersVisible)
    fun setHoverExpand self expand = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHoverExpand_ (self & expand)
    fun setHoverSelection self hover = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHoverSelection_ (self & hover)
    fun setLevelIndentation self indentation = (GtkTreeViewClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GtkTreeViewClass.FFI.withPtr false &&&> GtkTreeModelClass.FFI.withOptPtr false ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GtkTreeViewClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GtkTreeViewClass.FFI.withPtr false &&&> GtkEntryClass.FFI.withOptPtr false ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GtkTreeViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell
      self
      (
        tooltip,
        path,
        column,
        cell
      ) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTooltipClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withOptPtr false
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr false
         &&&> GtkCellRendererClass.FFI.withOptPtr false
         ---> I
      )
        setTooltipCell_
        (
          self
           & tooltip
           & path
           & column
           & cell
        )
    fun setTooltipColumn self column = (GtkTreeViewClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self (tooltip, path) =
      (
        GtkTreeViewClass.FFI.withPtr false
         &&&> GtkTooltipClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         ---> I
      )
        setTooltipRow_
        (
          self
           & tooltip
           & path
        )
    fun setVadjustment self adjustment = (GtkTreeViewClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setVadjustment_ (self & adjustment)
    fun unsetRowsDragDest self = (GtkTreeViewClass.FFI.withPtr false ---> I) unsetRowsDragDest_ self
    fun unsetRowsDragSource self = (GtkTreeViewClass.FFI.withPtr false ---> I) unsetRowsDragSource_ self
    local
      open ClosureMarshal Signal
    in
      fun columnsChangedSig f = signal "columns-changed" (void ---> ret_void) f
      fun cursorChangedSig f = signal "cursor-changed" (void ---> ret_void) f
      fun expandCollapseCursorRowSig f =
        signal "expand-collapse-cursor-row"
          (
            get 0w1 boolean
             &&&> get 0w2 boolean
             &&&> get 0w3 boolean
             ---> ret boolean
          )
          (
            fn
              object
               & p0
               & p1 =>
                f
                  (
                    object,
                    p0,
                    p1
                  )
          )
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn step & direction => f (step, direction))
      fun rowActivatedSig f = signal "row-activated" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeViewColumnClass.t ---> ret_void) (fn path & column => f (path, column))
      fun rowCollapsedSig f = signal "row-collapsed" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f (iter, path))
      fun rowExpandedSig f = signal "row-expanded" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f (iter, path))
      fun selectAllSig f = signal "select-all" (void ---> ret boolean) f
      fun selectCursorParentSig f = signal "select-cursor-parent" (void ---> ret boolean) f
      fun selectCursorRowSig f = signal "select-cursor-row" (get 0w1 boolean ---> ret boolean) f
      fun startInteractiveSearchSig f = signal "start-interactive-search" (void ---> ret boolean) f
      fun testCollapseRowSig f = signal "test-collapse-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f (iter, path))
      fun testExpandRowSig f = signal "test-expand-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f (iter, path))
      fun toggleCursorRowSig f = signal "toggle-cursor-row" (void ---> ret boolean) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val activateOnSingleClickProp =
        {
          name = "activate-on-single-click",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val enableGridLinesProp =
        {
          name = "enable-grid-lines",
          gtype = fn () => C.gtype GtkTreeViewGridLines.t (),
          get = fn x => fn () => C.get GtkTreeViewGridLines.t x,
          set = fn x => C.set GtkTreeViewGridLines.t x,
          init = fn x => C.set GtkTreeViewGridLines.t x
        }
      val enableSearchProp =
        {
          name = "enable-search",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val enableTreeLinesProp =
        {
          name = "enable-tree-lines",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val expanderColumnProp =
        {
          name = "expander-column",
          gtype = fn () => C.gtype GtkTreeViewColumnClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeViewColumnClass.tOpt x,
          set = fn x => C.set GtkTreeViewColumnClass.tOpt x,
          init = fn x => C.set GtkTreeViewColumnClass.tOpt x
        }
      val fixedHeightModeProp =
        {
          name = "fixed-height-mode",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val headersClickableProp =
        {
          name = "headers-clickable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val headersVisibleProp =
        {
          name = "headers-visible",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hoverExpandProp =
        {
          name = "hover-expand",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hoverSelectionProp =
        {
          name = "hover-selection",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val levelIndentationProp =
        {
          name = "level-indentation",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val modelProp =
        {
          name = "model",
          gtype = fn () => C.gtype GtkTreeModelClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeModelClass.tOpt x,
          set = fn x => C.set GtkTreeModelClass.tOpt x,
          init = fn x => C.set GtkTreeModelClass.tOpt x
        }
      val reorderableProp =
        {
          name = "reorderable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rubberBandingProp =
        {
          name = "rubber-banding",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rulesHintProp =
        {
          name = "rules-hint",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val searchColumnProp =
        {
          name = "search-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val showExpandersProp =
        {
          name = "show-expanders",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val tooltipColumnProp =
        {
          name = "tooltip-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
