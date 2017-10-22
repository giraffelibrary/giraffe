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
    val getType_ = _import "gtk_combo_box_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_combo_box_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithArea_ = _import "gtk_combo_box_new_with_area" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithAreaAndEntry_ = _import "gtk_combo_box_new_with_area_and_entry" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithEntry_ = _import "gtk_combo_box_new_with_entry" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithModel_ = _import "gtk_combo_box_new_with_model" : GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithModelAndEntry_ = _import "gtk_combo_box_new_with_model_and_entry" : GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getActive_ = _import "gtk_combo_box_get_active" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val getActiveId_ = _import "gtk_combo_box_get_active_id" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_get_active_iter" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getAddTearoffs_ = _import "gtk_combo_box_get_add_tearoffs" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getButtonSensitivity_ = _import "gtk_combo_box_get_button_sensitivity" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getColumnSpanColumn_ = _import "gtk_combo_box_get_column_span_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val getEntryTextColumn_ = _import "gtk_combo_box_get_entry_text_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val getFocusOnClick_ = _import "gtk_combo_box_get_focus_on_click" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getHasEntry_ = _import "gtk_combo_box_get_has_entry" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getIdColumn_ = _import "gtk_combo_box_get_id_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val getModel_ = _import "gtk_combo_box_get_model" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p;
    val getPopupAccessible_ = _import "gtk_combo_box_get_popup_accessible" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> AtkObjectClass.FFI.notnull AtkObjectClass.FFI.p;
    val getPopupFixedWidth_ = _import "gtk_combo_box_get_popup_fixed_width" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getRowSpanColumn_ = _import "gtk_combo_box_get_row_span_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val getTitle_ = _import "gtk_combo_box_get_title" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getWrapWidth_ = _import "gtk_combo_box_get_wrap_width" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> GInt.FFI.val_;
    val popdown_ = _import "gtk_combo_box_popdown" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> unit;
    val popup_ = _import "gtk_combo_box_popup" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p -> unit;
    val popupForDevice_ = fn x1 & x2 => (_import "gtk_combo_box_popup_for_device" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> unit;) (x1, x2)
    val setActive_ = fn x1 & x2 => (_import "gtk_combo_box_set_active" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setActiveId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_active_id" :
              GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_set_active_iter" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * unit GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_combo_box_set_add_tearoffs" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setButtonSensitivity_ = fn x1 & x2 => (_import "gtk_combo_box_set_button_sensitivity" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_column_span_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setEntryTextColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_entry_text_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_combo_box_set_focus_on_click" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIdColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_id_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_combo_box_set_model" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * unit GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
    val setPopupFixedWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_popup_fixed_width" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_row_span_column" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_title" :
              GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_wrap_width" : GtkComboBoxClass.FFI.notnull GtkComboBoxClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkComboBoxClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr ---> GtkComboBoxClass.FFI.fromPtr false) newWithArea_ area
    fun newWithAreaAndEntry area = (GtkCellAreaClass.FFI.withPtr ---> GtkComboBoxClass.FFI.fromPtr false) newWithAreaAndEntry_ area
    fun newWithEntry () = (I ---> GtkComboBoxClass.FFI.fromPtr false) newWithEntry_ ()
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr ---> GtkComboBoxClass.FFI.fromPtr false) newWithModel_ model
    fun newWithModelAndEntry model = (GtkTreeModelClass.FFI.withPtr ---> GtkComboBoxClass.FFI.fromPtr false) newWithModelAndEntry_ model
    fun getActive self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getActive_ self
    fun getActiveId self = (GtkComboBoxClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getActiveId_ self
    fun getActiveIter self =
      let
        val iter & retVal = (GtkComboBoxClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal) getActiveIter_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getAddTearoffs self = (GtkComboBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getAddTearoffs_ self
    fun getButtonSensitivity self = (GtkComboBoxClass.FFI.withPtr ---> GtkSensitivityType.FFI.fromVal) getButtonSensitivity_ self
    fun getColumnSpanColumn self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getColumnSpanColumn_ self
    fun getEntryTextColumn self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getEntryTextColumn_ self
    fun getFocusOnClick self = (GtkComboBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getHasEntry self = (GtkComboBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasEntry_ self
    fun getIdColumn self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getIdColumn_ self
    fun getModel self = (GtkComboBoxClass.FFI.withPtr ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun getPopupAccessible self = (GtkComboBoxClass.FFI.withPtr ---> AtkObjectClass.FFI.fromPtr false) getPopupAccessible_ self
    fun getPopupFixedWidth self = (GtkComboBoxClass.FFI.withPtr ---> GBool.FFI.fromVal) getPopupFixedWidth_ self
    fun getRowSpanColumn self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getRowSpanColumn_ self
    fun getTitle self = (GtkComboBoxClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getWrapWidth self = (GtkComboBoxClass.FFI.withPtr ---> GInt.FFI.fromVal) getWrapWidth_ self
    fun popdown self = (GtkComboBoxClass.FFI.withPtr ---> I) popdown_ self
    fun popup self = (GtkComboBoxClass.FFI.withPtr ---> I) popup_ self
    fun popupForDevice self device = (GtkComboBoxClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> I) popupForDevice_ (self & device)
    fun setActive self index = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setActive_ (self & index)
    fun setActiveId self activeId = (GtkComboBoxClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> GBool.FFI.fromVal) setActiveId_ (self & activeId)
    fun setActiveIter self iter = (GtkComboBoxClass.FFI.withPtr &&&> GtkTreeIterRecord.FFI.withOptPtr ---> I) setActiveIter_ (self & iter)
    fun setAddTearoffs self addTearoffs = (GtkComboBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    fun setButtonSensitivity self sensitivity = (GtkComboBoxClass.FFI.withPtr &&&> GtkSensitivityType.FFI.withVal ---> I) setButtonSensitivity_ (self & sensitivity)
    fun setColumnSpanColumn self columnSpan = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setColumnSpanColumn_ (self & columnSpan)
    fun setEntryTextColumn self textColumn = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setEntryTextColumn_ (self & textColumn)
    fun setFocusOnClick self focusOnClick = (GtkComboBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setIdColumn self idColumn = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setIdColumn_ (self & idColumn)
    fun setModel self model = (GtkComboBoxClass.FFI.withPtr &&&> GtkTreeModelClass.FFI.withOptPtr ---> I) setModel_ (self & model)
    fun setPopupFixedWidth self fixed = (GtkComboBoxClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setPopupFixedWidth_ (self & fixed)
    fun setRowSpanColumn self rowSpan = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setRowSpanColumn_ (self & rowSpan)
    fun setTitle self title = (GtkComboBoxClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setTitle_ (self & title)
    fun setWrapWidth self width = (GtkComboBoxClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setWrapWidth_ (self & width)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun formatEntryTextSig f = signal "format-entry-text" (get 0w1 string ---> ret string) f
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
