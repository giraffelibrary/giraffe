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
    val getType_ = _import "gtk_combo_box_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_combo_box_new" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithArea_ = _import "gtk_combo_box_new_with_area" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithAreaAndEntry_ = _import "gtk_combo_box_new_with_area_and_entry" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithEntry_ = _import "gtk_combo_box_new_with_entry" : unit -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithModel_ = _import "gtk_combo_box_new_with_model" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val newWithModelAndEntry_ = _import "gtk_combo_box_new_with_model_and_entry" : GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getActive_ = _import "gtk_combo_box_get_active" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val getActiveId_ = _import "gtk_combo_box_get_active_id" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_get_active_iter" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getAddTearoffs_ = _import "gtk_combo_box_get_add_tearoffs" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Bool.C.val_;
    val getButtonSensitivity_ = _import "gtk_combo_box_get_button_sensitivity" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> GtkSensitivityType.C.val_;
    val getColumnSpanColumn_ = _import "gtk_combo_box_get_column_span_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val getEntryTextColumn_ = _import "gtk_combo_box_get_entry_text_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val getFocusOnClick_ = _import "gtk_combo_box_get_focus_on_click" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Bool.C.val_;
    val getHasEntry_ = _import "gtk_combo_box_get_has_entry" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Bool.C.val_;
    val getIdColumn_ = _import "gtk_combo_box_get_id_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val getModel_ = _import "gtk_combo_box_get_model" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p;
    val getPopupAccessible_ = _import "gtk_combo_box_get_popup_accessible" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getPopupFixedWidth_ = _import "gtk_combo_box_get_popup_fixed_width" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Bool.C.val_;
    val getRowSpanColumn_ = _import "gtk_combo_box_get_row_span_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val getTitle_ = _import "gtk_combo_box_get_title" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getWrapWidth_ = _import "gtk_combo_box_get_wrap_width" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> FFI.Int32.C.val_;
    val popdown_ = _import "gtk_combo_box_popdown" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> unit;
    val popup_ = _import "gtk_combo_box_popup" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p -> unit;
    val popupForDevice_ = fn x1 & x2 => (_import "gtk_combo_box_popup_for_device" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> unit;) (x1, x2)
    val setActive_ = fn x1 & x2 => (_import "gtk_combo_box_set_active" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setActiveId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_active_id" :
              GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_set_active_iter" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * unit GtkTreeIterRecord.C.p -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_combo_box_set_add_tearoffs" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setButtonSensitivity_ = fn x1 & x2 => (_import "gtk_combo_box_set_button_sensitivity" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * GtkSensitivityType.C.val_ -> unit;) (x1, x2)
    val setColumnSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_column_span_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setEntryTextColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_entry_text_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_combo_box_set_focus_on_click" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIdColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_id_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_combo_box_set_model" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * unit GtkTreeModelClass.C.p -> unit;) (x1, x2)
    val setPopupFixedWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_popup_fixed_width" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRowSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_row_span_column" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_title" :
              GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_wrap_width" : GtkComboBoxClass.C.notnull GtkComboBoxClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
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
