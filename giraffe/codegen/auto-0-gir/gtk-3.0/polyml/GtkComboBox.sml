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
      val getType_ = call (load_sym libgtk "gtk_combo_box_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_combo_box_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithArea_ = call (load_sym libgtk "gtk_combo_box_new_with_area") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithAreaAndEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_area_and_entry") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_entry") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithModel_ = call (load_sym libgtk "gtk_combo_box_new_with_model") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithModelAndEntry_ = call (load_sym libgtk "gtk_combo_box_new_with_model_and_entry") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getActive_ = call (load_sym libgtk "gtk_combo_box_get_active") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getActiveId_ = call (load_sym libgtk "gtk_combo_box_get_active_id") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getActiveIter_ = call (load_sym libgtk "gtk_combo_box_get_active_iter") (GObjectObjectClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAddTearoffs_ = call (load_sym libgtk "gtk_combo_box_get_add_tearoffs") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getButtonSensitivity_ = call (load_sym libgtk "gtk_combo_box_get_button_sensitivity") (GObjectObjectClass.PolyML.cPtr --> GtkSensitivityType.PolyML.cVal)
      val getColumnSpanColumn_ = call (load_sym libgtk "gtk_combo_box_get_column_span_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getEntryTextColumn_ = call (load_sym libgtk "gtk_combo_box_get_entry_text_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getFocusOnClick_ = call (load_sym libgtk "gtk_combo_box_get_focus_on_click") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHasEntry_ = call (load_sym libgtk "gtk_combo_box_get_has_entry") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIdColumn_ = call (load_sym libgtk "gtk_combo_box_get_id_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getModel_ = call (load_sym libgtk "gtk_combo_box_get_model") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPopupAccessible_ = call (load_sym libgtk "gtk_combo_box_get_popup_accessible") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPopupFixedWidth_ = call (load_sym libgtk "gtk_combo_box_get_popup_fixed_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRowSpanColumn_ = call (load_sym libgtk "gtk_combo_box_get_row_span_column") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getTitle_ = call (load_sym libgtk "gtk_combo_box_get_title") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWrapWidth_ = call (load_sym libgtk "gtk_combo_box_get_wrap_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val popdown_ = call (load_sym libgtk "gtk_combo_box_popdown") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val popup_ = call (load_sym libgtk "gtk_combo_box_popup") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val popupForDevice_ = call (load_sym libgtk "gtk_combo_box_popup_for_device") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setActive_ = call (load_sym libgtk "gtk_combo_box_set_active") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setActiveId_ = call (load_sym libgtk "gtk_combo_box_set_active_id") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.Bool.PolyML.cVal)
      val setActiveIter_ = call (load_sym libgtk "gtk_combo_box_set_active_iter") (GObjectObjectClass.PolyML.cPtr &&> GtkTreeIterRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setAddTearoffs_ = call (load_sym libgtk "gtk_combo_box_set_add_tearoffs") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setButtonSensitivity_ = call (load_sym libgtk "gtk_combo_box_set_button_sensitivity") (GObjectObjectClass.PolyML.cPtr &&> GtkSensitivityType.PolyML.cVal --> FFI.PolyML.cVoid)
      val setColumnSpanColumn_ = call (load_sym libgtk "gtk_combo_box_set_column_span_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEntryTextColumn_ = call (load_sym libgtk "gtk_combo_box_set_entry_text_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setFocusOnClick_ = call (load_sym libgtk "gtk_combo_box_set_focus_on_click") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIdColumn_ = call (load_sym libgtk "gtk_combo_box_set_id_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setModel_ = call (load_sym libgtk "gtk_combo_box_set_model") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setPopupFixedWidth_ = call (load_sym libgtk "gtk_combo_box_set_popup_fixed_width") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRowSpanColumn_ = call (load_sym libgtk "gtk_combo_box_set_row_span_column") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTitle_ = call (load_sym libgtk "gtk_combo_box_set_title") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setWrapWidth_ = call (load_sym libgtk "gtk_combo_box_set_wrap_width") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
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
    fun newWithArea area = (GObjectObjectClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithArea_ area
    fun newWithAreaAndEntry area = (GObjectObjectClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithAreaAndEntry_ area
    fun newWithEntry () = (I ---> GtkComboBoxClass.C.fromPtr false) newWithEntry_ ()
    fun newWithModel model = (GObjectObjectClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithModel_ model
    fun newWithModelAndEntry model = (GObjectObjectClass.C.withPtr ---> GtkComboBoxClass.C.fromPtr false) newWithModelAndEntry_ model
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getActive_ self
    fun getActiveId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getActiveId_ self
    fun getActiveIter self =
      let
        val iter & retVal = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withNewPtr ---> GtkTreeIterRecord.C.fromPtr true && FFI.Bool.C.fromVal) getActiveIter_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getAddTearoffs self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAddTearoffs_ self
    fun getButtonSensitivity self = (GObjectObjectClass.C.withPtr ---> GtkSensitivityType.C.fromVal) getButtonSensitivity_ self
    fun getColumnSpanColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getColumnSpanColumn_ self
    fun getEntryTextColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getEntryTextColumn_ self
    fun getFocusOnClick self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getFocusOnClick_ self
    fun getHasEntry self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasEntry_ self
    fun getIdColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getIdColumn_ self
    fun getModel self = (GObjectObjectClass.C.withPtr ---> GtkTreeModelClass.C.fromPtr false) getModel_ self
    fun getPopupAccessible self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getPopupAccessible_ self
    fun getPopupFixedWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getPopupFixedWidth_ self
    fun getRowSpanColumn self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getRowSpanColumn_ self
    fun getTitle self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getTitle_ self
    fun getWrapWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWrapWidth_ self
    fun popdown self = (GObjectObjectClass.C.withPtr ---> I) popdown_ self
    fun popup self = (GObjectObjectClass.C.withPtr ---> I) popup_ self
    fun popupForDevice self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) popupForDevice_ (self & device)
    fun setActive self index = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setActive_ (self & index)
    fun setActiveId self activeId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> FFI.Bool.C.fromVal) setActiveId_ (self & activeId)
    fun setActiveIter self iter = (GObjectObjectClass.C.withPtr &&&> GtkTreeIterRecord.C.withOptPtr ---> I) setActiveIter_ (self & iter)
    fun setAddTearoffs self addTearoffs = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    fun setButtonSensitivity self sensitivity = (GObjectObjectClass.C.withPtr &&&> GtkSensitivityType.C.withVal ---> I) setButtonSensitivity_ (self & sensitivity)
    fun setColumnSpanColumn self columnSpan = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setColumnSpanColumn_ (self & columnSpan)
    fun setEntryTextColumn self textColumn = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setEntryTextColumn_ (self & textColumn)
    fun setFocusOnClick self focusOnClick = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setIdColumn self idColumn = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setIdColumn_ (self & idColumn)
    fun setModel self model = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupFixedWidth self fixed = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setPopupFixedWidth_ (self & fixed)
    fun setRowSpanColumn self rowSpan = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setRowSpanColumn_ (self & rowSpan)
    fun setTitle self title = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTitle_ (self & title)
    fun setWrapWidth self width = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWrapWidth_ (self & width)
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
