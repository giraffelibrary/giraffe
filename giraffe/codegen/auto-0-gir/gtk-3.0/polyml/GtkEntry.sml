structure GtkEntry :>
  GTK_ENTRY
    where type 'a class = 'a GtkEntryClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a cell_editable_class = 'a GtkCellEditableClass.class
    where type 'a editable_class = 'a GtkEditableClass.class
    where type 'a adjustment_class = 'a GtkAdjustmentClass.class
    where type target_list_t = GtkTargetListRecord.t
    where type delete_type_t = GtkDeleteType.t
    where type entry_icon_position_t = GtkEntryIconPosition.t
    where type movement_step_t = GtkMovementStep.t
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a entry_buffer_class = 'a GtkEntryBufferClass.class
    where type 'a entry_completion_class = 'a GtkEntryCompletionClass.class
    where type border_t = GtkBorderRecord.t
    where type input_hints_t = GtkInputHints.t
    where type input_purpose_t = GtkInputPurpose.t
    where type image_type_t = GtkImageType.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_entry_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_entry_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithBuffer_ = call (getSymbol "gtk_entry_new_with_buffer") (GtkEntryBufferClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getActivatesDefault_ = call (getSymbol "gtk_entry_get_activates_default") (GtkEntryClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAlignment_ = call (getSymbol "gtk_entry_get_alignment") (GtkEntryClass.PolyML.cPtr --> GFloat.PolyML.cVal)
      val getAttributes_ = call (getSymbol "gtk_entry_get_attributes") (GtkEntryClass.PolyML.cPtr --> PangoAttrListRecord.PolyML.cOptPtr)
      val getBuffer_ = call (getSymbol "gtk_entry_get_buffer") (GtkEntryClass.PolyML.cPtr --> GtkEntryBufferClass.PolyML.cPtr)
      val getCompletion_ = call (getSymbol "gtk_entry_get_completion") (GtkEntryClass.PolyML.cPtr --> GtkEntryCompletionClass.PolyML.cPtr)
      val getCurrentIconDragSource_ = call (getSymbol "gtk_entry_get_current_icon_drag_source") (GtkEntryClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getCursorHadjustment_ = call (getSymbol "gtk_entry_get_cursor_hadjustment") (GtkEntryClass.PolyML.cPtr --> GtkAdjustmentClass.PolyML.cOptPtr)
      val getHasFrame_ = call (getSymbol "gtk_entry_get_has_frame") (GtkEntryClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIconActivatable_ = call (getSymbol "gtk_entry_get_icon_activatable") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GBool.PolyML.cVal)
      val getIconArea_ =
        call (getSymbol "gtk_entry_get_icon_area")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GdkRectangleRecord.PolyML.cPtr
             --> cVoid
          )
      val getIconAtPos_ =
        call (getSymbol "gtk_entry_get_icon_at_pos")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GInt.PolyML.cVal
          )
      val getIconGicon_ = call (getSymbol "gtk_entry_get_icon_gicon") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GioIconClass.PolyML.cOptPtr)
      val getIconName_ = call (getSymbol "gtk_entry_get_icon_name") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getIconPixbuf_ = call (getSymbol "gtk_entry_get_icon_pixbuf") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getIconSensitive_ = call (getSymbol "gtk_entry_get_icon_sensitive") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GBool.PolyML.cVal)
      val getIconStock_ = call (getSymbol "gtk_entry_get_icon_stock") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getIconStorageType_ = call (getSymbol "gtk_entry_get_icon_storage_type") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GtkImageType.PolyML.cVal)
      val getIconTooltipMarkup_ = call (getSymbol "gtk_entry_get_icon_tooltip_markup") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getIconTooltipText_ = call (getSymbol "gtk_entry_get_icon_tooltip_text") (GtkEntryClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutOptPtr)
      val getInnerBorder_ = call (getSymbol "gtk_entry_get_inner_border") (GtkEntryClass.PolyML.cPtr --> GtkBorderRecord.PolyML.cOptPtr)
      val getInputHints_ = call (getSymbol "gtk_entry_get_input_hints") (GtkEntryClass.PolyML.cPtr --> GtkInputHints.PolyML.cVal)
      val getInputPurpose_ = call (getSymbol "gtk_entry_get_input_purpose") (GtkEntryClass.PolyML.cPtr --> GtkInputPurpose.PolyML.cVal)
      val getInvisibleChar_ = call (getSymbol "gtk_entry_get_invisible_char") (GtkEntryClass.PolyML.cPtr --> GChar.PolyML.cVal)
      val getLayout_ = call (getSymbol "gtk_entry_get_layout") (GtkEntryClass.PolyML.cPtr --> PangoLayoutClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (getSymbol "gtk_entry_get_layout_offsets")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getMaxLength_ = call (getSymbol "gtk_entry_get_max_length") (GtkEntryClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMaxWidthChars_ = call (getSymbol "gtk_entry_get_max_width_chars") (GtkEntryClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getOverwriteMode_ = call (getSymbol "gtk_entry_get_overwrite_mode") (GtkEntryClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPlaceholderText_ = call (getSymbol "gtk_entry_get_placeholder_text") (GtkEntryClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProgressFraction_ = call (getSymbol "gtk_entry_get_progress_fraction") (GtkEntryClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getProgressPulseStep_ = call (getSymbol "gtk_entry_get_progress_pulse_step") (GtkEntryClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getTabs_ = call (getSymbol "gtk_entry_get_tabs") (GtkEntryClass.PolyML.cPtr --> PangoTabArrayRecord.PolyML.cOptPtr)
      val getText_ = call (getSymbol "gtk_entry_get_text") (GtkEntryClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTextArea_ = call (getSymbol "gtk_entry_get_text_area") (GtkEntryClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val getTextLength_ = call (getSymbol "gtk_entry_get_text_length") (GtkEntryClass.PolyML.cPtr --> GUInt16.PolyML.cVal)
      val getVisibility_ = call (getSymbol "gtk_entry_get_visibility") (GtkEntryClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getWidthChars_ = call (getSymbol "gtk_entry_get_width_chars") (GtkEntryClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val grabFocusWithoutSelecting_ = call (getSymbol "gtk_entry_grab_focus_without_selecting") (GtkEntryClass.PolyML.cPtr --> cVoid)
      val imContextFilterKeypress_ = call (getSymbol "gtk_entry_im_context_filter_keypress") (GtkEntryClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val layoutIndexToTextIndex_ = call (getSymbol "gtk_entry_layout_index_to_text_index") (GtkEntryClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val progressPulse_ = call (getSymbol "gtk_entry_progress_pulse") (GtkEntryClass.PolyML.cPtr --> cVoid)
      val resetImContext_ = call (getSymbol "gtk_entry_reset_im_context") (GtkEntryClass.PolyML.cPtr --> cVoid)
      val setActivatesDefault_ = call (getSymbol "gtk_entry_set_activates_default") (GtkEntryClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setAlignment_ = call (getSymbol "gtk_entry_set_alignment") (GtkEntryClass.PolyML.cPtr &&> GFloat.PolyML.cVal --> cVoid)
      val setAttributes_ = call (getSymbol "gtk_entry_set_attributes") (GtkEntryClass.PolyML.cPtr &&> PangoAttrListRecord.PolyML.cPtr --> cVoid)
      val setBuffer_ = call (getSymbol "gtk_entry_set_buffer") (GtkEntryClass.PolyML.cPtr &&> GtkEntryBufferClass.PolyML.cPtr --> cVoid)
      val setCompletion_ = call (getSymbol "gtk_entry_set_completion") (GtkEntryClass.PolyML.cPtr &&> GtkEntryCompletionClass.PolyML.cOptPtr --> cVoid)
      val setCursorHadjustment_ = call (getSymbol "gtk_entry_set_cursor_hadjustment") (GtkEntryClass.PolyML.cPtr &&> GtkAdjustmentClass.PolyML.cOptPtr --> cVoid)
      val setHasFrame_ = call (getSymbol "gtk_entry_set_has_frame") (GtkEntryClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setIconActivatable_ =
        call (getSymbol "gtk_entry_set_icon_activatable")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setIconDragSource_ =
        call (getSymbol "gtk_entry_set_icon_drag_source")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GtkTargetListRecord.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val setIconFromGicon_ =
        call (getSymbol "gtk_entry_set_icon_from_gicon")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GioIconClass.PolyML.cOptPtr
             --> cVoid
          )
      val setIconFromIconName_ =
        call (getSymbol "gtk_entry_set_icon_from_icon_name")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setIconFromPixbuf_ =
        call (getSymbol "gtk_entry_set_icon_from_pixbuf")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GdkPixbufPixbufClass.PolyML.cOptPtr
             --> cVoid
          )
      val setIconFromStock_ =
        call (getSymbol "gtk_entry_set_icon_from_stock")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setIconSensitive_ =
        call (getSymbol "gtk_entry_set_icon_sensitive")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setIconTooltipMarkup_ =
        call (getSymbol "gtk_entry_set_icon_tooltip_markup")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setIconTooltipText_ =
        call (getSymbol "gtk_entry_set_icon_tooltip_text")
          (
            GtkEntryClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val setInnerBorder_ = call (getSymbol "gtk_entry_set_inner_border") (GtkEntryClass.PolyML.cPtr &&> GtkBorderRecord.PolyML.cOptPtr --> cVoid)
      val setInputHints_ = call (getSymbol "gtk_entry_set_input_hints") (GtkEntryClass.PolyML.cPtr &&> GtkInputHints.PolyML.cVal --> cVoid)
      val setInputPurpose_ = call (getSymbol "gtk_entry_set_input_purpose") (GtkEntryClass.PolyML.cPtr &&> GtkInputPurpose.PolyML.cVal --> cVoid)
      val setInvisibleChar_ = call (getSymbol "gtk_entry_set_invisible_char") (GtkEntryClass.PolyML.cPtr &&> GChar.PolyML.cVal --> cVoid)
      val setMaxLength_ = call (getSymbol "gtk_entry_set_max_length") (GtkEntryClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMaxWidthChars_ = call (getSymbol "gtk_entry_set_max_width_chars") (GtkEntryClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setOverwriteMode_ = call (getSymbol "gtk_entry_set_overwrite_mode") (GtkEntryClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPlaceholderText_ = call (getSymbol "gtk_entry_set_placeholder_text") (GtkEntryClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setProgressFraction_ = call (getSymbol "gtk_entry_set_progress_fraction") (GtkEntryClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setProgressPulseStep_ = call (getSymbol "gtk_entry_set_progress_pulse_step") (GtkEntryClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setTabs_ = call (getSymbol "gtk_entry_set_tabs") (GtkEntryClass.PolyML.cPtr &&> PangoTabArrayRecord.PolyML.cPtr --> cVoid)
      val setText_ = call (getSymbol "gtk_entry_set_text") (GtkEntryClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setVisibility_ = call (getSymbol "gtk_entry_set_visibility") (GtkEntryClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setWidthChars_ = call (getSymbol "gtk_entry_set_width_chars") (GtkEntryClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val textIndexToLayoutIndex_ = call (getSymbol "gtk_entry_text_index_to_layout_index") (GtkEntryClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GInt.PolyML.cVal)
      val unsetInvisibleChar_ = call (getSymbol "gtk_entry_unset_invisible_char") (GtkEntryClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkEntryClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a cell_editable_class = 'a GtkCellEditableClass.class
    type 'a editable_class = 'a GtkEditableClass.class
    type 'a adjustment_class = 'a GtkAdjustmentClass.class
    type target_list_t = GtkTargetListRecord.t
    type delete_type_t = GtkDeleteType.t
    type entry_icon_position_t = GtkEntryIconPosition.t
    type movement_step_t = GtkMovementStep.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a entry_buffer_class = 'a GtkEntryBufferClass.class
    type 'a entry_completion_class = 'a GtkEntryCompletionClass.class
    type border_t = GtkBorderRecord.t
    type input_hints_t = GtkInputHints.t
    type input_purpose_t = GtkInputPurpose.t
    type image_type_t = GtkImageType.t
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr false ---> GtkEditableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEntryClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkEntryBufferClass.FFI.withPtr false ---> GtkEntryClass.FFI.fromPtr false) newWithBuffer_ buffer before GtkEntryBufferClass.FFI.touchPtr buffer
    fun getActivatesDefault self = (GtkEntryClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActivatesDefault_ self
    fun getAlignment self = (GtkEntryClass.FFI.withPtr false ---> GFloat.FFI.fromVal) getAlignment_ self
    fun getAttributes self = (GtkEntryClass.FFI.withPtr false ---> PangoAttrListRecord.FFI.fromOptPtr false) getAttributes_ self before GtkEntryClass.FFI.touchPtr self
    fun getBuffer self = (GtkEntryClass.FFI.withPtr false ---> GtkEntryBufferClass.FFI.fromPtr false) getBuffer_ self before GtkEntryClass.FFI.touchPtr self
    fun getCompletion self = (GtkEntryClass.FFI.withPtr false ---> GtkEntryCompletionClass.FFI.fromPtr false) getCompletion_ self before GtkEntryClass.FFI.touchPtr self
    fun getCurrentIconDragSource self = (GtkEntryClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCurrentIconDragSource_ self
    fun getCursorHadjustment self = (GtkEntryClass.FFI.withPtr false ---> GtkAdjustmentClass.FFI.fromOptPtr false) getCursorHadjustment_ self before GtkEntryClass.FFI.touchPtr self
    fun getHasFrame self = (GtkEntryClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasFrame_ self
    fun getIconActivatable self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> GBool.FFI.fromVal) getIconActivatable_ (self & iconPos)
    fun getIconArea self iconPos =
      let
        val iconArea & () =
          (
            GtkEntryClass.FFI.withPtr false
             &&&> GtkEntryIconPosition.FFI.withVal
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && I
          )
            getIconArea_
            (
              self
               & iconPos
               & ()
            )
      in
        iconArea
      end
    fun getIconAtPos self (x, y) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        getIconAtPos_
        (
          self
           & x
           & y
        )
    fun getIconGicon self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> GioIconClass.FFI.fromOptPtr false) getIconGicon_ (self & iconPos) before GtkEntryClass.FFI.touchPtr self
    fun getIconName self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getIconName_ (self & iconPos) before GtkEntryClass.FFI.touchPtr self
    fun getIconPixbuf self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getIconPixbuf_ (self & iconPos) before GtkEntryClass.FFI.touchPtr self
    fun getIconSensitive self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> GBool.FFI.fromVal) getIconSensitive_ (self & iconPos)
    fun getIconStock self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromPtr 0) getIconStock_ (self & iconPos) before GtkEntryClass.FFI.touchPtr self
    fun getIconStorageType self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> GtkImageType.FFI.fromVal) getIconStorageType_ (self & iconPos)
    fun getIconTooltipMarkup self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr ~1) getIconTooltipMarkup_ (self & iconPos)
    fun getIconTooltipText self iconPos = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr ~1) getIconTooltipText_ (self & iconPos)
    fun getInnerBorder self = (GtkEntryClass.FFI.withPtr false ---> GtkBorderRecord.FFI.fromOptPtr false) getInnerBorder_ self before GtkEntryClass.FFI.touchPtr self
    fun getInputHints self = (GtkEntryClass.FFI.withPtr false ---> GtkInputHints.FFI.fromVal) getInputHints_ self
    fun getInputPurpose self = (GtkEntryClass.FFI.withPtr false ---> GtkInputPurpose.FFI.fromVal) getInputPurpose_ self
    fun getInvisibleChar self = (GtkEntryClass.FFI.withPtr false ---> GChar.FFI.fromVal) getInvisibleChar_ self
    fun getLayout self = (GtkEntryClass.FFI.withPtr false ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self before GtkEntryClass.FFI.touchPtr self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkEntryClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (x, y)
      end
    fun getMaxLength self = (GtkEntryClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMaxLength_ self
    fun getMaxWidthChars self = (GtkEntryClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMaxWidthChars_ self
    fun getOverwriteMode self = (GtkEntryClass.FFI.withPtr false ---> GBool.FFI.fromVal) getOverwriteMode_ self
    fun getPlaceholderText self = (GtkEntryClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getPlaceholderText_ self before GtkEntryClass.FFI.touchPtr self
    fun getProgressFraction self = (GtkEntryClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getProgressFraction_ self
    fun getProgressPulseStep self = (GtkEntryClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getProgressPulseStep_ self
    fun getTabs self = (GtkEntryClass.FFI.withPtr false ---> PangoTabArrayRecord.FFI.fromOptPtr false) getTabs_ self before GtkEntryClass.FFI.touchPtr self
    fun getText self = (GtkEntryClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getText_ self before GtkEntryClass.FFI.touchPtr self
    fun getTextArea self =
      let
        val textArea & () = (GtkEntryClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getTextArea_ (self & ())
      in
        textArea
      end
    fun getTextLength self = (GtkEntryClass.FFI.withPtr false ---> GUInt16.FFI.fromVal) getTextLength_ self
    fun getVisibility self = (GtkEntryClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisibility_ self
    fun getWidthChars self = (GtkEntryClass.FFI.withPtr false ---> GInt.FFI.fromVal) getWidthChars_ self
    fun grabFocusWithoutSelecting self = (GtkEntryClass.FFI.withPtr false ---> I) grabFocusWithoutSelecting_ self
    fun imContextFilterKeypress self event = (GtkEntryClass.FFI.withPtr false &&&> GdkEventKeyRecord.FFI.withPtr false ---> GBool.FFI.fromVal) imContextFilterKeypress_ (self & event)
    fun layoutIndexToTextIndex self layoutIndex = (GtkEntryClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) layoutIndexToTextIndex_ (self & layoutIndex)
    fun progressPulse self = (GtkEntryClass.FFI.withPtr false ---> I) progressPulse_ self
    fun resetImContext self = (GtkEntryClass.FFI.withPtr false ---> I) resetImContext_ self
    fun setActivatesDefault self setting = (GtkEntryClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActivatesDefault_ (self & setting)
    fun setAlignment self xalign = (GtkEntryClass.FFI.withPtr false &&&> GFloat.FFI.withVal ---> I) setAlignment_ (self & xalign)
    fun setAttributes self attrs = (GtkEntryClass.FFI.withPtr false &&&> PangoAttrListRecord.FFI.withPtr false ---> I) setAttributes_ (self & attrs)
    fun setBuffer self buffer = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryBufferClass.FFI.withPtr false ---> I) setBuffer_ (self & buffer)
    fun setCompletion self completion = (GtkEntryClass.FFI.withPtr false &&&> GtkEntryCompletionClass.FFI.withOptPtr false ---> I) setCompletion_ (self & completion)
    fun setCursorHadjustment self adjustment = (GtkEntryClass.FFI.withPtr false &&&> GtkAdjustmentClass.FFI.withOptPtr false ---> I) setCursorHadjustment_ (self & adjustment)
    fun setHasFrame self setting = (GtkEntryClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasFrame_ (self & setting)
    fun setIconActivatable self (iconPos, activatable) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        setIconActivatable_
        (
          self
           & iconPos
           & activatable
        )
    fun setIconDragSource
      self
      (
        iconPos,
        targetList,
        actions
      ) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GtkTargetListRecord.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         ---> I
      )
        setIconDragSource_
        (
          self
           & iconPos
           & targetList
           & actions
        )
    fun setIconFromGicon self (iconPos, icon) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GioIconClass.FFI.withOptPtr false
         ---> I
      )
        setIconFromGicon_
        (
          self
           & iconPos
           & icon
        )
    fun setIconFromIconName self (iconPos, iconName) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setIconFromIconName_
        (
          self
           & iconPos
           & iconName
        )
    fun setIconFromPixbuf self (iconPos, pixbuf) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr false
         ---> I
      )
        setIconFromPixbuf_
        (
          self
           & iconPos
           & pixbuf
        )
    fun setIconFromStock self (iconPos, stockId) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setIconFromStock_
        (
          self
           & iconPos
           & stockId
        )
    fun setIconSensitive self (iconPos, sensitive) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        setIconSensitive_
        (
          self
           & iconPos
           & sensitive
        )
    fun setIconTooltipMarkup self (iconPos, tooltip) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setIconTooltipMarkup_
        (
          self
           & iconPos
           & tooltip
        )
    fun setIconTooltipText self (iconPos, tooltip) =
      (
        GtkEntryClass.FFI.withPtr false
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        setIconTooltipText_
        (
          self
           & iconPos
           & tooltip
        )
    fun setInnerBorder self border = (GtkEntryClass.FFI.withPtr false &&&> GtkBorderRecord.FFI.withOptPtr false ---> I) setInnerBorder_ (self & border)
    fun setInputHints self hints = (GtkEntryClass.FFI.withPtr false &&&> GtkInputHints.FFI.withVal ---> I) setInputHints_ (self & hints)
    fun setInputPurpose self purpose = (GtkEntryClass.FFI.withPtr false &&&> GtkInputPurpose.FFI.withVal ---> I) setInputPurpose_ (self & purpose)
    fun setInvisibleChar self ch = (GtkEntryClass.FFI.withPtr false &&&> GChar.FFI.withVal ---> I) setInvisibleChar_ (self & ch)
    fun setMaxLength self max = (GtkEntryClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMaxLength_ (self & max)
    fun setMaxWidthChars self nChars = (GtkEntryClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setOverwriteMode self overwrite = (GtkEntryClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setOverwriteMode_ (self & overwrite)
    fun setPlaceholderText self text = (GtkEntryClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setPlaceholderText_ (self & text)
    fun setProgressFraction self fraction = (GtkEntryClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setProgressFraction_ (self & fraction)
    fun setProgressPulseStep self fraction = (GtkEntryClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setProgressPulseStep_ (self & fraction)
    fun setTabs self tabs = (GtkEntryClass.FFI.withPtr false &&&> PangoTabArrayRecord.FFI.withPtr false ---> I) setTabs_ (self & tabs)
    fun setText self text = (GtkEntryClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setText_ (self & text)
    fun setVisibility self visible = (GtkEntryClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisibility_ (self & visible)
    fun setWidthChars self nChars = (GtkEntryClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    fun textIndexToLayoutIndex self textIndex = (GtkEntryClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) textIndexToLayoutIndex_ (self & textIndex)
    fun unsetInvisibleChar self = (GtkEntryClass.FFI.withPtr false ---> I) unsetInvisibleChar_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun backspaceSig f = signal "backspace" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cutClipboardSig f = signal "cut-clipboard" (void ---> ret_void) f
      fun deleteFromCursorSig f = signal "delete-from-cursor" (get 0w1 GtkDeleteType.t &&&> get 0w2 int ---> ret_void) (fn type' & count => f (type', count))
      fun iconPressSig f = signal "icon-press" (get 0w1 GtkEntryIconPosition.t &&&> get 0w2 GdkEventButtonRecord.t ---> ret_void) (fn iconPos & event => f (iconPos, event))
      fun iconReleaseSig f = signal "icon-release" (get 0w1 GtkEntryIconPosition.t &&&> get 0w2 GdkEventButtonRecord.t ---> ret_void) (fn iconPos & event => f (iconPos, event))
      fun insertAtCursorSig f = signal "insert-at-cursor" (get 0w1 string ---> ret_void) f
      fun moveCursorSig f =
        signal "move-cursor"
          (
            get 0w1 GtkMovementStep.t
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             ---> ret_void
          )
          (
            fn
              step
               & count
               & extendSelection =>
                f
                  (
                    step,
                    count,
                    extendSelection
                  )
          )
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkWidgetClass.t ---> ret_void) f
      fun preeditChangedSig f = signal "preedit-changed" (get 0w1 string ---> ret_void) f
      fun toggleOverwriteSig f = signal "toggle-overwrite" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activatesDefaultProp =
        {
          name = "activates-default",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val attributesProp =
        {
          name = "attributes",
          gtype = fn () => C.gtype PangoAttrListRecord.tOpt (),
          get = fn x => fn () => C.get PangoAttrListRecord.tOpt x,
          set = fn x => C.set PangoAttrListRecord.tOpt x,
          init = fn x => C.set PangoAttrListRecord.tOpt x
        }
      val bufferProp =
        {
          name = "buffer",
          gtype = fn () => C.gtype GtkEntryBufferClass.tOpt (),
          get = fn x => fn () => C.get GtkEntryBufferClass.tOpt x,
          set = fn x => C.set GtkEntryBufferClass.tOpt x,
          init = fn x => C.set GtkEntryBufferClass.tOpt x
        }
      val capsLockWarningProp =
        {
          name = "caps-lock-warning",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val completionProp =
        {
          name = "completion",
          gtype = fn () => C.gtype GtkEntryCompletionClass.tOpt (),
          get = fn x => fn () => C.get GtkEntryCompletionClass.tOpt x,
          set = fn x => C.set GtkEntryCompletionClass.tOpt x,
          init = fn x => C.set GtkEntryCompletionClass.tOpt x
        }
      val cursorPositionProp =
        {
          name = "cursor-position",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val editableProp =
        {
          name = "editable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
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
      val imModuleProp =
        {
          name = "im-module",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val innerBorderProp =
        {
          name = "inner-border",
          gtype = fn () => C.gtype GtkBorderRecord.tOpt (),
          get = fn x => fn () => C.get GtkBorderRecord.tOpt x,
          set = fn x => C.set GtkBorderRecord.tOpt x,
          init = fn x => C.set GtkBorderRecord.tOpt x
        }
      val inputHintsProp =
        {
          name = "input-hints",
          gtype = fn () => C.gtype GtkInputHints.t (),
          get = fn x => fn () => C.get GtkInputHints.t x,
          set = fn x => C.set GtkInputHints.t x,
          init = fn x => C.set GtkInputHints.t x
        }
      val inputPurposeProp =
        {
          name = "input-purpose",
          gtype = fn () => C.gtype GtkInputPurpose.t (),
          get = fn x => fn () => C.get GtkInputPurpose.t x,
          set = fn x => C.set GtkInputPurpose.t x,
          init = fn x => C.set GtkInputPurpose.t x
        }
      val invisibleCharProp =
        {
          name = "invisible-char",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val invisibleCharSetProp =
        {
          name = "invisible-char-set",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val maxLengthProp =
        {
          name = "max-length",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val maxWidthCharsProp =
        {
          name = "max-width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val overwriteModeProp =
        {
          name = "overwrite-mode",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val placeholderTextProp =
        {
          name = "placeholder-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val populateAllProp =
        {
          name = "populate-all",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val primaryIconActivatableProp =
        {
          name = "primary-icon-activatable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val primaryIconGiconProp =
        {
          name = "primary-icon-gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val primaryIconNameProp =
        {
          name = "primary-icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val primaryIconPixbufProp =
        {
          name = "primary-icon-pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val primaryIconSensitiveProp =
        {
          name = "primary-icon-sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val primaryIconStockProp =
        {
          name = "primary-icon-stock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val primaryIconStorageTypeProp =
        {
          name = "primary-icon-storage-type",
          gtype = fn () => C.gtype GtkImageType.t (),
          get = fn x => fn () => C.get GtkImageType.t x,
          set = ignore,
          init = ignore
        }
      val primaryIconTooltipMarkupProp =
        {
          name = "primary-icon-tooltip-markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val primaryIconTooltipTextProp =
        {
          name = "primary-icon-tooltip-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val progressFractionProp =
        {
          name = "progress-fraction",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val progressPulseStepProp =
        {
          name = "progress-pulse-step",
          gtype = fn () => C.gtype double (),
          get = fn x => fn () => C.get double x,
          set = fn x => C.set double x,
          init = fn x => C.set double x
        }
      val scrollOffsetProp =
        {
          name = "scroll-offset",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val secondaryIconActivatableProp =
        {
          name = "secondary-icon-activatable",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val secondaryIconGiconProp =
        {
          name = "secondary-icon-gicon",
          gtype = fn () => C.gtype GioIconClass.tOpt (),
          get = fn x => fn () => C.get GioIconClass.tOpt x,
          set = fn x => C.set GioIconClass.tOpt x,
          init = fn x => C.set GioIconClass.tOpt x
        }
      val secondaryIconNameProp =
        {
          name = "secondary-icon-name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val secondaryIconPixbufProp =
        {
          name = "secondary-icon-pixbuf",
          gtype = fn () => C.gtype GdkPixbufPixbufClass.tOpt (),
          get = fn x => fn () => C.get GdkPixbufPixbufClass.tOpt x,
          set = fn x => C.set GdkPixbufPixbufClass.tOpt x,
          init = fn x => C.set GdkPixbufPixbufClass.tOpt x
        }
      val secondaryIconSensitiveProp =
        {
          name = "secondary-icon-sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val secondaryIconStockProp =
        {
          name = "secondary-icon-stock",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val secondaryIconStorageTypeProp =
        {
          name = "secondary-icon-storage-type",
          gtype = fn () => C.gtype GtkImageType.t (),
          get = fn x => fn () => C.get GtkImageType.t x,
          set = ignore,
          init = ignore
        }
      val secondaryIconTooltipMarkupProp =
        {
          name = "secondary-icon-tooltip-markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val secondaryIconTooltipTextProp =
        {
          name = "secondary-icon-tooltip-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val selectionBoundProp =
        {
          name = "selection-bound",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
      val shadowTypeProp =
        {
          name = "shadow-type",
          gtype = fn () => C.gtype GtkShadowType.t (),
          get = fn x => fn () => C.get GtkShadowType.t x,
          set = fn x => C.set GtkShadowType.t x,
          init = fn x => C.set GtkShadowType.t x
        }
      val tabsProp =
        {
          name = "tabs",
          gtype = fn () => C.gtype PangoTabArrayRecord.tOpt (),
          get = fn x => fn () => C.get PangoTabArrayRecord.tOpt x,
          set = fn x => C.set PangoTabArrayRecord.tOpt x,
          init = fn x => C.set PangoTabArrayRecord.tOpt x
        }
      val textProp =
        {
          name = "text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val textLengthProp =
        {
          name = "text-length",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = ignore,
          init = ignore
        }
      val truncateMultilineProp =
        {
          name = "truncate-multiline",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibilityProp =
        {
          name = "visibility",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val widthCharsProp =
        {
          name = "width-chars",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = fn x => C.set int x,
          init = fn x => C.set int x
        }
      val xalignProp =
        {
          name = "xalign",
          gtype = fn () => C.gtype float (),
          get = fn x => fn () => C.get float x,
          set = fn x => C.set float x,
          init = fn x => C.set float x
        }
    end
  end
