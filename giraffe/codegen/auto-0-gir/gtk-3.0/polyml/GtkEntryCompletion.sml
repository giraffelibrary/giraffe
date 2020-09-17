structure GtkEntryCompletion :>
  GTK_ENTRY_COMPLETION
    where type 'a class = 'a GtkEntryCompletionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_entry_completion_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_entry_completion_new") (cVoid --> GtkEntryCompletionClass.PolyML.cPtr)
      val newWithArea_ = call (getSymbol "gtk_entry_completion_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkEntryCompletionClass.PolyML.cPtr)
      val complete_ = call (getSymbol "gtk_entry_completion_complete") (GtkEntryCompletionClass.PolyML.cPtr --> cVoid)
      val computePrefix_ = call (getSymbol "gtk_entry_completion_compute_prefix") (GtkEntryCompletionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutOptPtr)
      val deleteAction_ = call (getSymbol "gtk_entry_completion_delete_action") (GtkEntryCompletionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val getCompletionPrefix_ = call (getSymbol "gtk_entry_completion_get_completion_prefix") (GtkEntryCompletionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEntry_ = call (getSymbol "gtk_entry_completion_get_entry") (GtkEntryCompletionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getInlineCompletion_ = call (getSymbol "gtk_entry_completion_get_inline_completion") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInlineSelection_ = call (getSymbol "gtk_entry_completion_get_inline_selection") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMinimumKeyLength_ = call (getSymbol "gtk_entry_completion_get_minimum_key_length") (GtkEntryCompletionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getModel_ = call (getSymbol "gtk_entry_completion_get_model") (GtkEntryCompletionClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cOptPtr)
      val getPopupCompletion_ = call (getSymbol "gtk_entry_completion_get_popup_completion") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPopupSetWidth_ = call (getSymbol "gtk_entry_completion_get_popup_set_width") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPopupSingleMatch_ = call (getSymbol "gtk_entry_completion_get_popup_single_match") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTextColumn_ = call (getSymbol "gtk_entry_completion_get_text_column") (GtkEntryCompletionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val insertActionMarkup_ =
        call (getSymbol "gtk_entry_completion_insert_action_markup")
          (
            GtkEntryCompletionClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val insertActionText_ =
        call (getSymbol "gtk_entry_completion_insert_action_text")
          (
            GtkEntryCompletionClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val insertPrefix_ = call (getSymbol "gtk_entry_completion_insert_prefix") (GtkEntryCompletionClass.PolyML.cPtr --> cVoid)
      val setInlineCompletion_ = call (getSymbol "gtk_entry_completion_set_inline_completion") (GtkEntryCompletionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setInlineSelection_ = call (getSymbol "gtk_entry_completion_set_inline_selection") (GtkEntryCompletionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMinimumKeyLength_ = call (getSymbol "gtk_entry_completion_set_minimum_key_length") (GtkEntryCompletionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setModel_ = call (getSymbol "gtk_entry_completion_set_model") (GtkEntryCompletionClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> cVoid)
      val setPopupCompletion_ = call (getSymbol "gtk_entry_completion_set_popup_completion") (GtkEntryCompletionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPopupSetWidth_ = call (getSymbol "gtk_entry_completion_set_popup_set_width") (GtkEntryCompletionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPopupSingleMatch_ = call (getSymbol "gtk_entry_completion_set_popup_single_match") (GtkEntryCompletionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTextColumn_ = call (getSymbol "gtk_entry_completion_set_text_column") (GtkEntryCompletionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkEntryCompletionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEntryCompletionClass.FFI.fromPtr true) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr false ---> GtkEntryCompletionClass.FFI.fromPtr true) newWithArea_ area
    fun complete self = (GtkEntryCompletionClass.FFI.withPtr false ---> I) complete_ self
    fun computePrefix self key = (GtkEntryCompletionClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> Utf8.FFI.fromOptPtr ~1) computePrefix_ (self & key)
    fun deleteAction self index = (GtkEntryCompletionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) deleteAction_ (self & index)
    fun getCompletionPrefix self = (GtkEntryCompletionClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCompletionPrefix_ self before GtkEntryCompletionClass.FFI.touchPtr self
    fun getEntry self = (GtkEntryCompletionClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getEntry_ self before GtkEntryCompletionClass.FFI.touchPtr self
    fun getInlineCompletion self = (GtkEntryCompletionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInlineCompletion_ self
    fun getInlineSelection self = (GtkEntryCompletionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInlineSelection_ self
    fun getMinimumKeyLength self = (GtkEntryCompletionClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMinimumKeyLength_ self
    fun getModel self = (GtkEntryCompletionClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromOptPtr false) getModel_ self before GtkEntryCompletionClass.FFI.touchPtr self
    fun getPopupCompletion self = (GtkEntryCompletionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPopupCompletion_ self
    fun getPopupSetWidth self = (GtkEntryCompletionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPopupSetWidth_ self
    fun getPopupSingleMatch self = (GtkEntryCompletionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPopupSingleMatch_ self
    fun getTextColumn self = (GtkEntryCompletionClass.FFI.withPtr false ---> GInt.FFI.fromVal) getTextColumn_ self
    fun insertActionMarkup self (index, markup) =
      (
        GtkEntryCompletionClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        insertActionMarkup_
        (
          self
           & index
           & markup
        )
    fun insertActionText self (index, text) =
      (
        GtkEntryCompletionClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        insertActionText_
        (
          self
           & index
           & text
        )
    fun insertPrefix self = (GtkEntryCompletionClass.FFI.withPtr false ---> I) insertPrefix_ self
    fun setInlineCompletion self inlineCompletion = (GtkEntryCompletionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInlineCompletion_ (self & inlineCompletion)
    fun setInlineSelection self inlineSelection = (GtkEntryCompletionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInlineSelection_ (self & inlineSelection)
    fun setMinimumKeyLength self length = (GtkEntryCompletionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMinimumKeyLength_ (self & length)
    fun setModel self model = (GtkEntryCompletionClass.FFI.withPtr false &&&> GtkTreeModelClass.FFI.withOptPtr false ---> I) setModel_ (self & model)
    fun setPopupCompletion self popupCompletion = (GtkEntryCompletionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPopupCompletion_ (self & popupCompletion)
    fun setPopupSetWidth self popupSetWidth = (GtkEntryCompletionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPopupSetWidth_ (self & popupSetWidth)
    fun setPopupSingleMatch self popupSingleMatch = (GtkEntryCompletionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPopupSingleMatch_ (self & popupSingleMatch)
    fun setTextColumn self column = (GtkEntryCompletionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setTextColumn_ (self & column)
    local
      open ClosureMarshal Signal
    in
      fun actionActivatedSig f = signal "action-activated" (get 0w1 int ---> ret_void) f
      fun cursorOnMatchSig f = signal "cursor-on-match" (get 0w1 GtkTreeModelClass.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret boolean) (fn model & iter => f (model, iter))
      fun insertPrefixSig f = signal "insert-prefix" (get 0w1 string ---> ret boolean) f
      fun matchSelectedSig f = signal "match-selected" (get 0w1 GtkTreeModelClass.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret boolean) (fn model & iter => f (model, iter))
      fun noMatchesSig f = signal "no-matches" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val cellAreaProp =
        {
          name = "cell-area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val inlineCompletionProp =
        {
          name = "inline-completion",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val inlineSelectionProp =
        {
          name = "inline-selection",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val minimumKeyLengthProp =
        {
          name = "minimum-key-length",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val modelProp =
        {
          name = "model",
          gtype = fn () => C.gtype GtkTreeModelClass.tOpt (),
          get = fn x => fn () => C.get GtkTreeModelClass.tOpt x,
          set = fn x => C.set GtkTreeModelClass.tOpt x,
          init = fn x => C.set GtkTreeModelClass.tOpt x
        }
      val popupCompletionProp =
        {
          name = "popup-completion",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val popupSetWidthProp =
        {
          name = "popup-set-width",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val popupSingleMatchProp =
        {
          name = "popup-single-match",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val textColumnProp =
        {
          name = "text-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
