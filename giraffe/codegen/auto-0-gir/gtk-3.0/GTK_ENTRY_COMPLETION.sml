signature GTK_ENTRY_COMPLETION =
  sig
    type 'a class
    type 'a buildable_class
    type 'a cell_layout_class
    type 'a widget_class
    type tree_iter_t
    type 'a cell_area_class
    type 'a tree_model_class
    type t = base class
    val asBuildable : 'a class -> base buildable_class
    val asCellLayout : 'a class -> base cell_layout_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithArea : 'a cell_area_class -> base class
    val complete : 'a class -> unit
    val deleteAction :
      'a class
       -> LargeInt.int
       -> unit
    val getCompletionPrefix : 'a class -> string
    val getEntry : 'a class -> base widget_class
    val getInlineCompletion : 'a class -> bool
    val getInlineSelection : 'a class -> bool
    val getMinimumKeyLength : 'a class -> LargeInt.int
    val getModel : 'a class -> base tree_model_class
    val getPopupCompletion : 'a class -> bool
    val getPopupSetWidth : 'a class -> bool
    val getPopupSingleMatch : 'a class -> bool
    val getTextColumn : 'a class -> LargeInt.int
    val insertActionMarkup :
      'a class
       -> LargeInt.int * string
       -> unit
    val insertActionText :
      'a class
       -> LargeInt.int * string
       -> unit
    val insertPrefix : 'a class -> unit
    val setInlineCompletion :
      'a class
       -> bool
       -> unit
    val setInlineSelection :
      'a class
       -> bool
       -> unit
    val setMinimumKeyLength :
      'a class
       -> LargeInt.int
       -> unit
    val setModel :
      'a class
       -> 'b tree_model_class option
       -> unit
    val setPopupCompletion :
      'a class
       -> bool
       -> unit
    val setPopupSetWidth :
      'a class
       -> bool
       -> unit
    val setPopupSingleMatch :
      'a class
       -> bool
       -> unit
    val setTextColumn :
      'a class
       -> LargeInt.int
       -> unit
    val actionActivatedSig : (LargeInt.int -> unit) -> 'a class Signal.signal
    val cursorOnMatchSig : (base tree_model_class * tree_iter_t -> bool) -> 'a class Signal.signal
    val insertPrefixSig : (string -> bool) -> 'a class Signal.signal
    val matchSelectedSig : (base tree_model_class * tree_iter_t -> bool) -> 'a class Signal.signal
    val cellAreaProp : ('a class, base cell_area_class option, 'b cell_area_class option) Property.readwrite
    val inlineCompletionProp : ('a class, bool, bool) Property.readwrite
    val inlineSelectionProp : ('a class, bool, bool) Property.readwrite
    val minimumKeyLengthProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class, base tree_model_class option, 'b tree_model_class option) Property.readwrite
    val popupCompletionProp : ('a class, bool, bool) Property.readwrite
    val popupSetWidthProp : ('a class, bool, bool) Property.readwrite
    val popupSingleMatchProp : ('a class, bool, bool) Property.readwrite
    val textColumnProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
