structure GtkIconView :>
  GTK_ICON_VIEW
    where type 'a class = 'a GtkIconViewClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a scrollable_class = 'a GtkScrollableClass.class
    where type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_view_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_icon_view_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithArea_ = call (getSymbol "gtk_icon_view_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithModel_ = call (getSymbol "gtk_icon_view_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val convertWidgetToBinWindowCoords_ =
        call (getSymbol "gtk_icon_view_convert_widget_to_bin_window_coords")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val createDragIcon_ = call (getSymbol "gtk_icon_view_create_drag_icon") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> CairoSurfaceRecord.PolyML.cPtr)
      val enableModelDragDest_ =
        call (getSymbol "gtk_icon_view_enable_model_drag_dest")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val enableModelDragSource_ =
        call (getSymbol "gtk_icon_view_enable_model_drag_source")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GdkModifierType.PolyML.cVal
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val getActivateOnSingleClick_ = call (getSymbol "gtk_icon_view_get_activate_on_single_click") (GtkIconViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCellRect_ =
        call (getSymbol "gtk_icon_view_get_cell_rect")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getColumnSpacing_ = call (getSymbol "gtk_icon_view_get_column_spacing") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getColumns_ = call (getSymbol "gtk_icon_view_get_columns") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCursor_ =
        call (getSymbol "gtk_icon_view_get_cursor")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkCellRendererClass.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getDestItemAtPos_ =
        call (getSymbol "gtk_icon_view_get_dest_item_at_pos")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkIconViewDropPosition.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getDragDestItem_ =
        call (getSymbol "gtk_icon_view_get_drag_dest_item")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkIconViewDropPosition.PolyML.cRef
             --> cVoid
          )
      val getItemAtPos_ =
        call (getSymbol "gtk_icon_view_get_item_at_pos")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkCellRendererClass.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val getItemColumn_ = call (getSymbol "gtk_icon_view_get_item_column") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getItemOrientation_ = call (getSymbol "gtk_icon_view_get_item_orientation") (GtkIconViewClass.PolyML.cPtr --> GtkOrientation.PolyML.cVal)
      val getItemPadding_ = call (getSymbol "gtk_icon_view_get_item_padding") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getItemRow_ = call (getSymbol "gtk_icon_view_get_item_row") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getItemWidth_ = call (getSymbol "gtk_icon_view_get_item_width") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMargin_ = call (getSymbol "gtk_icon_view_get_margin") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarkupColumn_ = call (getSymbol "gtk_icon_view_get_markup_column") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getModel_ = call (getSymbol "gtk_icon_view_get_model") (GtkIconViewClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cOptPtr)
      val getPathAtPos_ =
        call (getSymbol "gtk_icon_view_get_path_at_pos")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GtkTreePathRecord.PolyML.cOptPtr
          )
      val getPixbufColumn_ = call (getSymbol "gtk_icon_view_get_pixbuf_column") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getReorderable_ = call (getSymbol "gtk_icon_view_get_reorderable") (GtkIconViewClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRowSpacing_ = call (getSymbol "gtk_icon_view_get_row_spacing") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSelectionMode_ = call (getSymbol "gtk_icon_view_get_selection_mode") (GtkIconViewClass.PolyML.cPtr --> GtkSelectionMode.PolyML.cVal)
      val getSpacing_ = call (getSymbol "gtk_icon_view_get_spacing") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTextColumn_ = call (getSymbol "gtk_icon_view_get_text_column") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTooltipColumn_ = call (getSymbol "gtk_icon_view_get_tooltip_column") (GtkIconViewClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getTooltipContext_ =
        call (getSymbol "gtk_icon_view_get_tooltip_context")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GBool.PolyML.cVal
             &&> GtkTreeModelClass.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreeIterRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val getVisibleRange_ =
        call (getSymbol "gtk_icon_view_get_visible_range")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOutRef
             &&> GtkTreePathRecord.PolyML.cOutRef
             --> GBool.PolyML.cVal
          )
      val itemActivated_ = call (getSymbol "gtk_icon_view_item_activated") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val pathIsSelected_ = call (getSymbol "gtk_icon_view_path_is_selected") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val scrollToPath_ =
        call (getSymbol "gtk_icon_view_scroll_to_path")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GFloat.PolyML.cVal
             &&> GFloat.PolyML.cVal
             --> cVoid
          )
      val selectAll_ = call (getSymbol "gtk_icon_view_select_all") (GtkIconViewClass.PolyML.cPtr --> cVoid)
      val selectPath_ = call (getSymbol "gtk_icon_view_select_path") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val setActivateOnSingleClick_ = call (getSymbol "gtk_icon_view_set_activate_on_single_click") (GtkIconViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setColumnSpacing_ = call (getSymbol "gtk_icon_view_set_column_spacing") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setColumns_ = call (getSymbol "gtk_icon_view_set_columns") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setCursor_ =
        call (getSymbol "gtk_icon_view_set_cursor")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setDragDestItem_ =
        call (getSymbol "gtk_icon_view_set_drag_dest_item")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cOptPtr
             &&> GtkIconViewDropPosition.PolyML.cVal
             --> cVoid
          )
      val setItemOrientation_ = call (getSymbol "gtk_icon_view_set_item_orientation") (GtkIconViewClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> cVoid)
      val setItemPadding_ = call (getSymbol "gtk_icon_view_set_item_padding") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setItemWidth_ = call (getSymbol "gtk_icon_view_set_item_width") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMargin_ = call (getSymbol "gtk_icon_view_set_margin") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarkupColumn_ = call (getSymbol "gtk_icon_view_set_markup_column") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setModel_ = call (getSymbol "gtk_icon_view_set_model") (GtkIconViewClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> cVoid)
      val setPixbufColumn_ = call (getSymbol "gtk_icon_view_set_pixbuf_column") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setReorderable_ = call (getSymbol "gtk_icon_view_set_reorderable") (GtkIconViewClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRowSpacing_ = call (getSymbol "gtk_icon_view_set_row_spacing") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setSelectionMode_ = call (getSymbol "gtk_icon_view_set_selection_mode") (GtkIconViewClass.PolyML.cPtr &&> GtkSelectionMode.PolyML.cVal --> cVoid)
      val setSpacing_ = call (getSymbol "gtk_icon_view_set_spacing") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTextColumn_ = call (getSymbol "gtk_icon_view_set_text_column") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTooltipCell_ =
        call (getSymbol "gtk_icon_view_set_tooltip_cell")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cOptPtr
             --> cVoid
          )
      val setTooltipColumn_ = call (getSymbol "gtk_icon_view_set_tooltip_column") (GtkIconViewClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setTooltipItem_ =
        call (getSymbol "gtk_icon_view_set_tooltip_item")
          (
            GtkIconViewClass.PolyML.cPtr
             &&> GtkTooltipClass.PolyML.cPtr
             &&> GtkTreePathRecord.PolyML.cPtr
             --> cVoid
          )
      val unselectAll_ = call (getSymbol "gtk_icon_view_unselect_all") (GtkIconViewClass.PolyML.cPtr --> cVoid)
      val unselectPath_ = call (getSymbol "gtk_icon_view_unselect_path") (GtkIconViewClass.PolyML.cPtr &&> GtkTreePathRecord.PolyML.cPtr --> cVoid)
      val unsetModelDragDest_ = call (getSymbol "gtk_icon_view_unset_model_drag_dest") (GtkIconViewClass.PolyML.cPtr --> cVoid)
      val unsetModelDragSource_ = call (getSymbol "gtk_icon_view_unset_model_drag_source") (GtkIconViewClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkIconViewClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a scrollable_class = 'a GtkScrollableClass.class
    type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    fun asScrollable self = (GObjectObjectClass.FFI.withPtr false ---> GtkScrollableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkIconViewClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr false ---> GtkIconViewClass.FFI.fromPtr false) newWithArea_ area
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr false ---> GtkIconViewClass.FFI.fromPtr false) newWithModel_ model
    fun convertWidgetToBinWindowCoords self (wx, wy) =
      let
        val bx
         & by
         & () =
          (
            GtkIconViewClass.FFI.withPtr false
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
    fun createDragIcon self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> CairoSurfaceRecord.FFI.fromPtr true) createDragIcon_ (self & path)
    fun enableModelDragDest self (targets, actions) =
      let
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
        val () =
          (
            GtkIconViewClass.FFI.withPtr false
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
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
        val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
        val () =
          (
            GtkIconViewClass.FFI.withPtr false
             &&&> GdkModifierType.FFI.withVal
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
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
    fun getActivateOnSingleClick self = (GtkIconViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivateOnSingleClick_ self
    fun getCellRect self (path, cell) =
      let
        val rect & retVal =
          (
            GtkIconViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withPtr false
             &&&> GtkCellRendererClass.FFI.withOptPtr false
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
    fun getColumnSpacing self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getColumnSpacing_ self
    fun getColumns self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getColumns_ self
    fun getCursor self =
      let
        val path
         & cell
         & retVal =
          (
            GtkIconViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkCellRendererClass.FFI.withRefOptPtr false
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
            GtkIconViewClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
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
            GtkIconViewClass.FFI.withPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
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
            GtkIconViewClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
             &&&> GtkCellRendererClass.FFI.withRefOptPtr true
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
    fun getItemColumn self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getItemColumn_ (self & path)
    fun getItemOrientation self = (GtkIconViewClass.FFI.withPtr false ---> GtkOrientation.FFI.fromVal) getItemOrientation_ self
    fun getItemPadding self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getItemPadding_ self
    fun getItemRow self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getItemRow_ (self & path)
    fun getItemWidth self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getItemWidth_ self
    fun getMargin self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMargin_ self
    fun getMarkupColumn self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarkupColumn_ self
    fun getModel self = (GtkIconViewClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self
    fun getPathAtPos self (x, y) =
      (
        GtkIconViewClass.FFI.withPtr false
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
    fun getPixbufColumn self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getPixbufColumn_ self
    fun getReorderable self = (GtkIconViewClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReorderable_ self
    fun getRowSpacing self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getRowSpacing_ self
    fun getSelectionMode self = (GtkIconViewClass.FFI.withPtr false ---> GtkSelectionMode.FFI.fromVal) getSelectionMode_ self
    fun getSpacing self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getSpacing_ self
    fun getTextColumn self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getTextColumn_ self
    fun getTooltipColumn self = (GtkIconViewClass.FFI.withPtr false ---> GInt.FFI.fromVal) getTooltipColumn_ self
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
            GtkIconViewClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GBool.FFI.withVal
             &&&> GtkTreeModelClass.FFI.withRefOptPtr false
             &&&> GtkTreePathRecord.FFI.withRefOptPtr true
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
            GtkIconViewClass.FFI.withPtr false
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
    fun itemActivated self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) itemActivated_ (self & path)
    fun pathIsSelected self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> GBool.FFI.fromVal) pathIsSelected_ (self & path)
    fun scrollToPath
      self
      (
        path,
        useAlign,
        rowAlign,
        colAlign
      ) =
      (
        GtkIconViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
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
    fun selectAll self = (GtkIconViewClass.FFI.withPtr false ---> I) selectAll_ self
    fun selectPath self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) selectPath_ (self & path)
    fun setActivateOnSingleClick self single = (GtkIconViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivateOnSingleClick_ (self & single)
    fun setColumnSpacing self columnSpacing = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setColumnSpacing_ (self & columnSpacing)
    fun setColumns self columns = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setColumns_ (self & columns)
    fun setCursor
      self
      (
        path,
        cell,
        startEditing
      ) =
      (
        GtkIconViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withOptPtr false
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
        GtkIconViewClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withOptPtr false
         &&&> GtkIconViewDropPosition.FFI.withVal
         ---> I
      )
        setDragDestItem_
        (
          self
           & path
           & pos
        )
    fun setItemOrientation self orientation = (GtkIconViewClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> I) setItemOrientation_ (self & orientation)
    fun setItemPadding self itemPadding = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setItemPadding_ (self & itemPadding)
    fun setItemWidth self itemWidth = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setItemWidth_ (self & itemWidth)
    fun setMargin self margin = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMargin_ (self & margin)
    fun setMarkupColumn self column = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarkupColumn_ (self & column)
    fun setModel self model = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreeModelClass.FFI.withOptPtr false ---> I) setModel_ (self & model)
    fun setPixbufColumn self column = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setPixbufColumn_ (self & column)
    fun setReorderable self reorderable = (GtkIconViewClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReorderable_ (self & reorderable)
    fun setRowSpacing self rowSpacing = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setRowSpacing_ (self & rowSpacing)
    fun setSelectionMode self mode = (GtkIconViewClass.FFI.withPtr false &&&> GtkSelectionMode.FFI.withVal ---> I) setSelectionMode_ (self & mode)
    fun setSpacing self spacing = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setSpacing_ (self & spacing)
    fun setTextColumn self column = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setTextColumn_ (self & column)
    fun setTooltipCell
      self
      (
        tooltip,
        path,
        cell
      ) =
      (
        GtkIconViewClass.FFI.withPtr false
         &&&> GtkTooltipClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withOptPtr false
         ---> I
      )
        setTooltipCell_
        (
          self
           & tooltip
           & path
           & cell
        )
    fun setTooltipColumn self column = (GtkIconViewClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setTooltipColumn_ (self & column)
    fun setTooltipItem self (tooltip, path) =
      (
        GtkIconViewClass.FFI.withPtr false
         &&&> GtkTooltipClass.FFI.withPtr false
         &&&> GtkTreePathRecord.FFI.withPtr false
         ---> I
      )
        setTooltipItem_
        (
          self
           & tooltip
           & path
        )
    fun unselectAll self = (GtkIconViewClass.FFI.withPtr false ---> I) unselectAll_ self
    fun unselectPath self path = (GtkIconViewClass.FFI.withPtr false &&&> GtkTreePathRecord.FFI.withPtr false ---> I) unselectPath_ (self & path)
    fun unsetModelDragDest self = (GtkIconViewClass.FFI.withPtr false ---> I) unsetModelDragDest_ self
    fun unsetModelDragSource self = (GtkIconViewClass.FFI.withPtr false ---> I) unsetModelDragSource_ self
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
      val cellAreaProp =
        {
          name = "cell-area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val columnSpacingProp =
        {
          name = "column-spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val columnsProp =
        {
          name = "columns",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val itemOrientationProp =
        {
          name = "item-orientation",
          gtype = fn () => C.gtype GtkOrientation.t (),
          get = fn x => fn () => C.get GtkOrientation.t x,
          set = fn x => C.set GtkOrientation.t x,
          init = fn x => C.set GtkOrientation.t x
        }
      val itemPaddingProp =
        {
          name = "item-padding",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val itemWidthProp =
        {
          name = "item-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginProp =
        {
          name = "margin",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val markupColumnProp =
        {
          name = "markup-column",
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
      val pixbufColumnProp =
        {
          name = "pixbuf-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val reorderableProp =
        {
          name = "reorderable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val rowSpacingProp =
        {
          name = "row-spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val selectionModeProp =
        {
          name = "selection-mode",
          gtype = fn () => C.gtype GtkSelectionMode.t (),
          get = fn x => fn () => C.get GtkSelectionMode.t x,
          set = fn x => C.set GtkSelectionMode.t x,
          init = fn x => C.set GtkSelectionMode.t x
        }
      val spacingProp =
        {
          name = "spacing",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val textColumnProp =
        {
          name = "text-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
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
