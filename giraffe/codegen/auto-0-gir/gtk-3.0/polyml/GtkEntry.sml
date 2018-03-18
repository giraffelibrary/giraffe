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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkCellEditableClass.FFI.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.FFI.withPtr ---> GtkEditableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkEntryClass.FFI.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GtkEntryBufferClass.FFI.withPtr ---> GtkEntryClass.FFI.fromPtr false) newWithBuffer_ buffer
    fun getActivatesDefault self = (GtkEntryClass.FFI.withPtr ---> GBool.FFI.fromVal) getActivatesDefault_ self
    fun getAlignment self = (GtkEntryClass.FFI.withPtr ---> GFloat.FFI.fromVal) getAlignment_ self
    fun getAttributes self = (GtkEntryClass.FFI.withPtr ---> PangoAttrListRecord.FFI.fromOptPtr false) getAttributes_ self
    fun getBuffer self = (GtkEntryClass.FFI.withPtr ---> GtkEntryBufferClass.FFI.fromPtr false) getBuffer_ self
    fun getCompletion self = (GtkEntryClass.FFI.withPtr ---> GtkEntryCompletionClass.FFI.fromPtr false) getCompletion_ self
    fun getCurrentIconDragSource self = (GtkEntryClass.FFI.withPtr ---> GInt.FFI.fromVal) getCurrentIconDragSource_ self
    fun getCursorHadjustment self = (GtkEntryClass.FFI.withPtr ---> GtkAdjustmentClass.FFI.fromOptPtr false) getCursorHadjustment_ self
    fun getHasFrame self = (GtkEntryClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasFrame_ self
    fun getIconActivatable self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> GBool.FFI.fromVal) getIconActivatable_ (self & iconPos)
    fun getIconArea self iconPos =
      let
        val iconArea & () =
          (
            GtkEntryClass.FFI.withPtr
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
        GtkEntryClass.FFI.withPtr
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
    fun getIconGicon self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> GioIconClass.FFI.fromOptPtr false) getIconGicon_ (self & iconPos)
    fun getIconName self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getIconName_ (self & iconPos)
    fun getIconPixbuf self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr false) getIconPixbuf_ (self & iconPos)
    fun getIconSensitive self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> GBool.FFI.fromVal) getIconSensitive_ (self & iconPos)
    fun getIconStock self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromPtr 0) getIconStock_ (self & iconPos)
    fun getIconStorageType self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> GtkImageType.FFI.fromVal) getIconStorageType_ (self & iconPos)
    fun getIconTooltipMarkup self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr 1) getIconTooltipMarkup_ (self & iconPos)
    fun getIconTooltipText self iconPos = (GtkEntryClass.FFI.withPtr &&&> GtkEntryIconPosition.FFI.withVal ---> Utf8.FFI.fromOptPtr 1) getIconTooltipText_ (self & iconPos)
    fun getInnerBorder self = (GtkEntryClass.FFI.withPtr ---> GtkBorderRecord.FFI.fromOptPtr false) getInnerBorder_ self
    fun getInputHints self = (GtkEntryClass.FFI.withPtr ---> GtkInputHints.FFI.fromVal) getInputHints_ self
    fun getInputPurpose self = (GtkEntryClass.FFI.withPtr ---> GtkInputPurpose.FFI.fromVal) getInputPurpose_ self
    fun getInvisibleChar self = (GtkEntryClass.FFI.withPtr ---> GChar.FFI.fromVal) getInvisibleChar_ self
    fun getLayout self = (GtkEntryClass.FFI.withPtr ---> PangoLayoutClass.FFI.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GtkEntryClass.FFI.withPtr
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
    fun getMaxLength self = (GtkEntryClass.FFI.withPtr ---> GInt.FFI.fromVal) getMaxLength_ self
    fun getMaxWidthChars self = (GtkEntryClass.FFI.withPtr ---> GInt.FFI.fromVal) getMaxWidthChars_ self
    fun getOverwriteMode self = (GtkEntryClass.FFI.withPtr ---> GBool.FFI.fromVal) getOverwriteMode_ self
    fun getPlaceholderText self = (GtkEntryClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getPlaceholderText_ self
    fun getProgressFraction self = (GtkEntryClass.FFI.withPtr ---> GDouble.FFI.fromVal) getProgressFraction_ self
    fun getProgressPulseStep self = (GtkEntryClass.FFI.withPtr ---> GDouble.FFI.fromVal) getProgressPulseStep_ self
    fun getTabs self = (GtkEntryClass.FFI.withPtr ---> PangoTabArrayRecord.FFI.fromOptPtr false) getTabs_ self
    fun getText self = (GtkEntryClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getText_ self
    fun getTextArea self =
      let
        val textArea & () = (GtkEntryClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && I) getTextArea_ (self & ())
      in
        textArea
      end
    fun getTextLength self = (GtkEntryClass.FFI.withPtr ---> GUInt16.FFI.fromVal) getTextLength_ self
    fun getVisibility self = (GtkEntryClass.FFI.withPtr ---> GBool.FFI.fromVal) getVisibility_ self
    fun getWidthChars self = (GtkEntryClass.FFI.withPtr ---> GInt.FFI.fromVal) getWidthChars_ self
    fun grabFocusWithoutSelecting self = (GtkEntryClass.FFI.withPtr ---> I) grabFocusWithoutSelecting_ self
    fun imContextFilterKeypress self event = (GtkEntryClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) imContextFilterKeypress_ (self & event)
    fun layoutIndexToTextIndex self layoutIndex = (GtkEntryClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) layoutIndexToTextIndex_ (self & layoutIndex)
    fun progressPulse self = (GtkEntryClass.FFI.withPtr ---> I) progressPulse_ self
    fun resetImContext self = (GtkEntryClass.FFI.withPtr ---> I) resetImContext_ self
    fun setActivatesDefault self setting = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActivatesDefault_ (self & setting)
    fun setAlignment self xalign = (GtkEntryClass.FFI.withPtr &&&> GFloat.FFI.withVal ---> I) setAlignment_ (self & xalign)
    fun setAttributes self attrs = (GtkEntryClass.FFI.withPtr &&&> PangoAttrListRecord.FFI.withPtr ---> I) setAttributes_ (self & attrs)
    fun setBuffer self buffer = (GtkEntryClass.FFI.withPtr &&&> GtkEntryBufferClass.FFI.withPtr ---> I) setBuffer_ (self & buffer)
    fun setCompletion self completion = (GtkEntryClass.FFI.withPtr &&&> GtkEntryCompletionClass.FFI.withOptPtr ---> I) setCompletion_ (self & completion)
    fun setCursorHadjustment self adjustment = (GtkEntryClass.FFI.withPtr &&&> GtkAdjustmentClass.FFI.withOptPtr ---> I) setCursorHadjustment_ (self & adjustment)
    fun setHasFrame self setting = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasFrame_ (self & setting)
    fun setIconActivatable self (iconPos, activatable) =
      (
        GtkEntryClass.FFI.withPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GtkTargetListRecord.FFI.withPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GioIconClass.FFI.withOptPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> GdkPixbufPixbufClass.FFI.withOptPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
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
        GtkEntryClass.FFI.withPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
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
        GtkEntryClass.FFI.withPtr
         &&&> GtkEntryIconPosition.FFI.withVal
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        setIconTooltipText_
        (
          self
           & iconPos
           & tooltip
        )
    fun setInnerBorder self border = (GtkEntryClass.FFI.withPtr &&&> GtkBorderRecord.FFI.withOptPtr ---> I) setInnerBorder_ (self & border)
    fun setInputHints self hints = (GtkEntryClass.FFI.withPtr &&&> GtkInputHints.FFI.withVal ---> I) setInputHints_ (self & hints)
    fun setInputPurpose self purpose = (GtkEntryClass.FFI.withPtr &&&> GtkInputPurpose.FFI.withVal ---> I) setInputPurpose_ (self & purpose)
    fun setInvisibleChar self ch = (GtkEntryClass.FFI.withPtr &&&> GChar.FFI.withVal ---> I) setInvisibleChar_ (self & ch)
    fun setMaxLength self max = (GtkEntryClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMaxLength_ (self & max)
    fun setMaxWidthChars self nChars = (GtkEntryClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setOverwriteMode self overwrite = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOverwriteMode_ (self & overwrite)
    fun setPlaceholderText self text = (GtkEntryClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setPlaceholderText_ (self & text)
    fun setProgressFraction self fraction = (GtkEntryClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setProgressFraction_ (self & fraction)
    fun setProgressPulseStep self fraction = (GtkEntryClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setProgressPulseStep_ (self & fraction)
    fun setTabs self tabs = (GtkEntryClass.FFI.withPtr &&&> PangoTabArrayRecord.FFI.withPtr ---> I) setTabs_ (self & tabs)
    fun setText self text = (GtkEntryClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setText_ (self & text)
    fun setVisibility self visible = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibility_ (self & visible)
    fun setWidthChars self nChars = (GtkEntryClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    fun textIndexToLayoutIndex self textIndex = (GtkEntryClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GInt.FFI.fromVal) textIndexToLayoutIndex_ (self & textIndex)
    fun unsetInvisibleChar self = (GtkEntryClass.FFI.withPtr ---> I) unsetInvisibleChar_ self
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
      open Property
    in
      val activatesDefaultProp =
        {
          get = fn x => get "activates-default" boolean x,
          set = fn x => set "activates-default" boolean x,
          new = fn x => new "activates-default" boolean x
        }
      val attributesProp =
        {
          get = fn x => get "attributes" PangoAttrListRecord.tOpt x,
          set = fn x => set "attributes" PangoAttrListRecord.tOpt x,
          new = fn x => new "attributes" PangoAttrListRecord.tOpt x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkEntryBufferClass.tOpt x,
          set = fn x => set "buffer" GtkEntryBufferClass.tOpt x,
          new = fn x => new "buffer" GtkEntryBufferClass.tOpt x
        }
      val capsLockWarningProp =
        {
          get = fn x => get "caps-lock-warning" boolean x,
          set = fn x => set "caps-lock-warning" boolean x,
          new = fn x => new "caps-lock-warning" boolean x
        }
      val completionProp =
        {
          get = fn x => get "completion" GtkEntryCompletionClass.tOpt x,
          set = fn x => set "completion" GtkEntryCompletionClass.tOpt x,
          new = fn x => new "completion" GtkEntryCompletionClass.tOpt x
        }
      val cursorPositionProp = {get = fn x => get "cursor-position" int x}
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x,
          new = fn x => new "editable" boolean x
        }
      val hasFrameProp =
        {
          get = fn x => get "has-frame" boolean x,
          set = fn x => set "has-frame" boolean x,
          new = fn x => new "has-frame" boolean x
        }
      val imModuleProp =
        {
          get = fn x => get "im-module" stringOpt x,
          set = fn x => set "im-module" stringOpt x,
          new = fn x => new "im-module" stringOpt x
        }
      val innerBorderProp =
        {
          get = fn x => get "inner-border" GtkBorderRecord.tOpt x,
          set = fn x => set "inner-border" GtkBorderRecord.tOpt x,
          new = fn x => new "inner-border" GtkBorderRecord.tOpt x
        }
      val inputHintsProp =
        {
          get = fn x => get "input-hints" GtkInputHints.t x,
          set = fn x => set "input-hints" GtkInputHints.t x,
          new = fn x => new "input-hints" GtkInputHints.t x
        }
      val inputPurposeProp =
        {
          get = fn x => get "input-purpose" GtkInputPurpose.t x,
          set = fn x => set "input-purpose" GtkInputPurpose.t x,
          new = fn x => new "input-purpose" GtkInputPurpose.t x
        }
      val invisibleCharProp =
        {
          get = fn x => get "invisible-char" uint x,
          set = fn x => set "invisible-char" uint x,
          new = fn x => new "invisible-char" uint x
        }
      val invisibleCharSetProp =
        {
          get = fn x => get "invisible-char-set" boolean x,
          set = fn x => set "invisible-char-set" boolean x,
          new = fn x => new "invisible-char-set" boolean x
        }
      val maxLengthProp =
        {
          get = fn x => get "max-length" int x,
          set = fn x => set "max-length" int x,
          new = fn x => new "max-length" int x
        }
      val maxWidthCharsProp =
        {
          get = fn x => get "max-width-chars" int x,
          set = fn x => set "max-width-chars" int x,
          new = fn x => new "max-width-chars" int x
        }
      val overwriteModeProp =
        {
          get = fn x => get "overwrite-mode" boolean x,
          set = fn x => set "overwrite-mode" boolean x,
          new = fn x => new "overwrite-mode" boolean x
        }
      val placeholderTextProp =
        {
          get = fn x => get "placeholder-text" stringOpt x,
          set = fn x => set "placeholder-text" stringOpt x,
          new = fn x => new "placeholder-text" stringOpt x
        }
      val populateAllProp =
        {
          get = fn x => get "populate-all" boolean x,
          set = fn x => set "populate-all" boolean x,
          new = fn x => new "populate-all" boolean x
        }
      val primaryIconActivatableProp =
        {
          get = fn x => get "primary-icon-activatable" boolean x,
          set = fn x => set "primary-icon-activatable" boolean x,
          new = fn x => new "primary-icon-activatable" boolean x
        }
      val primaryIconGiconProp =
        {
          get = fn x => get "primary-icon-gicon" GioIconClass.tOpt x,
          set = fn x => set "primary-icon-gicon" GioIconClass.tOpt x,
          new = fn x => new "primary-icon-gicon" GioIconClass.tOpt x
        }
      val primaryIconNameProp =
        {
          get = fn x => get "primary-icon-name" stringOpt x,
          set = fn x => set "primary-icon-name" stringOpt x,
          new = fn x => new "primary-icon-name" stringOpt x
        }
      val primaryIconPixbufProp =
        {
          get = fn x => get "primary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "primary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "primary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val primaryIconSensitiveProp =
        {
          get = fn x => get "primary-icon-sensitive" boolean x,
          set = fn x => set "primary-icon-sensitive" boolean x,
          new = fn x => new "primary-icon-sensitive" boolean x
        }
      val primaryIconStockProp =
        {
          get = fn x => get "primary-icon-stock" stringOpt x,
          set = fn x => set "primary-icon-stock" stringOpt x,
          new = fn x => new "primary-icon-stock" stringOpt x
        }
      val primaryIconStorageTypeProp = {get = fn x => get "primary-icon-storage-type" GtkImageType.t x}
      val primaryIconTooltipMarkupProp =
        {
          get = fn x => get "primary-icon-tooltip-markup" stringOpt x,
          set = fn x => set "primary-icon-tooltip-markup" stringOpt x,
          new = fn x => new "primary-icon-tooltip-markup" stringOpt x
        }
      val primaryIconTooltipTextProp =
        {
          get = fn x => get "primary-icon-tooltip-text" stringOpt x,
          set = fn x => set "primary-icon-tooltip-text" stringOpt x,
          new = fn x => new "primary-icon-tooltip-text" stringOpt x
        }
      val progressFractionProp =
        {
          get = fn x => get "progress-fraction" double x,
          set = fn x => set "progress-fraction" double x,
          new = fn x => new "progress-fraction" double x
        }
      val progressPulseStepProp =
        {
          get = fn x => get "progress-pulse-step" double x,
          set = fn x => set "progress-pulse-step" double x,
          new = fn x => new "progress-pulse-step" double x
        }
      val scrollOffsetProp = {get = fn x => get "scroll-offset" int x}
      val secondaryIconActivatableProp =
        {
          get = fn x => get "secondary-icon-activatable" boolean x,
          set = fn x => set "secondary-icon-activatable" boolean x,
          new = fn x => new "secondary-icon-activatable" boolean x
        }
      val secondaryIconGiconProp =
        {
          get = fn x => get "secondary-icon-gicon" GioIconClass.tOpt x,
          set = fn x => set "secondary-icon-gicon" GioIconClass.tOpt x,
          new = fn x => new "secondary-icon-gicon" GioIconClass.tOpt x
        }
      val secondaryIconNameProp =
        {
          get = fn x => get "secondary-icon-name" stringOpt x,
          set = fn x => set "secondary-icon-name" stringOpt x,
          new = fn x => new "secondary-icon-name" stringOpt x
        }
      val secondaryIconPixbufProp =
        {
          get = fn x => get "secondary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "secondary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          new = fn x => new "secondary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val secondaryIconSensitiveProp =
        {
          get = fn x => get "secondary-icon-sensitive" boolean x,
          set = fn x => set "secondary-icon-sensitive" boolean x,
          new = fn x => new "secondary-icon-sensitive" boolean x
        }
      val secondaryIconStockProp =
        {
          get = fn x => get "secondary-icon-stock" stringOpt x,
          set = fn x => set "secondary-icon-stock" stringOpt x,
          new = fn x => new "secondary-icon-stock" stringOpt x
        }
      val secondaryIconStorageTypeProp = {get = fn x => get "secondary-icon-storage-type" GtkImageType.t x}
      val secondaryIconTooltipMarkupProp =
        {
          get = fn x => get "secondary-icon-tooltip-markup" stringOpt x,
          set = fn x => set "secondary-icon-tooltip-markup" stringOpt x,
          new = fn x => new "secondary-icon-tooltip-markup" stringOpt x
        }
      val secondaryIconTooltipTextProp =
        {
          get = fn x => get "secondary-icon-tooltip-text" stringOpt x,
          set = fn x => set "secondary-icon-tooltip-text" stringOpt x,
          new = fn x => new "secondary-icon-tooltip-text" stringOpt x
        }
      val selectionBoundProp = {get = fn x => get "selection-bound" int x}
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x,
          new = fn x => new "shadow-type" GtkShadowType.t x
        }
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x,
          new = fn x => new "tabs" PangoTabArrayRecord.tOpt x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x,
          new = fn x => new "text" stringOpt x
        }
      val textLengthProp = {get = fn x => get "text-length" uint x}
      val truncateMultilineProp =
        {
          get = fn x => get "truncate-multiline" boolean x,
          set = fn x => set "truncate-multiline" boolean x,
          new = fn x => new "truncate-multiline" boolean x
        }
      val visibilityProp =
        {
          get = fn x => get "visibility" boolean x,
          set = fn x => set "visibility" boolean x,
          new = fn x => new "visibility" boolean x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x,
          new = fn x => new "width-chars" int x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x,
          new = fn x => new "xalign" float x
        }
    end
  end
