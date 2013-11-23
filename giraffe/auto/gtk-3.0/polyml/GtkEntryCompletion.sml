structure GtkEntryCompletion :>
  GTK_ENTRY_COMPLETION
    where type 'a class_t = 'a GtkEntryCompletionClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type treeiterrecord_t = GtkTreeIterRecord.t
    where type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    where type 'a treemodelclass_t = 'a GtkTreeModelClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_completion_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_entry_completion_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithArea_ = call (load_sym libgtk "gtk_entry_completion_new_with_area") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val complete_ = call (load_sym libgtk "gtk_entry_completion_complete") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deleteAction_ = call (load_sym libgtk "gtk_entry_completion_delete_action") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val getCompletionPrefix_ = call (load_sym libgtk "gtk_entry_completion_get_completion_prefix") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getEntry_ = call (load_sym libgtk "gtk_entry_completion_get_entry") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInlineCompletion_ = call (load_sym libgtk "gtk_entry_completion_get_inline_completion") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getInlineSelection_ = call (load_sym libgtk "gtk_entry_completion_get_inline_selection") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getMinimumKeyLength_ = call (load_sym libgtk "gtk_entry_completion_get_minimum_key_length") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getModel_ = call (load_sym libgtk "gtk_entry_completion_get_model") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getPopupCompletion_ = call (load_sym libgtk "gtk_entry_completion_get_popup_completion") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPopupSetWidth_ = call (load_sym libgtk "gtk_entry_completion_get_popup_set_width") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getPopupSingleMatch_ = call (load_sym libgtk "gtk_entry_completion_get_popup_single_match") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getTextColumn_ = call (load_sym libgtk "gtk_entry_completion_get_text_column") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val insertActionMarkup_ =
        call (load_sym libgtk "gtk_entry_completion_insert_action_markup")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val insertActionText_ =
        call (load_sym libgtk "gtk_entry_completion_insert_action_text")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.String.PolyML.INPTR
             --> FFI.PolyML.VOID
          )
      val insertPrefix_ = call (load_sym libgtk "gtk_entry_completion_insert_prefix") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setInlineCompletion_ = call (load_sym libgtk "gtk_entry_completion_set_inline_completion") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setInlineSelection_ = call (load_sym libgtk "gtk_entry_completion_set_inline_selection") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setMinimumKeyLength_ = call (load_sym libgtk "gtk_entry_completion_set_minimum_key_length") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
      val setModel_ = call (load_sym libgtk "gtk_entry_completion_set_model") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setPopupCompletion_ = call (load_sym libgtk "gtk_entry_completion_set_popup_completion") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPopupSetWidth_ = call (load_sym libgtk "gtk_entry_completion_set_popup_set_width") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setPopupSingleMatch_ = call (load_sym libgtk "gtk_entry_completion_set_popup_single_match") (GObjectObjectClass.PolyML.PTR &&> FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val setTextColumn_ = call (load_sym libgtk "gtk_entry_completion_set_text_column") (GObjectObjectClass.PolyML.PTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkEntryCompletionClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a celllayoutclass_t = 'a GtkCellLayoutClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type treeiterrecord_t = GtkTreeIterRecord.t
    type 'a cellareaclass_t = 'a GtkCellAreaClass.t
    type 'a treemodelclass_t = 'a GtkTreeModelClass.t
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEntryCompletionClass.C.fromPtr true) new_ ()
    fun newWithArea area = (GObjectObjectClass.C.withPtr ---> GtkEntryCompletionClass.C.fromPtr true) newWithArea_ area
    fun complete self = (GObjectObjectClass.C.withPtr ---> I) complete_ self
    fun deleteAction self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) deleteAction_ (self & index)
    fun getCompletionPrefix self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCompletionPrefix_ self
    fun getEntry self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getEntry_ self
    fun getInlineCompletion self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInlineCompletion_ self
    fun getInlineSelection self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInlineSelection_ self
    fun getMinimumKeyLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMinimumKeyLength_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPopupCompletion self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupCompletion_ self
    fun getPopupSetWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupSetWidth_ self
    fun getPopupSingleMatch self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupSingleMatch_ self
    fun getTextColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getTextColumn_ self
    fun insertActionMarkup self index markup =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.String.C.withConstPtr
         ---> I
      )
        insertActionText_
        (
          self
           & index
           & text
        )
    fun insertPrefix self = (GObjectObjectClass.C.withPtr ---> I) insertPrefix_ self
    fun setInlineCompletion self inlineCompletion = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInlineCompletion_ (self & inlineCompletion)
    fun setInlineSelection self inlineSelection = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInlineSelection_ (self & inlineSelection)
    fun setMinimumKeyLength self length = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMinimumKeyLength_ (self & length)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupCompletion self popupCompletion = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupCompletion_ (self & popupCompletion)
    fun setPopupSetWidth self popupSetWidth = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupSetWidth_ (self & popupSetWidth)
    fun setPopupSingleMatch self popupSingleMatch = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupSingleMatch_ (self & popupSingleMatch)
    fun setTextColumn self column = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setTextColumn_ (self & column)
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
