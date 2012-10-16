structure GtkTreeView :>
  GTK_TREE_VIEW
    where type 'a class_t = 'a GtkTreeViewClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a scrollableclass_t = 'a GtkScrollableClass.t
    where type 'a treeselectionclass_t = 'a GtkTreeSelectionClass.t
    where type treeviewdropposition_t = GtkTreeViewDropPosition.t
    where type 'a entryclass_t = 'a GtkEntryClass.t
    where type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    where type 'a tooltipclass_t = 'a GtkTooltipClass.t
    where type movementstep_t = GtkMovementStep.t
    where type treepathrecord_t = GtkTreePathRecord.t
    where type treeiterrecord_t = GtkTreeIterRecord.t
    where type treeviewgridlines_t = GtkTreeViewGridLines.t
    where type 'a treeviewcolumnclass_t = 'a GtkTreeViewColumnClass.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    val getType_ = _import "gtk_tree_view_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_tree_view_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithModel_ = _import "gtk_tree_view_new_with_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendColumn_ = fn x1 & x2 => (_import "gtk_tree_view_append_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;) (x1, x2)
    val collapseAll_ = _import "gtk_tree_view_collapse_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val collapseRow_ = fn x1 & x2 => (_import "gtk_tree_view_collapse_row" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.val_;) (x1, x2)
    val columnsAutosize_ = _import "gtk_tree_view_columns_autosize" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val convertBinWindowToTreeCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_bin_window_to_tree_coords" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createRowDragIcon_ = fn x1 & x2 => (_import "gtk_tree_view_create_row_drag_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> CairoSurfaceRecord.C.notnull CairoSurfaceRecord.C.p;) (x1, x2)
    val expandAll_ = _import "gtk_tree_view_expand_all" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val expandRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_expand_row" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * FFI.Bool.val_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val expandToPath_ = fn x1 & x2 => (_import "gtk_tree_view_expand_to_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> unit;) (x1, x2)
    val getBackgroundArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_background_area" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBinWindow_ = _import "gtk_tree_view_get_bin_window" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCellArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_cell_area" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getColumn_ = fn x1 & x2 => (_import "gtk_tree_view_get_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_get_cursor" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeViewDropPosition.C.ref_
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeViewDropPosition.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableSearch_ = _import "gtk_tree_view_get_enable_search" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getEnableTreeLines_ = _import "gtk_tree_view_get_enable_tree_lines" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getExpanderColumn_ = _import "gtk_tree_view_get_expander_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getFixedHeightMode_ = _import "gtk_tree_view_get_fixed_height_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getGridLines_ = _import "gtk_tree_view_get_grid_lines" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkTreeViewGridLines.C.val_;
    val getHeadersClickable_ = _import "gtk_tree_view_get_headers_clickable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getHeadersVisible_ = _import "gtk_tree_view_get_headers_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getHoverExpand_ = _import "gtk_tree_view_get_hover_expand" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getHoverSelection_ = _import "gtk_tree_view_get_hover_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getLevelIndentation_ = _import "gtk_tree_view_get_level_indentation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getModel_ = _import "gtk_tree_view_get_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> FFI.Bool.val_;
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
    val getReorderable_ = _import "gtk_tree_view_get_reorderable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getRubberBanding_ = _import "gtk_tree_view_get_rubber_banding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getRulesHint_ = _import "gtk_tree_view_get_rules_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getSearchColumn_ = _import "gtk_tree_view_get_search_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
    val getSearchEntry_ = _import "gtk_tree_view_get_search_entry" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getSelection_ = _import "gtk_tree_view_get_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getShowExpanders_ = _import "gtk_tree_view_get_show_expanders" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getTooltipColumn_ = _import "gtk_tree_view_get_tooltip_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               * FFI.Bool.val_
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               -> FFI.Bool.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getVisibleRect_ = fn x1 & x2 => (_import "gtk_tree_view_get_visible_rect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p -> unit;) (x1, x2)
    val insertColumn_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_insert_column" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               -> FFI.Int32.val_;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
               * (unit, GtkTreePathRecord.C.notnull) GtkTreePathRecord.C.r
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> FFI.Bool.val_;
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
    val isRubberBandingActive_ = _import "gtk_tree_view_is_rubber_banding_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val moveColumnAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_move_column_after" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeColumn_ = fn x1 & x2 => (_import "gtk_tree_view_remove_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.val_;) (x1, x2)
    val rowActivated_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_row_activated" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowExpanded_ = fn x1 & x2 => (_import "gtk_tree_view_row_expanded" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p -> FFI.Bool.val_;) (x1, x2)
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Bool.val_
               * FFI.Float.val_
               * FFI.Float.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Bool.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               * FFI.Bool.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTreePathRecord.C.p
               * GtkTreeViewDropPosition.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEnableSearch_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_search" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setEnableTreeLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_tree_lines" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setExpanderColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_expander_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setFixedHeightMode_ = fn x1 & x2 => (_import "gtk_tree_view_set_fixed_height_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setGridLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_grid_lines" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkTreeViewGridLines.C.val_ -> unit;) (x1, x2)
    val setHeadersClickable_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_clickable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setHeadersVisible_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_visible" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setHoverExpand_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_expand" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setHoverSelection_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_selection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setLevelIndentation_ = fn x1 & x2 => (_import "gtk_tree_view_set_level_indentation" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_tree_view_set_model" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_set_reorderable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setRubberBanding_ = fn x1 & x2 => (_import "gtk_tree_view_set_rubber_banding" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setRulesHint_ = fn x1 & x2 => (_import "gtk_tree_view_set_rules_hint" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setSearchColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val setSearchEntry_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_entry" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setShowExpanders_ = fn x1 & x2 => (_import "gtk_tree_view_set_show_expanders" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setTooltipCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_set_tooltip_cell" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GtkTreePathRecord.C.p
               * unit GObjectObjectClass.C.p
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setTooltipColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_tooltip_column" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.val_ -> unit;) (x1, x2)
    val setTooltipRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_set_tooltip_row" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkTreePathRecord.C.notnull GtkTreePathRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetRowsDragDest_ = _import "gtk_tree_view_unset_rows_drag_dest" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val unsetRowsDragSource_ = _import "gtk_tree_view_unset_rows_drag_source" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkTreeViewClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a scrollableclass_t = 'a GtkScrollableClass.t
    type 'a treeselectionclass_t = 'a GtkTreeSelectionClass.t
    type treeviewdropposition_t = GtkTreeViewDropPosition.t
    type 'a entryclass_t = 'a GtkEntryClass.t
    type 'a cellrendererclass_t = 'a GtkCellRendererClass.t
    type 'a tooltipclass_t = 'a GtkTooltipClass.t
    type movementstep_t = GtkMovementStep.t
    type treepathrecord_t = GtkTreePathRecord.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    type treeviewgridlines_t = GtkTreeViewGridLines.t
    type 'a treeviewcolumnclass_t = 'a GtkTreeViewColumnClass.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.C.withPtr ---> GtkScrollableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkTreeViewClass.C.fromPtr false) new_ ()
    fun newWithModel model = (GObjectObjectClass.C.withPtr ---> GtkTreeViewClass.C.fromPtr false) newWithModel_ model
    fun appendColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GObjectObjectClass.C.withPtr ---> I) collapseAll_ self
    fun collapseRow self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GObjectObjectClass.C.withPtr ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self bx by =
      let
        val tx
         & ty
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertBinWindowToTreeCoords_
            (
              self
               & bx
               & by
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertBinWindowToWidgetCoords_
            (
              self
               & bx
               & by
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertTreeToBinWindowCoords_
            (
              self
               & tx
               & ty
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertTreeToWidgetCoords_
            (
              self
               & tx
               & ty
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & 0
               & 0
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            convertWidgetToTreeCoords_
            (
              self
               & wx
               & wy
               & 0
               & 0
            )
      in
        (tx, ty)
      end
    fun createRowDragIcon self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> CairoSurfaceRecord.C.fromPtr true) createRowDragIcon_ (self & path)
    fun expandAll self = (GObjectObjectClass.C.withPtr ---> I) expandAll_ self
    fun expandRow self path openAll =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> FFI.Bool.withVal
         ---> FFI.Bool.fromVal
      )
        expandRow_
        (
          self
           & path
           & openAll
        )
    fun expandToPath self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> I) expandToPath_ (self & path)
    fun getBackgroundArea self path column =
      let
        val rect & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun getBinWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getBinWindow_ self
    fun getCellArea self path column =
      let
        val rect & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withOptPtr
             &&&> GObjectObjectClass.C.withOptPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun getColumn self n = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> GtkTreeViewColumnClass.C.fromPtr false) getColumn_ (self & n)
    fun getCursor self =
      let
        val path
         & focusColumn
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeViewDropPosition.C.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewDropPosition.C.fromVal
                   && FFI.Bool.fromVal
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
            GObjectObjectClass.C.withPtr
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
    fun getEnableSearch self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getEnableSearch_ self
    fun getEnableTreeLines self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getEnableTreeLines_ self
    fun getExpanderColumn self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewColumnClass.C.fromPtr false) getExpanderColumn_ self
    fun getFixedHeightMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getFixedHeightMode_ self
    fun getGridLines self = (GObjectObjectClass.C.withPtr ---> GtkTreeViewGridLines.C.fromVal) getGridLines_ self
    fun getHeadersClickable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHeadersClickable_ self
    fun getHeadersVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHeadersVisible_ self
    fun getHoverExpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHoverExpand_ self
    fun getHoverSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHoverSelection_ self
    fun getLevelIndentation self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getLevelIndentation_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPathAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr false
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            getPathAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & 0
               & 0
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
    fun getReorderable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getReorderable_ self
    fun getRubberBanding self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getRubberBanding_ self
    fun getRulesHint self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getRulesHint_ self
    fun getSearchColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GObjectObjectClass.C.withPtr ---> GtkEntryClass.C.fromPtr false) getSearchEntry_ self
    fun getSelection self = (GObjectObjectClass.C.withPtr ---> GtkTreeSelectionClass.C.fromPtr false) getSelection_ self
    fun getShowExpanders self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getTooltipColumn_ self
    fun getTooltipContext self x y keyboardTip =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Bool.withVal
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreeIterRecord.C.withNewPtr
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && GtkTreeModelClass.C.fromPtr false
                   && GtkTreePathRecord.C.fromPtr true
                   && GtkTreeIterRecord.C.fromPtr true
                   && FFI.Bool.fromVal
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
            GObjectObjectClass.C.withPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GtkTreePathRecord.C.withRefOptPtr
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreePathRecord.C.fromPtr true
                   && FFI.Bool.fromVal
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
        val visibleRect & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self column position =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         ---> FFI.Int32.fromVal
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withVal
             &&&> GtkTreePathRecord.C.withRefOptPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> GtkTreePathRecord.C.fromPtr true
                   && GtkTreeViewColumnClass.C.fromPtr true
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            isBlankAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & 0
               & 0
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
    fun isRubberBandingActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) isRubberBandingActive_ self
    fun moveColumnAfter self column baseColumn =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        moveColumnAfter_
        (
          self
           & column
           & baseColumn
        )
    fun removeColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) removeColumn_ (self & column)
    fun rowActivated self path column =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         ---> I
      )
        rowActivated_
        (
          self
           & path
           & column
        )
    fun rowExpanded self path = (GObjectObjectClass.C.withPtr &&&> GtkTreePathRecord.C.withPtr ---> FFI.Bool.fromVal) rowExpanded_ (self & path)
    fun scrollToCell self path column useAlign rowAlign colAlign =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.withVal
         &&&> FFI.Float.withVal
         &&&> FFI.Float.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Bool.withVal
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
        GObjectObjectClass.C.withPtr
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
    fun setEnableSearch self enableSearch = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setEnableSearch_ (self & enableSearch)
    fun setEnableTreeLines self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setEnableTreeLines_ (self & enabled)
    fun setExpanderColumn self column = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setExpanderColumn_ (self & column)
    fun setFixedHeightMode self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setFixedHeightMode_ (self & enable)
    fun setGridLines self gridLines = (GObjectObjectClass.C.withPtr &&&> GtkTreeViewGridLines.C.withVal ---> I) setGridLines_ (self & gridLines)
    fun setHeadersClickable self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHeadersClickable_ (self & setting)
    fun setHeadersVisible self headersVisible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHeadersVisible_ (self & headersVisible)
    fun setHoverExpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHoverExpand_ (self & expand)
    fun setHoverSelection self hover = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setHoverSelection_ (self & hover)
    fun setLevelIndentation self indentation = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell self tooltip path column cell =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
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
    fun setTooltipColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self tooltip path =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTreePathRecord.C.withPtr
         ---> I
      )
        setTooltipRow_
        (
          self
           & tooltip
           & path
        )
    fun unsetRowsDragDest self = (GObjectObjectClass.C.withPtr ---> I) unsetRowsDragDest_ self
    fun unsetRowsDragSource self = (GObjectObjectClass.C.withPtr ---> I) unsetRowsDragSource_ self
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
