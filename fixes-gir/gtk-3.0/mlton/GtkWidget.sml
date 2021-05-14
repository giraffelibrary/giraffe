structure GtkWidget :>
  GTK_WIDGET
    where type 'a class = 'a GtkWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type accel_flags_t = GtkAccelFlags.t
    where type orientation_t = GtkOrientation.t
    where type dest_defaults_t = GtkDestDefaults.t
    where type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    where type target_list_t = GtkTargetListRecord.t
    where type 'a clipboard_class = 'a GtkClipboardClass.class
    where type widget_path_t = GtkWidgetPathRecord.t
    where type size_request_mode_t = GtkSizeRequestMode.t
    where type 'a settings_class = 'a GtkSettingsClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class
    where type 'a rc_style_class = 'a GtkRcStyleClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type requisition_t = GtkRequisitionRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type drag_result_t = GtkDragResult.t
    where type direction_type_t = GtkDirectionType.t
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type widget_help_type_t = GtkWidgetHelpType.t
    where type allocation_t = GtkAllocationRecord.t
    where type state_type_t = GtkStateType.t
    where type state_flags_t = GtkStateFlags.t
    where type 'a container_class = 'a GtkContainerClass.class
    where type 'a style_class = 'a GtkStyleClass.class
    where type align_t = GtkAlign.t =
  struct
    val getType_ = _import "gtk_widget_get_type" : unit -> GObjectType.FFI.val_;
    val getDefaultDirection_ = _import "gtk_widget_get_default_direction" : unit -> GtkTextDirection.FFI.val_;
    val getDefaultStyle_ = _import "gtk_widget_get_default_style" : unit -> GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p;
    val popCompositeChild_ = _import "gtk_widget_pop_composite_child" : unit -> unit;
    val pushCompositeChild_ = _import "gtk_widget_push_composite_child" : unit -> unit;
    val setDefaultDirection_ = _import "gtk_widget_set_default_direction" : GtkTextDirection.FFI.val_ -> unit;
    val activate_ = _import "gtk_widget_activate" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val addAccelerator_ =
      fn
        x1
         & (x2, x3)
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "mlton_gtk_widget_add_accelerator" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               * GtkAccelFlags.FFI.val_
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
    val addDeviceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_add_device_events" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GdkEventMask.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addEvents_ = fn x1 & x2 => (_import "gtk_widget_add_events" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkEventMask.FFI.val_ -> unit;) (x1, x2)
    val addMnemonicLabel_ = fn x1 & x2 => (_import "gtk_widget_add_mnemonic_label" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val canActivateAccel_ = fn x1 & x2 => (_import "gtk_widget_can_activate_accel" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GUInt.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val childFocus_ = fn x1 & x2 => (_import "gtk_widget_child_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkDirectionType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val childNotify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_child_notify" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val classPath_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_widget_class_path" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GUInt.FFI.ref_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
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
    val computeExpand_ = fn x1 & x2 => (_import "gtk_widget_compute_expand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkOrientation.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val createPangoContext_ = _import "gtk_widget_create_pango_context" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> PangoContextClass.FFI.non_opt PangoContextClass.FFI.p;
    val createPangoLayout_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_create_pango_layout" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> PangoLayoutClass.FFI.non_opt PangoLayoutClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val destroy_ = _import "gtk_widget_destroy" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val deviceIsShadowed_ = fn x1 & x2 => (_import "gtk_widget_device_is_shadowed" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val dragBegin_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_drag_begin" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkTargetListRecord.FFI.non_opt GtkTargetListRecord.FFI.p
               * GdkDragAction.FFI.val_
               * GInt.FFI.val_
               * GdkEvent.FFI.opt GdkEvent.FFI.p
               -> GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dragBeginWithCoordinates_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gtk_drag_begin_with_coordinates" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkTargetListRecord.FFI.non_opt GtkTargetListRecord.FFI.p
               * GdkDragAction.FFI.val_
               * GInt.FFI.val_
               * GdkEvent.FFI.opt GdkEvent.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p;
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
    val dragCheckThreshold_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_drag_check_threshold" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dragDestAddImageTargets_ = _import "gtk_drag_dest_add_image_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragDestAddTextTargets_ = _import "gtk_drag_dest_add_text_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragDestAddUriTargets_ = _import "gtk_drag_dest_add_uri_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragDestFindTarget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_drag_dest_find_target" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p
               * GtkTargetListRecord.FFI.opt GtkTargetListRecord.FFI.p
               -> GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val dragDestGetTargetList_ = _import "gtk_drag_dest_get_target_list" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkTargetListRecord.FFI.opt GtkTargetListRecord.FFI.p;
    val dragDestGetTrackMotion_ = _import "gtk_drag_dest_get_track_motion" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val dragDestSet_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_drag_dest_set" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkDestDefaults.FFI.val_
               * GtkTargetEntryRecordCArrayN.MLton.p1
               * GtkTargetEntryRecordCArrayN.FFI.non_opt GtkTargetEntryRecordCArrayN.MLton.p2
               * GInt.FFI.val_
               * GdkDragAction.FFI.val_
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
    val dragDestSetProxy_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_dest_set_proxy" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GdkDragProtocol.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragDestSetTargetList_ = fn x1 & x2 => (_import "gtk_drag_dest_set_target_list" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkTargetListRecord.FFI.opt GtkTargetListRecord.FFI.p -> unit;) (x1, x2)
    val dragDestSetTrackMotion_ = fn x1 & x2 => (_import "gtk_drag_dest_set_track_motion" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val dragDestUnset_ = _import "gtk_drag_dest_unset" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragGetData_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_get_data" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkDragContextClass.FFI.non_opt GdkDragContextClass.FFI.p
               * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragHighlight_ = _import "gtk_drag_highlight" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragSourceAddImageTargets_ = _import "gtk_drag_source_add_image_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragSourceAddTextTargets_ = _import "gtk_drag_source_add_text_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragSourceAddUriTargets_ = _import "gtk_drag_source_add_uri_targets" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragSourceGetTargetList_ = _import "gtk_drag_source_get_target_list" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkTargetListRecord.FFI.opt GtkTargetListRecord.FFI.p;
    val dragSourceSet_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_gtk_drag_source_set" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkModifierType.FFI.val_
               * GtkTargetEntryRecordCArrayN.MLton.p1
               * GtkTargetEntryRecordCArrayN.FFI.non_opt GtkTargetEntryRecordCArrayN.MLton.p2
               * GInt.FFI.val_
               * GdkDragAction.FFI.val_
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
    val dragSourceSetIconGicon_ = fn x1 & x2 => (_import "gtk_drag_source_set_icon_gicon" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val dragSourceSetIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_drag_source_set_icon_name" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dragSourceSetIconPixbuf_ = fn x1 & x2 => (_import "gtk_drag_source_set_icon_pixbuf" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkPixbufPixbufClass.FFI.non_opt GdkPixbufPixbufClass.FFI.p -> unit;) (x1, x2)
    val dragSourceSetIconStock_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_drag_source_set_icon_stock" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dragSourceSetTargetList_ = fn x1 & x2 => (_import "gtk_drag_source_set_target_list" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkTargetListRecord.FFI.opt GtkTargetListRecord.FFI.p -> unit;) (x1, x2)
    val dragSourceUnset_ = _import "gtk_drag_source_unset" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val dragUnhighlight_ = _import "gtk_drag_unhighlight" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val draw_ = fn x1 & x2 => (_import "gtk_widget_draw" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoContextRecord.FFI.non_opt CairoContextRecord.FFI.p -> unit;) (x1, x2)
    val ensureStyle_ = _import "gtk_widget_ensure_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val errorBell_ = _import "gtk_widget_error_bell" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val event_ = fn x1 & x2 => (_import "gtk_widget_event" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val freezeChildNotify_ = _import "gtk_widget_freeze_child_notify" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val getAccessible_ = _import "gtk_widget_get_accessible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> AtkObjectClass.FFI.non_opt AtkObjectClass.FFI.p;
    val getActionGroup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_get_action_group" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioActionGroupClass.FFI.opt GioActionGroupClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllocatedBaseline_ = _import "gtk_widget_get_allocated_baseline" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getAllocatedHeight_ = _import "gtk_widget_get_allocated_height" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getAllocatedSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_allocated_size" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getAllocatedWidth_ = _import "gtk_widget_get_allocated_width" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getAllocation_ = fn x1 & x2 => (_import "gtk_widget_get_allocation" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p -> unit;) (x1, x2)
    val getAncestor_ = fn x1 & x2 => (_import "gtk_widget_get_ancestor" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GObjectType.FFI.val_ -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;) (x1, x2)
    val getAppPaintable_ = _import "gtk_widget_get_app_paintable" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getCanDefault_ = _import "gtk_widget_get_can_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getCanFocus_ = _import "gtk_widget_get_can_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getChildRequisition_ = fn x1 & x2 => (_import "gtk_widget_get_child_requisition" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p -> unit;) (x1, x2)
    val getChildVisible_ = _import "gtk_widget_get_child_visible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getClip_ = fn x1 & x2 => (_import "gtk_widget_get_clip" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p -> unit;) (x1, x2)
    val getClipboard_ = fn x1 & x2 => (_import "gtk_widget_get_clipboard" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GtkClipboardClass.FFI.non_opt GtkClipboardClass.FFI.p;) (x1, x2)
    val getCompositeName_ = _import "gtk_widget_get_composite_name" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDeviceEnabled_ = fn x1 & x2 => (_import "gtk_widget_get_device_enabled" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getDeviceEvents_ = fn x1 & x2 => (_import "gtk_widget_get_device_events" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GdkEventMask.FFI.val_;) (x1, x2)
    val getDirection_ = _import "gtk_widget_get_direction" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkTextDirection.FFI.val_;
    val getDisplay_ = _import "gtk_widget_get_display" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p;
    val getDoubleBuffered_ = _import "gtk_widget_get_double_buffered" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getEvents_ = _import "gtk_widget_get_events" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkEventMask.FFI.val_;
    val getFocusOnClick_ = _import "gtk_widget_get_focus_on_click" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getFontMap_ = _import "gtk_widget_get_font_map" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> PangoFontMapClass.FFI.opt PangoFontMapClass.FFI.p;
    val getFontOptions_ = _import "gtk_widget_get_font_options" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> CairoFontOptionsRecord.FFI.opt CairoFontOptionsRecord.FFI.p;
    val getFrameClock_ = _import "gtk_widget_get_frame_clock" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkFrameClockClass.FFI.opt GdkFrameClockClass.FFI.p;
    val getHalign_ = _import "gtk_widget_get_halign" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkAlign.FFI.val_;
    val getHasTooltip_ = _import "gtk_widget_get_has_tooltip" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getHasWindow_ = _import "gtk_widget_get_has_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getHexpand_ = _import "gtk_widget_get_hexpand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getHexpandSet_ = _import "gtk_widget_get_hexpand_set" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getMapped_ = _import "gtk_widget_get_mapped" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getMarginBottom_ = _import "gtk_widget_get_margin_bottom" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getMarginEnd_ = _import "gtk_widget_get_margin_end" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getMarginLeft_ = _import "gtk_widget_get_margin_left" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getMarginRight_ = _import "gtk_widget_get_margin_right" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getMarginStart_ = _import "gtk_widget_get_margin_start" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getMarginTop_ = _import "gtk_widget_get_margin_top" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getModifierMask_ = fn x1 & x2 => (_import "gtk_widget_get_modifier_mask" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkModifierIntent.FFI.val_ -> GdkModifierType.FFI.val_;) (x1, x2)
    val getModifierStyle_ = _import "gtk_widget_get_modifier_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkRcStyleClass.FFI.non_opt GtkRcStyleClass.FFI.p;
    val getName_ = _import "gtk_widget_get_name" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getNoShowAll_ = _import "gtk_widget_get_no_show_all" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getOpacity_ = _import "gtk_widget_get_opacity" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GDouble.FFI.val_;
    val getPangoContext_ = _import "gtk_widget_get_pango_context" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> PangoContextClass.FFI.non_opt PangoContextClass.FFI.p;
    val getParent_ = _import "gtk_widget_get_parent" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getParentWindow_ = _import "gtk_widget_get_parent_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    val getPath_ = _import "gtk_widget_get_path" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkWidgetPathRecord.FFI.non_opt GtkWidgetPathRecord.FFI.p;
    val getPointer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_pointer" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredHeight_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_preferred_height" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredHeightAndBaselineForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_widget_get_preferred_height_and_baseline_for_width" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
    val getPreferredHeightForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_get_preferred_height_for_width" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getPreferredSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_preferred_size" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p
               * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredWidth_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_preferred_width" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredWidthForHeight_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_get_preferred_width_for_height" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getRealized_ = _import "gtk_widget_get_realized" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getReceivesDefault_ = _import "gtk_widget_get_receives_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getRequestMode_ = _import "gtk_widget_get_request_mode" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkSizeRequestMode.FFI.val_;
    val getRequisition_ = fn x1 & x2 => (_import "gtk_widget_get_requisition" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p -> unit;) (x1, x2)
    val getRootWindow_ = _import "gtk_widget_get_root_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getScaleFactor_ = _import "gtk_widget_get_scale_factor" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GInt.FFI.val_;
    val getScreen_ = _import "gtk_widget_get_screen" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getSensitive_ = _import "gtk_widget_get_sensitive" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getSettings_ = _import "gtk_widget_get_settings" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkSettingsClass.FFI.non_opt GtkSettingsClass.FFI.p;
    val getSizeRequest_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_size_request" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getState_ = _import "gtk_widget_get_state" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkStateType.FFI.val_;
    val getStateFlags_ = _import "gtk_widget_get_state_flags" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkStateFlags.FFI.val_;
    val getStyle_ = _import "gtk_widget_get_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkStyleClass.FFI.non_opt GtkStyleClass.FFI.p;
    val getStyleContext_ = _import "gtk_widget_get_style_context" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkStyleContextClass.FFI.non_opt GtkStyleContextClass.FFI.p;
    val getSupportMultidevice_ = _import "gtk_widget_get_support_multidevice" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getTemplateChild_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_widget_get_template_child" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GObjectType.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getTooltipMarkup_ = _import "gtk_widget_get_tooltip_markup" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getTooltipText_ = _import "gtk_widget_get_tooltip_text" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getTooltipWindow_ = _import "gtk_widget_get_tooltip_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkWindowClass.FFI.non_opt GtkWindowClass.FFI.p;
    val getToplevel_ = _import "gtk_widget_get_toplevel" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getValign_ = _import "gtk_widget_get_valign" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkAlign.FFI.val_;
    val getValignWithBaseline_ = _import "gtk_widget_get_valign_with_baseline" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GtkAlign.FFI.val_;
    val getVexpand_ = _import "gtk_widget_get_vexpand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getVexpandSet_ = _import "gtk_widget_get_vexpand_set" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getVisible_ = _import "gtk_widget_get_visible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val getVisual_ = _import "gtk_widget_get_visual" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkVisualClass.FFI.non_opt GdkVisualClass.FFI.p;
    val getWindow_ = _import "gtk_widget_get_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    val grabAdd_ = _import "gtk_grab_add" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val grabDefault_ = _import "gtk_widget_grab_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val grabFocus_ = _import "gtk_widget_grab_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val grabRemove_ = _import "gtk_grab_remove" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val hasDefault_ = _import "gtk_widget_has_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hasFocus_ = _import "gtk_widget_has_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hasGrab_ = _import "gtk_widget_has_grab" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hasRcStyle_ = _import "gtk_widget_has_rc_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hasScreen_ = _import "gtk_widget_has_screen" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hasVisibleFocus_ = _import "gtk_widget_has_visible_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val hide_ = _import "gtk_widget_hide" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val hideOnDelete_ = _import "gtk_widget_hide_on_delete" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val inDestruction_ = _import "gtk_widget_in_destruction" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val initTemplate_ = _import "gtk_widget_init_template" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val inputShapeCombineRegion_ = fn x1 & x2 => (_import "gtk_widget_input_shape_combine_region" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoRegionRecord.FFI.opt CairoRegionRecord.FFI.p -> unit;) (x1, x2)
    val insertActionGroup_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_insert_action_group" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioActionGroupClass.FFI.opt GioActionGroupClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val intersect_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_intersect" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isAncestor_ = fn x1 & x2 => (_import "gtk_widget_is_ancestor" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val isComposited_ = _import "gtk_widget_is_composited" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val isDrawable_ = _import "gtk_widget_is_drawable" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val isFocus_ = _import "gtk_widget_is_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val isSensitive_ = _import "gtk_widget_is_sensitive" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val isToplevel_ = _import "gtk_widget_is_toplevel" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val isVisible_ = _import "gtk_widget_is_visible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> GBool.FFI.val_;
    val keynavFailed_ = fn x1 & x2 => (_import "gtk_widget_keynav_failed" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkDirectionType.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val listActionPrefixes_ = _import "gtk_widget_list_action_prefixes" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;
    val map_ = _import "gtk_widget_map" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val mnemonicActivate_ = fn x1 & x2 => (_import "gtk_widget_mnemonic_activate" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val modifyBase_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_base" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateType.FFI.val_
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val modifyBg_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_bg" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateType.FFI.val_
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val modifyCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_cursor" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val modifyFg_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_fg" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateType.FFI.val_
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val modifyFont_ = fn x1 & x2 => (_import "gtk_widget_modify_font" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val modifyStyle_ = fn x1 & x2 => (_import "gtk_widget_modify_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkRcStyleClass.FFI.non_opt GtkRcStyleClass.FFI.p -> unit;) (x1, x2)
    val modifyText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_text" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateType.FFI.val_
               * GdkColorRecord.FFI.opt GdkColorRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val overrideBackgroundColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_override_background_color" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val overrideColor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_override_color" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val overrideCursor_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_override_cursor" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val overrideFont_ = fn x1 & x2 => (_import "gtk_widget_override_font" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * PangoFontDescriptionRecord.FFI.opt PangoFontDescriptionRecord.FFI.p -> unit;) (x1, x2)
    val overrideSymbolicColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_override_symbolic_color" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GdkRgbaRecord.FFI.opt GdkRgbaRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val path_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_widget_path" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GUInt.FFI.ref_
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
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
    val queueAllocate_ = _import "gtk_widget_queue_allocate" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val queueComputeExpand_ = _import "gtk_widget_queue_compute_expand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val queueDraw_ = _import "gtk_widget_queue_draw" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val queueDrawArea_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_widget_queue_draw_area" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queueDrawRegion_ = fn x1 & x2 => (_import "gtk_widget_queue_draw_region" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p -> unit;) (x1, x2)
    val queueResize_ = _import "gtk_widget_queue_resize" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val queueResizeNoRedraw_ = _import "gtk_widget_queue_resize_no_redraw" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val realize_ = _import "gtk_widget_realize" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val regionIntersect_ = fn x1 & x2 => (_import "gtk_widget_region_intersect" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p -> CairoRegionRecord.FFI.non_opt CairoRegionRecord.FFI.p;) (x1, x2)
    val registerWindow_ = fn x1 & x2 => (_import "gtk_widget_register_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val removeAccelerator_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_remove_accelerator" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkAccelGroupClass.FFI.non_opt GtkAccelGroupClass.FFI.p
               * GUInt.FFI.val_
               * GdkModifierType.FFI.val_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeMnemonicLabel_ = fn x1 & x2 => (_import "gtk_widget_remove_mnemonic_label" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val removeTickCallback_ = fn x1 & x2 => (_import "gtk_widget_remove_tick_callback" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val renderIcon_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6) =>
          (
            _import "mlton_gtk_widget_render_icon" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val renderIconPixbuf_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_render_icon_pixbuf" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val reparent_ = fn x1 & x2 => (_import "gtk_widget_reparent" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val resetRcStyles_ = _import "gtk_widget_reset_rc_styles" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val resetStyle_ = _import "gtk_widget_reset_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val sendExpose_ = fn x1 & x2 => (_import "gtk_widget_send_expose" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GInt.FFI.val_;) (x1, x2)
    val sendFocusChange_ = fn x1 & x2 => (_import "gtk_widget_send_focus_change" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setAccelPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_set_accel_path" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GtkAccelGroupClass.FFI.opt GtkAccelGroupClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAllocation_ = fn x1 & x2 => (_import "gtk_widget_set_allocation" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p -> unit;) (x1, x2)
    val setAppPaintable_ = fn x1 & x2 => (_import "gtk_widget_set_app_paintable" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCanDefault_ = fn x1 & x2 => (_import "gtk_widget_set_can_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setCanFocus_ = fn x1 & x2 => (_import "gtk_widget_set_can_focus" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setChildVisible_ = fn x1 & x2 => (_import "gtk_widget_set_child_visible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setClip_ = fn x1 & x2 => (_import "gtk_widget_set_clip" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p -> unit;) (x1, x2)
    val setCompositeName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_composite_name" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeviceEnabled_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_device_enabled" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDeviceEvents_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_device_events" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p
               * GdkEventMask.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDirection_ = fn x1 & x2 => (_import "gtk_widget_set_direction" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkTextDirection.FFI.val_ -> unit;) (x1, x2)
    val setDoubleBuffered_ = fn x1 & x2 => (_import "gtk_widget_set_double_buffered" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setEvents_ = fn x1 & x2 => (_import "gtk_widget_set_events" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkEventMask.FFI.val_ -> unit;) (x1, x2)
    val setFocusOnClick_ = fn x1 & x2 => (_import "gtk_widget_set_focus_on_click" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setFontMap_ = fn x1 & x2 => (_import "gtk_widget_set_font_map" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * PangoFontMapClass.FFI.opt PangoFontMapClass.FFI.p -> unit;) (x1, x2)
    val setFontOptions_ = fn x1 & x2 => (_import "gtk_widget_set_font_options" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoFontOptionsRecord.FFI.opt CairoFontOptionsRecord.FFI.p -> unit;) (x1, x2)
    val setHalign_ = fn x1 & x2 => (_import "gtk_widget_set_halign" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAlign.FFI.val_ -> unit;) (x1, x2)
    val setHasTooltip_ = fn x1 & x2 => (_import "gtk_widget_set_has_tooltip" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasWindow_ = fn x1 & x2 => (_import "gtk_widget_set_has_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHexpand_ = fn x1 & x2 => (_import "gtk_widget_set_hexpand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHexpandSet_ = fn x1 & x2 => (_import "gtk_widget_set_hexpand_set" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMapped_ = fn x1 & x2 => (_import "gtk_widget_set_mapped" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMarginBottom_ = fn x1 & x2 => (_import "gtk_widget_set_margin_bottom" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarginEnd_ = fn x1 & x2 => (_import "gtk_widget_set_margin_end" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarginLeft_ = fn x1 & x2 => (_import "gtk_widget_set_margin_left" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarginRight_ = fn x1 & x2 => (_import "gtk_widget_set_margin_right" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarginStart_ = fn x1 & x2 => (_import "gtk_widget_set_margin_start" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setMarginTop_ = fn x1 & x2 => (_import "gtk_widget_set_margin_top" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_name" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNoShowAll_ = fn x1 & x2 => (_import "gtk_widget_set_no_show_all" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setOpacity_ = fn x1 & x2 => (_import "gtk_widget_set_opacity" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setParent_ = fn x1 & x2 => (_import "gtk_widget_set_parent" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setParentWindow_ = fn x1 & x2 => (_import "gtk_widget_set_parent_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val setRealized_ = fn x1 & x2 => (_import "gtk_widget_set_realized" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setReceivesDefault_ = fn x1 & x2 => (_import "gtk_widget_set_receives_default" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRedrawOnAllocate_ = fn x1 & x2 => (_import "gtk_widget_set_redraw_on_allocate" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSensitive_ = fn x1 & x2 => (_import "gtk_widget_set_sensitive" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSizeRequest_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_size_request" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setState_ = fn x1 & x2 => (_import "gtk_widget_set_state" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkStateType.FFI.val_ -> unit;) (x1, x2)
    val setStateFlags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_state_flags" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkStateFlags.FFI.val_
               * GBool.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyle_ = fn x1 & x2 => (_import "gtk_widget_set_style" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkStyleClass.FFI.opt GtkStyleClass.FFI.p -> unit;) (x1, x2)
    val setSupportMultidevice_ = fn x1 & x2 => (_import "gtk_widget_set_support_multidevice" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_tooltip_markup" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipText_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_tooltip_text" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipWindow_ = fn x1 & x2 => (_import "gtk_widget_set_tooltip_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkWindowClass.FFI.opt GtkWindowClass.FFI.p -> unit;) (x1, x2)
    val setValign_ = fn x1 & x2 => (_import "gtk_widget_set_valign" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAlign.FFI.val_ -> unit;) (x1, x2)
    val setVexpand_ = fn x1 & x2 => (_import "gtk_widget_set_vexpand" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVexpandSet_ = fn x1 & x2 => (_import "gtk_widget_set_vexpand_set" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_widget_set_visible" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisual_ = fn x1 & x2 => (_import "gtk_widget_set_visual" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkVisualClass.FFI.opt GdkVisualClass.FFI.p -> unit;) (x1, x2)
    val setWindow_ = fn x1 & x2 => (_import "gtk_widget_set_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val shapeCombineRegion_ = fn x1 & x2 => (_import "gtk_widget_shape_combine_region" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * CairoRegionRecord.FFI.opt CairoRegionRecord.FFI.p -> unit;) (x1, x2)
    val show_ = _import "gtk_widget_show" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val showAll_ = _import "gtk_widget_show_all" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val showNow_ = _import "gtk_widget_show_now" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val sizeAllocate_ = fn x1 & x2 => (_import "gtk_widget_size_allocate" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p -> unit;) (x1, x2)
    val sizeAllocateWithBaseline_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_size_allocate_with_baseline" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkAllocationRecord.FFI.non_opt GtkAllocationRecord.FFI.p
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val sizeRequest_ = fn x1 & x2 => (_import "gtk_widget_size_request" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkRequisitionRecord.FFI.non_opt GtkRequisitionRecord.FFI.p -> unit;) (x1, x2)
    val styleAttach_ = _import "gtk_widget_style_attach" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val styleGetProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_style_get_property" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawChildNotify_ = _import "gtk_widget_thaw_child_notify" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val translateCoordinates_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6 =>
          (
            _import "gtk_widget_translate_coordinates" :
              GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
    val triggerTooltipQuery_ = _import "gtk_widget_trigger_tooltip_query" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val unmap_ = _import "gtk_widget_unmap" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val unparent_ = _import "gtk_widget_unparent" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val unrealize_ = _import "gtk_widget_unrealize" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;
    val unregisterWindow_ = fn x1 & x2 => (_import "gtk_widget_unregister_window" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> unit;) (x1, x2)
    val unsetStateFlags_ = fn x1 & x2 => (_import "gtk_widget_unset_state_flags" : GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p * GtkStateFlags.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type accel_flags_t = GtkAccelFlags.t
    type orientation_t = GtkOrientation.t
    type dest_defaults_t = GtkDestDefaults.t
    type target_entry_record_c_array_n_t = GtkTargetEntryRecordCArrayN.t
    type target_list_t = GtkTargetListRecord.t
    type 'a clipboard_class = 'a GtkClipboardClass.class
    type widget_path_t = GtkWidgetPathRecord.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type 'a settings_class = 'a GtkSettingsClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type 'a rc_style_class = 'a GtkRcStyleClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type requisition_t = GtkRequisitionRecord.t
    type text_direction_t = GtkTextDirection.t
    type drag_result_t = GtkDragResult.t
    type direction_type_t = GtkDirectionType.t
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type widget_help_type_t = GtkWidgetHelpType.t
    type allocation_t = GtkAllocationRecord.t
    type state_type_t = GtkStateType.t
    type state_flags_t = GtkStateFlags.t
    type 'a container_class = 'a GtkContainerClass.class
    type 'a style_class = 'a GtkStyleClass.class
    type align_t = GtkAlign.t
    type t = base class
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false
    in
      fun asImplementorIface self = call I (GObjectObjectClass.toBase self)
    end
    local
      val call = GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false
    in
      fun asBuildable self = call I (GObjectObjectClass.toBase self)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    local
      val call = I ---> GtkTextDirection.FFI.fromVal
    in
      fun getDefaultDirection () = call getDefaultDirection_ ()
    end
    local
      val call = I ---> GtkStyleClass.FFI.fromPtr false
    in
      fun getDefaultStyle () = call getDefaultStyle_ ()
    end
    local
      val call = I ---> I
    in
      fun popCompositeChild () = call popCompositeChild_ ()
    end
    local
      val call = I ---> I
    in
      fun pushCompositeChild () = call pushCompositeChild_ ()
    end
    local
      val call = GtkTextDirection.FFI.withVal ---> I
    in
      fun setDefaultDirection dir = call setDefaultDirection_ dir
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun activate self = call activate_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkAccelGroupClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         &&&> GtkAccelFlags.FFI.withVal
         ---> I
    in
      fun addAccelerator
        self
        (
          accelSignal,
          accelGroup,
          accelKey,
          accelMods,
          accelFlags
        ) =
        call addAccelerator_
          (
            GtkWidgetClass.toBase self
             & accelSignal
             & GtkAccelGroupClass.toBase accelGroup
             & accelKey
             & accelMods
             & accelFlags
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
    in
      fun addDeviceEvents self (device, events) =
        call addDeviceEvents_
          (
            GtkWidgetClass.toBase self
             & GdkDeviceClass.toBase device
             & events
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I
    in
      fun addEvents self events = call addEvents_ (GtkWidgetClass.toBase self & events)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun addMnemonicLabel self label = call addMnemonicLabel_ (GtkWidgetClass.toBase self & GtkWidgetClass.toBase label)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun canActivateAccel self signalId = call canActivateAccel_ (GtkWidgetClass.toBase self & signalId)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun childFocus self direction = call childFocus_ (GtkWidgetClass.toBase self & direction)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun childNotify self childProperty = call childNotify_ (GtkWidgetClass.toBase self & childProperty)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GUInt.FFI.withRefVal
         &&&> Utf8.FFI.withRefOptPtr 0
         &&&> Utf8.FFI.withRefOptPtr 0
         ---> GUInt.FFI.fromVal
               && Utf8.FFI.fromPtr ~1
               && Utf8.FFI.fromPtr ~1
               && I
    in
      fun classPath self =
        let
          val pathLength
           & path
           & pathReversed
           & () =
            call classPath_
              (
                GtkWidgetClass.toBase self
                 & GUInt.null
                 & NONE
                 & NONE
              )
        in
          (
            pathLength,
            path,
            pathReversed
          )
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun computeExpand self orientation = call computeExpand_ (GtkWidgetClass.toBase self & orientation)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr true
    in
      fun createPangoContext self = call createPangoContext_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> PangoLayoutClass.FFI.fromPtr true
    in
      fun createPangoLayout self text = call createPangoLayout_ (GtkWidgetClass.toBase self & text)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun destroy self = call destroy_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun deviceIsShadowed self device = call deviceIsShadowed_ (GtkWidgetClass.toBase self & GdkDeviceClass.toBase device)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         ---> GdkDragContextClass.FFI.fromPtr false
    in
      fun dragBegin
        self
        (
          targets,
          actions,
          button,
          event
        ) =
        call dragBegin_
          (
            GtkWidgetClass.toBase self
             & targets
             & actions
             & button
             & Option.map GdkEvent.toBase event
          )
         before GtkWidgetClass.FFI.touchPtr self
         before GtkTargetListRecord.FFI.touchPtr targets
         before GdkEvent.FFI.touchOptPtr event
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GdkDragContextClass.FFI.fromPtr false
    in
      fun dragBeginWithCoordinates
        self
        (
          targets,
          actions,
          button,
          event,
          x,
          y
        ) =
        call dragBeginWithCoordinates_
          (
            GtkWidgetClass.toBase self
             & targets
             & actions
             & button
             & Option.map GdkEvent.toBase event
             & x
             & y
          )
         before GtkWidgetClass.FFI.touchPtr self
         before GtkTargetListRecord.FFI.touchPtr targets
         before GdkEvent.FFI.touchOptPtr event
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun dragCheckThreshold
        self
        (
          startX,
          startY,
          currentX,
          currentY
        ) =
        call dragCheckThreshold_
          (
            GtkWidgetClass.toBase self
             & startX
             & startY
             & currentX
             & currentY
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragDestAddImageTargets self = call dragDestAddImageTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragDestAddTextTargets self = call dragDestAddTextTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragDestAddUriTargets self = call dragDestAddUriTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDragContextClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withOptPtr false
         ---> GdkAtomRecord.FFI.fromPtr false
    in
      fun dragDestFindTarget self (context, targetList) =
        call dragDestFindTarget_
          (
            GtkWidgetClass.toBase self
             & GdkDragContextClass.toBase context
             & targetList
          )
         before GtkWidgetClass.FFI.touchPtr self
         before GdkDragContextClass.FFI.touchPtr context
         before GtkTargetListRecord.FFI.touchOptPtr targetList
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkTargetListRecord.FFI.fromOptPtr false
    in
      fun dragDestGetTargetList self = call dragDestGetTargetList_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun dragDestGetTrackMotion self = call dragDestGetTrackMotion_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkDestDefaults.FFI.withVal
         &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GdkDragAction.FFI.withVal
         ---> I
    in
      fun dragDestSet
        self
        (
          flags,
          targets,
          actions
        ) =
        let
          val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
          val () =
            call dragDestSet_
              (
                GtkWidgetClass.toBase self
                 & flags
                 & targets
                 & nTargets
                 & actions
              )
        in
          ()
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkDragProtocol.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
    in
      fun dragDestSetProxy
        self
        (
          proxyWindow,
          protocol,
          useCoordinates
        ) =
        call dragDestSetProxy_
          (
            GtkWidgetClass.toBase self
             & GdkWindowClass.toBase proxyWindow
             & protocol
             & useCoordinates
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkTargetListRecord.FFI.withOptPtr false ---> I
    in
      fun dragDestSetTargetList self targetList = call dragDestSetTargetList_ (GtkWidgetClass.toBase self & targetList)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun dragDestSetTrackMotion self trackMotion = call dragDestSetTrackMotion_ (GtkWidgetClass.toBase self & trackMotion)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragDestUnset self = call dragDestUnset_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDragContextClass.FFI.withPtr false
         &&&> GdkAtomRecord.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         ---> I
    in
      fun dragGetData
        self
        (
          context,
          target,
          time
        ) =
        call dragGetData_
          (
            GtkWidgetClass.toBase self
             & GdkDragContextClass.toBase context
             & target
             & time
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragHighlight self = call dragHighlight_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragSourceAddImageTargets self = call dragSourceAddImageTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragSourceAddTextTargets self = call dragSourceAddTextTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragSourceAddUriTargets self = call dragSourceAddUriTargets_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkTargetListRecord.FFI.fromOptPtr false
    in
      fun dragSourceGetTargetList self = call dragSourceGetTargetList_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkModifierType.FFI.withVal
         &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> GdkDragAction.FFI.withVal
         ---> I
    in
      fun dragSourceSet
        self
        (
          startButtonMask,
          targets,
          actions
        ) =
        let
          val nTargets = LargeInt.fromInt (GtkTargetEntryRecordCArrayN.length targets)
          val () =
            call dragSourceSet_
              (
                GtkWidgetClass.toBase self
                 & startButtonMask
                 & targets
                 & nTargets
                 & actions
              )
        in
          ()
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I
    in
      fun dragSourceSetIconGicon self icon = call dragSourceSetIconGicon_ (GtkWidgetClass.toBase self & GioIconClass.toBase icon)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun dragSourceSetIconName self iconName = call dragSourceSetIconName_ (GtkWidgetClass.toBase self & iconName)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I
    in
      fun dragSourceSetIconPixbuf self pixbuf = call dragSourceSetIconPixbuf_ (GtkWidgetClass.toBase self & GdkPixbufPixbufClass.toBase pixbuf)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun dragSourceSetIconStock self stockId = call dragSourceSetIconStock_ (GtkWidgetClass.toBase self & stockId)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkTargetListRecord.FFI.withOptPtr false ---> I
    in
      fun dragSourceSetTargetList self targetList = call dragSourceSetTargetList_ (GtkWidgetClass.toBase self & targetList)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragSourceUnset self = call dragSourceUnset_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun dragUnhighlight self = call dragUnhighlight_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoContextRecord.FFI.withPtr false ---> I
    in
      fun draw self cr = call draw_ (GtkWidgetClass.toBase self & cr)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun ensureStyle self = call ensureStyle_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun errorBell self = call errorBell_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun event self event = call event_ (GtkWidgetClass.toBase self & GdkEvent.toBase event)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun freezeChildNotify self = call freezeChildNotify_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false
    in
      fun getAccessible self = call getAccessible_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionGroupClass.FFI.fromOptPtr false
    in
      fun getActionGroup self prefix = call getActionGroup_ (GtkWidgetClass.toBase self & prefix) before GtkWidgetClass.FFI.touchPtr self before Utf8.FFI.touchPtr prefix
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getAllocatedBaseline self = call getAllocatedBaseline_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getAllocatedHeight self = call getAllocatedHeight_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkAllocationRecord.FFI.withNewPtr
         &&&> GInt.FFI.withRefVal
         ---> GtkAllocationRecord.FFI.fromPtr true
               && GInt.FFI.fromVal
               && I
    in
      fun getAllocatedSize self =
        let
          val allocation
           & baseline
           & () =
            call getAllocatedSize_
              (
                GtkWidgetClass.toBase self
                 & ()
                 & GInt.null
              )
        in
          (allocation, baseline)
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getAllocatedWidth self = call getAllocatedWidth_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withNewPtr ---> GtkAllocationRecord.FFI.fromPtr true && I
    in
      fun getAllocation self =
        let
          val allocation & () = call getAllocation_ (GtkWidgetClass.toBase self & ())
        in
          allocation
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false
    in
      fun getAncestor self widgetType = call getAncestor_ (GtkWidgetClass.toBase self & widgetType) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getAppPaintable self = call getAppPaintable_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getCanDefault self = call getCanDefault_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getCanFocus self = call getCanFocus_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I
    in
      fun getChildRequisition self =
        let
          val requisition & () = call getChildRequisition_ (GtkWidgetClass.toBase self & ())
        in
          requisition
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getChildVisible self = call getChildVisible_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withNewPtr ---> GtkAllocationRecord.FFI.fromPtr true && I
    in
      fun getClip self =
        let
          val clip & () = call getClip_ (GtkWidgetClass.toBase self & ())
        in
          clip
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GtkClipboardClass.FFI.fromPtr false
    in
      fun getClipboard self selection = call getClipboard_ (GtkWidgetClass.toBase self & selection) before GtkWidgetClass.FFI.touchPtr self before GdkAtomRecord.FFI.touchPtr selection
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1
    in
      fun getCompositeName self = call getCompositeName_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getDeviceEnabled self device = call getDeviceEnabled_ (GtkWidgetClass.toBase self & GdkDeviceClass.toBase device)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal
    in
      fun getDeviceEvents self device = call getDeviceEvents_ (GtkWidgetClass.toBase self & GdkDeviceClass.toBase device)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkTextDirection.FFI.fromVal
    in
      fun getDirection self = call getDirection_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false
    in
      fun getDisplay self = call getDisplay_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getDoubleBuffered self = call getDoubleBuffered_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal
    in
      fun getEvents self = call getEvents_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getFocusOnClick self = call getFocusOnClick_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromOptPtr false
    in
      fun getFontMap self = call getFontMap_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> CairoFontOptionsRecord.FFI.fromOptPtr false
    in
      fun getFontOptions self = call getFontOptions_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkFrameClockClass.FFI.fromOptPtr false
    in
      fun getFrameClock self = call getFrameClock_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal
    in
      fun getHalign self = call getHalign_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHasTooltip self = call getHasTooltip_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHasWindow self = call getHasWindow_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHexpand self = call getHexpand_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getHexpandSet self = call getHexpandSet_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getMapped self = call getMapped_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginBottom self = call getMarginBottom_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginEnd self = call getMarginEnd_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginLeft self = call getMarginLeft_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginRight self = call getMarginRight_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginStart self = call getMarginStart_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getMarginTop self = call getMarginTop_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkModifierIntent.FFI.withVal ---> GdkModifierType.FFI.fromVal
    in
      fun getModifierMask self intent = call getModifierMask_ (GtkWidgetClass.toBase self & intent)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkRcStyleClass.FFI.fromPtr false
    in
      fun getModifierStyle self = call getModifierStyle_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0
    in
      fun getName self = call getName_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getNoShowAll self = call getNoShowAll_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GDouble.FFI.fromVal
    in
      fun getOpacity self = call getOpacity_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr false
    in
      fun getPangoContext self = call getPangoContext_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false
    in
      fun getParent self = call getParent_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false
    in
      fun getParentWindow self = call getParentWindow_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkWidgetPathRecord.FFI.fromPtr false
    in
      fun getPath self = call getPath_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPointer self =
        let
          val x
           & y
           & () =
            call getPointer_
              (
                GtkWidgetClass.toBase self
                 & GInt.null
                 & GInt.null
              )
        in
          (x, y)
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPreferredHeight self =
        let
          val minimumHeight
           & naturalHeight
           & () =
            call getPreferredHeight_
              (
                GtkWidgetClass.toBase self
                 & GInt.null
                 & GInt.null
              )
        in
          (minimumHeight, naturalHeight)
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPreferredHeightAndBaselineForWidth self width =
        let
          val minimumHeight
           & naturalHeight
           & minimumBaseline
           & naturalBaseline
           & () =
            call getPreferredHeightAndBaselineForWidth_
              (
                GtkWidgetClass.toBase self
                 & width
                 & GInt.null
                 & GInt.null
                 & GInt.null
                 & GInt.null
              )
        in
          (
            minimumHeight,
            naturalHeight,
            minimumBaseline,
            naturalBaseline
          )
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPreferredHeightForWidth self width =
        let
          val minimumHeight
           & naturalHeight
           & () =
            call getPreferredHeightForWidth_
              (
                GtkWidgetClass.toBase self
                 & width
                 & GInt.null
                 & GInt.null
              )
        in
          (minimumHeight, naturalHeight)
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkRequisitionRecord.FFI.withNewPtr
         &&&> GtkRequisitionRecord.FFI.withNewPtr
         ---> GtkRequisitionRecord.FFI.fromPtr true
               && GtkRequisitionRecord.FFI.fromPtr true
               && I
    in
      fun getPreferredSize self =
        let
          val minimumSize
           & naturalSize
           & () =
            call getPreferredSize_
              (
                GtkWidgetClass.toBase self
                 & ()
                 & ()
              )
        in
          (minimumSize, naturalSize)
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPreferredWidth self =
        let
          val minimumWidth
           & naturalWidth
           & () =
            call getPreferredWidth_
              (
                GtkWidgetClass.toBase self
                 & GInt.null
                 & GInt.null
              )
        in
          (minimumWidth, naturalWidth)
        end
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getPreferredWidthForHeight self height =
        let
          val minimumWidth
           & naturalWidth
           & () =
            call getPreferredWidthForHeight_
              (
                GtkWidgetClass.toBase self
                 & height
                 & GInt.null
                 & GInt.null
              )
        in
          (minimumWidth, naturalWidth)
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getRealized self = call getRealized_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getReceivesDefault self = call getReceivesDefault_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkSizeRequestMode.FFI.fromVal
    in
      fun getRequestMode self = call getRequestMode_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I
    in
      fun getRequisition self =
        let
          val requisition & () = call getRequisition_ (GtkWidgetClass.toBase self & ())
        in
          requisition
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false
    in
      fun getRootWindow self = call getRootWindow_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun getScaleFactor self = call getScaleFactor_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false
    in
      fun getScreen self = call getScreen_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getSensitive self = call getSensitive_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkSettingsClass.FFI.fromPtr false
    in
      fun getSettings self = call getSettings_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && I
    in
      fun getSizeRequest self =
        let
          val width
           & height
           & () =
            call getSizeRequest_
              (
                GtkWidgetClass.toBase self
                 & GInt.null
                 & GInt.null
              )
        in
          (width, height)
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkStateType.FFI.fromVal
    in
      fun getState self = call getState_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkStateFlags.FFI.fromVal
    in
      fun getStateFlags self = call getStateFlags_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkStyleClass.FFI.fromPtr false
    in
      fun getStyle self = call getStyle_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkStyleContextClass.FFI.fromPtr false
    in
      fun getStyleContext self = call getStyleContext_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getSupportMultidevice self = call getSupportMultidevice_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GObjectObjectClass.FFI.fromPtr false
    in
      fun getTemplateChild self (widgetType, name) =
        call getTemplateChild_
          (
            GtkWidgetClass.toBase self
             & widgetType
             & name
          )
         before GtkWidgetClass.FFI.touchPtr self
         before Utf8.FFI.touchPtr name
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1
    in
      fun getTooltipMarkup self = call getTooltipMarkup_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1
    in
      fun getTooltipText self = call getTooltipText_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkWindowClass.FFI.fromPtr false
    in
      fun getTooltipWindow self = call getTooltipWindow_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false
    in
      fun getToplevel self = call getToplevel_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal
    in
      fun getValign self = call getValign_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal
    in
      fun getValignWithBaseline self = call getValignWithBaseline_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getVexpand self = call getVexpand_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getVexpandSet self = call getVexpandSet_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun getVisible self = call getVisible_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkVisualClass.FFI.fromPtr false
    in
      fun getVisual self = call getVisual_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false
    in
      fun getWindow self = call getWindow_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun grabAdd self = call grabAdd_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun grabDefault self = call grabDefault_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun grabFocus self = call grabFocus_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun grabRemove self = call grabRemove_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasDefault self = call hasDefault_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasFocus self = call hasFocus_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasGrab self = call hasGrab_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasRcStyle self = call hasRcStyle_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasScreen self = call hasScreen_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hasVisibleFocus self = call hasVisibleFocus_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun hide self = call hide_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun hideOnDelete self = call hideOnDelete_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun inDestruction self = call inDestruction_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun initTemplate self = call initTemplate_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I
    in
      fun inputShapeCombineRegion self region = call inputShapeCombineRegion_ (GtkWidgetClass.toBase self & region)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioActionGroupClass.FFI.withOptPtr false
         ---> I
    in
      fun insertActionGroup self (name, group) =
        call insertActionGroup_
          (
            GtkWidgetClass.toBase self
             & name
             & Option.map GioActionGroupClass.toBase group
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withPtr false
         &&&> GdkRectangleRecord.FFI.withNewPtr
         ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal
    in
      fun intersect self area =
        let
          val intersection & retVal =
            call intersect_
              (
                GtkWidgetClass.toBase self
                 & area
                 & ()
              )
        in
          if retVal then SOME intersection else NONE
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isAncestor self ancestor = call isAncestor_ (GtkWidgetClass.toBase self & GtkWidgetClass.toBase ancestor)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isComposited self = call isComposited_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isDrawable self = call isDrawable_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isFocus self = call isFocus_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isSensitive self = call isSensitive_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isToplevel self = call isToplevel_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun isVisible self = call isVisible_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun keynavFailed self direction = call keynavFailed_ (GtkWidgetClass.toBase self & direction)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 1
    in
      fun listActionPrefixes self = call listActionPrefixes_ (GtkWidgetClass.toBase self) before GtkWidgetClass.FFI.touchPtr self
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun map self = call map_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal
    in
      fun mnemonicActivate self groupCycling = call mnemonicActivate_ (GtkWidgetClass.toBase self & groupCycling)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
    in
      fun modifyBase self (state, color) =
        call modifyBase_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
    in
      fun modifyBg self (state, color) =
        call modifyBg_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
    in
      fun modifyCursor self (primary, secondary) =
        call modifyCursor_
          (
            GtkWidgetClass.toBase self
             & primary
             & secondary
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
    in
      fun modifyFg self (state, color) =
        call modifyFg_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I
    in
      fun modifyFont self fontDesc = call modifyFont_ (GtkWidgetClass.toBase self & fontDesc)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkRcStyleClass.FFI.withPtr false ---> I
    in
      fun modifyStyle self style = call modifyStyle_ (GtkWidgetClass.toBase self & GtkRcStyleClass.toBase style)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
    in
      fun modifyText self (state, color) =
        call modifyText_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
    in
      fun overrideBackgroundColor self (state, color) =
        call overrideBackgroundColor_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
    in
      fun overrideColor self (state, color) =
        call overrideColor_
          (
            GtkWidgetClass.toBase self
             & state
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
    in
      fun overrideCursor self (cursor, secondaryCursor) =
        call overrideCursor_
          (
            GtkWidgetClass.toBase self
             & cursor
             & secondaryCursor
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I
    in
      fun overrideFont self fontDesc = call overrideFont_ (GtkWidgetClass.toBase self & fontDesc)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
    in
      fun overrideSymbolicColor self (name, color) =
        call overrideSymbolicColor_
          (
            GtkWidgetClass.toBase self
             & name
             & color
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GUInt.FFI.withRefVal
         &&&> Utf8.FFI.withRefOptPtr 0
         &&&> Utf8.FFI.withRefOptPtr 0
         ---> GUInt.FFI.fromVal
               && Utf8.FFI.fromPtr ~1
               && Utf8.FFI.fromPtr ~1
               && I
    in
      fun path self =
        let
          val pathLength
           & path
           & pathReversed
           & () =
            call path_
              (
                GtkWidgetClass.toBase self
                 & GUInt.null
                 & NONE
                 & NONE
              )
        in
          (
            pathLength,
            path,
            pathReversed
          )
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun queueAllocate self = call queueAllocate_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun queueComputeExpand self = call queueComputeExpand_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun queueDraw self = call queueDraw_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
    in
      fun queueDrawArea
        self
        (
          x,
          y,
          width,
          height
        ) =
        call queueDrawArea_
          (
            GtkWidgetClass.toBase self
             & x
             & y
             & width
             & height
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> I
    in
      fun queueDrawRegion self region = call queueDrawRegion_ (GtkWidgetClass.toBase self & region)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun queueResize self = call queueResize_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun queueResizeNoRedraw self = call queueResizeNoRedraw_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun realize self = call realize_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true
    in
      fun regionIntersect self region = call regionIntersect_ (GtkWidgetClass.toBase self & region)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I
    in
      fun registerWindow self window = call registerWindow_ (GtkWidgetClass.toBase self & GdkWindowClass.toBase window)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkAccelGroupClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
    in
      fun removeAccelerator
        self
        (
          accelGroup,
          accelKey,
          accelMods
        ) =
        call removeAccelerator_
          (
            GtkWidgetClass.toBase self
             & GtkAccelGroupClass.toBase accelGroup
             & accelKey
             & accelMods
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun removeMnemonicLabel self label = call removeMnemonicLabel_ (GtkWidgetClass.toBase self & GtkWidgetClass.toBase label)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I
    in
      fun removeTickCallback self id = call removeTickCallback_ (GtkWidgetClass.toBase self & id)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
    in
      fun renderIcon
        self
        (
          stockId,
          size,
          detail
        ) =
        call renderIcon_
          (
            GtkWidgetClass.toBase self
             & stockId
             & size
             & detail
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
    in
      fun renderIconPixbuf self (stockId, size) =
        call renderIconPixbuf_
          (
            GtkWidgetClass.toBase self
             & stockId
             & size
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun reparent self newParent = call reparent_ (GtkWidgetClass.toBase self & GtkWidgetClass.toBase newParent)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun resetRcStyles self = call resetRcStyles_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun resetStyle self = call resetStyle_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GInt.FFI.fromVal
    in
      fun sendExpose self event = call sendExpose_ (GtkWidgetClass.toBase self & GdkEvent.toBase event)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal
    in
      fun sendFocusChange self event = call sendFocusChange_ (GtkWidgetClass.toBase self & GdkEvent.toBase event)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GtkAccelGroupClass.FFI.withOptPtr false
         ---> I
    in
      fun setAccelPath self (accelPath, accelGroup) =
        call setAccelPath_
          (
            GtkWidgetClass.toBase self
             & accelPath
             & Option.map GtkAccelGroupClass.toBase accelGroup
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I
    in
      fun setAllocation self allocation = call setAllocation_ (GtkWidgetClass.toBase self & allocation)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setAppPaintable self appPaintable = call setAppPaintable_ (GtkWidgetClass.toBase self & appPaintable)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setCanDefault self canDefault = call setCanDefault_ (GtkWidgetClass.toBase self & canDefault)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setCanFocus self canFocus = call setCanFocus_ (GtkWidgetClass.toBase self & canFocus)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setChildVisible self isVisible = call setChildVisible_ (GtkWidgetClass.toBase self & isVisible)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I
    in
      fun setClip self clip = call setClip_ (GtkWidgetClass.toBase self & clip)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun setCompositeName self name = call setCompositeName_ (GtkWidgetClass.toBase self & name)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
    in
      fun setDeviceEnabled self (device, enabled) =
        call setDeviceEnabled_
          (
            GtkWidgetClass.toBase self
             & GdkDeviceClass.toBase device
             & enabled
          )
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
    in
      fun setDeviceEvents self (device, events) =
        call setDeviceEvents_
          (
            GtkWidgetClass.toBase self
             & GdkDeviceClass.toBase device
             & events
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkTextDirection.FFI.withVal ---> I
    in
      fun setDirection self dir = call setDirection_ (GtkWidgetClass.toBase self & dir)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setDoubleBuffered self doubleBuffered = call setDoubleBuffered_ (GtkWidgetClass.toBase self & doubleBuffered)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I
    in
      fun setEvents self events = call setEvents_ (GtkWidgetClass.toBase self & events)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setFocusOnClick self focusOnClick = call setFocusOnClick_ (GtkWidgetClass.toBase self & focusOnClick)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> PangoFontMapClass.FFI.withOptPtr false ---> I
    in
      fun setFontMap self fontMap = call setFontMap_ (GtkWidgetClass.toBase self & Option.map PangoFontMapClass.toBase fontMap)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoFontOptionsRecord.FFI.withOptPtr false ---> I
    in
      fun setFontOptions self options = call setFontOptions_ (GtkWidgetClass.toBase self & options)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAlign.FFI.withVal ---> I
    in
      fun setHalign self align = call setHalign_ (GtkWidgetClass.toBase self & align)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setHasTooltip self hasTooltip = call setHasTooltip_ (GtkWidgetClass.toBase self & hasTooltip)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setHasWindow self hasWindow = call setHasWindow_ (GtkWidgetClass.toBase self & hasWindow)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setHexpand self expand = call setHexpand_ (GtkWidgetClass.toBase self & expand)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setHexpandSet self set = call setHexpandSet_ (GtkWidgetClass.toBase self & set)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setMapped self mapped = call setMapped_ (GtkWidgetClass.toBase self & mapped)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginBottom self margin = call setMarginBottom_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginEnd self margin = call setMarginEnd_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginLeft self margin = call setMarginLeft_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginRight self margin = call setMarginRight_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginStart self margin = call setMarginStart_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I
    in
      fun setMarginTop self margin = call setMarginTop_ (GtkWidgetClass.toBase self & margin)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I
    in
      fun setName self name = call setName_ (GtkWidgetClass.toBase self & name)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setNoShowAll self noShowAll = call setNoShowAll_ (GtkWidgetClass.toBase self & noShowAll)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I
    in
      fun setOpacity self opacity = call setOpacity_ (GtkWidgetClass.toBase self & opacity)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun setParent self parent = call setParent_ (GtkWidgetClass.toBase self & GtkWidgetClass.toBase parent)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I
    in
      fun setParentWindow self parentWindow = call setParentWindow_ (GtkWidgetClass.toBase self & GdkWindowClass.toBase parentWindow)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setRealized self realized = call setRealized_ (GtkWidgetClass.toBase self & realized)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setReceivesDefault self receivesDefault = call setReceivesDefault_ (GtkWidgetClass.toBase self & receivesDefault)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setRedrawOnAllocate self redrawOnAllocate = call setRedrawOnAllocate_ (GtkWidgetClass.toBase self & redrawOnAllocate)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setSensitive self sensitive = call setSensitive_ (GtkWidgetClass.toBase self & sensitive)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
    in
      fun setSizeRequest self (width, height) =
        call setSizeRequest_
          (
            GtkWidgetClass.toBase self
             & width
             & height
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkStateType.FFI.withVal ---> I
    in
      fun setState self state = call setState_ (GtkWidgetClass.toBase self & state)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
    in
      fun setStateFlags self (flags, clear) =
        call setStateFlags_
          (
            GtkWidgetClass.toBase self
             & flags
             & clear
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkStyleClass.FFI.withOptPtr false ---> I
    in
      fun setStyle self style = call setStyle_ (GtkWidgetClass.toBase self & Option.map GtkStyleClass.toBase style)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setSupportMultidevice self supportMultidevice = call setSupportMultidevice_ (GtkWidgetClass.toBase self & supportMultidevice)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I
    in
      fun setTooltipMarkup self markup = call setTooltipMarkup_ (GtkWidgetClass.toBase self & markup)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I
    in
      fun setTooltipText self text = call setTooltipText_ (GtkWidgetClass.toBase self & text)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withOptPtr false ---> I
    in
      fun setTooltipWindow self customWindow = call setTooltipWindow_ (GtkWidgetClass.toBase self & Option.map GtkWindowClass.toBase customWindow)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAlign.FFI.withVal ---> I
    in
      fun setValign self align = call setValign_ (GtkWidgetClass.toBase self & align)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setVexpand self expand = call setVexpand_ (GtkWidgetClass.toBase self & expand)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setVexpandSet self set = call setVexpandSet_ (GtkWidgetClass.toBase self & set)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I
    in
      fun setVisible self visible = call setVisible_ (GtkWidgetClass.toBase self & visible)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkVisualClass.FFI.withOptPtr false ---> I
    in
      fun setVisual self visual = call setVisual_ (GtkWidgetClass.toBase self & Option.map GdkVisualClass.toBase visual)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr true ---> I
    in
      fun setWindow self window = call setWindow_ (GtkWidgetClass.toBase self & GdkWindowClass.toBase window)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I
    in
      fun shapeCombineRegion self region = call shapeCombineRegion_ (GtkWidgetClass.toBase self & region)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun show self = call show_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun showAll self = call showAll_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun showNow self = call showNow_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I
    in
      fun sizeAllocate self allocation = call sizeAllocate_ (GtkWidgetClass.toBase self & allocation)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkAllocationRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
    in
      fun sizeAllocateWithBaseline self (allocation, baseline) =
        call sizeAllocateWithBaseline_
          (
            GtkWidgetClass.toBase self
             & allocation
             & baseline
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I
    in
      fun sizeRequest self =
        let
          val requisition & () = call sizeRequest_ (GtkWidgetClass.toBase self & ())
        in
          requisition
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun styleAttach self = call styleAttach_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
    in
      fun styleGetProperty self (propertyName, value) =
        call styleGetProperty_
          (
            GtkWidgetClass.toBase self
             & propertyName
             & value
          )
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun thawChildNotify self = call thawChildNotify_ (GtkWidgetClass.toBase self)
    end
    local
      val call =
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withRefVal
         &&&> GInt.FFI.withRefVal
         ---> GInt.FFI.fromVal
               && GInt.FFI.fromVal
               && GBool.FFI.fromVal
    in
      fun translateCoordinates
        self
        (
          destWidget,
          srcX,
          srcY
        ) =
        let
          val destX
           & destY
           & retVal =
            call translateCoordinates_
              (
                GtkWidgetClass.toBase self
                 & GtkWidgetClass.toBase destWidget
                 & srcX
                 & srcY
                 & GInt.null
                 & GInt.null
              )
        in
          if retVal then SOME (destX, destY) else NONE
        end
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun triggerTooltipQuery self = call triggerTooltipQuery_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun unmap self = call unmap_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun unparent self = call unparent_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false ---> I
    in
      fun unrealize self = call unrealize_ (GtkWidgetClass.toBase self)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I
    in
      fun unregisterWindow self window = call unregisterWindow_ (GtkWidgetClass.toBase self & GdkWindowClass.toBase window)
    end
    local
      val call = GtkWidgetClass.FFI.withPtr false &&&> GtkStateFlags.FFI.withVal ---> I
    in
      fun unsetStateFlags self flags = call unsetStateFlags_ (GtkWidgetClass.toBase self & flags)
    end
    local
      open ClosureMarshal Signal
    in
      fun accelClosuresChangedSig f =
        signal "accel-closures-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun buttonPressEventSig f =
        signal "button-press-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun buttonReleaseEventSig f =
        signal "button-release-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun canActivateAccelSig f =
        signal "can-activate-accel" (get 0w1 uint ---> ret boolean)
          (
            fn
              signalId =>
                let
                  val retVal = f signalId
                in
                  retVal
                end
          )
      fun childNotifySig f =
        signal "child-notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void)
          (
            fn
              childProperty =>
                let
                  val () = f childProperty
                in
                  ()
                end
          )
      fun compositedChangedSig f =
        signal "composited-changed" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun configureEventSig f =
        signal "configure-event" (get 0w1 GdkEventConfigureRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun damageEventSig f =
        signal "damage-event" (get 0w1 GdkEventExposeRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun deleteEventSig f =
        signal "delete-event" (get 0w1 GdkEvent.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun destroySig f =
        signal "destroy" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun destroyEventSig f =
        signal "destroy-event" (get 0w1 GdkEvent.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun directionChangedSig f =
        signal "direction-changed" (get 0w1 GtkTextDirection.t ---> ret_void)
          (
            fn
              previousDirection =>
                let
                  val () = f previousDirection
                in
                  ()
                end
          )
      fun dragBeginSig f =
        signal "drag-begin" (get 0w1 GdkDragContextClass.t ---> ret_void)
          (
            fn
              context =>
                let
                  val () = f context
                in
                  ()
                end
          )
      fun dragDataDeleteSig f =
        signal "drag-data-delete" (get 0w1 GdkDragContextClass.t ---> ret_void)
          (
            fn
              context =>
                let
                  val () = f context
                in
                  ()
                end
          )
      fun dragDataGetSig f =
        signal "drag-data-get"
          (
            get 0w1 GdkDragContextClass.t
             &&&> get 0w2 GtkSelectionDataRecord.t
             &&&> get 0w3 uint
             &&&> get 0w4 uint
             ---> ret_void
          )
          (
            fn
              context
               & data
               & info
               & time =>
                let
                  val () =
                    f
                      (
                        context,
                        data,
                        info,
                        time
                      )
                in
                  ()
                end
          )
      fun dragDataReceivedSig f =
        signal "drag-data-received"
          (
            get 0w1 GdkDragContextClass.t
             &&&> get 0w2 int
             &&&> get 0w3 int
             &&&> get 0w4 GtkSelectionDataRecord.t
             &&&> get 0w5 uint
             &&&> get 0w6 uint
             ---> ret_void
          )
          (
            fn
              context
               & x
               & y
               & data
               & info
               & time =>
                let
                  val () =
                    f
                      (
                        context,
                        x,
                        y,
                        data,
                        info,
                        time
                      )
                in
                  ()
                end
          )
      fun dragDropSig f =
        signal "drag-drop"
          (
            get 0w1 GdkDragContextClass.t
             &&&> get 0w2 int
             &&&> get 0w3 int
             &&&> get 0w4 uint
             ---> ret boolean
          )
          (
            fn
              context
               & x
               & y
               & time =>
                let
                  val retVal =
                    f
                      (
                        context,
                        x,
                        y,
                        time
                      )
                in
                  retVal
                end
          )
      fun dragEndSig f =
        signal "drag-end" (get 0w1 GdkDragContextClass.t ---> ret_void)
          (
            fn
              context =>
                let
                  val () = f context
                in
                  ()
                end
          )
      fun dragFailedSig f =
        signal "drag-failed" (get 0w1 GdkDragContextClass.t &&&> get 0w2 GtkDragResult.t ---> ret boolean)
          (
            fn
              context & result =>
                let
                  val retVal = f (context, result)
                in
                  retVal
                end
          )
      fun dragLeaveSig f =
        signal "drag-leave" (get 0w1 GdkDragContextClass.t &&&> get 0w2 uint ---> ret_void)
          (
            fn
              context & time =>
                let
                  val () = f (context, time)
                in
                  ()
                end
          )
      fun dragMotionSig f =
        signal "drag-motion"
          (
            get 0w1 GdkDragContextClass.t
             &&&> get 0w2 int
             &&&> get 0w3 int
             &&&> get 0w4 uint
             ---> ret boolean
          )
          (
            fn
              context
               & x
               & y
               & time =>
                let
                  val retVal =
                    f
                      (
                        context,
                        x,
                        y,
                        time
                      )
                in
                  retVal
                end
          )
      fun drawSig f =
        signal "draw" (get 0w1 CairoContextRecord.t ---> ret boolean)
          (
            fn
              cr =>
                let
                  val retVal = f cr
                in
                  retVal
                end
          )
      fun enterNotifyEventSig f =
        signal "enter-notify-event" (get 0w1 GdkEventCrossingRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun eventSig f =
        signal "event" (get 0w1 GdkEvent.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun eventAfterSig f =
        signal "event-after" (get 0w1 GdkEvent.t ---> ret_void)
          (
            fn
              event =>
                let
                  val () = f event
                in
                  ()
                end
          )
      fun focusSig f =
        signal "focus" (get 0w1 GtkDirectionType.t ---> ret boolean)
          (
            fn
              direction =>
                let
                  val retVal = f direction
                in
                  retVal
                end
          )
      fun focusInEventSig f =
        signal "focus-in-event" (get 0w1 GdkEventFocusRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun focusOutEventSig f =
        signal "focus-out-event" (get 0w1 GdkEventFocusRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun grabBrokenEventSig f =
        signal "grab-broken-event" (get 0w1 GdkEventGrabBrokenRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun grabFocusSig f =
        signal "grab-focus" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun grabNotifySig f =
        signal "grab-notify" (get 0w1 boolean ---> ret_void)
          (
            fn
              wasGrabbed =>
                let
                  val () = f wasGrabbed
                in
                  ()
                end
          )
      fun hideSig f =
        signal "hide" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun hierarchyChangedSig f =
        signal "hierarchy-changed" (get 0w1 GtkWidgetClass.tOpt ---> ret_void)
          (
            fn
              previousToplevel =>
                let
                  val () = f previousToplevel
                in
                  ()
                end
          )
      fun keyPressEventSig f =
        signal "key-press-event" (get 0w1 GdkEventKeyRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun keyReleaseEventSig f =
        signal "key-release-event" (get 0w1 GdkEventKeyRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun keynavFailedSig f =
        signal "keynav-failed" (get 0w1 GtkDirectionType.t ---> ret boolean)
          (
            fn
              direction =>
                let
                  val retVal = f direction
                in
                  retVal
                end
          )
      fun leaveNotifyEventSig f =
        signal "leave-notify-event" (get 0w1 GdkEventCrossingRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun mapSig f =
        signal "map" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun mapEventSig f =
        signal "map-event" (get 0w1 GdkEventAnyRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun mnemonicActivateSig f =
        signal "mnemonic-activate" (get 0w1 boolean ---> ret boolean)
          (
            fn
              groupCycling =>
                let
                  val retVal = f groupCycling
                in
                  retVal
                end
          )
      fun motionNotifyEventSig f =
        signal "motion-notify-event" (get 0w1 GdkEventMotionRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun moveFocusSig f =
        signal "move-focus" (get 0w1 GtkDirectionType.t ---> ret_void)
          (
            fn
              direction =>
                let
                  val () = f direction
                in
                  ()
                end
          )
      fun parentSetSig f =
        signal "parent-set" (get 0w1 GtkWidgetClass.tOpt ---> ret_void)
          (
            fn
              oldParent =>
                let
                  val () = f oldParent
                in
                  ()
                end
          )
      fun popupMenuSig f =
        signal "popup-menu" (void ---> ret boolean)
          (
            fn
              () =>
                let
                  val retVal = f ()
                in
                  retVal
                end
          )
      fun propertyNotifyEventSig f =
        signal "property-notify-event" (get 0w1 GdkEventPropertyRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun proximityInEventSig f =
        signal "proximity-in-event" (get 0w1 GdkEventProximityRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun proximityOutEventSig f =
        signal "proximity-out-event" (get 0w1 GdkEventProximityRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun queryTooltipSig f =
        signal "query-tooltip"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 boolean
             &&&> get 0w4 GtkTooltipClass.t
             ---> ret boolean
          )
          (
            fn
              x
               & y
               & keyboardMode
               & tooltip =>
                let
                  val retVal =
                    f
                      (
                        x,
                        y,
                        keyboardMode,
                        tooltip
                      )
                in
                  retVal
                end
          )
      fun realizeSig f =
        signal "realize" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun screenChangedSig f =
        signal "screen-changed" (get 0w1 GdkScreenClass.tOpt ---> ret_void)
          (
            fn
              previousScreen =>
                let
                  val () = f previousScreen
                in
                  ()
                end
          )
      fun scrollEventSig f =
        signal "scroll-event" (get 0w1 GdkEventScrollRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun selectionClearEventSig f =
        signal "selection-clear-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun selectionGetSig f =
        signal "selection-get"
          (
            get 0w1 GtkSelectionDataRecord.t
             &&&> get 0w2 uint
             &&&> get 0w3 uint
             ---> ret_void
          )
          (
            fn
              data
               & info
               & time =>
                let
                  val () =
                    f
                      (
                        data,
                        info,
                        time
                      )
                in
                  ()
                end
          )
      fun selectionNotifyEventSig f =
        signal "selection-notify-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun selectionReceivedSig f =
        signal "selection-received" (get 0w1 GtkSelectionDataRecord.t &&&> get 0w2 uint ---> ret_void)
          (
            fn
              data & time =>
                let
                  val () = f (data, time)
                in
                  ()
                end
          )
      fun selectionRequestEventSig f =
        signal "selection-request-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun showSig f =
        signal "show" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun showHelpSig f =
        signal "show-help" (get 0w1 GtkWidgetHelpType.t ---> ret boolean)
          (
            fn
              helpType =>
                let
                  val retVal = f helpType
                in
                  retVal
                end
          )
      fun sizeAllocateSig f =
        signal "size-allocate" (get 0w1 GtkAllocationRecord.t ---> ret_void)
          (
            fn
              allocation =>
                let
                  val () = f allocation
                in
                  ()
                end
          )
      fun stateChangedSig f =
        signal "state-changed" (get 0w1 GtkStateType.t ---> ret_void)
          (
            fn
              state =>
                let
                  val () = f state
                in
                  ()
                end
          )
      fun stateFlagsChangedSig f =
        signal "state-flags-changed" (get 0w1 GtkStateFlags.t ---> ret_void)
          (
            fn
              flags =>
                let
                  val () = f flags
                in
                  ()
                end
          )
      fun styleSetSig f =
        signal "style-set" (get 0w1 GtkStyleClass.tOpt ---> ret_void)
          (
            fn
              previousStyle =>
                let
                  val () = f previousStyle
                in
                  ()
                end
          )
      fun styleUpdatedSig f =
        signal "style-updated" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun touchEventSig f =
        signal "touch-event" (get 0w1 GdkEvent.t ---> ret boolean)
          (
            fn
              object =>
                let
                  val retVal = f object
                in
                  retVal
                end
          )
      fun unmapSig f =
        signal "unmap" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun unmapEventSig f =
        signal "unmap-event" (get 0w1 GdkEventAnyRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun unrealizeSig f =
        signal "unrealize" (void ---> ret_void)
          (
            fn
              () =>
                let
                  val () = f ()
                in
                  ()
                end
          )
      fun visibilityNotifyEventSig f =
        signal "visibility-notify-event" (get 0w1 GdkEventVisibilityRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
      fun windowStateEventSig f =
        signal "window-state-event" (get 0w1 GdkEventWindowStateRecord.t ---> ret boolean)
          (
            fn
              event =>
                let
                  val retVal = f event
                in
                  retVal
                end
          )
    end
    local
      open ValueAccessor
    in
      val appPaintableProp =
        {
          name = "app-paintable",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val canDefaultProp =
        {
          name = "can-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val canFocusProp =
        {
          name = "can-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val compositeChildProp =
        {
          name = "composite-child",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => ignore,
          init = ignore
        }
      val doubleBufferedProp =
        {
          name = "double-buffered",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val eventsProp =
        {
          name = "events",
          gtype = fn () => C.gtype GdkEventMask.t (),
          get = fn _ => fn v => fn () => C.get GdkEventMask.t v,
          set = fn _ => fn v => fn x => C.set GdkEventMask.t v x,
          init = fn v => fn x => C.set GdkEventMask.t v x
        }
      val expandProp =
        {
          name = "expand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val focusOnClickProp =
        {
          name = "focus-on-click",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val halignProp =
        {
          name = "halign",
          gtype = fn () => C.gtype GtkAlign.t (),
          get = fn _ => fn v => fn () => C.get GtkAlign.t v,
          set = fn _ => fn v => fn x => C.set GtkAlign.t v x,
          init = fn v => fn x => C.set GtkAlign.t v x
        }
      val hasDefaultProp =
        {
          name = "has-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val hasFocusProp =
        {
          name = "has-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val hasTooltipProp =
        {
          name = "has-tooltip",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val heightRequestProp =
        {
          name = "height-request",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val hexpandProp =
        {
          name = "hexpand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val hexpandSetProp =
        {
          name = "hexpand-set",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val isFocusProp =
        {
          name = "is-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val marginProp =
        {
          name = "margin",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginBottomProp =
        {
          name = "margin-bottom",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginEndProp =
        {
          name = "margin-end",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginLeftProp =
        {
          name = "margin-left",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginRightProp =
        {
          name = "margin-right",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginStartProp =
        {
          name = "margin-start",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val marginTopProp =
        {
          name = "margin-top",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
      val noShowAllProp =
        {
          name = "no-show-all",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val opacityProp =
        {
          name = "opacity",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn v => fn () => C.get double v,
          set = fn _ => fn v => fn x => C.set double v x,
          init = fn v => fn x => C.set double v x
        }
      val parentProp =
        {
          name = "parent",
          gtype = fn () => C.gtype GtkContainerClass.tOpt (),
          get = fn _ => fn v => fn () => C.get GtkContainerClass.tOpt v,
          set = fn _ => fn v => fn x => C.set GtkContainerClass.tOpt v (Option.map GtkContainerClass.toBase x),
          init = fn v => fn x => C.set GtkContainerClass.tOpt v (Option.map GtkContainerClass.toBase x)
        }
      val receivesDefaultProp =
        {
          name = "receives-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val scaleFactorProp =
        {
          name = "scale-factor",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => ignore,
          init = ignore
        }
      val sensitiveProp =
        {
          name = "sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val styleProp =
        {
          name = "style",
          gtype = fn () => C.gtype GtkStyleClass.tOpt (),
          get = fn _ => fn v => fn () => C.get GtkStyleClass.tOpt v,
          set = fn _ => fn v => fn x => C.set GtkStyleClass.tOpt v (Option.map GtkStyleClass.toBase x),
          init = fn v => fn x => C.set GtkStyleClass.tOpt v (Option.map GtkStyleClass.toBase x)
        }
      val tooltipMarkupProp =
        {
          name = "tooltip-markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
      val tooltipTextProp =
        {
          name = "tooltip-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn v => fn () => C.get stringOpt v,
          set = fn _ => fn v => fn x => C.set stringOpt v x,
          init = fn v => fn x => C.set stringOpt v x
        }
      val valignProp =
        {
          name = "valign",
          gtype = fn () => C.gtype GtkAlign.t (),
          get = fn _ => fn v => fn () => C.get GtkAlign.t v,
          set = fn _ => fn v => fn x => C.set GtkAlign.t v x,
          init = fn v => fn x => C.set GtkAlign.t v x
        }
      val vexpandProp =
        {
          name = "vexpand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val vexpandSetProp =
        {
          name = "vexpand-set",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn v => fn () => C.get boolean v,
          set = fn _ => fn v => fn x => C.set boolean v x,
          init = fn v => fn x => C.set boolean v x
        }
      val widthRequestProp =
        {
          name = "width-request",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn v => fn () => C.get int v,
          set = fn _ => fn v => fn x => C.set int v x,
          init = fn v => fn x => C.set int v x
        }
      val windowProp =
        {
          name = "window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn _ => fn v => fn () => C.get GdkWindowClass.tOpt v,
          set = fn _ => ignore,
          init = ignore
        }
    end
  end
