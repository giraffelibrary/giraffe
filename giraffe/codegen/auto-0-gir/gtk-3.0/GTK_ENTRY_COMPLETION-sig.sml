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
    val computePrefix :
      'a class
       -> string
       -> string option
    val deleteAction :
      'a class
       -> LargeInt.int
       -> unit
    val getCompletionPrefix : 'a class -> string
    val getEntry : 'a class -> base widget_class
    val getInlineCompletion : 'a class -> bool
    val getInlineSelection : 'a class -> bool
    val getMinimumKeyLength : 'a class -> LargeInt.int
    val getModel : 'a class -> base tree_model_class option
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
    val actionActivatedSig : (LargeInt.int -> unit) -> 'a class Signal.t
    val cursorOnMatchSig : (base tree_model_class * tree_iter_t -> bool) -> 'a class Signal.t
    val insertPrefixSig : (string -> bool) -> 'a class Signal.t
    val matchSelectedSig : (base tree_model_class * tree_iter_t -> bool) -> 'a class Signal.t
    val noMatchesSig : (unit -> unit) -> 'a class Signal.t
    val cellAreaProp : ('a class, unit -> base cell_area_class option, unit, 'b cell_area_class option -> unit) Property.t
    val inlineCompletionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val inlineSelectionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val minimumKeyLengthProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val modelProp : ('a class, unit -> base tree_model_class option, 'b tree_model_class option -> unit, 'b tree_model_class option -> unit) Property.t
    val popupCompletionProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val popupSetWidthProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val popupSingleMatchProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val textColumnProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
