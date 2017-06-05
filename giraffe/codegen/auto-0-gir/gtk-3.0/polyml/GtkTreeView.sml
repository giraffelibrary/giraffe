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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_tree_view_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_tree_view_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithModel_ = call (load_sym libgtk "gtk_tree_view_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val appendColumn_ = call (load_sym libgtk "gtk_tree_view_append_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val collapseAll_ = call (load_sym libgtk "gtk_tree_view_collapse_all") (GtkTreeViewClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val collapseRow_ = call (load_sym libgtk "gtk_tree_view_collapse_row") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val columnsAutosize_ = call (load_sym libgtk "gtk_tree_view_columns_autosize") (GtkTreeViewClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val convertBinWindowToTreeCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_bin_window_to_tree_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val convertBinWindowToWidgetCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_bin_window_to_widget_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val convertTreeToBinWindowCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_tree_to_bin_window_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val convertTreeToWidgetCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_tree_to_widget_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val convertWidgetToBinWindowCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_widget_to_bin_window_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val convertWidgetToTreeCoords_ =
        call (load_sym libgtk "gtk_tree_view_convert_widget_to_tree_coords")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val createRowDragIcon_ = call (load_sym libgtk "gtk_tree_view_create_row_drag_icon") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val expandAll_ = call (load_sym libgtk "gtk_tree_view_expand_all") (GtkTreeViewClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val expandRow_ =
        call (load_sym libgtk "gtk_tree_view_expand_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val expandToPath_ = call (load_sym libgtk "gtk_tree_view_expand_to_path") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getBackgroundArea_ =
        call (load_sym libgtk "gtk_tree_view_get_background_area")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getBinWindow_ = call (load_sym libgtk "gtk_tree_view_get_bin_window") (GtkTreeViewClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getCellArea_ =
        call (load_sym libgtk "gtk_tree_view_get_cell_area")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val getColumn_ = call (load_sym libgtk "gtk_tree_view_get_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GtkTreeViewColumnClass.PolyML.cPtr)
      val getCursor_ =
        call (load_sym libgtk "gtk_tree_view_get_cursor")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             --> PolyMLFFI.cVoid
          )
      val getDestRowAtPos_ =
        call (load_sym libgtk "gtk_tree_view_get_dest_row_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewDropPosition.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getDragDestRow_ =
        call (load_sym libgtk "gtk_tree_view_get_drag_dest_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewDropPosition.PolyML.cRef
             --> PolyMLFFI.cVoid
          )
      val getEnableSearch_ = call (load_sym libgtk "gtk_tree_view_get_enable_search") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEnableTreeLines_ = call (load_sym libgtk "gtk_tree_view_get_enable_tree_lines") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getExpanderColumn_ = call (load_sym libgtk "gtk_tree_view_get_expander_column") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeViewColumnClass.PolyML.cPtr)
      val getFixedHeightMode_ = call (load_sym libgtk "gtk_tree_view_get_fixed_height_mode") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getGridLines_ = call (load_sym libgtk "gtk_tree_view_get_grid_lines") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeViewGridLines.PolyML.cVal)
      val getHeadersClickable_ = call (load_sym libgtk "gtk_tree_view_get_headers_clickable") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHeadersVisible_ = call (load_sym libgtk "gtk_tree_view_get_headers_visible") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHoverExpand_ = call (load_sym libgtk "gtk_tree_view_get_hover_expand") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHoverSelection_ = call (load_sym libgtk "gtk_tree_view_get_hover_selection") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getLevelIndentation_ = call (load_sym libgtk "gtk_tree_view_get_level_indentation") (GtkTreeViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_tree_view_get_model") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getPathAtPos_ =
        call (load_sym libgtk "gtk_tree_view_get_path_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getReorderable_ = call (load_sym libgtk "gtk_tree_view_get_reorderable") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRubberBanding_ = call (load_sym libgtk "gtk_tree_view_get_rubber_banding") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRulesHint_ = call (load_sym libgtk "gtk_tree_view_get_rules_hint") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSearchColumn_ = call (load_sym libgtk "gtk_tree_view_get_search_column") (GtkTreeViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSearchEntry_ = call (load_sym libgtk "gtk_tree_view_get_search_entry") (GtkTreeViewClass.PolyML.cPtr --> GtkEntryClass.PolyML.cPtr)
      val getSelection_ = call (load_sym libgtk "gtk_tree_view_get_selection") (GtkTreeViewClass.PolyML.cPtr --> GtkTreeSelectionClass.PolyML.cPtr)
      val getShowExpanders_ = call (load_sym libgtk "gtk_tree_view_get_show_expanders") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTooltipColumn_ = call (load_sym libgtk "gtk_tree_view_get_tooltip_column") (GtkTreeViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTooltipContext_ =
        call (load_sym libgtk "gtk_tree_view_get_tooltip_context")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GBool.PolyML.cVal
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getVisibleRange_ =
        call (load_sym libgtk "gtk_tree_view_get_visible_range")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getVisibleRect_ = call (load_sym libgtk "gtk_tree_view_get_visible_rect") (GtkTreeViewClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> PolyMLFFI.cVoid)
      val insertColumn_ =
        call (load_sym libgtk "gtk_tree_view_insert_column")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val isBlankAtPos_ =
        call (load_sym libgtk "gtk_tree_view_is_blank_at_pos")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeViewColumnClass.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val isRubberBandingActive_ = call (load_sym libgtk "gtk_tree_view_is_rubber_banding_active") (GtkTreeViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val moveColumnAfter_ =
        call (load_sym libgtk "gtk_tree_view_move_column_after")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val removeColumn_ = call (load_sym libgtk "gtk_tree_view_remove_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val rowActivated_ =
        call (load_sym libgtk "gtk_tree_view_row_activated")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val rowExpanded_ = call (load_sym libgtk "gtk_tree_view_row_expanded") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val scrollToCell_ =
        call (load_sym libgtk "gtk_tree_view_scroll_to_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val scrollToPoint_ =
        call (load_sym libgtk "gtk_tree_view_scroll_to_point")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setCursor_ =
        call (load_sym libgtk "gtk_tree_view_set_cursor")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setCursorOnCell_ =
        call (load_sym libgtk "gtk_tree_view_set_cursor_on_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setDragDestRow_ =
        call (load_sym libgtk "gtk_tree_view_set_drag_dest_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewDropPosition.PolyML.cVal
             --> PolyMLFFI.cVoid
          )
      val setEnableSearch_ = call (load_sym libgtk "gtk_tree_view_set_enable_search") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setEnableTreeLines_ = call (load_sym libgtk "gtk_tree_view_set_enable_tree_lines") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setExpanderColumn_ = call (load_sym libgtk "gtk_tree_view_set_expander_column") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewColumnClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setFixedHeightMode_ = call (load_sym libgtk "gtk_tree_view_set_fixed_height_mode") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setGridLines_ = call (load_sym libgtk "gtk_tree_view_set_grid_lines") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeViewGridLines.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHeadersClickable_ = call (load_sym libgtk "gtk_tree_view_set_headers_clickable") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHeadersVisible_ = call (load_sym libgtk "gtk_tree_view_set_headers_visible") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHoverExpand_ = call (load_sym libgtk "gtk_tree_view_set_hover_expand") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setHoverSelection_ = call (load_sym libgtk "gtk_tree_view_set_hover_selection") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setLevelIndentation_ = call (load_sym libgtk "gtk_tree_view_set_level_indentation") (GtkTreeViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_tree_view_set_model") (GtkTreeViewClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setReorderable_ = call (load_sym libgtk "gtk_tree_view_set_reorderable") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRubberBanding_ = call (load_sym libgtk "gtk_tree_view_set_rubber_banding") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRulesHint_ = call (load_sym libgtk "gtk_tree_view_set_rules_hint") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSearchColumn_ = call (load_sym libgtk "gtk_tree_view_set_search_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setSearchEntry_ = call (load_sym libgtk "gtk_tree_view_set_search_entry") (GtkTreeViewClass.PolyML.cPtr &&> GtkEntryClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setShowExpanders_ = call (load_sym libgtk "gtk_tree_view_set_show_expanders") (GtkTreeViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTooltipCell_ =
        call (load_sym libgtk "gtk_tree_view_set_tooltip_cell")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkTreeViewColumnClass.PolyML.cOptPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
      val setTooltipColumn_ = call (load_sym libgtk "gtk_tree_view_set_tooltip_column") (GtkTreeViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTooltipRow_ =
        call (load_sym libgtk "gtk_tree_view_set_tooltip_row")
          (
            GtkTreeViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> PolyMLFFI.cVoid
          )
      val unsetRowsDragDest_ = call (load_sym libgtk "gtk_tree_view_unset_rows_drag_dest") (GtkTreeViewClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val unsetRowsDragSource_ = call (load_sym libgtk "gtk_tree_view_unset_rows_drag_source") (GtkTreeViewClass.PolyML.cPtr --> PolyMLFFI.cVoid)
    end
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
    fun appendColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) appendColumn_ (self & column)
    fun collapseAll self = (GtkTreeViewClass.FFI.withPtr ---> I) collapseAll_ self
    fun collapseRow self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) collapseRow_ (self & path)
    fun columnsAutosize self = (GtkTreeViewClass.FFI.withPtr ---> I) columnsAutosize_ self
    fun convertBinWindowToTreeCoords self bx by =
      let
        val tx
         & ty
         & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertBinWindowToTreeCoords_
            (
              self
               & bx
               & by
               & GInt.null
               & GInt.null
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertBinWindowToWidgetCoords_
            (
              self
               & bx
               & by
               & GInt.null
               & GInt.null
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertTreeToBinWindowCoords_
            (
              self
               & tx
               & ty
               & GInt.null
               & GInt.null
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertTreeToWidgetCoords_
            (
              self
               & tx
               & ty
               & GInt.null
               & GInt.null
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertWidgetToBinWindowCoords_
            (
              self
               & wx
               & wy
               & GInt.null
               & GInt.null
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            convertWidgetToTreeCoords_
            (
              self
               & wx
               & wy
               & GInt.null
               & GInt.null
            )
      in
        (tx, ty)
      end
    fun createRowDragIcon self path = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> CairoSurfaceRecord.FFI.fromPtr true) createRowDragIcon_ (self & path)
    fun expandAll self = (GtkTreeViewClass.FFI.withPtr ---> I) expandAll_ self
    fun expandRow self path openAll =
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
    fun getBackgroundArea self path column =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr
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
    fun getBinWindow self = (GtkTreeViewClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getBinWindow_ self
    fun getCellArea self path column =
      let
        val rect & () =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withOptPtr
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
    fun getColumn self n = (GtkTreeViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GtkTreeViewColumnClass.FFI.fromPtr false) getColumn_ (self & n)
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
    fun getDestRowAtPos self dragX dragY =
      let
        val path
         & pos
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
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
    fun getLevelIndentation self = (GtkTreeViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getLevelIndentation_ self
    fun getModel self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun getPathAtPos self x y =
      let
        val path
         & column
         & cellX
         & cellY
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewColumnClass.FFI.fromPtr false
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getPathAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & GInt.null
               & GInt.null
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
    fun getSearchColumn self = (GtkTreeViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getSearchColumn_ self
    fun getSearchEntry self = (GtkTreeViewClass.FFI.withPtr ---> GtkEntryClass.FFI.fromPtr false) getSearchEntry_ self
    fun getSelection self = (GtkTreeViewClass.FFI.withPtr ---> GtkTreeSelectionClass.FFI.fromPtr false) getSelection_ self
    fun getShowExpanders self = (GtkTreeViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getShowExpanders_ self
    fun getTooltipColumn self = (GtkTreeViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getTooltipColumn_ self
    fun getTooltipContext self x y keyboardTip =
      let
        val x
         & y
         & model
         & path
         & iter
         & retVal =
          (
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GBool.FFI.withVal
             &&&> GtkTreeModelClass.FFI.withRefOptPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeIterRecord.FFI.withNewPtr
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
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
        val visibleRect & () = (GtkTreeViewClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getVisibleRect_ (self & ())
      in
        visibleRect
      end
    fun insertColumn self column position =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GtkTreeViewColumnClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
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
            GtkTreeViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkTreeViewColumnClass.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkTreeViewColumnClass.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            isBlankAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
               & GInt.null
               & GInt.null
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
    fun moveColumnAfter self column baseColumn =
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
    fun removeColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeViewColumnClass.FFI.withPtr ---> GInt.FFI.fromVal) removeColumn_ (self & column)
    fun rowActivated self path column =
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
    fun scrollToCell self path column useAlign rowAlign colAlign =
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
    fun scrollToPoint self treeX treeY =
      (
        GtkTreeViewClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun setCursorOnCell self path focusColumn focusCell startEditing =
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
    fun setDragDestRow self path pos =
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
    fun setLevelIndentation self indentation = (GtkTreeViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setLevelIndentation_ (self & indentation)
    fun setModel self model = (GtkTreeViewClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    fun setReorderable self reorderable = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRubberBanding self enable = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRubberBanding_ (self & enable)
    fun setRulesHint self setting = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRulesHint_ (self & setting)
    fun setSearchColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSearchColumn_ (self & column)
    fun setSearchEntry self entry = (GtkTreeViewClass.FFI.withPtr &&&> GtkEntryClass.FFI.withOptPtr ---> I) setSearchEntry_ (self & entry)
    fun setShowExpanders self enabled = (GtkTreeViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setShowExpanders_ (self & enabled)
    fun setTooltipCell self tooltip path column cell =
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
    fun setTooltipColumn self column = (GtkTreeViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipRow self tooltip path =
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
