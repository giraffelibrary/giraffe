structure GtkComboBox :>
  GTK_COMBO_BOX
    where type 'a class = 'a GtkComboBoxClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type tree_iter_t = GtkTreeIterRecord.t
    where type scroll_type_t = GtkScrollType.t
    where type sensitivity_type_t = GtkSensitivityType.t
    where type 'a cell_area_class = 'a GtkCellAreaClass.class
    where type 'a tree_model_class = 'a GtkTreeModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_combo_box_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_combo_box_new") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithArea_ = call (load_sym libgtk "gtk_combo_box_new_with_area") (GtkCellAreaClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithAreaAndEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_area_and_entry") (GtkCellAreaClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_entry") (PolyMLFFI.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithModel_ = call (load_sym libgtk "gtk_combo_box_new_with_model") (GtkTreeModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithModelAndEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_model_and_entry") (GtkTreeModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getActive_ = call (load_sym libgtk "gtk_combo_box_get_active") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getActiveId_ = call (load_sym libgtk "gtk_combo_box_get_active_id") (GtkComboBoxClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getActiveIter_ = call (load_sym libgtk "gtk_combo_box_get_active_iter") (GtkComboBoxClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAddTearoffs_ = call (load_sym libgtk "gtk_combo_box_get_add_tearoffs") (GtkComboBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getButtonSensitivity_ = call (load_sym libgtk "gtk_combo_box_get_button_sensitivity") (GtkComboBoxClass.PolyML.cPtr --> GtkSensitivityType.PolyML.cVal)
      val getColumnSpanColumn_ = call (load_sym libgtk "gtk_combo_box_get_column_span_column") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getEntryTextColumn_ = call (load_sym libgtk "gtk_combo_box_get_entry_text_column") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_combo_box_get_focus_on_click") (GtkComboBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHasEntry_ = call (load_sym libgtk "gtk_combo_box_get_has_entry") (GtkComboBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIdColumn_ = call (load_sym libgtk "gtk_combo_box_get_id_column") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_combo_box_get_model") (GtkComboBoxClass.PolyML.cPtr --> GtkTreeModelClass.PolyML.cPtr)
      val getPopupAccessible_ = call (load_sym libgtk "gtk_combo_box_get_popup_accessible") (GtkComboBoxClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getPopupFixedWidth_ = call (load_sym libgtk "gtk_combo_box_get_popup_fixed_width") (GtkComboBoxClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpanColumn_ = call (load_sym libgtk "gtk_combo_box_get_row_span_column") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_combo_box_get_title") (GtkComboBoxClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWrapWidth_ = call (load_sym libgtk "gtk_combo_box_get_wrap_width") (GtkComboBoxClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val popdown_ = call (load_sym libgtk "gtk_combo_box_popdown") (GtkComboBoxClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val popup_ = call (load_sym libgtk "gtk_combo_box_popup") (GtkComboBoxClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val popupForDevice_ = call (load_sym libgtk "gtk_combo_box_popup_for_device") (GtkComboBoxClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val setActive_ = call (load_sym libgtk "gtk_combo_box_set_active") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setActiveId_ = call (load_sym libgtk "gtk_combo_box_set_active_id") (GtkComboBoxClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.Bool.PolyML.cVal)
      val setActiveIter_ = call (load_sym libgtk "gtk_combo_box_set_active_iter") (GtkComboBoxClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setAddTearoffs_ = call (load_sym libgtk "gtk_combo_box_set_add_tearoffs") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setButtonSensitivity_ = call (load_sym libgtk "gtk_combo_box_set_button_sensitivity") (GtkComboBoxClass.PolyML.cPtr &&> GtkSensitivityType.PolyML.cVal --> PolyMLFFI.cVoid)
      val setColumnSpanColumn_ = call (load_sym libgtk "gtk_combo_box_set_column_span_column") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setEntryTextColumn_ = call (load_sym libgtk "gtk_combo_box_set_entry_text_column") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setFocusOnClick_ = call (load_sym libgtk "gtk_combo_box_set_focus_on_click") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setIdColumn_ = call (load_sym libgtk "gtk_combo_box_set_id_column") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_combo_box_set_model") (GtkComboBoxClass.PolyML.cPtr &&> GtkTreeModelClass.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val setPopupFixedWidth_ = call (load_sym libgtk "gtk_combo_box_set_popup_fixed_width") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> PolyMLFFI.cVoid)
      val setRowSpanColumn_ = call (load_sym libgtk "gtk_combo_box_set_row_span_column") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_combo_box_set_title") (GtkComboBoxClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> PolyMLFFI.cVoid)
      val setWrapWidth_ = call (load_sym libgtk "gtk_combo_box_set_wrap_width") (GtkComboBoxClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a class = 'a GtkComboBoxClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type tree_iter_t = GtkTreeIterRecord.t
    type scroll_type_t = GtkScrollType.t
    type sensitivity_type_t = GtkSensitivityType.t
    type 'a cell_area_class = 'a GtkCellAreaClass.class
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkComboBoxClass.C.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithArea_ area
    fun newWithAreaAndEntry area = (GtkCellAreaClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithAreaAndEntry_ area
    fun newWithEntry () = (I ---> GtkComboBoxClass.C.fromPtr false) newWithEntry_ ()
    fun newWithModel model = (GtkTreeModelClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithModel_ model
    fun newWithModelAndEntry model = (GtkTreeModelClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithModelAndEntry_ model
    fun getActive self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getActive_ self
    fun getActiveId self = (GtkComboBoxClass.C.withPtr ---> Utf8.C.fromPtr false) getActiveId_ self
    fun getActiveIter self =
      let
        val iter & retVal = (GtkComboBoxClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getActiveIter_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getAddTearoffs self = (GtkComboBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getAddTearoffs_ self
    fun getButtonSensitivity self = (GtkComboBoxClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getButtonSensitivity_ self
    fun getColumnSpanColumn self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getColumnSpanColumn_ self
    fun getEntryTextColumn self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getEntryTextColumn_ self
    fun getFocusOnClick self = (GtkComboBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getHasEntry self = (GtkComboBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasEntry_ self
    fun getIdColumn self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getIdColumn_ self
    fun getModel self = (GtkComboBoxClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPopupAccessible self = (GtkComboBoxClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getPopupAccessible_ self
    fun getPopupFixedWidth self = (GtkComboBoxClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupFixedWidth_ self
    fun getRowSpanColumn self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getRowSpanColumn_ self
    fun getTitle self = (GtkComboBoxClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getWrapWidth self = (GtkComboBoxClass.C.withPtr ---> FFI.Int32.C.fromVal) getWrapWidth_ self
    fun popdown self = (GtkComboBoxClass.C.withPtr ---> I) popdown_ self
    fun popup self = (GtkComboBoxClass.C.withPtr ---> I) popup_ self
    fun popupForDevice self device = (GtkComboBoxClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> I) popupForDevice_ (self & device)
    fun setActive self index = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setActive_ (self & index)
    fun setActiveId self activeId = (GtkComboBoxClass.C.withPtr &&&> Utf8.C.withOptPtr ---> FFI.Bool.C.fromVal) setActiveId_ (self & activeId)
    fun setActiveIter self iter = (GtkComboBoxClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> I) setActiveIter_ (self & iter)
    fun setAddTearoffs self addTearoffs = (GtkComboBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    fun setButtonSensitivity self sensitivity = (GtkComboBoxClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setButtonSensitivity_ (self & sensitivity)
    fun setColumnSpanColumn self columnSpan = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setColumnSpanColumn_ (self & columnSpan)
    fun setEntryTextColumn self textColumn = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setEntryTextColumn_ (self & textColumn)
    fun setFocusOnClick self focusOnClick = (GtkComboBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setIdColumn self idColumn = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setIdColumn_ (self & idColumn)
    fun setModel self model = (GtkComboBoxClass.C.withPtr &&&> GtkTreeModelClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupFixedWidth self fixed = (GtkComboBoxClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupFixedWidth_ (self & fixed)
    fun setRowSpanColumn self rowSpan = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setRowSpanColumn_ (self & rowSpan)
    fun setTitle self title = (GtkComboBoxClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setWrapWidth self width = (GtkComboBoxClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setWrapWidth_ (self & width)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun moveActiveSig f = signal "move-active" (get 0w1 GtkScrollType.t ---> ret_void) f
      fun popdownSig f = signal "popdown" (void ---> ret boolean) f
      fun popupSig f = signal "popup" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" int x,
          set = fn x => set "active" int x
        }
      val activeIdProp =
        {
          get = fn x => get "active-id" stringOpt x,
          set = fn x => set "active-id" stringOpt x
        }
      val addTearoffsProp =
        {
          get = fn x => get "add-tearoffs" boolean x,
          set = fn x => set "add-tearoffs" boolean x
        }
      val buttonSensitivityProp =
        {
          get = fn x => get "button-sensitivity" GtkSensitivityType.t x,
          set = fn x => set "button-sensitivity" GtkSensitivityType.t x
        }
      val cellAreaProp =
        {
          get = fn x => get "cell-area" GtkCellAreaClass.tOpt x,
          set = fn x => set "cell-area" GtkCellAreaClass.tOpt x
        }
      val columnSpanColumnProp =
        {
          get = fn x => get "column-span-column" int x,
          set = fn x => set "column-span-column" int x
        }
      val entryTextColumnProp =
        {
          get = fn x => get "entry-text-column" int x,
          set = fn x => set "entry-text-column" int x
        }
      val focusOnClickProp =
        {
          get = fn x => get "focus-on-click" boolean x,
          set = fn x => set "focus-on-click" boolean x
        }
      val hasEntryProp =
        {
          get = fn x => get "has-entry" boolean x,
          set = fn x => set "has-entry" boolean x
        }
      val hasFrameProp =
        {
          get = fn x => get "has-frame" boolean x,
          set = fn x => set "has-frame" boolean x
        }
      val idColumnProp =
        {
          get = fn x => get "id-column" int x,
          set = fn x => set "id-column" int x
        }
      val modelProp =
        {
          get = fn x => get "model" GtkTreeModelClass.tOpt x,
          set = fn x => set "model" GtkTreeModelClass.tOpt x
        }
      val popupFixedWidthProp =
        {
          get = fn x => get "popup-fixed-width" boolean x,
          set = fn x => set "popup-fixed-width" boolean x
        }
      val popupShownProp = {get = fn x => get "popup-shown" boolean x}
      val rowSpanColumnProp =
        {
          get = fn x => get "row-span-column" int x,
          set = fn x => set "row-span-column" int x
        }
      val tearoffTitleProp =
        {
          get = fn x => get "tearoff-title" stringOpt x,
          set = fn x => set "tearoff-title" stringOpt x
        }
      val wrapWidthProp =
        {
          get = fn x => get "wrap-width" int x,
          set = fn x => set "wrap-width" int x
        }
    end
  end
