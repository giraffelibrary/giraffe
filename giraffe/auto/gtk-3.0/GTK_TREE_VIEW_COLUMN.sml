signature GTK_TREE_VIEW_COLUMN =
  sig
    type 'a class_t
    type 'a widgetclass_t
    type sorttype_t
    type treeviewcolumnsizing_t
    type 'a cellareaclass_t
    type 'a cellrendererclass_t
    type 'a treemodelclass_t
    type treeiterrecord_t
    type 'a celllayoutclass_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithArea : 'a cellareaclass_t -> base class_t
    val addAttribute :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> LargeInt.int
       -> unit
    val cellGetPosition :
      'a class_t
       -> 'b cellrendererclass_t
       -> (LargeInt.int * LargeInt.int) option
    val cellGetSize :
      'a class_t
       -> Gdk.RectangleRecord.t option
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
    val cellIsVisible : 'a class_t -> bool
    val cellSetCellData :
      'a class_t
       -> 'b treemodelclass_t
       -> treeiterrecord_t
       -> bool
       -> bool
       -> unit
    val clear : 'a class_t -> unit
    val clearAttributes :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val clicked : 'a class_t -> unit
    val focusCell :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val getAlignment : 'a class_t -> real
    val getButton : 'a class_t -> base widgetclass_t
    val getClickable : 'a class_t -> bool
    val getExpand : 'a class_t -> bool
    val getFixedWidth : 'a class_t -> LargeInt.int
    val getMaxWidth : 'a class_t -> LargeInt.int
    val getMinWidth : 'a class_t -> LargeInt.int
    val getReorderable : 'a class_t -> bool
    val getResizable : 'a class_t -> bool
    val getSizing : 'a class_t -> treeviewcolumnsizing_t
    val getSortColumnId : 'a class_t -> LargeInt.int
    val getSortIndicator : 'a class_t -> bool
    val getSortOrder : 'a class_t -> sorttype_t
    val getSpacing : 'a class_t -> LargeInt.int
    val getTitle : 'a class_t -> string
    val getTreeView : 'a class_t -> base widgetclass_t
    val getVisible : 'a class_t -> bool
    val getWidget : 'a class_t -> base widgetclass_t
    val getWidth : 'a class_t -> LargeInt.int
    val getXOffset : 'a class_t -> LargeInt.int
    val packEnd :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
       -> unit
    val packStart :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
       -> unit
    val queueResize : 'a class_t -> unit
    val setAlignment :
      'a class_t
       -> real
       -> unit
    val setClickable :
      'a class_t
       -> bool
       -> unit
    val setExpand :
      'a class_t
       -> bool
       -> unit
    val setFixedWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMaxWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setMinWidth :
      'a class_t
       -> LargeInt.int
       -> unit
    val setReorderable :
      'a class_t
       -> bool
       -> unit
    val setResizable :
      'a class_t
       -> bool
       -> unit
    val setSizing :
      'a class_t
       -> treeviewcolumnsizing_t
       -> unit
    val setSortColumnId :
      'a class_t
       -> LargeInt.int
       -> unit
    val setSortIndicator :
      'a class_t
       -> bool
       -> unit
    val setSortOrder :
      'a class_t
       -> sorttype_t
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setTitle :
      'a class_t
       -> string
       -> unit
    val setVisible :
      'a class_t
       -> bool
       -> unit
    val setWidget :
      'a class_t
       -> 'b widgetclass_t option
       -> unit
    val clickedSig : (unit -> unit) -> 'a class_t Signal.signal
    val alignmentProp : ('a class_t, real, real) Property.readwrite
    val cellAreaProp : ('a class_t, base cellareaclass_t option, 'b cellareaclass_t option) Property.readwrite
    val clickableProp : ('a class_t, bool, bool) Property.readwrite
    val expandProp : ('a class_t, bool, bool) Property.readwrite
    val fixedWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val maxWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val minWidthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val reorderableProp : ('a class_t, bool, bool) Property.readwrite
    val resizableProp : ('a class_t, bool, bool) Property.readwrite
    val sizingProp : ('a class_t, treeviewcolumnsizing_t, treeviewcolumnsizing_t) Property.readwrite
    val sortColumnIdProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val sortIndicatorProp : ('a class_t, bool, bool) Property.readwrite
    val sortOrderProp : ('a class_t, sorttype_t, sorttype_t) Property.readwrite
    val spacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val titleProp : ('a class_t, string option, string option) Property.readwrite
    val visibleProp : ('a class_t, bool, bool) Property.readwrite
    val widgetProp : ('a class_t, base widgetclass_t option, 'b widgetclass_t option) Property.readwrite
    val widthProp : ('a class_t, LargeInt.int) Property.readonly
    val xOffsetProp : ('a class_t, LargeInt.int) Property.readonly
  end
