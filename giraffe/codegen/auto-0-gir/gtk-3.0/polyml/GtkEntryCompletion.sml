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
      val computePrefix_ = call (getSymbol "gtk_entry_completion_compute_prefix") (GtkEntryCompletionClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> Utf8.PolyML.cOutPtr)
      val deleteAction_ = call (getSymbol "gtk_entry_completion_delete_action") (GtkEntryCompletionClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val getCompletionPrefix_ = call (getSymbol "gtk_entry_completion_get_completion_prefix") (GtkEntryCompletionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEntry_ = call (getSymbol "gtk_entry_completion_get_entry") (GtkEntryCompletionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getInlineCompletion_ = call (getSymbol "gtk_entry_completion_get_inline_completion") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInlineSelection_ = call (getSymbol "gtk_entry_completion_get_inline_selection") (GtkEntryCompletionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMinimumKeyLength_ = call (getSymbol "gtk_entry_completion_get_minimum_key_length") (GtkEntryCompletionClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getModel_ = call (getSymbol "gtk_entry_completion_get_model") (GtkEntryCompletionClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
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
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEntryCompletionClass.FFI.fromPtr true) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr ---> GtkEntryCompletionClass.FFI.fromPtr true) newWithArea_ area
    fun complete self = (GtkEntryCompletionClass.FFI.withPtr ---> I) complete_ self
    fun computePrefix self key = (GtkEntryCompletionClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> Utf8.FFI.fromPtr 1) computePrefix_ (self & key)
    fun deleteAction self index = (GtkEntryCompletionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) deleteAction_ (self & index)
    fun getCompletionPrefix self = (GtkEntryCompletionClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCompletionPrefix_ self
    fun getEntry self = (GtkEntryCompletionClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getEntry_ self
    fun getInlineCompletion self = (GtkEntryCompletionClass.FFI.withPtr ---> GBool.FFI.fromVal) getInlineCompletion_ self
    fun getInlineSelection self = (GtkEntryCompletionClass.FFI.withPtr ---> GBool.FFI.fromVal) getInlineSelection_ self
    fun getMinimumKeyLength self = (GtkEntryCompletionClass.FFI.withPtr ---> GInt.FFI.fromVal) getMinimumKeyLength_ self
    fun getModel self = (GtkEntryCompletionClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun getPopupCompletion self = (GtkEntryCompletionClass.FFI.withPtr ---> GBool.FFI.fromVal) getPopupCompletion_ self
    fun getPopupSetWidth self = (GtkEntryCompletionClass.FFI.withPtr ---> GBool.FFI.fromVal) getPopupSetWidth_ self
    fun getPopupSingleMatch self = (GtkEntryCompletionClass.FFI.withPtr ---> GBool.FFI.fromVal) getPopupSingleMatch_ self
    fun getTextColumn self = (GtkEntryCompletionClass.FFI.withPtr ---> GInt.FFI.fromVal) getTextColumn_ self
    fun insertActionMarkup self (index, markup) =
      (
        GtkEntryCompletionClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
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
        GtkEntryCompletionClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        insertActionText_
        (
          self
           & index
           & text
        )
    fun insertPrefix self = (GtkEntryCompletionClass.FFI.withPtr ---> I) insertPrefix_ self
    fun setInlineCompletion self inlineCompletion = (GtkEntryCompletionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInlineCompletion_ (self & inlineCompletion)
    fun setInlineSelection self inlineSelection = (GtkEntryCompletionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInlineSelection_ (self & inlineSelection)
    fun setMinimumKeyLength self length = (GtkEntryCompletionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMinimumKeyLength_ (self & length)
    fun setModel self model = (GtkEntryCompletionClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupCompletion self popupCompletion = (GtkEntryCompletionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPopupCompletion_ (self & popupCompletion)
    fun setPopupSetWidth self popupSetWidth = (GtkEntryCompletionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPopupSetWidth_ (self & popupSetWidth)
    fun setPopupSingleMatch self popupSingleMatch = (GtkEntryCompletionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPopupSingleMatch_ (self & popupSingleMatch)
    fun setTextColumn self column = (GtkEntryCompletionClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setTextColumn_ (self & column)
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
      open Property
    in
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val inlineCompletionProp =
        {
          get = fn x => get "inline-completion" boolean x,
          set = fn x => set "inline-completion" boolean x
        }
      val inlineSelectionProp =
        {
          get = fn x => get "inline-selection" boolean x,
          set = fn x => set "inline-selection" boolean x
        }
      val minimumKeyLengthProp =
        {
          get = fn x => get "minimum-key-length" int x,
          set = fn x => set "minimum-key-length" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val popupCompletionProp =
        {
          get = fn x => get "popup-completion" boolean x,
          set = fn x => set "popup-completion" boolean x
        }
      val popupSetWidthProp =
        {
          get = fn x => get "popup-set-width" boolean x,
          set = fn x => set "popup-set-width" boolean x
        }
      val popupSingleMatchProp =
        {
          get = fn x => get "popup-single-match" boolean x,
          set = fn x => set "popup-single-match" boolean x
        }
      val textColumnProp =
        {
          get = fn x => get "text-column" int x,
          set = fn x => set "text-column" int x
        }
    end
  end
