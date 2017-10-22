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
    val getType_ = _import "gtk_entry_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_entry_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithBuffer_ = _import "gtk_entry_new_with_buffer" : GtkEntryBufferClass.FFI.notnull GtkEntryBufferClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getActivatesDefault_ = _import "gtk_entry_get_activates_default" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GBool.FFI.val_;
    val getAlignment_ = _import "gtk_entry_get_alignment" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GFloat.FFI.val_;
    val getAttributes_ = _import "gtk_entry_get_attributes" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit PangoAttrListRecord.FFI.p;
    val getBuffer_ = _import "gtk_entry_get_buffer" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GtkEntryBufferClass.FFI.notnull GtkEntryBufferClass.FFI.p;
    val getCompletion_ = _import "gtk_entry_get_completion" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GtkEntryCompletionClass.FFI.notnull GtkEntryCompletionClass.FFI.p;
    val getCurrentIconDragSource_ = _import "gtk_entry_get_current_icon_drag_source" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GInt32.FFI.val_;
    val getCursorHadjustment_ = _import "gtk_entry_get_cursor_hadjustment" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit GtkAdjustmentClass.FFI.p;
    val getHasFrame_ = _import "gtk_entry_get_has_frame" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GBool.FFI.val_;
    val getIconActivatable_ = fn x1 & x2 => (_import "gtk_entry_get_icon_activatable" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getIconArea_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_get_icon_area" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconAtPos_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_get_icon_at_pos" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconGicon_ = fn x1 & x2 => (_import "gtk_entry_get_icon_gicon" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> unit GioIconClass.FFI.p;) (x1, x2)
    val getIconName_ = fn x1 & x2 => (_import "gtk_entry_get_icon_name" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> unit Utf8.FFI.out_p;) (x1, x2)
    val getIconPixbuf_ = fn x1 & x2 => (_import "gtk_entry_get_icon_pixbuf" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> unit GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getIconSensitive_ = fn x1 & x2 => (_import "gtk_entry_get_icon_sensitive" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getIconStock_ = fn x1 & x2 => (_import "gtk_entry_get_icon_stock" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;) (x1, x2)
    val getIconStorageType_ = fn x1 & x2 => (_import "gtk_entry_get_icon_storage_type" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> GtkImageType.FFI.val_;) (x1, x2)
    val getIconTooltipMarkup_ = fn x1 & x2 => (_import "gtk_entry_get_icon_tooltip_markup" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> unit Utf8.FFI.out_p;) (x1, x2)
    val getIconTooltipText_ = fn x1 & x2 => (_import "gtk_entry_get_icon_tooltip_text" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryIconPosition.FFI.val_ -> unit Utf8.FFI.out_p;) (x1, x2)
    val getInnerBorder_ = _import "gtk_entry_get_inner_border" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit GtkBorderRecord.FFI.p;
    val getInputHints_ = _import "gtk_entry_get_input_hints" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GtkInputHints.FFI.val_;
    val getInputPurpose_ = _import "gtk_entry_get_input_purpose" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GtkInputPurpose.FFI.val_;
    val getInvisibleChar_ = _import "gtk_entry_get_invisible_char" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GChar.FFI.val_;
    val getLayout_ = _import "gtk_entry_get_layout" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> PangoLayoutClass.FFI.notnull PangoLayoutClass.FFI.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_get_layout_offsets" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMaxLength_ = _import "gtk_entry_get_max_length" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GInt32.FFI.val_;
    val getMaxWidthChars_ = _import "gtk_entry_get_max_width_chars" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GInt32.FFI.val_;
    val getOverwriteMode_ = _import "gtk_entry_get_overwrite_mode" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GBool.FFI.val_;
    val getPlaceholderText_ = _import "gtk_entry_get_placeholder_text" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getProgressFraction_ = _import "gtk_entry_get_progress_fraction" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GDouble.FFI.val_;
    val getProgressPulseStep_ = _import "gtk_entry_get_progress_pulse_step" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GDouble.FFI.val_;
    val getTabs_ = _import "gtk_entry_get_tabs" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit PangoTabArrayRecord.FFI.p;
    val getText_ = _import "gtk_entry_get_text" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getTextArea_ = fn x1 & x2 => (_import "gtk_entry_get_text_area" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val getTextLength_ = _import "gtk_entry_get_text_length" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GUInt16.FFI.val_;
    val getVisibility_ = _import "gtk_entry_get_visibility" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GBool.FFI.val_;
    val getWidthChars_ = _import "gtk_entry_get_width_chars" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> GInt32.FFI.val_;
    val grabFocusWithoutSelecting_ = _import "gtk_entry_grab_focus_without_selecting" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit;
    val imContextFilterKeypress_ = fn x1 & x2 => (_import "gtk_entry_im_context_filter_keypress" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GdkEventKeyRecord.FFI.notnull GdkEventKeyRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val layoutIndexToTextIndex_ = fn x1 & x2 => (_import "gtk_entry_layout_index_to_text_index" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val progressPulse_ = _import "gtk_entry_progress_pulse" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit;
    val resetImContext_ = _import "gtk_entry_reset_im_context" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit;
    val setActivatesDefault_ = fn x1 & x2 => (_import "gtk_entry_set_activates_default" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setAlignment_ = fn x1 & x2 => (_import "gtk_entry_set_alignment" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GFloat.FFI.val_ -> unit;) (x1, x2)
    val setAttributes_ = fn x1 & x2 => (_import "gtk_entry_set_attributes" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * PangoAttrListRecord.FFI.notnull PangoAttrListRecord.FFI.p -> unit;) (x1, x2)
    val setBuffer_ = fn x1 & x2 => (_import "gtk_entry_set_buffer" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkEntryBufferClass.FFI.notnull GtkEntryBufferClass.FFI.p -> unit;) (x1, x2)
    val setCompletion_ = fn x1 & x2 => (_import "gtk_entry_set_completion" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * unit GtkEntryCompletionClass.FFI.p -> unit;) (x1, x2)
    val setCursorHadjustment_ = fn x1 & x2 => (_import "gtk_entry_set_cursor_hadjustment" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * unit GtkAdjustmentClass.FFI.p -> unit;) (x1, x2)
    val setHasFrame_ = fn x1 & x2 => (_import "gtk_entry_set_has_frame" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setIconActivatable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_set_icon_activatable" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconDragSource_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_entry_set_icon_drag_source" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * GtkTargetListRecord.FFI.notnull GtkTargetListRecord.FFI.p
               * GdkDragAction.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconFromGicon_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_set_icon_from_gicon" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * unit GioIconClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconFromIconName_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_entry_set_icon_from_icon_name" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconFromPixbuf_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_set_icon_from_pixbuf" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * unit GdkPixbufPixbufClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconFromStock_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_entry_set_icon_from_stock" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconSensitive_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_set_icon_sensitive" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIconTooltipMarkup_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_entry_set_icon_tooltip_markup" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setIconTooltipText_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_entry_set_icon_tooltip_text" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * GtkEntryIconPosition.FFI.val_
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setInnerBorder_ = fn x1 & x2 => (_import "gtk_entry_set_inner_border" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * unit GtkBorderRecord.FFI.p -> unit;) (x1, x2)
    val setInputHints_ = fn x1 & x2 => (_import "gtk_entry_set_input_hints" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkInputHints.FFI.val_ -> unit;) (x1, x2)
    val setInputPurpose_ = fn x1 & x2 => (_import "gtk_entry_set_input_purpose" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GtkInputPurpose.FFI.val_ -> unit;) (x1, x2)
    val setInvisibleChar_ = fn x1 & x2 => (_import "gtk_entry_set_invisible_char" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GChar.FFI.val_ -> unit;) (x1, x2)
    val setMaxLength_ = fn x1 & x2 => (_import "gtk_entry_set_max_length" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setMaxWidthChars_ = fn x1 & x2 => (_import "gtk_entry_set_max_width_chars" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val setOverwriteMode_ = fn x1 & x2 => (_import "gtk_entry_set_overwrite_mode" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPlaceholderText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_entry_set_placeholder_text" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setProgressFraction_ = fn x1 & x2 => (_import "gtk_entry_set_progress_fraction" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setProgressPulseStep_ = fn x1 & x2 => (_import "gtk_entry_set_progress_pulse_step" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setTabs_ = fn x1 & x2 => (_import "gtk_entry_set_tabs" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * PangoTabArrayRecord.FFI.notnull PangoTabArrayRecord.FFI.p -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_entry_set_text" :
              GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibility_ = fn x1 & x2 => (_import "gtk_entry_set_visibility" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_entry_set_width_chars" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    val textIndexToLayoutIndex_ = fn x1 & x2 => (_import "gtk_entry_text_index_to_layout_index" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p * GInt32.FFI.val_ -> GInt32.FFI.val_;) (x1, x2)
    val unsetInvisibleChar_ = _import "gtk_entry_unset_invisible_char" : GtkEntryClass.FFI.notnull GtkEntryClass.FFI.p -> unit;
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
    fun getCurrentIconDragSource self = (GtkEntryClass.FFI.withPtr ---> GInt32.FFI.fromVal) getCurrentIconDragSource_ self
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (x, y)
      end
    fun getMaxLength self = (GtkEntryClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxLength_ self
    fun getMaxWidthChars self = (GtkEntryClass.FFI.withPtr ---> GInt32.FFI.fromVal) getMaxWidthChars_ self
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
    fun getWidthChars self = (GtkEntryClass.FFI.withPtr ---> GInt32.FFI.fromVal) getWidthChars_ self
    fun grabFocusWithoutSelecting self = (GtkEntryClass.FFI.withPtr ---> I) grabFocusWithoutSelecting_ self
    fun imContextFilterKeypress self event = (GtkEntryClass.FFI.withPtr &&&> GdkEventKeyRecord.FFI.withPtr ---> GBool.FFI.fromVal) imContextFilterKeypress_ (self & event)
    fun layoutIndexToTextIndex self layoutIndex = (GtkEntryClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) layoutIndexToTextIndex_ (self & layoutIndex)
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
    fun setMaxLength self max = (GtkEntryClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxLength_ (self & max)
    fun setMaxWidthChars self nChars = (GtkEntryClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setMaxWidthChars_ (self & nChars)
    fun setOverwriteMode self overwrite = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setOverwriteMode_ (self & overwrite)
    fun setPlaceholderText self text = (GtkEntryClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setPlaceholderText_ (self & text)
    fun setProgressFraction self fraction = (GtkEntryClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setProgressFraction_ (self & fraction)
    fun setProgressPulseStep self fraction = (GtkEntryClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setProgressPulseStep_ (self & fraction)
    fun setTabs self tabs = (GtkEntryClass.FFI.withPtr &&&> PangoTabArrayRecord.FFI.withPtr ---> I) setTabs_ (self & tabs)
    fun setText self text = (GtkEntryClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setText_ (self & text)
    fun setVisibility self visible = (GtkEntryClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVisibility_ (self & visible)
    fun setWidthChars self nChars = (GtkEntryClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) setWidthChars_ (self & nChars)
    fun textIndexToLayoutIndex self textIndex = (GtkEntryClass.FFI.withPtr &&&> GInt32.FFI.withVal ---> GInt32.FFI.fromVal) textIndexToLayoutIndex_ (self & textIndex)
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
          set = fn x => set "activates-default" boolean x
        }
      val attributesProp =
        {
          get = fn x => get "attributes" PangoAttrListRecord.tOpt x,
          set = fn x => set "attributes" PangoAttrListRecord.tOpt x
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
      val inputHintsProp =
        {
          get = fn x => get "input-hints" GtkInputHints.t x,
          set = fn x => set "input-hints" GtkInputHints.t x
        }
      val inputPurposeProp =
        {
          get = fn x => get "input-purpose" GtkInputPurpose.t x,
          set = fn x => set "input-purpose" GtkInputPurpose.t x
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
      val maxWidthCharsProp =
        {
          get = fn x => get "max-width-chars" int x,
          set = fn x => set "max-width-chars" int x
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
      val populateAllProp =
        {
          get = fn x => get "populate-all" boolean x,
          set = fn x => set "populate-all" boolean x
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
      val tabsProp =
        {
          get = fn x => get "tabs" PangoTabArrayRecord.tOpt x,
          set = fn x => set "tabs" PangoTabArrayRecord.tOpt x
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
