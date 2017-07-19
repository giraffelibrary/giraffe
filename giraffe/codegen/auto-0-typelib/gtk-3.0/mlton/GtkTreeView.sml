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
    val getType_ = _import "gtk_tree_view_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_tree_view_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithModel_ = _import "gtk_tree_view_new_with_model" : GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val appendColumn_ = fn x1 & x2 => (_import "gtk_tree_view_append_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val collapseAll_ = _import "gtk_tree_view_collapse_all" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> unit;
    val collapseRow_ = fn x1 & x2 => (_import "gtk_tree_view_collapse_row" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val columnsAutosize_ = _import "gtk_tree_view_columns_autosize" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> unit;
    val convertBinWindowToTreeCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_convert_bin_window_to_tree_coords" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createRowDragIcon_ = fn x1 & x2 => (_import "gtk_tree_view_create_row_drag_icon" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p;) (x1, x2)
    val expandAll_ = _import "gtk_tree_view_expand_all" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> unit;
    val expandRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_expand_row" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val expandToPath_ = fn x1 & x2 => (_import "gtk_tree_view_expand_to_path" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val getBackgroundArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_background_area" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getBinWindow_ = _import "gtk_tree_view_get_bin_window" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getCellArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_tree_view_get_cell_area" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getColumn_ = fn x1 & x2 => (_import "gtk_tree_view_get_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GInt32.FFI.val_ -> GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p;) (x1, x2)
    val getCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_get_cursor" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkTreeViewColumnClass.FFI.notnull) GtkTreeViewColumnClass.FFI.r
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * GtkTreeViewDropPosition.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * GtkTreeViewDropPosition.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getEnableSearch_ = _import "gtk_tree_view_get_enable_search" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getEnableTreeLines_ = _import "gtk_tree_view_get_enable_tree_lines" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getExpanderColumn_ = _import "gtk_tree_view_get_expander_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p;
    val getFixedHeightMode_ = _import "gtk_tree_view_get_fixed_height_mode" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getGridLines_ = _import "gtk_tree_view_get_grid_lines" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GtkTreeViewGridLines.FFI.val_;
    val getHeadersClickable_ = _import "gtk_tree_view_get_headers_clickable" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getHeadersVisible_ = _import "gtk_tree_view_get_headers_visible" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getHoverExpand_ = _import "gtk_tree_view_get_hover_expand" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getHoverSelection_ = _import "gtk_tree_view_get_hover_selection" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getLevelIndentation_ = _import "gtk_tree_view_get_level_indentation" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GInt32.FFI.val_;
    val getModel_ = _import "gtk_tree_view_get_model" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p;
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkTreeViewColumnClass.FFI.notnull) GtkTreeViewColumnClass.FFI.r
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
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
    val getReorderable_ = _import "gtk_tree_view_get_reorderable" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getRubberBanding_ = _import "gtk_tree_view_get_rubber_banding" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getRulesHint_ = _import "gtk_tree_view_get_rules_hint" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getSearchColumn_ = _import "gtk_tree_view_get_search_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GInt32.FFI.val_;
    val getSearchEntry_ = _import "gtk_tree_view_get_search_entry" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p;
    val getSelection_ = _import "gtk_tree_view_get_selection" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GtkTreeSelectionClass.FFI.notnull GtkTreeSelectionClass.FFI.p;
    val getShowExpanders_ = _import "gtk_tree_view_get_show_expanders" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val getTooltipColumn_ = _import "gtk_tree_view_get_tooltip_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GInt32.FFI.val_;
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * GBool.FFI.val_
               * (unit, GtkTreeModelClass.FFI.notnull) GtkTreeModelClass.FFI.r
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               -> GBool.FFI.val_;
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getVisibleRect_ = fn x1 & x2 => (_import "gtk_tree_view_get_visible_rect" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * CairoRectangleIntRecord.FFI.notnull CairoRectangleIntRecord.FFI.p -> unit;) (x1, x2)
    val insertColumn_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_insert_column" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkTreeViewColumnClass.FFI.notnull) GtkTreeViewColumnClass.FFI.r
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GBool.FFI.val_;
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
    val isRubberBandingActive_ = _import "gtk_tree_view_is_rubber_banding_active" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> GBool.FFI.val_;
    val moveColumnAfter_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_move_column_after" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val removeColumn_ = fn x1 & x2 => (_import "gtk_tree_view_remove_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p -> GInt32.FFI.val_;) (x1, x2)
    val rowActivated_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_row_activated" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val rowExpanded_ = fn x1 & x2 => (_import "gtk_tree_view_row_expanded" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * GBool.FFI.val_
               * GFloat.FFI.val_
               * GFloat.FFI.val_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * GBool.FFI.val_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * unit GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
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
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * GtkTreeViewDropPosition.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setEnableSearch_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_search" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEnableTreeLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_enable_tree_lines" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setExpanderColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_expander_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreeViewColumnClass.FFI.notnull GtkTreeViewColumnClass.FFI.p -> unit;) (x1, x2)
    val setFixedHeightMode_ = fn x1 & x2 => (_import "gtk_tree_view_set_fixed_height_mode" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setGridLines_ = fn x1 & x2 => (_import "gtk_tree_view_set_grid_lines" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GtkTreeViewGridLines.FFI.val_ -> unit;) (x1, x2)
    val setHeadersClickable_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_clickable" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHeadersVisible_ = fn x1 & x2 => (_import "gtk_tree_view_set_headers_visible" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHoverExpand_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_expand" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHoverSelection_ = fn x1 & x2 => (_import "gtk_tree_view_set_hover_selection" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setLevelIndentation_ = fn x1 & x2 => (_import "gtk_tree_view_set_level_indentation" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_tree_view_set_model" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * unit GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_tree_view_set_reorderable" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRubberBanding_ = fn x1 & x2 => (_import "gtk_tree_view_set_rubber_banding" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRulesHint_ = fn x1 & x2 => (_import "gtk_tree_view_set_rules_hint" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSearchColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setSearchEntry_ = fn x1 & x2 => (_import "gtk_tree_view_set_search_entry" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * unit GtkEntryClass.FFI.p -> unit;) (x1, x2)
    val setShowExpanders_ = fn x1 & x2 => (_import "gtk_tree_view_set_show_expanders" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTooltipCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_tree_view_set_tooltip_cell" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * unit GtkTreeViewColumnClass.FFI.p
               * unit GtkCellRendererClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val setTooltipColumn_ = fn x1 & x2 => (_import "gtk_tree_view_set_tooltip_column" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTooltipRow_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_tree_view_set_tooltip_row" :
              GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p
               * GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unsetRowsDragDest_ = _import "gtk_tree_view_unset_rows_drag_dest" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> unit;
    val unsetRowsDragSource_ = _import "gtk_tree_view_unset_rows_drag_source" : GtkTreeViewClass.FFI.notnull GtkTreeViewClass.FFI.p -> unit;
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkTreeViewClass.FFI.fromPtr false) new_ ()
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr ---> GtkTreeViewClass.FFI.fromPtr false) newWithModel_ model
    fun appendColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewColumnClass.FFI.withPtr ---> GInt32.FFI.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GtkTreeViewClass.FFI.withPtr ---> I) collapseAll_ self
    fun collapseRow self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GtkTreeViewClass.FFI.withPtr ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self (bx, by) =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
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
    fun createRowDragIcon self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> CairoSurfaceRecord.FFI.fromPtr true) createRowDragIcon_ (self & path)
    fun expandAll self = (GtkTreeViewClass.FFI.withPtr ---> I) expandAll_ self
    fun expandRow self (path, openAll) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        expandRow_
        (
          self
           & path
           & openAll
        )
    fun expandToPath self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) expandToPath_ (self & path)
    fun getBackgroundArea self (path, column) =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr
             &&&> CairoRectangleIntRecord.FFI.withNewPtr
             ---> CairoRectangleIntRecord.FFI.fromPtr true && I
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
    fun getBinWindow self = (GtkTreeViewClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getCellArea self (path, column) =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr
             &&&> CairoRectangleIntRecord.FFI.withNewPtr
             ---> CairoRectangleIntRecord.FFI.fromPtr true && I
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
    fun getColumn self n = (GtkTreeViewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GtkTreeViewColumnClass.FFI.fromPtr false) getColumn_ (self & n)
    fun getCursor self =
      let
        val path
         & focusColumn
         & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr
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
        (path, focusColumn)
      end
    fun getDestRowAtPos self (dragX, dragY) =
      let
        val path
         & pos
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
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
    fun getEnableSearch self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getEnableSearch_ self
    fun getEnableTreeLines self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getEnableTreeLines_ self
    fun getExpanderColumn self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeViewColumnClass.FFI.fromPtr false) getExpanderColumn_ self
    fun getFixedHeightMode self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getFixedHeightMode_ self
    fun getGridLines self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeViewGridLines.FFI.fromVal) getGridLines_ self
    fun getHeadersClickable self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getHeadersClickable_ self
    fun getHeadersVisible self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getHeadersVisible_ self
    fun getHoverExpand self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getHoverExpand_ self
    fun getHoverSelection self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getHoverSelection_ self
    fun getLevelIndentation self = (GtkTreeViewClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLevelIndentation_ self
    fun getModel self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun getPathAtPos self (x, y) =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr
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
    fun getReorderable self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getReorderable_ self
    fun getRubberBanding self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getRubberBanding_ self
    fun getRulesHint self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getRulesHint_ self
    fun getSearchColumn self = (GtkTreeViewClass.FFI.withPtr ---> GInt32.FFI.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GtkTreeViewClass.FFI.withPtr ---> GtkEntryClass.FFI.fromPtr false) getSearchEntry_ self
    fun getSelection self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeSelectionClass.FFI.fromPtr false) getSelection_ self
    fun getShowExpanders self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GtkTreeViewClass.FFI.withPtr ---> GInt32.FFI.fromVal) getTooltipColumn_ self
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GBool.FFI.withVal
             &&&> GtkTreeModelClass.FFI.withRefOptPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
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
      end
    fun getVisibleRange self =
      let
        val startPath
         & endPath
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
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
        val visibleRect & () = (GtkTreeViewClass.FFI.withPtr &&&> CairoRectangleIntRecord.FFI.withNewPtr ---> CairoRectangleIntRecord.FFI.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self (column, position) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withPtr
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr
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
    fun isRubberBandingActive self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) isRubberBandingActive_ self
    fun moveColumnAfter self (column, baseColumn) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr
         ---> I
      )
        moveColumnAfter_
        (
          self
           & column
           & baseColumn
        )
    fun removeColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewColumnClass.FFI.withPtr ---> GInt32.FFI.fromVal) removeColumn_ (self & column)
    fun rowActivated self (path, column) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withPtr
         ---> I
      )
        rowActivated_
        (
          self
           & path
           & column
        )
    fun rowExpanded self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) rowExpanded_ (self & path)
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
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withOptPtr
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr
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
        GtkTreeViewClass.FFI.withPtr
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
    fun setCursor
      self
      (
        path,
        focusColumn,
        startEditing
      ) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr
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
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr
         &&&> GtkCellRendererClass.FFI.withOptPtr
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
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withOptPtr
         &&&> GtkTreeViewDropPosition.FFI.withVal
         ---> I
      )
        setDragDestRow_
        (
          self
           & path
           & pos
        )
    fun setEnableSearch self enableSearch = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEnableSearch_ (self & enableSearch)
    fun setEnableTreeLines self enabled = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setEnableTreeLines_ (self & enabled)
    fun setExpanderColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewColumnClass.FFI.withPtr ---> I) setExpanderColumn_ (self & column)
    fun setFixedHeightMode self enable = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFixedHeightMode_ (self & enable)
    fun setGridLines self gridLines = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewGridLines.FFI.withVal ---> I) setGridLines_ (self & gridLines)
    fun setHeadersClickable self setting = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHeadersClickable_ (self & setting)
    fun setHeadersVisible self headersVisible = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHeadersVisible_ (self & headersVisible)
    fun setHoverExpand self expand = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHoverExpand_ (self & expand)
    fun setHoverSelection self hover = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHoverSelection_ (self & hover)
    fun setLevelIndentation self indentation = (GtkTreeViewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GtkTreeViewClass.FFI.withPtr &&&> GtkEntryClass.FFI.withOptPtr ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell
      self
      (
        tooltip,
        path,
        column,
        cell
      ) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTooltipClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withOptPtr
         &&&> GtkTreeViewColumnClass.FFI.withOptPtr
         &&&> GtkCellRendererClass.FFI.withOptPtr
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
    fun setTooltipColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self (tooltip, path) =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTooltipClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         ---> I
      )
        setTooltipRow_
        (
          self
           & tooltip
           & path
        )
    fun unsetRowsDragDest self = (GtkTreeViewClass.FFI.withPtr ---> I) unsetRowsDragDest_ self
    fun unsetRowsDragSource self = (GtkTreeViewClass.FFI.withPtr ---> I) unsetRowsDragSource_ self
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
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn object & p0 => f (object, p0))
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
