signature GTK_CELL_AREA =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type direction_type_t
    type size_request_mode_t
    type cell_renderer_state_t
    type 'a cell_area_context_class
    type 'a widget_class
    type orientation_t
    type tree_iter_t
    type 'a tree_model_class
    type 'a cell_editable_class
    type 'a cell_renderer_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val activate :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
           * bool
       -> bool
    val activateCell :
      'a class
       -> 'b widget_class
           * 'c cell_renderer_class
           * 'd Gdk.Event.union
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
       -> bool
    val add :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val addFocusSibling :
      'a class
       -> 'b cell_renderer_class * 'c cell_renderer_class
       -> unit
    val applyAttributes :
      'a class
       -> 'b tree_model_class
           * tree_iter_t
           * bool
           * bool
       -> unit
    val attributeConnect :
      'a class
       -> 'b cell_renderer_class
           * string
           * LargeInt.int
       -> unit
    val attributeDisconnect :
      'a class
       -> 'b cell_renderer_class * string
       -> unit
    val attributeGetColumn :
      'a class
       -> 'b cell_renderer_class * string
       -> LargeInt.int
    val cellGetProperty :
      'a class
       -> 'b cell_renderer_class
           * string
           * GObject.ValueRecord.t
       -> unit
    val cellSetProperty :
      'a class
       -> 'b cell_renderer_class
           * string
           * GObject.ValueRecord.t
       -> unit
    val copyContext :
      'a class
       -> 'b cell_area_context_class
       -> base cell_area_context_class
    val createContext : 'a class -> base cell_area_context_class
    val event :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * 'd Gdk.Event.union
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
       -> LargeInt.int
    val focus :
      'a class
       -> direction_type_t
       -> bool
    val getCellAllocation :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * 'd cell_renderer_class
           * Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
    val getCellAtPosition :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * Gdk.RectangleRecord.t
           * LargeInt.int
           * LargeInt.int
       -> base cell_renderer_class * Gdk.RectangleRecord.t
    val getCurrentPathString : 'a class -> string
    val getEditWidget : 'a class -> base cell_editable_class
    val getEditedCell : 'a class -> base cell_renderer_class
    val getFocusCell : 'a class -> base cell_renderer_class
    val getFocusFromSibling :
      'a class
       -> 'b cell_renderer_class
       -> base cell_renderer_class
    val getPreferredHeight :
      'a class
       -> 'b cell_area_context_class * 'c widget_class
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredWidth :
      'a class
       -> 'b cell_area_context_class * 'c widget_class
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class -> size_request_mode_t
    val hasRenderer :
      'a class
       -> 'b cell_renderer_class
       -> bool
    val innerCellArea :
      'a class
       -> 'b widget_class * Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
    val isActivatable : 'a class -> bool
    val isFocusSibling :
      'a class
       -> 'b cell_renderer_class * 'c cell_renderer_class
       -> bool
    val remove :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val removeFocusSibling :
      'a class
       -> 'b cell_renderer_class * 'c cell_renderer_class
       -> unit
    val render :
      'a class
       -> 'b cell_area_context_class
           * 'c widget_class
           * Cairo.ContextRecord.t
           * Gdk.RectangleRecord.t
           * Gdk.RectangleRecord.t
           * cell_renderer_state_t
           * bool
       -> unit
    val requestRenderer :
      'a class
       -> 'b cell_renderer_class
           * orientation_t
           * 'c widget_class
           * LargeInt.int
       -> LargeInt.int * LargeInt.int
    val setFocusCell :
      'a class
       -> 'b cell_renderer_class
       -> unit
    val stopEditing :
      'a class
       -> bool
       -> unit
    val addEditableSig :
      (base cell_renderer_class
        * base cell_editable_class
        * Gdk.RectangleRecord.t
        * string
        -> unit)
       -> 'a class Signal.t
    val applyAttributesSig :
      (base tree_model_class
        * tree_iter_t
        * bool
        * bool
        -> unit)
       -> 'a class Signal.t
    val focusChangedSig : (base cell_renderer_class * string -> unit) -> 'a class Signal.t
    val removeEditableSig : (base cell_renderer_class * base cell_editable_class -> unit) -> 'a class Signal.t
    val editWidgetProp : ('a class, base cell_editable_class option) Property.readonly
    val editedCellProp : ('a class, base cell_renderer_class option) Property.readonly
    val focusCellProp : ('a class, base cell_renderer_class option, 'b cell_renderer_class option) Property.readwrite
  end
