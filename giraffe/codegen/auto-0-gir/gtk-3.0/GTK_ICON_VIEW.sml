signature GTK_ICON_VIEW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type 'a scrollable_class
    type target_entry_t
    type tree_iter_t
    type icon_view_drop_position_t
    type 'a cell_renderer_class
    type 'a tooltip_class
    type tree_path_t
    type movement_step_t
    type 'a cell_area_class
    type orientation_t
    type 'a tree_model_class
    type selection_mode_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val asScrollable : 'a class -> base scrollable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithArea : 'a cell_area_class -> base class
    val newWithModel : 'a tree_model_class -> base class
    val convertWidgetToBinWindowCoords :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val createDragIcon :
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
    val getActivateOnSingleClick : 'a class -> bool
    val getCellRect :
      'a class
       -> tree_path_t * 'b cell_renderer_class option
       -> Gdk.RectangleRecord.t option
    val getColumnSpacing : 'a class -> LargeInt.int
    val getColumns : 'a class -> LargeInt.int
    val getCursor : 'a class -> (tree_path_t * base cell_renderer_class) option
    val getDestItemAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (tree_path_t * icon_view_drop_position_t) option
    val getDragDestItem : 'a class -> tree_path_t * icon_view_drop_position_t
    val getItemAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> (tree_path_t * base cell_renderer_class) option
    val getItemColumn :
      'a class
       -> tree_path_t
       -> LargeInt.int
    val getItemOrientation : 'a class -> orientation_t
    val getItemPadding : 'a class -> LargeInt.int
    val getItemRow :
      'a class
       -> tree_path_t
       -> LargeInt.int
    val getItemWidth : 'a class -> LargeInt.int
    val getMargin : 'a class -> LargeInt.int
    val getMarkupColumn : 'a class -> LargeInt.int
    val getModel : 'a class -> base tree_model_class
    val getPathAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> tree_path_t
    val getPixbufColumn : 'a class -> LargeInt.int
    val getReorderable : 'a class -> bool
    val getRowSpacing : 'a class -> LargeInt.int
    val getSelectionMode : 'a class -> selection_mode_t
    val getSpacing : 'a class -> LargeInt.int
    val getTextColumn : 'a class -> LargeInt.int
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
    val getVisibleRange : 'a class -> (tree_path_t * tree_path_t) option
    val itemActivated :
      'a class
       -> tree_path_t
       -> unit
    val pathIsSelected :
      'a class
       -> tree_path_t
       -> bool
    val scrollToPath :
      'a class
       -> tree_path_t
           * bool
           * real
           * real
       -> unit
    val selectAll : 'a class -> unit
    val selectPath :
      'a class
       -> tree_path_t
       -> unit
    val setActivateOnSingleClick :
      'a class
       -> bool
       -> unit
    val setColumnSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setColumns :
      'a class
       -> LargeInt.int
       -> unit
    val setCursor :
      'a class
       -> tree_path_t
           * 'b cell_renderer_class option
           * bool
       -> unit
    val setDragDestItem :
      'a class
       -> tree_path_t option * icon_view_drop_position_t
       -> unit
    val setItemOrientation :
      'a class
       -> orientation_t
       -> unit
    val setItemPadding :
      'a class
       -> LargeInt.int
       -> unit
    val setItemWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setMargin :
      'a class
       -> LargeInt.int
       -> unit
    val setMarkupColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setModel :
      'a class
       -> 'b tree_model_class option
       -> unit
    val setPixbufColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setReorderable :
      'a class
       -> bool
       -> unit
    val setRowSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setSelectionMode :
      'a class
       -> selection_mode_t
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setTextColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setTooltipCell :
      'a class
       -> 'b tooltip_class
           * tree_path_t
           * 'c cell_renderer_class option
       -> unit
    val setTooltipColumn :
      'a class
       -> LargeInt.int
       -> unit
    val setTooltipItem :
      'a class
       -> 'b tooltip_class * tree_path_t
       -> unit
    val unselectAll : 'a class -> unit
    val unselectPath :
      'a class
       -> tree_path_t
       -> unit
    val unsetModelDragDest : 'a class -> unit
    val unsetModelDragSource : 'a class -> unit
    val activateCursorItemSig : (unit -> bool) -> 'a class Signal.t
    val itemActivatedSig : (tree_path_t -> unit) -> 'a class Signal.t
    val moveCursorSig : (movement_step_t * LargeInt.int -> bool) -> 'a class Signal.t
    val selectAllSig : (unit -> unit) -> 'a class Signal.t
    val selectCursorItemSig : (unit -> unit) -> 'a class Signal.t
    val selectionChangedSig : (unit -> unit) -> 'a class Signal.t
    val toggleCursorItemSig : (unit -> unit) -> 'a class Signal.t
    val unselectAllSig : (unit -> unit) -> 'a class Signal.t
    val activateOnSingleClickProp : ('a class, bool, bool) Property.readwrite
    val cellAreaProp : ('a class, base cell_area_class option, 'b cell_area_class option) Property.readwrite
    val columnSpacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val columnsProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val itemOrientationProp : ('a class, orientation_t, orientation_t) Property.readwrite
    val itemPaddingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val itemWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val marginProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val markupColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
    val pixbufColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val reorderableProp : ('a class, bool, bool) Property.readwrite
    val rowSpacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val selectionModeProp : ('a class, selection_mode_t, selection_mode_t) Property.readwrite
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val textColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val tooltipColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
