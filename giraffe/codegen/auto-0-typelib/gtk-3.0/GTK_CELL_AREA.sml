signature GTK_CELL_AREA =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type 'a celllayoutclass_t
    type directiontype_t
    type sizerequestmode_t
    type cellrendererstate_t
    type 'a cellareacontextclass_t
    type 'a widgetclass_t
    type orientation_t
    type treeiterrecord_t
    type 'a treemodelclass_t
    type 'a celleditableclass_t
    type 'a cellrendererclass_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> bool
       -> bool
    val activateCell :
      'a class_t
       -> 'b widgetclass_t
       -> 'c cellrendererclass_t
       -> 'd Gdk.Event.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> bool
    val add :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val addFocusSibling :
      'a class_t
       -> 'b cellrendererclass_t
       -> 'c cellrendererclass_t
       -> unit
    val applyAttributes :
      'a class_t
       -> 'b treemodelclass_t
       -> treeiterrecord_t
       -> bool
       -> bool
       -> unit
    val attributeConnect :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> LargeInt.int
       -> unit
    val attributeDisconnect :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> unit
    val cellGetProperty :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val cellSetProperty :
      'a class_t
       -> 'b cellrendererclass_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val copyContext :
      'a class_t
       -> 'b cellareacontextclass_t
       -> base cellareacontextclass_t
    val createContext : 'a class_t -> base cellareacontextclass_t
    val event :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> 'd Gdk.Event.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> LargeInt.int
    val focus :
      'a class_t
       -> directiontype_t
       -> bool
    val getCellAllocation :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> 'd cellrendererclass_t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
    val getCellAtPosition :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> Cairo.RectangleIntRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> base cellrendererclass_t * Cairo.RectangleIntRecord.t
    val getCurrentPathString : 'a class_t -> string
    val getEditWidget : 'a class_t -> base celleditableclass_t
    val getEditedCell : 'a class_t -> base cellrendererclass_t
    val getFocusCell : 'a class_t -> base cellrendererclass_t
    val getFocusFromSibling :
      'a class_t
       -> 'b cellrendererclass_t
       -> base cellrendererclass_t
    val getPreferredHeight :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredWidth :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class_t -> sizerequestmode_t
    val hasRenderer :
      'a class_t
       -> 'b cellrendererclass_t
       -> bool
    val innerCellArea :
      'a class_t
       -> 'b widgetclass_t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
    val isActivatable : 'a class_t -> bool
    val isFocusSibling :
      'a class_t
       -> 'b cellrendererclass_t
       -> 'c cellrendererclass_t
       -> bool
    val remove :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val removeFocusSibling :
      'a class_t
       -> 'b cellrendererclass_t
       -> 'c cellrendererclass_t
       -> unit
    val render :
      'a class_t
       -> 'b cellareacontextclass_t
       -> 'c widgetclass_t
       -> Cairo.ContextRecord.t
       -> Cairo.RectangleIntRecord.t
       -> Cairo.RectangleIntRecord.t
       -> cellrendererstate_t
       -> bool
       -> unit
    val requestRenderer :
      'a class_t
       -> 'b cellrendererclass_t
       -> orientation_t
       -> 'c widgetclass_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val setFocusCell :
      'a class_t
       -> 'b cellrendererclass_t
       -> unit
    val stopEditing :
      'a class_t
       -> bool
       -> unit
    val addEditableSig :
      (base cellrendererclass_t
        -> base celleditableclass_t
        -> Cairo.RectangleIntRecord.t
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val applyAttributesSig :
      (base treemodelclass_t
        -> treeiterrecord_t
        -> bool
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val focusChangedSig :
      (base cellrendererclass_t
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val removeEditableSig :
      (base cellrendererclass_t
        -> base celleditableclass_t
        -> unit)
       -> 'a class_t Signal.signal
    val editWidgetProp : ('a class_t, base celleditableclass_t option) Property.readonly
    val editedCellProp : ('a class_t, base cellrendererclass_t option) Property.readonly
    val focusCellProp : ('a class_t, base cellrendererclass_t option, 'b cellrendererclass_t option) Property.readwrite
  end
