signature GTK_CELL_AREA =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_layout_class_t
    type direction_type_t
    type size_request_mode_t
    type cell_renderer_state_t
    type 'a cell_area_context_class_t
    type 'a widget_class_t
    type orientation_t
    type tree_iter_record_t
    type 'a tree_model_class_t
    type 'a cell_editable_class_t
    type 'a cell_renderer_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val getType : unit -> GObject.Type.t
    val activate :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> bool
       -> bool
    val activateCell :
      'a class_t
       -> 'b widget_class_t
       -> 'c cell_renderer_class_t
       -> 'd Gdk.Event.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> bool
    val add :
      'a class_t
       -> 'b cell_renderer_class_t
       -> unit
    val addFocusSibling :
      'a class_t
       -> 'b cell_renderer_class_t
       -> 'c cell_renderer_class_t
       -> unit
    val applyAttributes :
      'a class_t
       -> 'b tree_model_class_t
       -> tree_iter_record_t
       -> bool
       -> bool
       -> unit
    val attributeConnect :
      'a class_t
       -> 'b cell_renderer_class_t
       -> string
       -> LargeInt.int
       -> unit
    val attributeDisconnect :
      'a class_t
       -> 'b cell_renderer_class_t
       -> string
       -> unit
    val cellGetProperty :
      'a class_t
       -> 'b cell_renderer_class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val cellSetProperty :
      'a class_t
       -> 'b cell_renderer_class_t
       -> string
       -> GObject.ValueRecord.t
       -> unit
    val copyContext :
      'a class_t
       -> 'b cell_area_context_class_t
       -> base cell_area_context_class_t
    val createContext : 'a class_t -> base cell_area_context_class_t
    val event :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> 'd Gdk.Event.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> LargeInt.int
    val focus :
      'a class_t
       -> direction_type_t
       -> bool
    val getCellAllocation :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> 'd cell_renderer_class_t
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
    val getCellAtPosition :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> Gdk.RectangleRecord.t
       -> LargeInt.int
       -> LargeInt.int
       -> base cell_renderer_class_t * Gdk.RectangleRecord.t
    val getCurrentPathString : 'a class_t -> string
    val getEditWidget : 'a class_t -> base cell_editable_class_t
    val getEditedCell : 'a class_t -> base cell_renderer_class_t
    val getFocusCell : 'a class_t -> base cell_renderer_class_t
    val getFocusFromSibling :
      'a class_t
       -> 'b cell_renderer_class_t
       -> base cell_renderer_class_t
    val getPreferredHeight :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredWidth :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getRequestMode : 'a class_t -> size_request_mode_t
    val hasRenderer :
      'a class_t
       -> 'b cell_renderer_class_t
       -> bool
    val innerCellArea :
      'a class_t
       -> 'b widget_class_t
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
    val isActivatable : 'a class_t -> bool
    val isFocusSibling :
      'a class_t
       -> 'b cell_renderer_class_t
       -> 'c cell_renderer_class_t
       -> bool
    val remove :
      'a class_t
       -> 'b cell_renderer_class_t
       -> unit
    val removeFocusSibling :
      'a class_t
       -> 'b cell_renderer_class_t
       -> 'c cell_renderer_class_t
       -> unit
    val render :
      'a class_t
       -> 'b cell_area_context_class_t
       -> 'c widget_class_t
       -> Cairo.ContextRecord.t
       -> Gdk.RectangleRecord.t
       -> Gdk.RectangleRecord.t
       -> cell_renderer_state_t
       -> bool
       -> unit
    val requestRenderer :
      'a class_t
       -> 'b cell_renderer_class_t
       -> orientation_t
       -> 'c widget_class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val setFocusCell :
      'a class_t
       -> 'b cell_renderer_class_t
       -> unit
    val stopEditing :
      'a class_t
       -> bool
       -> unit
    val addEditableSig :
      (base cell_renderer_class_t
        -> base cell_editable_class_t
        -> Cairo.RectangleIntRecord.t
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val applyAttributesSig :
      (base tree_model_class_t
        -> tree_iter_record_t
        -> bool
        -> bool
        -> unit)
       -> 'a class_t Signal.signal
    val focusChangedSig :
      (base cell_renderer_class_t
        -> string
        -> unit)
       -> 'a class_t Signal.signal
    val removeEditableSig :
      (base cell_renderer_class_t
        -> base cell_editable_class_t
        -> unit)
       -> 'a class_t Signal.signal
    val editWidgetProp : ('a class_t, base cell_editable_class_t option) Property.readonly
    val editedCellProp : ('a class_t, base cell_renderer_class_t option) Property.readonly
    val focusCellProp : ('a class_t, base cell_renderer_class_t option, 'b cell_renderer_class_t option) Property.readwrite
  end
