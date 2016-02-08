structure GtkEntry :>
  GTK_ENTRY
    where type 'a class_t = 'a GtkEntryClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    where type 'a editable_class_t = 'a GtkEditableClass.t
    where type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    where type target_list_record_t = GtkTargetListRecord.t
    where type delete_type_t = GtkDeleteType.t
    where type entry_icon_position_t = GtkEntryIconPosition.t
    where type movement_step_t = GtkMovementStep.t
    where type 'a menu_class_t = 'a GtkMenuClass.t
    where type 'a entry_buffer_class_t = 'a GtkEntryBufferClass.t
    where type 'a entry_completion_class_t = 'a GtkEntryCompletionClass.t
    where type border_record_t = GtkBorderRecord.t
    where type image_type_t = GtkImageType.t
    where type shadow_type_t = GtkShadowType.t =
  struct
    val getType_ = _import "gtk_entry_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_entry_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithBuffer_ = _import "gtk_entry_new_with_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getActivatesDefault_ = _import "gtk_entry_get_activates_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getAlignment_ = _import "gtk_entry_get_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Float.C.val_;
    val getBuffer_ = _import "gtk_entry_get_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCompletion_ = _import "gtk_entry_get_completion" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getCurrentIconDragSource_ = _import "gtk_entry_get_current_icon_drag_source" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getCursorHadjustment_ = _import "gtk_entry_get_cursor_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getHasFrame_ = _import "gtk_entry_get_has_frame" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIconActivatable_ = fn x1 & x2 => (_import "gtk_entry_get_icon_activatable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getIconArea_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_get_icon_area" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getIconGicon_ = fn x1 & x2 => (_import "gtk_entry_get_icon_gicon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getIconName_ = fn x1 & x2 => (_import "gtk_entry_get_icon_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getIconPixbuf_ = fn x1 & x2 => (_import "gtk_entry_get_icon_pixbuf" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getIconSensitive_ = fn x1 & x2 => (_import "gtk_entry_get_icon_sensitive" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getIconStock_ = fn x1 & x2 => (_import "gtk_entry_get_icon_stock" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getIconStorageType_ = fn x1 & x2 => (_import "gtk_entry_get_icon_storage_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> GtkImageType.C.val_;) (x1, x2)
    val getIconTooltipMarkup_ = fn x1 & x2 => (_import "gtk_entry_get_icon_tooltip_markup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getIconTooltipText_ = fn x1 & x2 => (_import "gtk_entry_get_icon_tooltip_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GtkEntryIconPosition.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getInnerBorder_ = _import "gtk_entry_get_inner_border" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GtkBorderRecord.C.notnull GtkBorderRecord.C.p;
    val getInvisibleChar_ = _import "gtk_entry_get_invisible_char" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Char.C.val_;
    val getLayout_ = _import "gtk_entry_get_layout" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getLayoutOffsets_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_get_layout_offsets" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMaxLength_ = _import "gtk_entry_get_max_length" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val getOverwriteMode_ = _import "gtk_entry_get_overwrite_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getPlaceholderText_ = _import "gtk_entry_get_placeholder_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getProgressFraction_ = _import "gtk_entry_get_progress_fraction" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getProgressPulseStep_ = _import "gtk_entry_get_progress_pulse_step" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Double.C.val_;
    val getText_ = _import "gtk_entry_get_text" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTextArea_ = fn x1 & x2 => (_import "gtk_entry_get_text_area" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p -> unit;) (x1, x2)
    val getTextLength_ = _import "gtk_entry_get_text_length" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt16.C.val_;
    val getVisibility_ = _import "gtk_entry_get_visibility" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getWidthChars_ = _import "gtk_entry_get_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int.C.val_;
    val imContextFilterKeypress_ = fn x1 & x2 => (_import "gtk_entry_im_context_filter_keypress" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEventKeyRecord.C.notnull GdkEventKeyRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val layoutIndexToTextIndex_ = fn x1 & x2 => (_import "gtk_entry_layout_index_to_text_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val progressPulse_ = _import "gtk_entry_progress_pulse" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val resetImContext_ = _import "gtk_entry_reset_im_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setActivatesDefault_ = fn x1 & x2 => (_import "gtk_entry_set_activates_default" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setAlignment_ = fn x1 & x2 => (_import "gtk_entry_set_alignment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Float.C.val_ -> unit;) (x1, x2)
    val setBuffer_ = fn x1 & x2 => (_import "gtk_entry_set_buffer" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setCompletion_ = fn x1 & x2 => (_import "gtk_entry_set_completion" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setCursorHadjustment_ = fn x1 & x2 => (_import "gtk_entry_set_cursor_hadjustment" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setHasFrame_ = fn x1 & x2 => (_import "gtk_entry_set_has_frame" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setIconActivatable_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_entry_set_icon_activatable" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * FFI.Bool.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * GdkDragAction.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * FFI.Bool.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GtkEntryIconPosition.C.val_
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setInnerBorder_ = fn x1 & x2 => (_import "gtk_entry_set_inner_border" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GtkBorderRecord.C.p -> unit;) (x1, x2)
    val setInvisibleChar_ = fn x1 & x2 => (_import "gtk_entry_set_invisible_char" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Char.C.val_ -> unit;) (x1, x2)
    val setMaxLength_ = fn x1 & x2 => (_import "gtk_entry_set_max_length" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setOverwriteMode_ = fn x1 & x2 => (_import "gtk_entry_set_overwrite_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setPlaceholderText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_entry_set_placeholder_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setProgressFraction_ = fn x1 & x2 => (_import "gtk_entry_set_progress_fraction" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setProgressPulseStep_ = fn x1 & x2 => (_import "gtk_entry_set_progress_pulse_step" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Double.C.val_ -> unit;) (x1, x2)
    val setText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_entry_set_text" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setVisibility_ = fn x1 & x2 => (_import "gtk_entry_set_visibility" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setWidthChars_ = fn x1 & x2 => (_import "gtk_entry_set_width_chars" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val textIndexToLayoutIndex_ = fn x1 & x2 => (_import "gtk_entry_text_index_to_layout_index" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> FFI.Int.C.val_;) (x1, x2)
    val unsetInvisibleChar_ = _import "gtk_entry_unset_invisible_char" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GtkEntryClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a cell_editable_class_t = 'a GtkCellEditableClass.t
    type 'a editable_class_t = 'a GtkEditableClass.t
    type 'a adjustment_class_t = 'a GtkAdjustmentClass.t
    type target_list_record_t = GtkTargetListRecord.t
    type delete_type_t = GtkDeleteType.t
    type entry_icon_position_t = GtkEntryIconPosition.t
    type movement_step_t = GtkMovementStep.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type 'a entry_buffer_class_t = 'a GtkEntryBufferClass.t
    type 'a entry_completion_class_t = 'a GtkEntryCompletionClass.t
    type border_record_t = GtkBorderRecord.t
    type image_type_t = GtkImageType.t
    type shadow_type_t = GtkShadowType.t
    type t = base class_t
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
    fun getCurrentIconDragSource self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getCurrentIconDragSource_ self
    fun getCursorHadjustment self = (GObjectObjectClass.C.withPtr ---> GtkAdjustmentClass.C.fromPtr false) getCursorHadjustment_ self
    fun getHasFrame self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasFrame_ self
    fun getIconActivatable self iconPos = (GObjectObjectClass.C.withPtr &&&> GtkEntryIconPosition.C.withVal ---> FFI.Bool.C.fromVal) getIconActivatable_ (self & iconPos)
    fun getIconArea self iconPos =
      let
        val iconArea & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GtkEntryIconPosition.C.withVal
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
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
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
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
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getLayoutOffsets_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (x, y)
      end
    fun getMaxLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getMaxLength_ self
    fun getOverwriteMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getOverwriteMode_ self
    fun getPlaceholderText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getPlaceholderText_ self
    fun getProgressFraction self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getProgressFraction_ self
    fun getProgressPulseStep self = (GObjectObjectClass.C.withPtr ---> FFI.Double.C.fromVal) getProgressPulseStep_ self
    fun getText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getText_ self
    fun getTextArea self =
      let
        val textArea & () = (GObjectObjectClass.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && I) getTextArea_ (self & ())
      in
        textArea
      end
    fun getTextLength self = (GObjectObjectClass.C.withPtr ---> FFI.UInt16.C.fromVal) getTextLength_ self
    fun getVisibility self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisibility_ self
    fun getWidthChars self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getWidthChars_ self
    fun imContextFilterKeypress self event = (GObjectObjectClass.C.withPtr &&&> GdkEventKeyRecord.C.withPtr ---> FFI.Bool.C.fromVal) imContextFilterKeypress_ (self & event)
    fun layoutIndexToTextIndex self layoutIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) layoutIndexToTextIndex_ (self & layoutIndex)
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
         &&&> Utf8.C.withConstOptPtr
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
         &&&> Utf8.C.withConstOptPtr
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
         &&&> Utf8.C.withConstOptPtr
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
         &&&> Utf8.C.withConstOptPtr
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
    fun setMaxLength self max = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMaxLength_ (self & max)
    fun setOverwriteMode self overwrite = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setOverwriteMode_ (self & overwrite)
    fun setPlaceholderText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setPlaceholderText_ (self & text)
    fun setProgressFraction self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setProgressFraction_ (self & fraction)
    fun setProgressPulseStep self fraction = (GObjectObjectClass.C.withPtr &&&> FFI.Double.C.withVal ---> I) setProgressPulseStep_ (self & fraction)
    fun setText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withConstPtr ---> I) setText_ (self & text)
    fun setVisibility self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisibility_ (self & visible)
    fun setWidthChars self nChars = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setWidthChars_ (self & nChars)
    fun textIndexToLayoutIndex self textIndex = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Int.C.fromVal) textIndexToLayoutIndex_ (self & textIndex)
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
