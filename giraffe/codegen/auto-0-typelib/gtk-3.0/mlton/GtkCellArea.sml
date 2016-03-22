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
    val getType_ = _import "gtk_cell_area_get_type" : unit -> GObjectType.C.val_;
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkCellRendererState.C.val_
               * FFI.Bool.C.val_
               -> FFI.Bool.C.val_;
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkCellRendererState.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val add_ = fn x1 & x2 => (_import "gtk_cell_area_add" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val addFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_add_focus_sibling" :
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkTreeModelClass.C.notnull GtkTreeModelClass.C.p
               * GtkTreeIterRecord.C.notnull GtkTreeIterRecord.C.p
               * FFI.Bool.C.val_
               * FFI.Bool.C.val_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int32.C.val_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val copyContext_ = fn x1 & x2 => (_import "gtk_cell_area_copy_context" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p -> GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p;) (x1, x2)
    val createContext_ = _import "gtk_cell_area_create_context" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p;
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkEvent.C.notnull GdkEvent.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkCellRendererState.C.val_
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val focus_ = fn x1 & x2 => (_import "gtk_cell_area_focus" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkDirectionType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               -> GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p;
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
    val getCurrentPathString_ = _import "gtk_cell_area_get_current_path_string" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getEditWidget_ = _import "gtk_cell_area_get_edit_widget" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkCellEditableClass.C.notnull GtkCellEditableClass.C.p;
    val getEditedCell_ = _import "gtk_cell_area_get_edited_cell" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p;
    val getFocusCell_ = _import "gtk_cell_area_get_focus_cell" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p;
    val getFocusFromSibling_ = fn x1 & x2 => (_import "gtk_cell_area_get_focus_from_sibling" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p;) (x1, x2)
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_cell_area_get_preferred_height" :
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
    val getRequestMode_ = _import "gtk_cell_area_get_request_mode" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> GtkSizeRequestMode.C.val_;
    val hasRenderer_ = fn x1 & x2 => (_import "gtk_cell_area_has_renderer" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val innerCellArea_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_cell_area_inner_cell_area" :
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val isActivatable_ = _import "gtk_cell_area_is_activatable" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p -> FFI.Bool.C.val_;
    val isFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_is_focus_sibling" :
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "gtk_cell_area_remove" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val removeFocusSibling_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_cell_area_remove_focus_sibling" :
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellAreaContextClass.C.notnull GtkCellAreaContextClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * CairoContextRecord.C.notnull CairoContextRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * CairoRectangleIntRecord.C.notnull CairoRectangleIntRecord.C.p
               * GtkCellRendererState.C.val_
               * FFI.Bool.C.val_
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
              GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p
               * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p
               * GtkOrientation.C.val_
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
    val setFocusCell_ = fn x1 & x2 => (_import "gtk_cell_area_set_focus_cell" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * GtkCellRendererClass.C.notnull GtkCellRendererClass.C.p -> unit;) (x1, x2)
    val stopEditing_ = fn x1 & x2 => (_import "gtk_cell_area_stop_editing" : GtkCellAreaClass.C.notnull GtkCellAreaClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
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
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.C.withPtr ---> GtkCellLayoutClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun activate self context widget cellArea flags editOnly =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellAreaContextClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
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
    fun activateCell self widget renderer event cellArea flags =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> FFI.Bool.C.fromVal
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
    fun add self renderer = (GtkCellAreaClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) add_ (self & renderer)
    fun addFocusSibling self renderer sibling =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         ---> I
      )
        addFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun applyAttributes self treeModel iter isExpander isExpanded =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkTreeModelClass.C.withPtr
         &&&> GtkTreeIterRecord.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.Bool.C.withVal
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
    fun attributeConnect self renderer attribute column =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> I
      )
        attributeConnect_
        (
          self
           & renderer
           & attribute
           & column
        )
    fun attributeDisconnect self renderer attribute =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        attributeDisconnect_
        (
          self
           & renderer
           & attribute
        )
    fun cellGetProperty self renderer propertyName value =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        cellGetProperty_
        (
          self
           & renderer
           & propertyName
           & value
        )
    fun cellSetProperty self renderer propertyName value =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        cellSetProperty_
        (
          self
           & renderer
           & propertyName
           & value
        )
    fun copyContext self context = (GtkCellAreaClass.C.withPtr &&&> GtkCellAreaContextClass.C.withPtr ---> GtkCellAreaContextClass.C.fromPtr true) copyContext_ (self & context)
    fun createContext self = (GtkCellAreaClass.C.withPtr ---> GtkCellAreaContextClass.C.fromPtr true) createContext_ self
    fun event self context widget event cellArea flags =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellAreaContextClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> GdkEvent.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         ---> FFI.Int32.C.fromVal
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
    fun focus self direction = (GtkCellAreaClass.C.withPtr &&&> GtkDirectionType.C.withVal ---> FFI.Bool.C.fromVal) focus_ (self & direction)
    fun getCellAllocation self context widget renderer cellArea =
      let
        val allocation & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> GtkCellRendererClass.C.withPtr
             &&&> CairoRectangleIntRecord.C.withPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun getCellAtPosition self context widget cellArea x y =
      let
        val allocArea & retVal =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> CairoRectangleIntRecord.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && GtkCellRendererClass.C.fromPtr false
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
    fun getCurrentPathString self = (GtkCellAreaClass.C.withPtr ---> Utf8.C.fromPtr false) getCurrentPathString_ self
    fun getEditWidget self = (GtkCellAreaClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) getEditWidget_ self
    fun getEditedCell self = (GtkCellAreaClass.C.withPtr ---> GtkCellRendererClass.C.fromPtr false) getEditedCell_ self
    fun getFocusCell self = (GtkCellAreaClass.C.withPtr ---> GtkCellRendererClass.C.fromPtr false) getFocusCell_ self
    fun getFocusFromSibling self renderer = (GtkCellAreaClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> GtkCellRendererClass.C.fromPtr false) getFocusFromSibling_ (self & renderer)
    fun getPreferredHeight self context widget =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & context
               & widget
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredHeightForWidth self context widget width =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & context
               & widget
               & width
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredWidth self context widget =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & context
               & widget
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getPreferredWidthForHeight self context widget height =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellAreaContextClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & context
               & widget
               & height
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRequestMode self = (GtkCellAreaClass.C.withPtr ---> GtkSizeRequestMode.C.fromVal) getRequestMode_ self
    fun hasRenderer self renderer = (GtkCellAreaClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> FFI.Bool.C.fromVal) hasRenderer_ (self & renderer)
    fun innerCellArea self widget cellArea =
      let
        val innerArea & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> CairoRectangleIntRecord.C.withPtr
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun isActivatable self = (GtkCellAreaClass.C.withPtr ---> FFI.Bool.C.fromVal) isActivatable_ self
    fun isFocusSibling self renderer sibling =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        isFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun remove self renderer = (GtkCellAreaClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) remove_ (self & renderer)
    fun removeFocusSibling self renderer sibling =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         &&&> GtkCellRendererClass.C.withPtr
         ---> I
      )
        removeFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun render self context widget cr backgroundArea cellArea flags paintFocus =
      (
        GtkCellAreaClass.C.withPtr
         &&&> GtkCellAreaContextClass.C.withPtr
         &&&> GtkWidgetClass.C.withPtr
         &&&> CairoContextRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> GtkCellRendererState.C.withVal
         &&&> FFI.Bool.C.withVal
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
    fun requestRenderer self renderer orientation widget forSize =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GtkCellAreaClass.C.withPtr
             &&&> GtkCellRendererClass.C.withPtr
             &&&> GtkOrientation.C.withVal
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            requestRenderer_
            (
              self
               & renderer
               & orientation
               & widget
               & forSize
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumSize, naturalSize)
      end
    fun setFocusCell self renderer = (GtkCellAreaClass.C.withPtr &&&> GtkCellRendererClass.C.withPtr ---> I) setFocusCell_ (self & renderer)
    fun stopEditing self canceled = (GtkCellAreaClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) stopEditing_ (self & canceled)
    local
      open ClosureMarshal Signal
    in
      fun addEditableSig f =
        signal "add-editable"
          (
            get 0w1 GtkCellRendererClass.t
             &&&> get 0w2 GtkCellEditableClass.t
             &&&> get 0w3 CairoRectangleIntRecord.t
             &&&> get 0w4 string
             ---> ret_void
          )
          (
            fn
              renderer
               & editable
               & cellArea
               & path =>
                f renderer editable cellArea path
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
                f model iter isExpander isExpanded
          )
      fun focusChangedSig f = signal "focus-changed" (get 0w1 GtkCellRendererClass.t &&&> get 0w2 string ---> ret_void) (fn renderer & path => f renderer path)
      fun removeEditableSig f = signal "remove-editable" (get 0w1 GtkCellRendererClass.t &&&> get 0w2 GtkCellEditableClass.t ---> ret_void) (fn renderer & editable => f renderer editable)
    end
    local
      open Property
    in
      val editWidgetProp = {get = fn x => get "edit-widget" GtkCellEditableClass.tOpt x}
      val editedCellProp = {get = fn x => get "edited-cell" GtkCellRendererClass.tOpt x}
      val focusCellProp =
        {
          get = fn x => get "focus-cell" GtkCellRendererClass.tOpt x,
          set = fn x => set "focus-cell" GtkCellRendererClass.tOpt x
        }
    end
  end
