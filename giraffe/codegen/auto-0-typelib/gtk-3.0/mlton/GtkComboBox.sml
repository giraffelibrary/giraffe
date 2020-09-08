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
    val new_ = _import "gtk_combo_box_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithArea_ = _import "gtk_combo_box_new_with_area" : GtkCellAreaClass.FFI.non_opt GtkCellAreaClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithAreaAndEntry_ = _import "gtk_combo_box_new_with_area_and_entry" : GtkCellAreaClass.FFI.non_opt GtkCellAreaClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithEntry_ = _import "gtk_combo_box_new_with_entry" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithModel_ = _import "gtk_combo_box_new_with_model" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithModelAndEntry_ = _import "gtk_combo_box_new_with_model_and_entry" : GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getActive_ = _import "gtk_combo_box_get_active" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val getActiveId_ = _import "gtk_combo_box_get_active_id" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_get_active_iter" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GtkTreeIterRecord.FFI.non_opt GtkTreeIterRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getAddTearoffs_ = _import "gtk_combo_box_get_add_tearoffs" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getButtonSensitivity_ = _import "gtk_combo_box_get_button_sensitivity" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GtkSensitivityType.FFI.val_;
    val getColumnSpanColumn_ = _import "gtk_combo_box_get_column_span_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val getEntryTextColumn_ = _import "gtk_combo_box_get_entry_text_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val getFocusOnClick_ = _import "gtk_combo_box_get_focus_on_click" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getHasEntry_ = _import "gtk_combo_box_get_has_entry" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getIdColumn_ = _import "gtk_combo_box_get_id_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val getModel_ = _import "gtk_combo_box_get_model" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GtkTreeModelClass.FFI.non_opt GtkTreeModelClass.FFI.p;
    val getPopupAccessible_ = _import "gtk_combo_box_get_popup_accessible" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val getPopupFixedWidth_ = _import "gtk_combo_box_get_popup_fixed_width" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GBool.FFI.val_;
    val getRowSpanColumn_ = _import "gtk_combo_box_get_row_span_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val getTitle_ = _import "gtk_combo_box_get_title" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getWrapWidth_ = _import "gtk_combo_box_get_wrap_width" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> GInt32.FFI.val_;
    val popdown_ = _import "gtk_combo_box_popdown" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> unit;
    val popup_ = _import "gtk_combo_box_popup" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p -> unit;
    val popupForDevice_ = fn x1 & x2 => (_import "gtk_combo_box_popup_for_device" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> unit;) (x1, x2)
    val setActive_ = fn x1 & x2 => (_import "gtk_combo_box_set_active" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setActiveId_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_active_id" :
              GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val setActiveIter_ = fn x1 & x2 => (_import "gtk_combo_box_set_active_iter" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GtkTreeIterRecord.FFI.opt GtkTreeIterRecord.FFI.p -> unit;) (x1, x2)
    val setAddTearoffs_ = fn x1 & x2 => (_import "gtk_combo_box_set_add_tearoffs" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setButtonSensitivity_ = fn x1 & x2 => (_import "gtk_combo_box_set_button_sensitivity" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GtkSensitivityType.FFI.val_ -> unit;) (x1, x2)
    val setColumnSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_column_span_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setEntryTextColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_entry_text_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_combo_box_set_focus_on_click" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIdColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_id_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setModel_ = fn x1 & x2 => (_import "gtk_combo_box_set_model" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GtkTreeModelClass.FFI.opt GtkTreeModelClass.FFI.p -> unit;) (x1, x2)
    val setPopupFixedWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_popup_fixed_width" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRowSpanColumn_ = fn x1 & x2 => (_import "gtk_combo_box_set_row_span_column" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setTitle_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_combo_box_set_title" :
              GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setWrapWidth_ = fn x1 & x2 => (_import "gtk_combo_box_set_wrap_width" : GtkComboBoxClass.FFI.non_opt GtkComboBoxClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkComboBoxClass.FFI.fromPtr false) new_ ()
    fun newWithArea area = (GtkCellAreaClass.FFI.withPtr false ---> GtkComboBoxClass.FFI.fromPtr false) newWithArea_ area
    fun newWithAreaAndEntry area = (GtkCellAreaClass.FFI.withPtr false ---> GtkComboBoxClass.FFI.fromPtr false) newWithAreaAndEntry_ area
    fun newWithEntry () = (I ---> GtkComboBoxClass.FFI.fromPtr false) newWithEntry_ ()
    fun newWithModel model = (GtkTreeModelClass.FFI.withPtr false ---> GtkComboBoxClass.FFI.fromPtr false) newWithModel_ model
    fun newWithModelAndEntry model = (GtkTreeModelClass.FFI.withPtr false ---> GtkComboBoxClass.FFI.fromPtr false) newWithModelAndEntry_ model
    fun getActive self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getActive_ self
    fun getActiveId self = (GtkComboBoxClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getActiveId_ self
    fun getActiveIter self =
      let
        val iter & retVal = (GtkComboBoxClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withNewPtr ---> GtkTreeIterRecord.FFI.fromPtr true && GBool.FFI.fromVal) getActiveIter_ (self & ())
      in
        if retVal then SOME iter else NONE
      end
    fun getAddTearoffs self = (GtkComboBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAddTearoffs_ self
    fun getButtonSensitivity self = (GtkComboBoxClass.FFI.withPtr false ---> GtkSensitivityType.FFI.fromVal) getButtonSensitivity_ self
    fun getColumnSpanColumn self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getColumnSpanColumn_ self
    fun getEntryTextColumn self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getEntryTextColumn_ self
    fun getFocusOnClick self = (GtkComboBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getHasEntry self = (GtkComboBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasEntry_ self
    fun getIdColumn self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getIdColumn_ self
    fun getModel self = (GtkComboBoxClass.FFI.withPtr false ---> GtkTreeModelClass.FFI.fromPtr false) getModel_ self
    fun getPopupAccessible self = (GtkComboBoxClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) getPopupAccessible_ self
    fun getPopupFixedWidth self = (GtkComboBoxClass.FFI.withPtr false ---> GBool.FFI.fromVal) getPopupFixedWidth_ self
    fun getRowSpanColumn self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getRowSpanColumn_ self
    fun getTitle self = (GtkComboBoxClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getTitle_ self
    fun getWrapWidth self = (GtkComboBoxClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getWrapWidth_ self
    fun popdown self = (GtkComboBoxClass.FFI.withPtr false ---> I) popdown_ self
    fun popup self = (GtkComboBoxClass.FFI.withPtr false ---> I) popup_ self
    fun popupForDevice self device = (GtkComboBoxClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> I) popupForDevice_ (self & device)
    fun setActive self index = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setActive_ (self & index)
    fun setActiveId self activeId = (GtkComboBoxClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> GBool.FFI.fromVal) setActiveId_ (self & activeId)
    fun setActiveIter self iter = (GtkComboBoxClass.FFI.withPtr false &&&> GtkTreeIterRecord.FFI.withOptPtr false ---> I) setActiveIter_ (self & iter)
    fun setAddTearoffs self addTearoffs = (GtkComboBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAddTearoffs_ (self & addTearoffs)
    fun setButtonSensitivity self sensitivity = (GtkComboBoxClass.FFI.withPtr false &&&> GtkSensitivityType.FFI.withVal ---> I) setButtonSensitivity_ (self & sensitivity)
    fun setColumnSpanColumn self columnSpan = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setColumnSpanColumn_ (self & columnSpan)
    fun setEntryTextColumn self textColumn = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setEntryTextColumn_ (self & textColumn)
    fun setFocusOnClick self focusOnClick = (GtkComboBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setIdColumn self idColumn = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setIdColumn_ (self & idColumn)
    fun setModel self model = (GtkComboBoxClass.FFI.withPtr false &&&> GtkTreeModelClass.FFI.withOptPtr false ---> I) setModel_ (self & model)
    fun setPopupFixedWidth self fixed = (GtkComboBoxClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setPopupFixedWidth_ (self & fixed)
    fun setRowSpanColumn self rowSpan = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setRowSpanColumn_ (self & rowSpan)
    fun setTitle self title = (GtkComboBoxClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setTitle_ (self & title)
    fun setWrapWidth self width = (GtkComboBoxClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setWrapWidth_ (self & width)
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
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val activeIdProp =
        {
          name = "active-id",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val addTearoffsProp =
        {
          name = "add-tearoffs",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val buttonSensitivityProp =
        {
          name = "button-sensitivity",
          gtype = fn () => C.gtype GtkSensitivityType.t (),
          get = fn x => fn () => C.get GtkSensitivityType.t x,
          set = fn x => C.set GtkSensitivityType.t x,
          init = fn x => C.set GtkSensitivityType.t x
        }
      val cellAreaProp =
        {
          name = "cell-area",
          gtype = fn () => C.gtype GtkCellAreaClass.tOpt (),
          get = fn x => fn () => C.get GtkCellAreaClass.tOpt x,
          set = ignore,
          init = fn x => C.set GtkCellAreaClass.tOpt x
        }
      val columnSpanColumnProp =
        {
          name = "column-span-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val entryTextColumnProp =
        {
          name = "entry-text-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val hasEntryProp =
        {
          name = "has-entry",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = fn x => C.set boolean x
        }
      val hasFrameProp =
        {
          name = "has-frame",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val idColumnProp =
        {
          name = "id-column",
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
      val popupFixedWidthProp =
        {
          name = "popup-fixed-width",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val popupShownProp =
        {
          name = "popup-shown",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val rowSpanColumnProp =
        {
          name = "row-span-column",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val tearoffTitleProp =
        {
          name = "tearoff-title",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val wrapWidthProp =
        {
          name = "wrap-width",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
    end
  end
