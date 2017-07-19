signature GTK_TREE_VIEW_COLUMN =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type tree_iter_t
    type 'a tree_model_class
    type 'a cell_renderer_class
    type 'a cell_area_class
    type tree_view_column_sizing_t
    type sort_type_t
    type 'a widget_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithArea : 'a cell_area_class -> base class
    val addAttribute :
      'a class
       -> 'b cell_renderer_class
           * string
           * LargeInt.int
       -> unit
    val cellGetPosition :
      'a class
       -> 'b cell_renderer_class
       -> (LargeInt.int * LargeInt.int) option
    val cellGetSize :
      'a class
       -> Cairo.RectangleIntRecord.t option
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val cellIsVisible : 'a class -> bool
    val cellSetCellData :
      'a class
       -> 'b tree_model_class
           * tree_iter_t
           * bool
           * bool
       -> unit
    val clear : 'a class -> unit
    val clearAttributes :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val clicked : 'a class -> unit
    val focusCell :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val getAlignment : 'a class -> real
    val getButton : 'a class -> base widget_class
    val getClickable : 'a class -> bool
    val getExpand : 'a class -> bool
    val getFixedWidth : 'a class -> LargeInt.int
    val getMaxWidth : 'a class -> LargeInt.int
    val getMinWidth : 'a class -> LargeInt.int
    val getReorderable : 'a class -> bool
    val getResizable : 'a class -> bool
    val getSizing : 'a class -> tree_view_column_sizing_t
    val getSortColumnId : 'a class -> LargeInt.int
    val getSortIndicator : 'a class -> bool
    val getSortOrder : 'a class -> sort_type_t
    val getSpacing : 'a class -> LargeInt.int
    val getTitle : 'a class -> string
    val getTreeView : 'a class -> base widget_class
    val getVisible : 'a class -> bool
    val getWidget : 'a class -> base widget_class
    val getWidth : 'a class -> LargeInt.int
    val getXOffset : 'a class -> LargeInt.int
    val packEnd :
      'a class
       -> 'b cell_renderer_class * bool
       -> unit
    val packStart :
      'a class
       -> 'b cell_renderer_class * bool
       -> unit
    val queueResize : 'a class -> unit
    val setAlignment :
      'a class
       -> real
       -> unit
    val setClickable :
      'a class
       -> bool
       -> unit
    val setExpand :
      'a class
       -> bool
       -> unit
    val setFixedWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setMaxWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setMinWidth :
      'a class
       -> LargeInt.int
       -> unit
    val setReorderable :
      'a class
       -> bool
       -> unit
    val setResizable :
      'a class
       -> bool
       -> unit
    val setSizing :
      'a class
       -> tree_view_column_sizing_t
       -> unit
    val setSortColumnId :
      'a class
       -> LargeInt.int
       -> unit
    val setSortIndicator :
      'a class
       -> bool
       -> unit
    val setSortOrder :
      'a class
       -> sort_type_t
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setTitle :
      'a class
       -> string
       -> unit
    val setVisible :
      'a class
       -> bool
       -> unit
    val setWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val clickedSig : (unit -> unit) -> 'a class Signal.signal
    val alignmentProp : ('a class, real, real) Property.readwrite
    val cellAreaProp : ('a class, base cell_area_class option, 'b cell_area_class option) Property.readwrite
    val clickableProp : ('a class, bool, bool) Property.readwrite
    val expandProp : ('a class, bool, bool) Property.readwrite
    val fixedWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val maxWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val minWidthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val reorderableProp : ('a class, bool, bool) Property.readwrite
    val resizableProp : ('a class, bool, bool) Property.readwrite
    val sizingProp : ('a class, tree_view_column_sizing_t, tree_view_column_sizing_t) Property.readwrite
    val sortColumnIdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val sortIndicatorProp : ('a class, bool, bool) Property.readwrite
    val sortOrderProp : ('a class, sort_type_t, sort_type_t) Property.readwrite
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val titleProp : ('a class, string option, string option) Property.readwrite
    val visibleProp : ('a class, bool, bool) Property.readwrite
    val widgetProp : ('a class, base widget_class option, 'b widget_class option) Property.readwrite
    val widthProp : ('a class, LargeInt.int) Property.readonly
    val xOffsetProp : ('a class, LargeInt.int) Property.readonly
  end
