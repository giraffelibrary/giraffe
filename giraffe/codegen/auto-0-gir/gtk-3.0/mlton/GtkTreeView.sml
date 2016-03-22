structure GtkTreeView :>
  GTK_TREE_VIEW
    where type 'a class = 'a GtkTreeViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type 'a tree_selection_class = 'a GtkTreeSelectionClass.class
    where type tree_view_drop_position_t = GtkTreeViewDropPosition.t
    where type 'a entry_class = 'a GtkEntryClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type movement_step_t = GtkMovementStep.t
    where type tree_path_t = GtkTreePathRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type tree_view_grid_lines_t = GtkTreeViewGridLines.t
    where type 'a tree_view_column_class = 'a GtkTreeViewColumnClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    val getType_ = _import "gtk_tree_view_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tree_view_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithModel_ = _import "gtk_tree_view_new_with_model" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val appendColumn_ = fn x1 & x2 => (_import "gtk_tree_view_append_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val collapseAll_ = _import "gtk_tree_view_collapse_all" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> unit;
    val collapseRow_ = fn x1 & x2 => (_import "gtk_tree_view_collapse_row" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val columnsAutosize_ = _import "gtk_tree_view_columns_autosize" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> unit;
    val convertBinWindowToTreeCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_bin_window_to_tree_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val convertBinWindowToWidgetCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_bin_window_to_widget_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val convertTreeToBinWindowCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_tree_to_bin_window_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val convertTreeToWidgetCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_tree_to_widget_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val convertWidgetToBinWindowCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_widget_to_bin_window_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val convertWidgetToTreeCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_widget_to_tree_coords" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createRowDragIcon_ = fn x1 & x2 => (_import "gtk_tree_view_create_row_drag_icon" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p;) (x1, x2)
    val expandAll_ = _import "gtk_tree_view_expand_all" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> unit;
    val expandRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_expand_row" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val expandToPath_ = fn x1 & x2 => (_import "gtk_tree_view_expand_to_path" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val getBackgroundArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_background_area" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBinWindow_ = _import "gtk_tree_view_get_bin_window" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getCellArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_cell_area" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getColumn_ = fn x1 & x2 => (_import "gtk_tree_view_get_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Int.C.val_ -> GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p;) (x1, x2)
    val getCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_get_cursor" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GtkTreeViewColumnClass.C.notnull) GtkTreeViewColumnClass.C.r
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getDestRowAtPos_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_get_dest_row_at_pos" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeViewDropPosition.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDragDestRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_get_drag_dest_row" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeViewDropPosition.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableSearch_ = _import "gtk_tree_view_get_enable_search" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getEnableTreeLines_ = _import "gtk_tree_view_get_enable_tree_lines" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getExpanderColumn_ = _import "gtk_tree_view_get_expander_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p;
    val getFixedHeightMode_ = _import "gtk_tree_view_get_fixed_height_mode" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getGridLines_ = _import "gtk_tree_view_get_grid_lines" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GtkTreeViewGridLines.C.val_;
    val getHeadersClickable_ = _import "gtk_tree_view_get_headers_clickable" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getHeadersVisible_ = _import "gtk_tree_view_get_headers_visible" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getHoverExpand_ = _import "gtk_tree_view_get_hover_expand" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getHoverSelection_ = _import "gtk_tree_view_get_hover_selection" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getLevelIndentation_ = _import "gtk_tree_view_get_level_indentation" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Int.C.val_;
    val getModel_ = _import "gtk_tree_view_get_model" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p;
    val getPathAtPos_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_tree_view_get_path_at_pos" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GtkTreeViewColumnClass.C.notnull) GtkTreeViewColumnClass.C.r
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getReorderable_ = _import "gtk_tree_view_get_reorderable" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getRubberBanding_ = _import "gtk_tree_view_get_rubber_banding" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getRulesHint_ = _import "gtk_tree_view_get_rules_hint" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getSearchColumn_ = _import "gtk_tree_view_get_search_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Int.C.val_;
    val getSearchEntry_ = _import "gtk_tree_view_get_search_entry" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GtkEntryClass.C.notnull GtkEntryClass.C.p;
    val getSelection_ = _import "gtk_tree_view_get_selection" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> GtkTreeSelectionClass.C.notnull GtkTreeSelectionClass.C.p;
    val getShowExpanders_ = _import "gtk_tree_view_get_show_expanders" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val getTooltipColumn_ = _import "gtk_tree_view_get_tooltip_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Int.C.val_;
    val getTooltipContext_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_tree_view_get_tooltip_context" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               * FFI.Bool.C.val_
               * (unit, GtkTreeModelClass.C.notnull) GtkTreeModelClass.C.r
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getVisibleRange_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_get_visible_range" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getVisibleRect_ = fn x1 & x2 => (_import "gtk_tree_view_get_visible_rect" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p -> unit;) (x1, x2)
    val insertColumn_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_insert_column" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isBlankAtPos_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_tree_view_is_blank_at_pos" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GtkTreeViewColumnClass.C.notnull) GtkTreeViewColumnClass.C.r
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val isRubberBandingActive_ = _import "gtk_tree_view_is_rubber_banding_active" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> FFI.Bool.C.val_;
    val moveColumnAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_move_column_after" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               * unit GtkTreeViewColumnClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeColumn_ = fn x1 & x2 => (_import "gtk_tree_view_remove_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> FFI.Int.C.val_;) (x1, x2)
    val rowActivated_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_row_activated" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowExpanded_ = fn x1 & x2 => (_import "gtk_tree_view_row_expanded" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val scrollToCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_tree_view_scroll_to_cell" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * FFI.Bool.C.val_
               * FFI.Float.C.val_
               * FFI.Float.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val scrollToPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_scroll_to_point" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setCursor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_set_cursor" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setCursorOnCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_set_cursor_on_cell" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * unit GtkCellRendererClass.C.p
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setDragDestRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_set_drag_dest_row" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * unit GtkTreePathRecord.C.p
               * GtkTreeViewDropPosition.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEnableSearch_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_search" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEnableTreeLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_tree_lines" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setExpanderColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_expander_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreeViewColumnClass.C.notnull GtkTreeViewColumnClass.C.p -> unit;) (x1, x2)
    val setFixedHeightMode_ = fn x1 & x2 => (_import "gtk_tree_view_set_fixed_height_mode" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setGridLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_grid_lines" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * GtkTreeViewGridLines.C.val_ -> unit;) (x1, x2)
    val setHeadersClickable_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_clickable" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHeadersVisible_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_visible" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHoverExpand_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_expand" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHoverSelection_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_selection" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setLevelIndentation_ = fn x1 & x2 => (_import "gtk_tree_view_set_level_indentation" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_tree_view_set_model" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * unit GtkTreeModelClass.C.p -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_set_reorderable" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRubberBanding_ = fn x1 & x2 => (_import "gtk_tree_view_set_rubber_banding" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRulesHint_ = fn x1 & x2 => (_import "gtk_tree_view_set_rules_hint" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSearchColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setSearchEntry_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_entry" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * unit GtkEntryClass.C.p -> unit;) (x1, x2)
    val setShowExpanders_ = fn x1 & x2 => (_import "gtk_tree_view_set_show_expanders" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTooltipCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_set_tooltip_cell" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GtkTreeViewColumnClass.C.p
               * unit GtkCellRendererClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setTooltipColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_tooltip_column" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setTooltipRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_set_tooltip_row" :
              GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p
               * GtkTooltipClass.C.notnull GtkTooltipClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetRowsDragDest_ = _import "gtk_tree_view_unset_rows_drag_dest" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> unit;
    val unsetRowsDragSource_ = _import "gtk_tree_view_unset_rows_drag_source" : GtkTreeViewClass.C.notnull GtkTreeViewClass.C.p -> unit;
    type 'a class = 'a GtkTreeViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type 'a tree_selection_class = 'a GtkTreeSelectionClass.class
    type tree_view_drop_position_t = GtkTreeViewDropPosition.t
    type 'a entry_class = 'a GtkEntryClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type movement_step_t = GtkMovementStep.t
    type tree_path_t = GtkTreePathRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type tree_view_grid_lines_t = GtkTreeViewGridLines.t
    type 'a tree_view_column_class = 'a GtkTreeViewColumnClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreeViewClass.C.fromPtr false) new_ ()
    fun newWithModel model = (GtkTreeModelClass.C.withPtr ---> GtkTreeViewClass.C.fromPtr false) newWithModel_ model
    fun appendColumn self column = (GtkTreeViewClass.C.withPtr &&&> GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GtkTreeViewClass.C.withPtr ---> I) collapseAll_ self
    fun collapseRow self path = (GtkTreeViewClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GtkTreeViewClass.C.withPtr ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self bx by =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertBinWindowToTreeCoords_
            (
              self
               & bx
               & by
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (tx, ty)
      end
    fun convertBinWindowToWidgetCoords self bx by =
      let
        val wx
         & wy
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertBinWindowToWidgetCoords_
            (
              self
               & bx
               & by
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (wx, wy)
      end
    fun convertTreeToBinWindowCoords self tx ty =
      let
        val bx
         & by
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertTreeToBinWindowCoords_
            (
              self
               & tx
               & ty
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (bx, by)
      end
    fun convertTreeToWidgetCoords self tx ty =
      let
        val wx
         & wy
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertTreeToWidgetCoords_
            (
              self
               & tx
               & ty
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (wx, wy)
      end
    fun convertWidgetToBinWindowCoords self wx wy =
      let
        val bx
         & by
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (bx, by)
      end
    fun convertWidgetToTreeCoords self wx wy =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            convertWidgetToTreeCoords_
            (
              self
               & wx
               & wy
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (tx, ty)
      end
    fun createRowDragIcon self path = (GtkTreeViewClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> CairoSurfaceRecord.C.fromPtr true) createRowDragIcon_ (self & path)
    fun expandAll self = (GtkTreeViewClass.C.withPtr ---> I) expandAll_ self
    fun expandRow self path openAll =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        expandRow_
        (
          self
           & path
           & openAll
        )
    fun expandToPath self path = (GtkTreeViewClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) expandToPath_ (self & path)
    fun getBackgroundArea self path column =
      let
        val rect & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GtkTreeViewColumnClass.C.withOptPtr
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
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
    fun getBinWindow self = (GtkTreeViewClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getCellArea self path column =
      let
        val rect & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GtkTreeViewColumnClass.C.withOptPtr
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
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
    fun getColumn self n = (GtkTreeViewClass.C.withPtr &&&> FFI.Int.C.withVal ---> GtkTreeViewColumnClass.C.fromPtr false) getColumn_ (self & n)
    fun getCursor self =
      let
        val path
         & focusColumn
         & () =
          (
            GtkTreeViewClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewColumnClass.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr false
                   && I
          )
            getCursor_
            (
              self
               & NONE
               & NONE
            )
      in
        (path, focusColumn)
      end
    fun getDestRowAtPos self dragX dragY =
      let
        val path
         & pos
         & retVal =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewDropPosition.C.fromVal
                   && FFI.Bool.C.fromVal
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
            GtkTreeViewClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewDropPosition.C.fromVal
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
    fun getEnableSearch self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableSearch_ self
    fun getEnableTreeLines self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getEnableTreeLines_ self
    fun getExpanderColumn self = (GtkTreeViewClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) getExpanderColumn_ self
    fun getFixedHeightMode self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getFixedHeightMode_ self
    fun getGridLines self = (GtkTreeViewClass.C.withPtr ---> GtkTreeViewGridLines.C.fromVal) getGridLines_ self
    fun getHeadersClickable self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getHeadersClickable_ self
    fun getHeadersVisible self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getHeadersVisible_ self
    fun getHoverExpand self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getHoverExpand_ self
    fun getHoverSelection self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getHoverSelection_ self
    fun getLevelIndentation self = (GtkTreeViewClass.C.withPtr ---> FFI.Int.C.fromVal) getLevelIndentation_ self
    fun getModel self = (GtkTreeViewClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPathAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewColumnClass.C.withRefOptPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr false
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getPathAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & FFI.Int.null
               & FFI.Int.null
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
    fun getReorderable self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getReorderable_ self
    fun getRubberBanding self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getRubberBanding_ self
    fun getRulesHint self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getRulesHint_ self
    fun getSearchColumn self = (GtkTreeViewClass.C.withPtr ---> FFI.Int.C.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GtkTreeViewClass.C.withPtr ---> GtkEntryClass.C.fromPtr false) getSearchEntry_ self
    fun getSelection self = (GtkTreeViewClass.C.withPtr ---> GtkTreeSelectionClass.C.fromPtr false) getSelection_ self
    fun getShowExpanders self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GtkTreeViewClass.C.withPtr ---> FFI.Int.C.fromVal) getTooltipColumn_ self
    fun getTooltipContext self x y keyboardTip =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Bool.C.withVal
             &&&> GtkTreeModelClass.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && GtkTreeModelClass.C.fromPtr false
                   && GtkTreePathRecord.C.fromPtr true
                   && GtkTreeIterRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
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
      end
    fun getVisibleRange self =
      let
        val startPath
         & endPath
         & retVal =
          (
            GtkTreeViewClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && FFI.Bool.C.fromVal
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
        val visibleRect & () = (GtkTreeViewClass.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self column position =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        insertColumn_
        (
          self
           & column
           & position
        )
    fun isBlankAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewColumnClass.C.withRefOptPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr true
                   && FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            isBlankAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & FFI.Int.null
               & FFI.Int.null
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
    fun isRubberBandingActive self = (GtkTreeViewClass.C.withPtr ---> FFI.Bool.C.fromVal) isRubberBandingActive_ self
    fun moveColumnAfter self column baseColumn =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withOptPtr
         ---> I
      )
        moveColumnAfter_
        (
          self
           & column
           & baseColumn
        )
    fun removeColumn self column = (GtkTreeViewClass.C.withPtr &&&> GtkTreeViewColumnClass.C.withPtr ---> FFI.Int.C.fromVal) removeColumn_ (self & column)
    fun rowActivated self path column =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withPtr
         ---> I
      )
        rowActivated_
        (
          self
           & path
           & column
        )
    fun rowExpanded self path = (GtkTreeViewClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.C.fromVal) rowExpanded_ (self & path)
    fun scrollToCell self path column useAlign rowAlign colAlign =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GtkTreeViewColumnClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Float.C.withVal
         &&&> FFI.Float.C.withVal
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
    fun scrollToPoint self treeX treeY =
      (
        GtkTreeViewClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        scrollToPoint_
        (
          self
           & treeX
           & treeY
        )
    fun setCursor self path focusColumn startEditing =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setCursor_
        (
          self
           & path
           & focusColumn
           & startEditing
        )
    fun setCursorOnCell self path focusColumn focusCell startEditing =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GtkTreeViewColumnClass.C.withOptPtr
         &&&> GtkCellRendererClass.C.withOptPtr
         &&&> FFI.Bool.C.withVal
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
    fun setDragDestRow self path pos =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GtkTreeViewDropPosition.C.withVal
         ---> I
      )
        setDragDestRow_
        (
          self
           & path
           & pos
        )
    fun setEnableSearch self enableSearch = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableSearch_ (self & enableSearch)
    fun setEnableTreeLines self enabled = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setEnableTreeLines_ (self & enabled)
    fun setExpanderColumn self column = (GtkTreeViewClass.C.withPtr &&&> GtkTreeViewColumnClass.C.withPtr ---> I) setExpanderColumn_ (self & column)
    fun setFixedHeightMode self enable = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFixedHeightMode_ (self & enable)
    fun setGridLines self gridLines = (GtkTreeViewClass.C.withPtr &&&> GtkTreeViewGridLines.C.withVal ---> I) setGridLines_ (self & gridLines)
    fun setHeadersClickable self setting = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHeadersClickable_ (self & setting)
    fun setHeadersVisible self headersVisible = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHeadersVisible_ (self & headersVisible)
    fun setHoverExpand self expand = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHoverExpand_ (self & expand)
    fun setHoverSelection self hover = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHoverSelection_ (self & hover)
    fun setLevelIndentation self indentation = (GtkTreeViewClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GtkTreeViewClass.C.withPtr &&&> GtkTreeModelClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GtkTreeViewClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GtkTreeViewClass.C.withPtr &&&> GtkEntryClass.C.withOptPtr ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GtkTreeViewClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell self tooltip path column cell =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTooltipClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GtkTreeViewColumnClass.C.withOptPtr
         &&&> GtkCellRendererClass.C.withOptPtr
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
    fun setTooltipColumn self column = (GtkTreeViewClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self tooltip path =
      (
        GtkTreeViewClass.C.withPtr
         &&&> GtkTooltipClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        setTooltipRow_
        (
          self
           & tooltip
           & path
        )
    fun unsetRowsDragDest self = (GtkTreeViewClass.C.withPtr ---> I) unsetRowsDragDest_ self
    fun unsetRowsDragSource self = (GtkTreeViewClass.C.withPtr ---> I) unsetRowsDragSource_ self
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
                f object p0 p1
          )
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn object & p0 => f object p0)
      fun rowActivatedSig f = signal "row-activated" (get 0w1 GtkTreePathRecord.t &&&> get 0w2 GtkTreeViewColumnClass.t ---> ret_void) (fn path & column => f path column)
      fun rowCollapsedSig f = signal "row-collapsed" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f iter path)
      fun rowExpandedSig f = signal "row-expanded" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret_void) (fn iter & path => f iter path)
      fun selectAllSig f = signal "select-all" (void ---> ret boolean) f
      fun selectCursorParentSig f = signal "select-cursor-parent" (void ---> ret boolean) f
      fun selectCursorRowSig f = signal "select-cursor-row" (get 0w1 boolean ---> ret boolean) f
      fun startInteractiveSearchSig f = signal "start-interactive-search" (void ---> ret boolean) f
      fun testCollapseRowSig f = signal "test-collapse-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f iter path)
      fun testExpandRowSig f = signal "test-expand-row" (get 0w1 GtkTreeIterRecord.t &&&> get 0w2 GtkTreePathRecord.t ---> ret boolean) (fn iter & path => f iter path)
      fun toggleCursorRowSig f = signal "toggle-cursor-row" (void ---> ret boolean) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret boolean) f
    end
    local
      open Property
    in
      val enableGridLinesProp =
        {
          get = fn x => get "enable-grid-lines" GtkTreeViewGridLines.t x,
          set = fn x => set "enable-grid-lines" GtkTreeViewGridLines.t x
        }
      val enableSearchProp =
        {
          get = fn x => get "enable-search" boolean x,
          set = fn x => set "enable-search" boolean x
        }
      val enableTreeLinesProp =
        {
          get = fn x => get "enable-tree-lines" boolean x,
          set = fn x => set "enable-tree-lines" boolean x
        }
      val expanderColumnProp =
        {
          get = fn x => get "expander-column" GtkTreeViewColumnClass.tOpt x,
          set = fn x => set "expander-column" GtkTreeViewColumnClass.tOpt x
        }
      val fixedHeightModeProp =
        {
          get = fn x => get "fixed-height-mode" boolean x,
          set = fn x => set "fixed-height-mode" boolean x
        }
      val headersClickableProp =
        {
          get = fn x => get "headers-clickable" boolean x,
          set = fn x => set "headers-clickable" boolean x
        }
      val headersVisibleProp =
        {
          get = fn x => get "headers-visible" boolean x,
          set = fn x => set "headers-visible" boolean x
        }
      val hoverExpandProp =
        {
          get = fn x => get "hover-expand" boolean x,
          set = fn x => set "hover-expand" boolean x
        }
      val hoverSelectionProp =
        {
          get = fn x => get "hover-selection" boolean x,
          set = fn x => set "hover-selection" boolean x
        }
      val levelIndentationProp =
        {
          get = fn x => get "level-indentation" int x,
          set = fn x => set "level-indentation" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x
        }
      val rubberBandingProp =
        {
          get = fn x => get "rubber-banding" boolean x,
          set = fn x => set "rubber-banding" boolean x
        }
      val rulesHintProp =
        {
          get = fn x => get "rules-hint" boolean x,
          set = fn x => set "rules-hint" boolean x
        }
      val searchColumnProp =
        {
          get = fn x => get "search-column" int x,
          set = fn x => set "search-column" int x
        }
      val showExpandersProp =
        {
          get = fn x => get "show-expanders" boolean x,
          set = fn x => set "show-expanders" boolean x
        }
      val tooltipColumnProp =
        {
          get = fn x => get "tooltip-column" int x,
          set = fn x => set "tooltip-column" int x
        }
    end
  end
