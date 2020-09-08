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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_area_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val activate_ =
        call (getSymbol "gtk_cell_area_activate")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val activateCell_ =
        call (getSymbol "gtk_cell_area_activate_cell")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val add_ = call (getSymbol "gtk_cell_area_add") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val addFocusSibling_ =
        call (getSymbol "gtk_cell_area_add_focus_sibling")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             --> cVoid
          )
      val applyAttributes_ =
        call (getSymbol "gtk_cell_area_apply_attributes")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkTreeModelClass.PolyML.cPtr
             &&> GtkTreeIterRecord.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val attributeConnect_ =
        call (getSymbol "gtk_cell_area_attribute_connect")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val attributeDisconnect_ =
        call (getSymbol "gtk_cell_area_attribute_disconnect")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val attributeGetColumn_ =
        call (getSymbol "gtk_cell_area_attribute_get_column")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> GInt32.PolyML.cVal
          )
      val cellGetProperty_ =
        call (getSymbol "gtk_cell_area_cell_get_property")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val cellSetProperty_ =
        call (getSymbol "gtk_cell_area_cell_set_property")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val copyContext_ = call (getSymbol "gtk_cell_area_copy_context") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellAreaContextClass.PolyML.cPtr --> GtkCellAreaContextClass.PolyML.cPtr)
      val createContext_ = call (getSymbol "gtk_cell_area_create_context") (GtkCellAreaClass.PolyML.cPtr --> GtkCellAreaContextClass.PolyML.cPtr)
      val event_ =
        call (getSymbol "gtk_cell_area_event")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkEvent.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val focus_ = call (getSymbol "gtk_cell_area_focus") (GtkCellAreaClass.PolyML.cPtr &&> GtkDirectionType.PolyML.cVal --> GBool.PolyML.cVal)
      val getCellAllocation_ =
        call (getSymbol "gtk_cell_area_get_cell_allocation")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getCellAtPosition_ =
        call (getSymbol "gtk_cell_area_get_cell_at_position")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GdkRectangleRecord.PolyML.cPtr
             --> GtkCellRendererClass.PolyML.cPtr
          )
      val getCurrentPathString_ = call (getSymbol "gtk_cell_area_get_current_path_string") (GtkCellAreaClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getEditWidget_ = call (getSymbol "gtk_cell_area_get_edit_widget") (GtkCellAreaClass.PolyML.cPtr --> GtkCellEditableClass.PolyML.cPtr)
      val getEditedCell_ = call (getSymbol "gtk_cell_area_get_edited_cell") (GtkCellAreaClass.PolyML.cPtr --> GtkCellRendererClass.PolyML.cPtr)
      val getFocusCell_ = call (getSymbol "gtk_cell_area_get_focus_cell") (GtkCellAreaClass.PolyML.cPtr --> GtkCellRendererClass.PolyML.cPtr)
      val getFocusFromSibling_ = call (getSymbol "gtk_cell_area_get_focus_from_sibling") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> GtkCellRendererClass.PolyML.cOptPtr)
      val getPreferredHeight_ =
        call (getSymbol "gtk_cell_area_get_preferred_height")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeightForWidth_ =
        call (getSymbol "gtk_cell_area_get_preferred_height_for_width")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidth_ =
        call (getSymbol "gtk_cell_area_get_preferred_width")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidthForHeight_ =
        call (getSymbol "gtk_cell_area_get_preferred_width_for_height")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val getRequestMode_ = call (getSymbol "gtk_cell_area_get_request_mode") (GtkCellAreaClass.PolyML.cPtr --> GtkSizeRequestMode.PolyML.cVal)
      val hasRenderer_ = call (getSymbol "gtk_cell_area_has_renderer") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val innerCellArea_ =
        call (getSymbol "gtk_cell_area_inner_cell_area")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val isActivatable_ = call (getSymbol "gtk_cell_area_is_activatable") (GtkCellAreaClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isFocusSibling_ =
        call (getSymbol "gtk_cell_area_is_focus_sibling")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val remove_ = call (getSymbol "gtk_cell_area_remove") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val removeFocusSibling_ =
        call (getSymbol "gtk_cell_area_remove_focus_sibling")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             --> cVoid
          )
      val render_ =
        call (getSymbol "gtk_cell_area_render")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellAreaContextClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> CairoContextRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GtkCellRendererState.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val requestRenderer_ =
        call (getSymbol "gtk_cell_area_request_renderer")
          (
            GtkCellAreaClass.PolyML.cPtr
             &&> GtkCellRendererClass.PolyML.cPtr
             &&> GtkOrientation.PolyML.cVal
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> cVoid
          )
      val setFocusCell_ = call (getSymbol "gtk_cell_area_set_focus_cell") (GtkCellAreaClass.PolyML.cPtr &&> GtkCellRendererClass.PolyML.cPtr --> cVoid)
      val stopEditing_ = call (getSymbol "gtk_cell_area_stop_editing") (GtkCellAreaClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellLayout self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellLayoutClass.FFI.fromPtr false) I self
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellAreaContextClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
    fun add self renderer = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) add_ (self & renderer)
    fun addFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkTreeModelClass.FFI.withPtr false
         &&&> GtkTreeIterRecord.FFI.withPtr false
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        cellSetProperty_
        (
          self
           & renderer
           & propertyName
           & value
        )
    fun copyContext self context = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellAreaContextClass.FFI.withPtr false ---> GtkCellAreaContextClass.FFI.fromPtr true) copyContext_ (self & context)
    fun createContext self = (GtkCellAreaClass.FFI.withPtr false ---> GtkCellAreaContextClass.FFI.fromPtr true) createContext_ self
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellAreaContextClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GdkEvent.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
    fun focus self direction = (GtkCellAreaClass.FFI.withPtr false &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal) focus_ (self & direction)
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GtkCellRendererClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
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
    fun getCurrentPathString self = (GtkCellAreaClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getCurrentPathString_ self
    fun getEditWidget self = (GtkCellAreaClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) getEditWidget_ self
    fun getEditedCell self = (GtkCellAreaClass.FFI.withPtr false ---> GtkCellRendererClass.FFI.fromPtr false) getEditedCell_ self
    fun getFocusCell self = (GtkCellAreaClass.FFI.withPtr false ---> GtkCellRendererClass.FFI.fromPtr false) getFocusCell_ self
    fun getFocusFromSibling self renderer = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> GtkCellRendererClass.FFI.fromOptPtr false) getFocusFromSibling_ (self & renderer)
    fun getPreferredHeight self (context, widget) =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellAreaContextClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
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
    fun getRequestMode self = (GtkCellAreaClass.FFI.withPtr false ---> GtkSizeRequestMode.FFI.fromVal) getRequestMode_ self
    fun hasRenderer self renderer = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasRenderer_ (self & renderer)
    fun innerCellArea self (widget, cellArea) =
      let
        val innerArea & () =
          (
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
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
    fun isActivatable self = (GtkCellAreaClass.FFI.withPtr false ---> GBool.FFI.fromVal) isActivatable_ self
    fun isFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        isFocusSibling_
        (
          self
           & renderer
           & sibling
        )
    fun remove self renderer = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) remove_ (self & renderer)
    fun removeFocusSibling self (renderer, sibling) =
      (
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
         &&&> GtkCellRendererClass.FFI.withPtr false
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
        GtkCellAreaClass.FFI.withPtr false
         &&&> GtkCellAreaContextClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> CairoContextRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
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
            GtkCellAreaClass.FFI.withPtr false
             &&&> GtkCellRendererClass.FFI.withPtr false
             &&&> GtkOrientation.FFI.withVal
             &&&> GtkWidgetClass.FFI.withPtr false
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
    fun setFocusCell self renderer = (GtkCellAreaClass.FFI.withPtr false &&&> GtkCellRendererClass.FFI.withPtr false ---> I) setFocusCell_ (self & renderer)
    fun stopEditing self canceled = (GtkCellAreaClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) stopEditing_ (self & canceled)
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
      open ValueAccessor
    in
      val editWidgetProp =
        {
          name = "edit-widget",
          gtype = fn () => C.gtype GtkCellEditableClass.tOpt (),
          get = fn x => fn () => C.get GtkCellEditableClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val editedCellProp =
        {
          name = "edited-cell",
          gtype = fn () => C.gtype GtkCellRendererClass.tOpt (),
          get = fn x => fn () => C.get GtkCellRendererClass.tOpt x,
          set = ignore,
          init = ignore
        }
      val focusCellProp =
        {
          name = "focus-cell",
          gtype = fn () => C.gtype GtkCellRendererClass.tOpt (),
          get = fn x => fn () => C.get GtkCellRendererClass.tOpt x,
          set = fn x => C.set GtkCellRendererClass.tOpt x,
          init = fn x => C.set GtkCellRendererClass.tOpt x
        }
    end
  end
