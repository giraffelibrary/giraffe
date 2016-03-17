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
    where type 'a menu_class = 'a GtkMenuClass.class
    where type 'a entry_buffer_class = 'a GtkEntryBufferClass.class
    where type 'a entry_completion_class = 'a GtkEntryCompletionClass.class
    where type border_t = GtkBorderRecord.t
    where type image_type_t = GtkImageType.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_entry_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithBuffer_ = call (load_sym libgtk "gtk_entry_new_with_buffer") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getActivatesDefault_ = call (load_sym libgtk "gtk_entry_get_activates_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAlignment_ = call (load_sym libgtk "gtk_entry_get_alignment") (GObjectObjectClass.PolyML.cPtr --> FFI.Float.PolyML.cVal)
      val getBuffer_ = call (load_sym libgtk "gtk_entry_get_buffer") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCompletion_ = call (load_sym libgtk "gtk_entry_get_completion") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCurrentIconDragSource_ = call (load_sym libgtk "gtk_entry_get_current_icon_drag_source") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getCursorHadjustment_ = call (load_sym libgtk "gtk_entry_get_cursor_hadjustment") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getHasFrame_ = call (load_sym libgtk "gtk_entry_get_has_frame") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getIconActivatable_ = call (load_sym libgtk "gtk_entry_get_icon_activatable") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getIconArea_ =
        call (load_sym libgtk "gtk_entry_get_icon_area")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> CairoRectangleIntRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getIconAtPos_ =
        call (load_sym libgtk "gtk_entry_get_icon_at_pos")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val getIconGicon_ = call (load_sym libgtk "gtk_entry_get_icon_gicon") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getIconName_ = call (load_sym libgtk "gtk_entry_get_icon_name") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getIconPixbuf_ = call (load_sym libgtk "gtk_entry_get_icon_pixbuf") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getIconSensitive_ = call (load_sym libgtk "gtk_entry_get_icon_sensitive") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val getIconStock_ = call (load_sym libgtk "gtk_entry_get_icon_stock") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getIconStorageType_ = call (load_sym libgtk "gtk_entry_get_icon_storage_type") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> GtkImageType.PolyML.cVal)
      val getIconTooltipMarkup_ = call (load_sym libgtk "gtk_entry_get_icon_tooltip_markup") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getIconTooltipText_ = call (load_sym libgtk "gtk_entry_get_icon_tooltip_text") (GObjectObjectClass.PolyML.cPtr &&> GtkEntryIconPosition.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getInnerBorder_ = call (load_sym libgtk "gtk_entry_get_inner_border") (GObjectObjectClass.PolyML.cPtr --> GtkBorderRecord.PolyML.cPtr)
      val getInvisibleChar_ = call (load_sym libgtk "gtk_entry_get_invisible_char") (GObjectObjectClass.PolyML.cPtr --> FFI.Char.PolyML.cVal)
      val getLayout_ = call (load_sym libgtk "gtk_entry_get_layout") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getLayoutOffsets_ =
        call (load_sym libgtk "gtk_entry_get_layout_offsets")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getMaxLength_ = call (load_sym libgtk "gtk_entry_get_max_length") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getOverwriteMode_ = call (load_sym libgtk "gtk_entry_get_overwrite_mode") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPlaceholderText_ = call (load_sym libgtk "gtk_entry_get_placeholder_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getProgressFraction_ = call (load_sym libgtk "gtk_entry_get_progress_fraction") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getProgressPulseStep_ = call (load_sym libgtk "gtk_entry_get_progress_pulse_step") (GObjectObjectClass.PolyML.cPtr --> FFI.Double.PolyML.cVal)
      val getText_ = call (load_sym libgtk "gtk_entry_get_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTextArea_ = call (load_sym libgtk "gtk_entry_get_text_area") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getTextLength_ = call (load_sym libgtk "gtk_entry_get_text_length") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt16.PolyML.cVal)
      val getVisibility_ = call (load_sym libgtk "gtk_entry_get_visibility") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getWidthChars_ = call (load_sym libgtk "gtk_entry_get_width_chars") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val imContextFilterKeypress_ = call (load_sym libgtk "gtk_entry_im_context_filter_keypress") (GObjectObjectClass.PolyML.cPtr &&> GdkEventKeyRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val layoutIndexToTextIndex_ = call (load_sym libgtk "gtk_entry_layout_index_to_text_index") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val progressPulse_ = call (load_sym libgtk "gtk_entry_progress_pulse") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val resetImContext_ = call (load_sym libgtk "gtk_entry_reset_im_context") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setActivatesDefault_ = call (load_sym libgtk "gtk_entry_set_activates_default") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setAlignment_ = call (load_sym libgtk "gtk_entry_set_alignment") (GObjectObjectClass.PolyML.cPtr &&> FFI.Float.PolyML.cVal --> FFI.PolyML.cVoid)
      val setBuffer_ = call (load_sym libgtk "gtk_entry_set_buffer") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setCompletion_ = call (load_sym libgtk "gtk_entry_set_completion") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setCursorHadjustment_ = call (load_sym libgtk "gtk_entry_set_cursor_hadjustment") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setHasFrame_ = call (load_sym libgtk "gtk_entry_set_has_frame") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setIconActivatable_ =
        call (load_sym libgtk "gtk_entry_set_icon_activatable")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconDragSource_ =
        call (load_sym libgtk "gtk_entry_set_icon_drag_source")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GtkTargetListRecord.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconFromGicon_ =
        call (load_sym libgtk "gtk_entry_set_icon_from_gicon")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setIconFromIconName_ =
        call (load_sym libgtk "gtk_entry_set_icon_from_icon_name")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setIconFromPixbuf_ =
        call (load_sym libgtk "gtk_entry_set_icon_from_pixbuf")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setIconFromStock_ =
        call (load_sym libgtk "gtk_entry_set_icon_from_stock")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setIconSensitive_ =
        call (load_sym libgtk "gtk_entry_set_icon_sensitive")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setIconTooltipMarkup_ =
        call (load_sym libgtk "gtk_entry_set_icon_tooltip_markup")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setIconTooltipText_ =
        call (load_sym libgtk "gtk_entry_set_icon_tooltip_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkEntryIconPosition.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> FFI.PolyML.cVoid
          )
      val setInnerBorder_ = call (load_sym libgtk "gtk_entry_set_inner_border") (GObjectObjectClass.PolyML.cPtr &&> GtkBorderRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setInvisibleChar_ = call (load_sym libgtk "gtk_entry_set_invisible_char") (GObjectObjectClass.PolyML.cPtr &&> FFI.Char.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMaxLength_ = call (load_sym libgtk "gtk_entry_set_max_length") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setOverwriteMode_ = call (load_sym libgtk "gtk_entry_set_overwrite_mode") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setPlaceholderText_ = call (load_sym libgtk "gtk_entry_set_placeholder_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setProgressFraction_ = call (load_sym libgtk "gtk_entry_set_progress_fraction") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setProgressPulseStep_ = call (load_sym libgtk "gtk_entry_set_progress_pulse_step") (GObjectObjectClass.PolyML.cPtr &&> FFI.Double.PolyML.cVal --> FFI.PolyML.cVoid)
      val setText_ = call (load_sym libgtk "gtk_entry_set_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setVisibility_ = call (load_sym libgtk "gtk_entry_set_visibility") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setWidthChars_ = call (load_sym libgtk "gtk_entry_set_width_chars") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val textIndexToLayoutIndex_ = call (load_sym libgtk "gtk_entry_text_index_to_layout_index") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.Int32.PolyML.cVal)
      val unsetInvisibleChar_ = call (load_sym libgtk "gtk_entry_unset_invisible_char") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
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
    type 'a menu_class = 'a GtkMenuClass.class
    type 'a entry_buffer_class = 'a GtkEntryBufferClass.class
    type 'a entry_completion_class = 'a GtkEntryCompletionClass.class
    type border_t = GtkBorderRecord.t
    type image_type_t = GtkImageType.t
    type shadow_type_t = GtkShadowType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    fun asCellEditable self = (GObjectObjectClass.C.withPtr ---> GtkCellEditableClass.C.fromPtr false) I self
    fun asEditable self = (GObjectObjectClass.C.withPtr ---> GtkEditableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkEntryClass.C.fromPtr false) new_ ()
    fun newWithBuffer buffer = (GObjectObjectClass.C.withPtr ---> GtkEntryClass.C.fromPtr false) newWithBuffer_ buffer
    fun getActivatesDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActivatesDefault_ self
    fun getAlignment self = (GObjectObjectClass.C.withPtr ---> FFI.Float.C.fromVal) getAlignment_ self
    fun getBuffer self = (GObjectObjectClass.C.withPtr ---> GtkEntryBufferClass.C.fromPtr false) getBuffer_ self
    fun getCompletion self = (GObjectObjectClass.C.withPtr ---> GtkEntryCompletionClass.C.fromPtr false) getCompletion_ self
    fun getCurrentIconDragSource self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentIconDragSource_ self
    fun getCursorHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getCursorHadjustment_ self
    fun getHasFrame self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasFrame_ self
    fun getIconActivatable self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> FFI.Bool.C.fromVal) getIconActivatable_ (self & iconPos)
    fun getIconArea self iconPos =
      let
        val iconArea & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkEntryIconPosition.C.withVal
             &&&> CairoRectangleIntRecord.C.withNewPtr
             ---> CairoRectangleIntRecord.C.fromPtr true && I
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
    fun getIconAtPos self x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        getIconAtPos_
        (
          self
           & x
           & y
        )
    fun getIconGicon self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> GioIconClass.C.fromPtr false) getIconGicon_ (self & iconPos)
    fun getIconName self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> Utf8.C.fromPtr false) getIconName_ (self & iconPos)
    fun getIconPixbuf self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr false) getIconPixbuf_ (self & iconPos)
    fun getIconSensitive self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> FFI.Bool.C.fromVal) getIconSensitive_ (self & iconPos)
    fun getIconStock self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> Utf8.C.fromPtr false) getIconStock_ (self & iconPos)
    fun getIconStorageType self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> GtkImageType.C.fromVal) getIconStorageType_ (self & iconPos)
    fun getIconTooltipMarkup self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> Utf8.C.fromPtr true) getIconTooltipMarkup_ (self & iconPos)
    fun getIconTooltipText self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> Utf8.C.fromPtr true) getIconTooltipText_ (self & iconPos)
    fun getInnerBorder self = (GObjectObjectClass.C.withPtr ---> GtkBorderRecord.C.fromPtr false) getInnerBorder_ self
    fun getInvisibleChar self = (GObjectObjectClass.C.withPtr ---> FFI.Char.C.fromVal) getInvisibleChar_ self
    fun getLayout self = (GObjectObjectClass.C.withPtr ---> PangoLayoutClass.C.fromPtr false) getLayout_ self
    fun getLayoutOffsets self =
      let
        val x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (x, y)
      end
    fun getMaxLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMaxLength_ self
    fun getOverwriteMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getOverwriteMode_ self
    fun getPlaceholderText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPlaceholderText_ self
    fun getProgressFraction self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getProgressFraction_ self
    fun getProgressPulseStep self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getProgressPulseStep_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun getTextArea self =
      let
        val textArea & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getTextArea_ (self & ())
      in
        textArea
      end
    fun getTextLength self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTextLength_ self
    fun getVisibility self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibility_ self
    fun getWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getWidthChars_ self
    fun imContextFilterKeypress self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) imContextFilterKeypress_ (self & event)
    fun layoutIndexToTextIndex self layoutIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) layoutIndexToTextIndex_ (self & layoutIndex)
    fun progressPulse self = (GObjectObjectClass.C.withPtr ---> I) progressPulse_ self
    fun resetImContext self = (GObjectObjectClass.C.withPtr ---> I) resetImContext_ self
    fun setActivatesDefault self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActivatesDefault_ (self & setting)
    fun setAlignment self xalign = (GObjectObjectClass.C.withPtr &&&> FFI.Float.C.withVal ---> I) setAlignment_ (self & xalign)
    fun setBuffer self buffer = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setBuffer_ (self & buffer)
    fun setCompletion self completion = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setCompletion_ (self & completion)
    fun setCursorHadjustment self adjustment = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setCursorHadjustment_ (self & adjustment)
    fun setHasFrame self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasFrame_ (self & setting)
    fun setIconActivatable self iconPos activatable =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setIconActivatable_
        (
          self
           & iconPos
           & activatable
        )
    fun setIconDragSource self iconPos targetList actions =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> GtkTargetListRecord.C.withPtr
         &&&> GdkDragAction.C.withVal
         ---> I
      )
        setIconDragSource_
        (
          self
           & iconPos
           & targetList
           & actions
        )
    fun setIconFromGicon self iconPos icon =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setIconFromGicon_
        (
          self
           & iconPos
           & icon
        )
    fun setIconFromIconName self iconPos iconName =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setIconFromIconName_
        (
          self
           & iconPos
           & iconName
        )
    fun setIconFromPixbuf self iconPos pixbuf =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setIconFromPixbuf_
        (
          self
           & iconPos
           & pixbuf
        )
    fun setIconFromStock self iconPos stockId =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setIconFromStock_
        (
          self
           & iconPos
           & stockId
        )
    fun setIconSensitive self iconPos sensitive =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setIconSensitive_
        (
          self
           & iconPos
           & sensitive
        )
    fun setIconTooltipMarkup self iconPos tooltip =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setIconTooltipMarkup_
        (
          self
           & iconPos
           & tooltip
        )
    fun setIconTooltipText self iconPos tooltip =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkEntryIconPosition.C.withVal
         &&&> Utf8.C.withOptPtr
         ---> I
      )
        setIconTooltipText_
        (
          self
           & iconPos
           & tooltip
        )
    fun setInnerBorder self border = (GObjectObjectClass.C.withPtr &&&> GtkBorderRecord.C.withOptPtr ---> I) setInnerBorder_ (self & border)
    fun setInvisibleChar self ch = (GObjectObjectClass.C.withPtr &&&> FFI.Char.C.withVal ---> I) setInvisibleChar_ (self & ch)
    fun setMaxLength self max = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMaxLength_ (self & max)
    fun setOverwriteMode self overwrite = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverwriteMode_ (self & overwrite)
    fun setPlaceholderText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setPlaceholderText_ (self & text)
    fun setProgressFraction self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setProgressFraction_ (self & fraction)
    fun setProgressPulseStep self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setProgressPulseStep_ (self & fraction)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setText_ (self & text)
    fun setVisibility self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibility_ (self & visible)
    fun setWidthChars self nChars = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setWidthChars_ (self & nChars)
    fun textIndexToLayoutIndex self textIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> FFI.Int32.C.fromVal) textIndexToLayoutIndex_ (self & textIndex)
    fun unsetInvisibleChar self = (GObjectObjectClass.C.withPtr ---> I) unsetInvisibleChar_ self
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun backspaceSig f = signal "backspace" (void ---> ret_void) f
      fun copyClipboardSig f = signal "copy-clipboard" (void ---> ret_void) f
      fun cutClipboardSig f = signal "cut-clipboard" (void ---> ret_void) f
      fun deleteFromCursorSig f = signal "delete-from-cursor" (get 0w1 GtkDeleteType.t &&&> get 0w2 int ---> ret_void) (fn type' & count => f type' count)
      fun iconPressSig f = signal "icon-press" (get 0w1 GtkEntryIconPosition.t &&&> get 0w2 GdkEventButtonRecord.t ---> ret_void) (fn iconPos & event => f iconPos event)
      fun iconReleaseSig f = signal "icon-release" (get 0w1 GtkEntryIconPosition.t &&&> get 0w2 GdkEventButtonRecord.t ---> ret_void) (fn iconPos & event => f iconPos event)
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
                f step count extendSelection
          )
      fun pasteClipboardSig f = signal "paste-clipboard" (void ---> ret_void) f
      fun populatePopupSig f = signal "populate-popup" (get 0w1 GtkMenuClass.t ---> ret_void) f
      fun preeditChangedSig f = signal "preedit-changed" (get 0w1 string ---> ret_void) f
      fun toggleOverwriteSig f = signal "toggle-overwrite" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activatesDefaultProp =
        {
          get = fn x => get "activates-default" boolean x,
          set = fn x => set "activates-default" boolean x
        }
      val bufferProp =
        {
          get = fn x => get "buffer" GtkEntryBufferClass.tOpt x,
          set = fn x => set "buffer" GtkEntryBufferClass.tOpt x
        }
      val capsLockWarningProp =
        {
          get = fn x => get "caps-lock-warning" boolean x,
          set = fn x => set "caps-lock-warning" boolean x
        }
      val completionProp =
        {
          get = fn x => get "completion" GtkEntryCompletionClass.tOpt x,
          set = fn x => set "completion" GtkEntryCompletionClass.tOpt x
        }
      val cursorPositionProp = {get = fn x => get "cursor-position" int x}
      val editableProp =
        {
          get = fn x => get "editable" boolean x,
          set = fn x => set "editable" boolean x
        }
      val hasFrameProp =
        {
          get = fn x => get "has-frame" boolean x,
          set = fn x => set "has-frame" boolean x
        }
      val imModuleProp =
        {
          get = fn x => get "im-module" stringOpt x,
          set = fn x => set "im-module" stringOpt x
        }
      val innerBorderProp =
        {
          get = fn x => get "inner-border" GtkBorderRecord.tOpt x,
          set = fn x => set "inner-border" GtkBorderRecord.tOpt x
        }
      val invisibleCharProp =
        {
          get = fn x => get "invisible-char" uint x,
          set = fn x => set "invisible-char" uint x
        }
      val invisibleCharSetProp =
        {
          get = fn x => get "invisible-char-set" boolean x,
          set = fn x => set "invisible-char-set" boolean x
        }
      val maxLengthProp =
        {
          get = fn x => get "max-length" int x,
          set = fn x => set "max-length" int x
        }
      val overwriteModeProp =
        {
          get = fn x => get "overwrite-mode" boolean x,
          set = fn x => set "overwrite-mode" boolean x
        }
      val placeholderTextProp =
        {
          get = fn x => get "placeholder-text" stringOpt x,
          set = fn x => set "placeholder-text" stringOpt x
        }
      val primaryIconActivatableProp =
        {
          get = fn x => get "primary-icon-activatable" boolean x,
          set = fn x => set "primary-icon-activatable" boolean x
        }
      val primaryIconGiconProp =
        {
          get = fn x => get "primary-icon-gicon" GioIconClass.tOpt x,
          set = fn x => set "primary-icon-gicon" GioIconClass.tOpt x
        }
      val primaryIconNameProp =
        {
          get = fn x => get "primary-icon-name" stringOpt x,
          set = fn x => set "primary-icon-name" stringOpt x
        }
      val primaryIconPixbufProp =
        {
          get = fn x => get "primary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "primary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val primaryIconSensitiveProp =
        {
          get = fn x => get "primary-icon-sensitive" boolean x,
          set = fn x => set "primary-icon-sensitive" boolean x
        }
      val primaryIconStockProp =
        {
          get = fn x => get "primary-icon-stock" stringOpt x,
          set = fn x => set "primary-icon-stock" stringOpt x
        }
      val primaryIconStorageTypeProp = {get = fn x => get "primary-icon-storage-type" GtkImageType.t x}
      val primaryIconTooltipMarkupProp =
        {
          get = fn x => get "primary-icon-tooltip-markup" stringOpt x,
          set = fn x => set "primary-icon-tooltip-markup" stringOpt x
        }
      val primaryIconTooltipTextProp =
        {
          get = fn x => get "primary-icon-tooltip-text" stringOpt x,
          set = fn x => set "primary-icon-tooltip-text" stringOpt x
        }
      val progressFractionProp =
        {
          get = fn x => get "progress-fraction" double x,
          set = fn x => set "progress-fraction" double x
        }
      val progressPulseStepProp =
        {
          get = fn x => get "progress-pulse-step" double x,
          set = fn x => set "progress-pulse-step" double x
        }
      val scrollOffsetProp = {get = fn x => get "scroll-offset" int x}
      val secondaryIconActivatableProp =
        {
          get = fn x => get "secondary-icon-activatable" boolean x,
          set = fn x => set "secondary-icon-activatable" boolean x
        }
      val secondaryIconGiconProp =
        {
          get = fn x => get "secondary-icon-gicon" GioIconClass.tOpt x,
          set = fn x => set "secondary-icon-gicon" GioIconClass.tOpt x
        }
      val secondaryIconNameProp =
        {
          get = fn x => get "secondary-icon-name" stringOpt x,
          set = fn x => set "secondary-icon-name" stringOpt x
        }
      val secondaryIconPixbufProp =
        {
          get = fn x => get "secondary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x,
          set = fn x => set "secondary-icon-pixbuf" GdkPixbufPixbufClass.tOpt x
        }
      val secondaryIconSensitiveProp =
        {
          get = fn x => get "secondary-icon-sensitive" boolean x,
          set = fn x => set "secondary-icon-sensitive" boolean x
        }
      val secondaryIconStockProp =
        {
          get = fn x => get "secondary-icon-stock" stringOpt x,
          set = fn x => set "secondary-icon-stock" stringOpt x
        }
      val secondaryIconStorageTypeProp = {get = fn x => get "secondary-icon-storage-type" GtkImageType.t x}
      val secondaryIconTooltipMarkupProp =
        {
          get = fn x => get "secondary-icon-tooltip-markup" stringOpt x,
          set = fn x => set "secondary-icon-tooltip-markup" stringOpt x
        }
      val secondaryIconTooltipTextProp =
        {
          get = fn x => get "secondary-icon-tooltip-text" stringOpt x,
          set = fn x => set "secondary-icon-tooltip-text" stringOpt x
        }
      val selectionBoundProp = {get = fn x => get "selection-bound" int x}
      val shadowTypeProp =
        {
          get = fn x => get "shadow-type" GtkShadowType.t x,
          set = fn x => set "shadow-type" GtkShadowType.t x
        }
      val textProp =
        {
          get = fn x => get "text" stringOpt x,
          set = fn x => set "text" stringOpt x
        }
      val textLengthProp = {get = fn x => get "text-length" uint x}
      val truncateMultilineProp =
        {
          get = fn x => get "truncate-multiline" boolean x,
          set = fn x => set "truncate-multiline" boolean x
        }
      val visibilityProp =
        {
          get = fn x => get "visibility" boolean x,
          set = fn x => set "visibility" boolean x
        }
      val widthCharsProp =
        {
          get = fn x => get "width-chars" int x,
          set = fn x => set "width-chars" int x
        }
      val xalignProp =
        {
          get = fn x => get "xalign" float x,
          set = fn x => set "xalign" float x
        }
    end
  end
