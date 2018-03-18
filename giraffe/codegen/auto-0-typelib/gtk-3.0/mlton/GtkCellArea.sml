structure GtkCellArea :>
  GTK_CELL_AREA
    where type 'a class = 'a GtkCellAreaClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    where type direction_type_t = GtkDirectionType.t
    where type size_request_mode_t = GtkSizeRequestMode.t
    where type cell_renderer_state_t = GtkCellRendererState.t
    where type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type orientation_t = GtkOrientation.t
    where type tree_iter_t = GtkTreeIterRecord.t
    where type 'a tree_model_class = 'a GtkTreeModelClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a cell_renderer_class = 'a GtkCellRendererClass.class =
  struct
    val getType_ = _import "gtk_cell_area_get_type" : unit -> GObjectType.FFI.val_;
    val activate_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_activate" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               * GBool.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val activateCell_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_activate_cell" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GdkEvent.FFI.notnull GdkEvent.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val add_ = fn x1 & x2 => (_import "gtk_cell_area_add" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val addFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_add_focus_sibling" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val applyAttributes_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_apply_attributes" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkTreeModelClass.FFI.notnull GtkTreeModelClass.FFI.p
               * GtkTreeIterRecord.FFI.notnull GtkTreeIterRecord.FFI.p
               * GBool.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val attributeConnect_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_cell_area_attribute_connect" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val attributeDisconnect_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_cell_area_attribute_disconnect" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val attributeGetColumn_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_cell_area_attribute_get_column" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val cellGetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_cell_area_cell_get_property" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val cellSetProperty_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_gtk_cell_area_cell_set_property" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val copyContext_ = fn x1 & x2 => (_import "gtk_cell_area_copy_context" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p -> GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p;) (x1, x2)
    val createContext_ = _import "gtk_cell_area_create_context" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p;
    val event_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_event" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GdkEvent.FFI.notnull GdkEvent.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val focus_ = fn x1 & x2 => (_import "gtk_cell_area_focus" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkDirectionType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getCellAllocation_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_get_cell_allocation" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getCellAtPosition_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_cell_area_get_cell_at_position" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getCurrentPathString_ = _import "gtk_cell_area_get_current_path_string" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getEditWidget_ = _import "gtk_cell_area_get_edit_widget" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkCellEditableClass.FFI.notnull GtkCellEditableClass.FFI.p;
    val getEditedCell_ = _import "gtk_cell_area_get_edited_cell" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p;
    val getFocusCell_ = _import "gtk_cell_area_get_focus_cell" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p;
    val getFocusFromSibling_ = fn x1 & x2 => (_import "gtk_cell_area_get_focus_from_sibling" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> unit GtkCellRendererClass.FFI.p;) (x1, x2)
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_get_preferred_height" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getPreferredHeightForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_get_preferred_height_for_width" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getPreferredWidth_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_get_preferred_width" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getPreferredWidthForHeight_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_cell_area_get_preferred_width_for_height" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getRequestMode_ = _import "gtk_cell_area_get_request_mode" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GtkSizeRequestMode.FFI.val_;
    val hasRenderer_ = fn x1 & x2 => (_import "gtk_cell_area_has_renderer" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val innerCellArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_area_inner_cell_area" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isActivatable_ = _import "gtk_cell_area_is_activatable" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p -> GBool.FFI.val_;
    val isFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_is_focus_sibling" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_cell_area_remove" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val removeFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_remove_focus_sibling" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val render_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7
         & x8 =>
          (
            _import "gtk_cell_area_render" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellAreaContextClass.FFI.notnull GtkCellAreaContextClass.FFI.p
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * CairoContextRecord.FFI.notnull CairoContextRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               * GtkCellRendererState.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8
            )
    val requestRenderer_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_cell_area_request_renderer" :
              GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p
               * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p
               * GtkOrientation.FFI.val_
               * GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setFocusCell_ = fn x1 & x2 => (_import "gtk_cell_area_set_focus_cell" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GtkCellRendererClass.FFI.notnull GtkCellRendererClass.FFI.p -> unit;) (x1, x2)
    val stopEditing_ = fn x1 & x2 => (_import "gtk_cell_area_stop_editing" : GtkCellAreaClass.FFI.notnull GtkCellAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkCellAreaClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_layout_class = 'a GtkCellLayoutClass.class
    type direction_type_t = GtkDirectionType.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type cell_renderer_state_t = GtkCellRendererState.t
    type 'a cell_area_context_class = 'a GtkCellAreaContextClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type orientation_t = GtkOrientation.t
    type tree_iter_t = GtkTreeIterRecord.t
    type 'a tree_model_class = 'a GtkTreeModelClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a cell_renderer_class = 'a GtkCellRendererClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr ---> GtkCellLayoutClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun activate
      self
      (
        context,
        widget,
        cellArea,
        flags,
        editOnly
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellAreaContextClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        activate_
        (
          self
           & context
           & widget
           & cellArea
           & flags
           & editOnly
        )
    fun activateCell
      self
      (
        widget,
        renderer,
        event,
        cellArea,
        flags
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        activateCell_
        (
          self
           & widget
           & renderer
           & event
           & cellArea
           & flags
        )
    fun add self renderer = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) add_ (self & renderer)
    fun addFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         ---> I
      )
        addFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun applyAttributes
      self
      (
        treeModel,
        iter,
        isExpander,
        isExpanded
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkTreeModelClass.FFI.withPtr
         &&&> GtkTreeIterRecord.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        applyAttributes_
        (
          self
           & treeModel
           & iter
           & isExpander
           & isExpanded
        )
    fun attributeConnect
      self
      (
        renderer,
        attribute,
        column
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         ---> I
      )
        attributeConnect_
        (
          self
           & renderer
           & attribute
           & column
        )
    fun attributeDisconnect self (renderer, attribute) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        attributeDisconnect_
        (
          self
           & renderer
           & attribute
        )
    fun attributeGetColumn self (renderer, attribute) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> GInt32.FFI.fromVal
      )
        attributeGetColumn_
        (
          self
           & renderer
           & attribute
        )
    fun cellGetProperty
      self
      (
        renderer,
        propertyName,
        value
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        cellGetProperty_
        (
          self
           & renderer
           & propertyName
           & value
        )
    fun cellSetProperty
      self
      (
        renderer,
        propertyName,
        value
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GObjectValueRecord.FFI.withPtr
         ---> I
      )
        cellSetProperty_
        (
          self
           & renderer
           & propertyName
           & value
        )
    fun copyContext self context = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellAreaContextClass.FFI.withPtr ---> GtkCellAreaContextClass.FFI.fromPtr true) copyContext_ (self & context)
    fun createContext self = (GtkCellAreaClass.FFI.withPtr ---> GtkCellAreaContextClass.FFI.fromPtr true) createContext_ self
    fun event
      self
      (
        context,
        widget,
        event,
        cellArea,
        flags
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellAreaContextClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> GdkEvent.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        event_
        (
          self
           & context
           & widget
           & event
           & cellArea
           & flags
        )
    fun focus self direction = (GtkCellAreaClass.FFI.withPtr &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal) focus_ (self & direction)
    fun getCellAllocation
      self
      (
        context,
        widget,
        renderer,
        cellArea
      ) =
      let
        val allocation & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GtkCellRendererClass.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getCellAllocation_
            (
              self
               & context
               & widget
               & renderer
               & cellArea
               & ()
            )
      in
        allocation
      end
    fun getCellAtPosition
      self
      (
        context,
        widget,
        cellArea,
        x,
        y
      ) =
      let
        val allocArea & retVal =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withVal
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && GtkCellRendererClass.FFI.fromPtr false
          )
            getCellAtPosition_
            (
              self
               & context
               & widget
               & cellArea
               & x
               & y
               & ()
            )
      in
        (retVal, allocArea)
      end
    fun getCurrentPathString self = (GtkCellAreaClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCurrentPathString_ self
    fun getEditWidget self = (GtkCellAreaClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) getEditWidget_ self
    fun getEditedCell self = (GtkCellAreaClass.FFI.withPtr ---> GtkCellRendererClass.FFI.fromPtr false) getEditedCell_ self
    fun getFocusCell self = (GtkCellAreaClass.FFI.withPtr ---> GtkCellRendererClass.FFI.fromPtr false) getFocusCell_ self
    fun getFocusFromSibling self renderer = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> GtkCellRendererClass.FFI.fromOptPtr false) getFocusFromSibling_ (self & renderer)
    fun getPreferredHeight self (context, widget) =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & context
               & widget
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredHeightForWidth
      self
      (
        context,
        widget,
        width
      ) =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & context
               & widget
               & width
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredWidth self (context, widget) =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & context
               & widget
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getPreferredWidthForHeight
      self
      (
        context,
        widget,
        height
      ) =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellAreaContextClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & context
               & widget
               & height
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GtkCellAreaClass.FFI.withPtr ---> GtkSizeRequestMode.FFI.fromVal) getRequestMode_ self
    fun hasRenderer self renderer = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> GBool.FFI.fromVal) hasRenderer_ (self & renderer)
    fun innerCellArea self (widget, cellArea) =
      let
        val innerArea & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withPtr
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            innerCellArea_
            (
              self
               & widget
               & cellArea
               & ()
            )
      in
        innerArea
      end
    fun isActivatable self = (GtkCellAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) isActivatable_ self
    fun isFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         ---> GBool.FFI.fromVal
      )
        isFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun remove self renderer = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) remove_ (self & renderer)
    fun removeFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         &&&> GtkCellRendererClass.FFI.withPtr
         ---> I
      )
        removeFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun render
      self
      (
        context,
        widget,
        cr,
        backgroundArea,
        cellArea,
        flags,
        paintFocus
      ) =
      (
        GtkCellAreaClass.FFI.withPtr
         &&&> GtkCellAreaContextClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> CairoContextRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GdkRectangleRecord.FFI.withPtr
         &&&> GtkCellRendererState.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        render_
        (
          self
           & context
           & widget
           & cr
           & backgroundArea
           & cellArea
           & flags
           & paintFocus
        )
    fun requestRenderer
      self
      (
        renderer,
        orientation,
        widget,
        forSize
      ) =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GtkCellAreaClass.FFI.withPtr
             &&&> GtkCellRendererClass.FFI.withPtr
             &&&> GtkOrientation.FFI.withVal
             &&&> GtkWidgetClass.FFI.withPtr
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            requestRenderer_
            (
              self
               & renderer
               & orientation
               & widget
               & forSize
               & GInt32.null
               & GInt32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun setFocusCell self renderer = (GtkCellAreaClass.FFI.withPtr &&&> GtkCellRendererClass.FFI.withPtr ---> I) setFocusCell_ (self & renderer)
    fun stopEditing self canceled = (GtkCellAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) stopEditing_ (self & canceled)
    local
      open ClosureMarshal Signal
    in
      fun addEditableSig f =
        signal "add-editable"
          (
            get 0w1 GtkCellRendererClass.t
             &&&> get 0w2 GtkCellEditableClass.t
             &&&> get 0w3 GdkRectangleRecord.t
             &&&> get 0w4 string
             ---> ret_void
          )
          (
            fn
              renderer
               & editable
               & cellArea
               & path =>
                f
                  (
                    renderer,
                    editable,
                    cellArea,
                    path
                  )
          )
      fun applyAttributesSig f =
        signal "apply-attributes"
          (
            get 0w1 GtkTreeModelClass.t
             &&&> get 0w2 GtkTreeIterRecord.t
             &&&> get 0w3 boolean
             &&&> get 0w4 boolean
             ---> ret_void
          )
          (
            fn
              model
               & iter
               & isExpander
               & isExpanded =>
                f
                  (
                    model,
                    iter,
                    isExpander,
                    isExpanded
                  )
          )
      fun focusChangedSig f = signal "focus-changed" (get 0w1 GtkCellRendererClass.t &&&> get 0w2 string ---> ret_void) (fn renderer & path => f (renderer, path))
      fun removeEditableSig f = signal "remove-editable" (get 0w1 GtkCellRendererClass.t &&&> get 0w2 GtkCellEditableClass.t ---> ret_void) (fn renderer & editable => f (renderer, editable))
    end
    local
      open Property
    in
      val editWidgetProp = {get = fn x => get "edit-widget" GtkCellEditableClass.tOpt x}
      val editedCellProp = {get = fn x => get "edited-cell" GtkCellRendererClass.tOpt x}
      val focusCellProp =
        {
          get = fn x => get "focus-cell" GtkCellRendererClass.tOpt x,
          set = fn x => set "focus-cell" GtkCellRendererClass.tOpt x,
          new = fn x => new "focus-cell" GtkCellRendererClass.tOpt x
        }
    end
  end
