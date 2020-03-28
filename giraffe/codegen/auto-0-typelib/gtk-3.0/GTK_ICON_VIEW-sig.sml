signature GTK_ICON_VIEW =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type 'a scrollable_class
    type target_entry_record_c_array_n_t
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
       -> target_entry_record_c_array_n_t * Gdk.DragAction.t
       -> unit
    val enableModelDragSource :
      'a class
       -> Gdk.ModifierType.t
           * target_entry_record_c_array_n_t
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
    val getModel : 'a class -> base tree_model_class option
    val getPathAtPos :
      'a class
       -> LargeInt.int * LargeInt.int
       -> tree_path_t option
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
    val activateOnSingleClickProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val cellAreaProp :
      {
        get : 'a class -> base cell_area_class option,
        new : 'b cell_area_class option -> 'a class Property.t
      }
    val columnSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val columnsProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val itemOrientationProp :
      {
        get : 'a class -> orientation_t,
        set :
          orientation_t
           -> 'a class
           -> unit,
        new : orientation_t -> 'a class Property.t
      }
    val itemPaddingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val itemWidthProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val marginProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val markupColumnProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val modelProp :
      {
        get : 'a class -> base tree_model_class option,
        set :
          'b tree_model_class option
           -> 'a class
           -> unit,
        new : 'b tree_model_class option -> 'a class Property.t
      }
    val pixbufColumnProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val reorderableProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val rowSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val selectionModeProp :
      {
        get : 'a class -> selection_mode_t,
        set :
          selection_mode_t
           -> 'a class
           -> unit,
        new : selection_mode_t -> 'a class Property.t
      }
    val spacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val textColumnProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val tooltipColumnProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end
