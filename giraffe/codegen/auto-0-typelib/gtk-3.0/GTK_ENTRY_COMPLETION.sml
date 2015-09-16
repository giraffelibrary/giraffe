signature GTK_ENTRY_COMPLETION =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a cell_layout_class_t
    type 'a widget_class_t
    type tree_iter_record_t
    type 'a cell_area_class_t
    type 'a tree_model_class_t
    type t = base class_t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asCellLayout : 'a class_t -> base cell_layout_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithArea : 'a cell_area_class_t -> base class_t
    val complete : 'a class_t -> unit
    val deleteAction :
      'a class_t
       -> LargeInt.int
       -> unit
    val getCompletionPrefix : 'a class_t -> string
    val getEntry : 'a class_t -> base widget_class_t
    val getInlineCompletion : 'a class_t -> bool
    val getInlineSelection : 'a class_t -> bool
    val getMinimumKeyLength : 'a class_t -> LargeInt.int
    val getModel : 'a class_t -> base tree_model_class_t
    val getPopupCompletion : 'a class_t -> bool
    val getPopupSetWidth : 'a class_t -> bool
    val getPopupSingleMatch : 'a class_t -> bool
    val getTextColumn : 'a class_t -> LargeInt.int
    val insertActionMarkup :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val insertActionText :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val insertPrefix : 'a class_t -> unit
    val setInlineCompletion :
      'a class_t
       -> bool
       -> unit
    val setInlineSelection :
      'a class_t
       -> bool
       -> unit
    val setMinimumKeyLength :
      'a class_t
       -> LargeInt.int
       -> unit
    val setModel :
      'a class_t
       -> 'b tree_model_class_t option
       -> unit
    val setPopupCompletion :
      'a class_t
       -> bool
       -> unit
    val setPopupSetWidth :
      'a class_t
       -> bool
       -> unit
    val setPopupSingleMatch :
      'a class_t
       -> bool
       -> unit
    val setTextColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val actionActivatedSig : (LargeInt.int -> unit) -> 'a class_t Signal.signal
    val cursorOnMatchSig :
      (base tree_model_class_t
        -> tree_iter_record_t
        -> bool)
       -> 'a class_t Signal.signal
    val insertPrefixSig : (string -> bool) -> 'a class_t Signal.signal
    val matchSelectedSig :
      (base tree_model_class_t
        -> tree_iter_record_t
        -> bool)
       -> 'a class_t Signal.signal
    val cellAreaProp : ('a class_t, base cell_area_class_t option, 'b cell_area_class_t option) Property.readwrite
    val inlineCompletionProp : ('a class_t, bool, bool) Property.readwrite
    val inlineSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val minimumKeyLengthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class_t, base tree_model_class_t option, 'b tree_model_class_t option) Property.readwrite
    val popupCompletionProp : ('a class_t, bool, bool) Property.readwrite
    val popupSetWidthProp : ('a class_t, bool, bool) Property.readwrite
    val popupSingleMatchProp : ('a class_t, bool, bool) Property.readwrite
    val textColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
