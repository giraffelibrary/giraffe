structure GtkIconView :>
  GTK_ICON_VIEW
    where type 'a class = 'a GtkIconViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type target_entry_t = GtkTargetEntryRecord.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type icon_view_drop_position_t = GtkIconViewDropPosition.t
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type tree_path_t = GtkTreePathRecord.t
    where type movement_step_t = GtkMovementStep.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type orientation_t = GtkOrientation.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type selection_mode_t = GtkSelectionMode.t =
  struct
    structure GtkTargetEntryRecordCVectorNType =
      CValueCVectorNType(
        structure CElemType = GtkTargetEntryRecord.C.ValueType
        structure ElemSequence = CValueVectorSequence(GtkTargetEntryRecord.C.ValueType)
      )
    structure GtkTargetEntryRecordCVectorN = CVectorN(GtkTargetEntryRecordCVectorNType)
    val getType_ = _import "gtk_icon_view_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_icon_view_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithArea_ = _import "gtk_icon_view_new_with_area" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithModel_ = _import "gtk_icon_view_new_with_model" : GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val convertWidgetToBinWindowCoords_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_view_convert_widget_to_bin_window_coords" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val createDragIcon_ = fn x1 & x2 => (_import "gtk_icon_view_create_drag_icon" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> CairoSurfaceRecord.FFI.notnull CairoSurfaceRecord.FFI.p;) (x1, x2)
    val enableModelDragDest_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5 =>
          (
            _import "mlton_gtk_icon_view_enable_model_drag_dest" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTargetEntryRecordCVectorN.MLton.p1
               * GtkTargetEntryRecordCVectorN.FFI.notnull GtkTargetEntryRecordCVectorN.MLton.p2
               * GInt.FFI.val_
               * GdkDragAction.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val enableModelDragSource_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_icon_view_enable_model_drag_source" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GdkModifierType.FFI.val_
               * GtkTargetEntryRecordCVectorN.MLton.p1
               * GtkTargetEntryRecordCVectorN.FFI.notnull GtkTargetEntryRecordCVectorN.MLton.p2
               * GInt.FFI.val_
               * GdkDragAction.FFI.val_
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
    val getActivateOnSingleClick_ = _import "gtk_icon_view_get_activate_on_single_click" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GBool.FFI.val_;
    val getCellRect_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_view_get_cell_rect" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * unit GtkCellRendererClass.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getColumnSpacing_ = _import "gtk_icon_view_get_column_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getColumns_ = _import "gtk_icon_view_get_columns" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_view_get_cursor" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkCellRendererClass.FFI.notnull) GtkCellRendererClass.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getDestItemAtPos_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_view_get_dest_item_at_pos" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * GtkIconViewDropPosition.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getDragDestItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_view_get_drag_dest_item" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * GtkIconViewDropPosition.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getItemAtPos_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_view_get_item_at_pos" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkCellRendererClass.FFI.notnull) GtkCellRendererClass.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getItemColumn_ = fn x1 & x2 => (_import "gtk_icon_view_get_item_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getItemOrientation_ = _import "gtk_icon_view_get_item_orientation" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GtkOrientation.FFI.val_;
    val getItemPadding_ = _import "gtk_icon_view_get_item_padding" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getItemRow_ = fn x1 & x2 => (_import "gtk_icon_view_get_item_row" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val getItemWidth_ = _import "gtk_icon_view_get_item_width" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getMargin_ = _import "gtk_icon_view_get_margin" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getMarkupColumn_ = _import "gtk_icon_view_get_markup_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getModel_ = _import "gtk_icon_view_get_model" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> unit GtkTreeModelClass.FFI.p;
    val getPathAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_view_get_path_at_pos" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit GtkTreePathRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getPixbufColumn_ = _import "gtk_icon_view_get_pixbuf_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getReorderable_ = _import "gtk_icon_view_get_reorderable" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GBool.FFI.val_;
    val getRowSpacing_ = _import "gtk_icon_view_get_row_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getSelectionMode_ = _import "gtk_icon_view_get_selection_mode" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GtkSelectionMode.FFI.val_;
    val getSpacing_ = _import "gtk_icon_view_get_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getTextColumn_ = _import "gtk_icon_view_get_text_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
    val getTooltipColumn_ = _import "gtk_icon_view_get_tooltip_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> GInt.FFI.val_;
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
            _import "gtk_icon_view_get_tooltip_context" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
            _import "gtk_icon_view_get_visible_range" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               * (unit, GtkTreePathRecord.FFI.notnull) GtkTreePathRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val itemActivated_ = fn x1 & x2 => (_import "gtk_icon_view_item_activated" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val pathIsSelected_ = fn x1 & x2 => (_import "gtk_icon_view_path_is_selected" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val scrollToPath_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_icon_view_scroll_to_path" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
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
              x5
            )
    val selectAll_ = _import "gtk_icon_view_select_all" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> unit;
    val selectPath_ = fn x1 & x2 => (_import "gtk_icon_view_select_path" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val setActivateOnSingleClick_ = fn x1 & x2 => (_import "gtk_icon_view_set_activate_on_single_click" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpacing_ = fn x1 & x2 => (_import "gtk_icon_view_set_column_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setColumns_ = fn x1 & x2 => (_import "gtk_icon_view_set_columns" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setCursor_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_view_set_cursor" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * unit GtkCellRendererClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDragDestItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_view_set_drag_dest_item" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * unit GtkTreePathRecord.FFI.p
               * GtkIconViewDropPosition.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setItemOrientation_ = fn x1 & x2 => (_import "gtk_icon_view_set_item_orientation" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkOrientation.FFI.val_ -> unit;) (x1, x2)
    val setItemPadding_ = fn x1 & x2 => (_import "gtk_icon_view_set_item_padding" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setItemWidth_ = fn x1 & x2 => (_import "gtk_icon_view_set_item_width" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMargin_ = fn x1 & x2 => (_import "gtk_icon_view_set_margin" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarkupColumn_ = fn x1 & x2 => (_import "gtk_icon_view_set_markup_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_icon_view_set_model" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * unit GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
    val setPixbufColumn_ = fn x1 & x2 => (_import "gtk_icon_view_set_pixbuf_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setReorderable_ = fn x1 & x2 => (_import "gtk_icon_view_set_reorderable" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpacing_ = fn x1 & x2 => (_import "gtk_icon_view_set_row_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setSelectionMode_ = fn x1 & x2 => (_import "gtk_icon_view_set_selection_mode" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkSelectionMode.FFI.val_ -> unit;) (x1, x2)
    val setSpacing_ = fn x1 & x2 => (_import "gtk_icon_view_set_spacing" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTextColumn_ = fn x1 & x2 => (_import "gtk_icon_view_set_text_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTooltipCell_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_view_set_tooltip_cell" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               * unit GtkCellRendererClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setTooltipColumn_ = fn x1 & x2 => (_import "gtk_icon_view_set_tooltip_column" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTooltipItem_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_view_set_tooltip_item" :
              GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p
               * GtkTooltipClass.FFI.notnull GtkTooltipClass.FFI.p
               * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val unselectAll_ = _import "gtk_icon_view_unselect_all" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> unit;
    val unselectPath_ = fn x1 & x2 => (_import "gtk_icon_view_unselect_path" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p * GtkTreePathRecord.FFI.notnull GtkTreePathRecord.FFI.p -> unit;) (x1, x2)
    val unsetModelDragDest_ = _import "gtk_icon_view_unset_model_drag_dest" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> unit;
    val unsetModelDragSource_ = _import "gtk_icon_view_unset_model_drag_source" : GtkIconViewClass.FFI.notnull GtkIconViewClass.FFI.p -> unit;
    type 'a class = 'a GtkIconViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_t = GtkTargetEntryRecord.t
    type tree_iter_t = GtkTreeIterRecord.t
    type icon_view_drop_position_t = GtkIconViewDropPosition.t
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type tree_path_t = GtkTreePathRecord.t
    type movement_step_t = GtkMovementStep.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type orientation_t = GtkOrientation.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type selection_mode_t = GtkSelectionMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconViewClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr ---> GtkIconViewClass.FFI.fromPtr false) newWithArea_ area
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr ---> GtkIconViewClass.FFI.fromPtr false) newWithModel_ model
    fun convertWidgetToBinWindowCoords self (wx, wy) =
      let
        val bx
         & by
         & () =
          (
            GtkIconViewClass.FFI.withPtr
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
    fun createDragIcon self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> CairoSurfaceRecord.FFI.fromPtr true) createDragIcon_ (self & path)
    fun enableModelDragDest self (targets, actions) =
      let
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GtkTargetEntryRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
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
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCVectorN.length targets)
        val () =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GdkModifierType.FFI.withVal
             &&&> GtkTargetEntryRecordCVectorN.FFI.withPtr
             &&&> GInt.FFI.withVal
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
    fun getActivateOnSingleClick self = (GtkIconViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getCellRect self (path, cell) =
      let
        val rect & retVal =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withPtr
             &&&> GtkCellRendererClass.FFI.withOptPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            getCellRect_
            (
              self
               & path
               & cell
               & ()
            )
      in
        if retVal then SOME rect else NONE
      end
    fun getColumnSpacing self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getColumnSpacing_ self
    fun getColumns self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getColumns_ self
    fun getCursor self =
      let
        val path
         & cell
         & retVal =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkCellRendererClass.FFI.withRefOptPtr
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkCellRendererClass.FFI.fromPtr false
                   && GBool.FFI.fromVal
          )
            getCursor_
            (
              self
               & NONE
               & NONE
            )
      in
        if retVal then SOME (path, cell) else NONE
      end
    fun getDestItemAtPos self (dragX, dragY) =
      let
        val path
         & pos
         & retVal =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkIconViewDropPosition.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkIconViewDropPosition.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getDestItemAtPos_
            (
              self
               & dragX
               & dragY
               & NONE
               & GtkIconViewDropPosition.null
            )
      in
        if retVal then SOME (path, pos) else NONE
      end
    fun getDragDestItem self =
      let
        val path
         & pos
         & () =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkIconViewDropPosition.FFI.withRefVal
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkIconViewDropPosition.FFI.fromVal
                   && I
          )
            getDragDestItem_
            (
              self
               & NONE
               & GtkIconViewDropPosition.null
            )
      in
        (path, pos)
      end
    fun getItemAtPos self (x, y) =
      let
        val path
         & cell
         & retVal =
          (
            GtkIconViewClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr
             &&&> GtkCellRendererClass.FFI.withRefOptPtr
             ---> GtkTreePathRecord.FFI.fromPtr true
                   && GtkCellRendererClass.FFI.fromPtr true
                   && GBool.FFI.fromVal
          )
            getItemAtPos_
            (
              self
               & x
               & y
               & NONE
               & NONE
            )
      in
        if retVal then SOME (path, cell) else NONE
      end
    fun getItemColumn self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GInt.FFI.fromVal) getItemColumn_ (self & path)
    fun getItemOrientation self = (GtkIconViewClass.FFI.withPtr ---> GtkOrientation.FFI.fromVal) getItemOrientation_ self
    fun getItemPadding self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getItemPadding_ self
    fun getItemRow self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GInt.FFI.fromVal) getItemRow_ (self & path)
    fun getItemWidth self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getItemWidth_ self
    fun getMargin self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getMargin_ self
    fun getMarkupColumn self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getMarkupColumn_ self
    fun getModel self = (GtkIconViewClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self
    fun getPathAtPos self (x, y) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GtkTreePathRecord.FFI.fromOptPtr true
      )
        getPathAtPos_
        (
          self
           & x
           & y
        )
    fun getPixbufColumn self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getPixbufColumn_ self
    fun getReorderable self = (GtkIconViewClass.FFI.withPtr ---> GBool.FFI.fromVal) getReorderable_ self
    fun getRowSpacing self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getRowSpacing_ self
    fun getSelectionMode self = (GtkIconViewClass.FFI.withPtr ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun getSpacing self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getSpacing_ self
    fun getTextColumn self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getTextColumn_ self
    fun getTooltipColumn self = (GtkIconViewClass.FFI.withPtr ---> GInt.FFI.fromVal) getTooltipColumn_ self
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
            GtkIconViewClass.FFI.withPtr
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
            GtkIconViewClass.FFI.withPtr
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
    fun itemActivated self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) itemActivated_ (self & path)
    fun pathIsSelected self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> GBool.FFI.fromVal) pathIsSelected_ (self & path)
    fun scrollToPath
      self
      (
        path,
        useAlign,
        rowAlign,
        colAlign
      ) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GFloat.FFI.withVal
         &&&> GFloat.FFI.withVal
         ---> I
      )
        scrollToPath_
        (
          self
           & path
           & useAlign
           & rowAlign
           & colAlign
        )
    fun selectAll self = (GtkIconViewClass.FFI.withPtr ---> I) selectAll_ self
    fun selectPath self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) selectPath_ (self & path)
    fun setActivateOnSingleClick self single = (GtkIconViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setColumnSpacing self columnSpacing = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setColumnSpacing_ (self & columnSpacing)
    fun setColumns self columns = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setColumns_ (self & columns)
    fun setCursor
      self
      (
        path,
        cell,
        startEditing
      ) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withOptPtr
         &&&> GBool.FFI.withVal
         ---> I
      )
        setCursor_
        (
          self
           & path
           & cell
           & startEditing
        )
    fun setDragDestItem self (path, pos) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withOptPtr
         &&&> GtkIconViewDropPosition.FFI.withVal
         ---> I
      )
        setDragDestItem_
        (
          self
           & path
           & pos
        )
    fun setItemOrientation self orientation = (GtkIconViewClass.FFI.withPtr &&&> GtkOrientation.FFI.withVal ---> I) setItemOrientation_ (self & orientation)
    fun setItemPadding self itemPadding = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setItemPadding_ (self & itemPadding)
    fun setItemWidth self itemWidth = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setItemWidth_ (self & itemWidth)
    fun setMargin self margin = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMargin_ (self & margin)
    fun setMarkupColumn self column = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMarkupColumn_ (self & column)
    fun setModel self model = (GtkIconViewClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    fun setPixbufColumn self column = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setPixbufColumn_ (self & column)
    fun setReorderable self reorderable = (GtkIconViewClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRowSpacing self rowSpacing = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setRowSpacing_ (self & rowSpacing)
    fun setSelectionMode self mode = (GtkIconViewClass.FFI.withPtr &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun setSpacing self spacing = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTextColumn self column = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setTextColumn_ (self & column)
    fun setTooltipCell
      self
      (
        tooltip,
        path,
        cell
      ) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GtkTooltipClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withOptPtr
         ---> I
      )
        setTooltipCell_
        (
          self
           & tooltip
           & path
           & cell
        )
    fun setTooltipColumn self column = (GtkIconViewClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipItem self (tooltip, path) =
      (
        GtkIconViewClass.FFI.withPtr
         &&&> GtkTooltipClass.FFI.withPtr
         &&&> GtkTreePathRecord.FFI.withPtr
         ---> I
      )
        setTooltipItem_
        (
          self
           & tooltip
           & path
        )
    fun unselectAll self = (GtkIconViewClass.FFI.withPtr ---> I) unselectAll_ self
    fun unselectPath self path = (GtkIconViewClass.FFI.withPtr &&&> GtkTreePathRecord.FFI.withPtr ---> I) unselectPath_ (self & path)
    fun unsetModelDragDest self = (GtkIconViewClass.FFI.withPtr ---> I) unsetModelDragDest_ self
    fun unsetModelDragSource self = (GtkIconViewClass.FFI.withPtr ---> I) unsetModelDragSource_ self
    local
      open ClosureMarshal Signal
    in
      fun activateCursorItemSig f = signal "activate-cursor-item" (void ---> ret boolean) f
      fun itemActivatedSig f = signal "item-activated" (get 0w1 GtkTreePathRecord.t ---> ret_void) f
      fun moveCursorSig f = signal "move-cursor" (get 0w1 GtkMovementStep.t &&&> get 0w2 int ---> ret boolean) (fn step & count => f (step, count))
      fun selectAllSig f = signal "select-all" (void ---> ret_void) f
      fun selectCursorItemSig f = signal "select-cursor-item" (void ---> ret_void) f
      fun selectionChangedSig f = signal "selection-changed" (void ---> ret_void) f
      fun toggleCursorItemSig f = signal "toggle-cursor-item" (void ---> ret_void) f
      fun unselectAllSig f = signal "unselect-all" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activateOnSingleClickProp =
        {
          get = fn x => get "activate-on-single-click" boolean x,
          set = fn x => set "activate-on-single-click" boolean x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val columnSpacingProp =
        {
          get = fn x => get "column-spacing" int x,
          set = fn x => set "column-spacing" int x
        }
      val columnsProp =
        {
          get = fn x => get "columns" int x,
          set = fn x => set "columns" int x
        }
      val itemOrientationProp =
        {
          get = fn x => get "item-orientation" GtkOrientation.t x,
          set = fn x => set "item-orientation" GtkOrientation.t x
        }
      val itemPaddingProp =
        {
          get = fn x => get "item-padding" int x,
          set = fn x => set "item-padding" int x
        }
      val itemWidthProp =
        {
          get = fn x => get "item-width" int x,
          set = fn x => set "item-width" int x
        }
      val marginProp =
        {
          get = fn x => get "margin" int x,
          set = fn x => set "margin" int x
        }
      val markupColumnProp =
        {
          get = fn x => get "markup-column" int x,
          set = fn x => set "markup-column" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val pixbufColumnProp =
        {
          get = fn x => get "pixbuf-column" int x,
          set = fn x => set "pixbuf-column" int x
        }
      val reorderableProp =
        {
          get = fn x => get "reorderable" boolean x,
          set = fn x => set "reorderable" boolean x
        }
      val rowSpacingProp =
        {
          get = fn x => get "row-spacing" int x,
          set = fn x => set "row-spacing" int x
        }
      val selectionModeProp =
        {
          get = fn x => get "selection-mode" GtkSelectionMode.t x,
          set = fn x => set "selection-mode" GtkSelectionMode.t x
        }
      val spacingProp =
        {
          get = fn x => get "spacing" int x,
          set = fn x => set "spacing" int x
        }
      val textColumnProp =
        {
          get = fn x => get "text-column" int x,
          set = fn x => set "text-column" int x
        }
      val tooltipColumnProp =
        {
          get = fn x => get "tooltip-column" int x,
          set = fn x => set "tooltip-column" int x
        }
    end
  end
