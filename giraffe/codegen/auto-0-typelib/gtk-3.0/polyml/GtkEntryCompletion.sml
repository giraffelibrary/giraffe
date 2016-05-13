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
      val getType_ = call (load_sym libgtk "gtk_entry_completion_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_entry_completion_new") (PolyMLFFI.cVoid --> GtkEntryCompletionClass.PolyML.cPtr)
      val newWithArea_ = call (load_sym libgtk "gtk_entry_completion_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkEntryCompletionClass.PolyML.cPtr)
      val complete_ = call (load_sym libgtk "gtk_entry_completion_complete") (GtkEntryCompletionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val deleteAction_ = call (load_sym libgtk "gtk_entry_completion_delete_action") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val getCompletionPrefix_ = call (load_sym libgtk "gtk_entry_completion_get_completion_prefix") (GtkEntryCompletionClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEntry_ = call (load_sym libgtk "gtk_entry_completion_get_entry") (GtkEntryCompletionClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getInlineCompletion_ = call (load_sym libgtk "gtk_entry_completion_get_inline_completion") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getInlineSelection_ = call (load_sym libgtk "gtk_entry_completion_get_inline_selection") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMinimumKeyLength_ = call (load_sym libgtk "gtk_entry_completion_get_minimum_key_length") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_entry_completion_get_model") (GtkEntryCompletionClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getPopupCompletion_ = call (load_sym libgtk "gtk_entry_completion_get_popup_completion") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPopupSetWidth_ = call (load_sym libgtk "gtk_entry_completion_get_popup_set_width") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPopupSingleMatch_ = call (load_sym libgtk "gtk_entry_completion_get_popup_single_match") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTextColumn_ = call (load_sym libgtk "gtk_entry_completion_get_text_column") (GtkEntryCompletionClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val insertActionMarkup_ =
        call (load_sym libgtk "gtk_entry_completion_insert_action_markup")
          (
            GtkEntryCompletionClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val insertActionText_ =
        call (load_sym libgtk "gtk_entry_completion_insert_action_text")
          (
            GtkEntryCompletionClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val insertPrefix_ = call (load_sym libgtk "gtk_entry_completion_insert_prefix") (GtkEntryCompletionClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setInlineCompletion_ = call (load_sym libgtk "gtk_entry_completion_set_inline_completion") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setInlineSelection_ = call (load_sym libgtk "gtk_entry_completion_set_inline_selection") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setMinimumKeyLength_ = call (load_sym libgtk "gtk_entry_completion_set_minimum_key_length") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_entry_completion_set_model") (GtkEntryCompletionClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setPopupCompletion_ = call (load_sym libgtk "gtk_entry_completion_set_popup_completion") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPopupSetWidth_ = call (load_sym libgtk "gtk_entry_completion_set_popup_set_width") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setPopupSingleMatch_ = call (load_sym libgtk "gtk_entry_completion_set_popup_single_match") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTextColumn_ = call (load_sym libgtk "gtk_entry_completion_set_text_column") (GtkEntryCompletionClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkEntryCompletionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEntryCompletionClass.C.fromPtr true) new_ ()
    fun newWithArea area = (GtkCellAreaClass.C.withPtr ---> GtkEntryCompletionClass.C.fromPtr true) newWithArea_ area
    fun complete self = (GtkEntryCompletionClass.C.withPtr ---> I) complete_ self
    fun deleteAction self index = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) deleteAction_ (self & index)
    fun getCompletionPrefix self = (GtkEntryCompletionClass.C.withPtr ---> Utf8.C.fromPtr false) getCompletionPrefix_ self
    fun getEntry self = (GtkEntryCompletionClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getEntry_ self
    fun getInlineCompletion self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Bool.C.fromVal) getInlineCompletion_ self
    fun getInlineSelection self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Bool.C.fromVal) getInlineSelection_ self
    fun getMinimumKeyLength self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Int32.C.fromVal) getMinimumKeyLength_ self
    fun getModel self = (GtkEntryCompletionClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPopupCompletion self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupCompletion_ self
    fun getPopupSetWidth self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupSetWidth_ self
    fun getPopupSingleMatch self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupSingleMatch_ self
    fun getTextColumn self = (GtkEntryCompletionClass.C.withPtr ---> FFI.Int32.C.fromVal) getTextColumn_ self
    fun insertActionMarkup self index markup =
      (
        GtkEntryCompletionClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        insertActionMarkup_
        (
          self
           & index
           & markup
        )
    fun insertActionText self index text =
      (
        GtkEntryCompletionClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        insertActionText_
        (
          self
           & index
           & text
        )
    fun insertPrefix self = (GtkEntryCompletionClass.C.withPtr ---> I) insertPrefix_ self
    fun setInlineCompletion self inlineCompletion = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInlineCompletion_ (self & inlineCompletion)
    fun setInlineSelection self inlineSelection = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInlineSelection_ (self & inlineSelection)
    fun setMinimumKeyLength self length = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMinimumKeyLength_ (self & length)
    fun setModel self model = (GtkEntryCompletionClass.C.withPtr &&&> GtkTreeModelClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupCompletion self popupCompletion = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupCompletion_ (self & popupCompletion)
    fun setPopupSetWidth self popupSetWidth = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupSetWidth_ (self & popupSetWidth)
    fun setPopupSingleMatch self popupSingleMatch = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupSingleMatch_ (self & popupSingleMatch)
    fun setTextColumn self column = (GtkEntryCompletionClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setTextColumn_ (self & column)
    local
      open ClosureMarshal Signal
    in
      fun actionActivatedSig f = signal "action-activated" (get 0w1 int ---> ret_void) f
      fun cursorOnMatchSig f = signal "cursor-on-match" (get 0w1 GtkTreeModelClass.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret boolean) (fn model & iter => f model iter)
      fun insertPrefixSig f = signal "insert-prefix" (get 0w1 string ---> ret boolean) f
      fun matchSelectedSig f = signal "match-selected" (get 0w1 GtkTreeModelClass.t &&&> get 0w2 GtkTreeIterRecord.t ---> ret boolean) (fn model & iter => f model iter)
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
