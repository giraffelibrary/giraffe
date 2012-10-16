signature GTK_ENTRY_COMPLETION =
  sig
    type 'a class_t
    type 'a treemodelclass_t
    type 'a cellareaclass_t
    type treeiterrecord_t
    type 'a widgetclass_t
    type 'a celllayoutclass_t
    type 'a buildableclass_t
    val asBuildable : 'a class_t -> base buildableclass_t
    val asCellLayout : 'a class_t -> base celllayoutclass_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithArea : 'a cellareaclass_t -> base class_t
    val complete : 'a class_t -> unit
    val deleteAction :
      'a class_t
       -> LargeInt.int
       -> unit
    val getCompletionPrefix : 'a class_t -> string
    val getEntry : 'a class_t -> base widgetclass_t
    val getInlineCompletion : 'a class_t -> bool
    val getInlineSelection : 'a class_t -> bool
    val getMinimumKeyLength : 'a class_t -> LargeInt.int
    val getModel : 'a class_t -> base treemodelclass_t
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
       -> 'b treemodelclass_t option
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
      (base treemodelclass_t
        -> treeiterrecord_t
        -> bool)
       -> 'a class_t Signal.signal
    val insertPrefixSig : (string -> bool) -> 'a class_t Signal.signal
    val matchSelectedSig :
      (base treemodelclass_t
        -> treeiterrecord_t
        -> bool)
       -> 'a class_t Signal.signal
    val cellAreaProp : ('a class_t, base cellareaclass_t option, 'b cellareaclass_t option) Property.readwrite
    val inlineCompletionProp : ('a class_t, bool, bool) Property.readwrite
    val inlineSelectionProp : ('a class_t, bool, bool) Property.readwrite
    val minimumKeyLengthProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val modelProp : ('a class_t, base treemodelclass_t option, 'b treemodelclass_t option) Property.readwrite
    val popupCompletionProp : ('a class_t, bool, bool) Property.readwrite
    val popupSetWidthProp : ('a class_t, bool, bool) Property.readwrite
    val popupSingleMatchProp : ('a class_t, bool, bool) Property.readwrite
    val textColumnProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
