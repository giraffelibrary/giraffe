structure GtkWidget :>
  GTK_WIDGET
    where type 'a class = 'a GtkWidgetClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type accel_flags_t = GtkAccelFlags.t
    where type orientation_t = GtkOrientation.t
    where type target_list_t = GtkTargetListRecord.t
    where type 'a clipboard_class = 'a GtkClipboardClass.class
    where type widget_path_t = GtkWidgetPathRecord.t
    where type requisition_t = GtkRequisitionRecord.t
    where type size_request_mode_t = GtkSizeRequestMode.t
    where type 'a settings_class = 'a GtkSettingsClass.class
    where type 'a style_context_class = 'a GtkStyleContextClass.class
    where type 'a rc_style_class = 'a GtkRcStyleClass.class
    where type state_type_t = GtkStateType.t
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type allocation_t = GtkAllocationRecord.t
    where type text_direction_t = GtkTextDirection.t
    where type drag_result_t = GtkDragResult.t
    where type direction_type_t = GtkDirectionType.t
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type widget_help_type_t = GtkWidgetHelpType.t
    where type state_flags_t = GtkStateFlags.t
    where type 'a container_class = 'a GtkContainerClass.class
    where type 'a style_class = 'a GtkStyleClass.class
    where type align_t = GtkAlign.t =
  struct
    val getType_ = _import "gtk_widget_get_type" : unit -> GObjectType.C.val_;
    val getDefaultDirection_ = _import "gtk_widget_get_default_direction" : unit -> GtkTextDirection.C.val_;
    val getDefaultStyle_ = _import "gtk_widget_get_default_style" : unit -> GtkStyleClass.C.notnull GtkStyleClass.C.p;
    val popCompositeChild_ = _import "gtk_widget_pop_composite_child" : unit -> unit;
    val pushCompositeChild_ = _import "gtk_widget_push_composite_child" : unit -> unit;
    val setDefaultDirection_ = _import "gtk_widget_set_default_direction" : GtkTextDirection.C.val_ -> unit;
    val activate_ = _import "gtk_widget_activate" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * FFI.UInt.C.val_
               * GdkModifierType.C.val_
               * GtkAccelFlags.C.val_
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkEventMask.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val addEvents_ = fn x1 & x2 => (_import "gtk_widget_add_events" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val addMnemonicLabel_ = fn x1 & x2 => (_import "gtk_widget_add_mnemonic_label" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val canActivateAccel_ = fn x1 & x2 => (_import "gtk_widget_can_activate_accel" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.UInt.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val childFocus_ = fn x1 & x2 => (_import "gtk_widget_child_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkDirectionType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val childNotify_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_child_notify" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.UInt.C.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
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
    val computeExpand_ = fn x1 & x2 => (_import "gtk_widget_compute_expand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkOrientation.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val createPangoContext_ = _import "gtk_widget_create_pango_context" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> PangoContextClass.C.notnull PangoContextClass.C.p;
    val createPangoLayout_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_create_pango_layout" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> PangoLayoutClass.C.notnull PangoLayoutClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val destroy_ = _import "gtk_widget_destroy" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val destroyed_ = fn x1 & x2 => (_import "gtk_widget_destroyed" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * (GtkWidgetClass.C.notnull, GtkWidgetClass.C.notnull) GtkWidgetClass.C.r -> unit;) (x1, x2)
    val deviceIsShadowed_ = fn x1 & x2 => (_import "gtk_widget_device_is_shadowed" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val dragBegin_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_drag_begin" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p
               * GdkDragAction.C.val_
               * FFI.Int.C.val_
               * GdkEvent.C.notnull GdkEvent.C.p
               -> GdkDragContextClass.C.notnull GdkDragContextClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val dragDestAddImageTargets_ = _import "gtk_drag_dest_add_image_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragDestAddTextTargets_ = _import "gtk_drag_dest_add_text_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragDestAddUriTargets_ = _import "gtk_drag_dest_add_uri_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragDestFindTarget_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_drag_dest_find_target" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkDragContextClass.C.notnull GdkDragContextClass.C.p
               * unit GtkTargetListRecord.C.p
               -> GdkAtomRecord.C.notnull GdkAtomRecord.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val dragDestGetTargetList_ = _import "gtk_drag_dest_get_target_list" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p;
    val dragDestGetTrackMotion_ = _import "gtk_drag_dest_get_track_motion" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val dragDestSetProxy_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_dest_set_proxy" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkDragProtocol.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragDestSetTargetList_ = fn x1 & x2 => (_import "gtk_drag_dest_set_target_list" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit GtkTargetListRecord.C.p -> unit;) (x1, x2)
    val dragDestSetTrackMotion_ = fn x1 & x2 => (_import "gtk_drag_dest_set_track_motion" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val dragDestUnset_ = _import "gtk_drag_dest_unset" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragGetData_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_drag_get_data" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkDragContextClass.C.notnull GdkDragContextClass.C.p
               * GdkAtomRecord.C.notnull GdkAtomRecord.C.p
               * FFI.UInt32.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val dragHighlight_ = _import "gtk_drag_highlight" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragSourceAddImageTargets_ = _import "gtk_drag_source_add_image_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragSourceAddTextTargets_ = _import "gtk_drag_source_add_text_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragSourceAddUriTargets_ = _import "gtk_drag_source_add_uri_targets" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragSourceGetTargetList_ = _import "gtk_drag_source_get_target_list" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkTargetListRecord.C.notnull GtkTargetListRecord.C.p;
    val dragSourceSetIconGicon_ = fn x1 & x2 => (_import "gtk_drag_source_set_icon_gicon" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GioIconClass.C.notnull GioIconClass.C.p -> unit;) (x1, x2)
    val dragSourceSetIconName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_drag_source_set_icon_name" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dragSourceSetIconPixbuf_ = fn x1 & x2 => (_import "gtk_drag_source_set_icon_pixbuf" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p -> unit;) (x1, x2)
    val dragSourceSetIconStock_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_drag_source_set_icon_stock" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val dragSourceSetTargetList_ = fn x1 & x2 => (_import "gtk_drag_source_set_target_list" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit GtkTargetListRecord.C.p -> unit;) (x1, x2)
    val dragSourceUnset_ = _import "gtk_drag_source_unset" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val dragUnhighlight_ = _import "gtk_drag_unhighlight" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val draw_ = fn x1 & x2 => (_import "gtk_widget_draw" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * CairoContextRecord.C.notnull CairoContextRecord.C.p -> unit;) (x1, x2)
    val ensureStyle_ = _import "gtk_widget_ensure_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val errorBell_ = _import "gtk_widget_error_bell" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val event_ = fn x1 & x2 => (_import "gtk_widget_event" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val freezeChildNotify_ = _import "gtk_widget_freeze_child_notify" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val getAccessible_ = _import "gtk_widget_get_accessible" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> AtkObjectClass.C.notnull AtkObjectClass.C.p;
    val getAllocatedHeight_ = _import "gtk_widget_get_allocated_height" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getAllocatedWidth_ = _import "gtk_widget_get_allocated_width" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getAllocation_ = fn x1 & x2 => (_import "gtk_widget_get_allocation" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkAllocationRecord.C.notnull GtkAllocationRecord.C.p -> unit;) (x1, x2)
    val getAppPaintable_ = _import "gtk_widget_get_app_paintable" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getCanDefault_ = _import "gtk_widget_get_can_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getCanFocus_ = _import "gtk_widget_get_can_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getChildVisible_ = _import "gtk_widget_get_child_visible" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getClipboard_ = fn x1 & x2 => (_import "gtk_widget_get_clipboard" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> GtkClipboardClass.C.notnull GtkClipboardClass.C.p;) (x1, x2)
    val getCompositeName_ = _import "gtk_widget_get_composite_name" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getDeviceEnabled_ = fn x1 & x2 => (_import "gtk_widget_get_device_enabled" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getDeviceEvents_ = fn x1 & x2 => (_import "gtk_widget_get_device_events" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkEventMask.C.val_;) (x1, x2)
    val getDirection_ = _import "gtk_widget_get_direction" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkTextDirection.C.val_;
    val getDisplay_ = _import "gtk_widget_get_display" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val getDoubleBuffered_ = _import "gtk_widget_get_double_buffered" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getEvents_ = _import "gtk_widget_get_events" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getHalign_ = _import "gtk_widget_get_halign" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkAlign.C.val_;
    val getHasTooltip_ = _import "gtk_widget_get_has_tooltip" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getHasWindow_ = _import "gtk_widget_get_has_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getHexpand_ = _import "gtk_widget_get_hexpand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getHexpandSet_ = _import "gtk_widget_get_hexpand_set" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getMapped_ = _import "gtk_widget_get_mapped" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getMarginBottom_ = _import "gtk_widget_get_margin_bottom" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getMarginLeft_ = _import "gtk_widget_get_margin_left" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getMarginRight_ = _import "gtk_widget_get_margin_right" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getMarginTop_ = _import "gtk_widget_get_margin_top" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Int.C.val_;
    val getModifierStyle_ = _import "gtk_widget_get_modifier_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkRcStyleClass.C.notnull GtkRcStyleClass.C.p;
    val getName_ = _import "gtk_widget_get_name" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getNoShowAll_ = _import "gtk_widget_get_no_show_all" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getPangoContext_ = _import "gtk_widget_get_pango_context" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> PangoContextClass.C.notnull PangoContextClass.C.p;
    val getParent_ = _import "gtk_widget_get_parent" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getParentWindow_ = _import "gtk_widget_get_parent_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getPath_ = _import "gtk_widget_get_path" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkWidgetPathRecord.C.notnull GtkWidgetPathRecord.C.p;
    val getPointer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_pointer" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getPreferredHeightForWidth_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_get_preferred_height_for_width" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p
               * GtkRequisitionRecord.C.notnull GtkRequisitionRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getRealized_ = _import "gtk_widget_get_realized" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getReceivesDefault_ = _import "gtk_widget_get_receives_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getRequestMode_ = _import "gtk_widget_get_request_mode" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkSizeRequestMode.C.val_;
    val getRootWindow_ = _import "gtk_widget_get_root_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getScreen_ = _import "gtk_widget_get_screen" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getSensitive_ = _import "gtk_widget_get_sensitive" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getSettings_ = _import "gtk_widget_get_settings" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkSettingsClass.C.notnull GtkSettingsClass.C.p;
    val getSizeRequest_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_get_size_request" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getStateFlags_ = _import "gtk_widget_get_state_flags" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkStateFlags.C.val_;
    val getStyle_ = _import "gtk_widget_get_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkStyleClass.C.notnull GtkStyleClass.C.p;
    val getStyleContext_ = _import "gtk_widget_get_style_context" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkStyleContextClass.C.notnull GtkStyleContextClass.C.p;
    val getSupportMultidevice_ = _import "gtk_widget_get_support_multidevice" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getTooltipMarkup_ = _import "gtk_widget_get_tooltip_markup" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltipText_ = _import "gtk_widget_get_tooltip_text" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getTooltipWindow_ = _import "gtk_widget_get_tooltip_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkWindowClass.C.notnull GtkWindowClass.C.p;
    val getToplevel_ = _import "gtk_widget_get_toplevel" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkWidgetClass.C.notnull GtkWidgetClass.C.p;
    val getValign_ = _import "gtk_widget_get_valign" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GtkAlign.C.val_;
    val getVexpand_ = _import "gtk_widget_get_vexpand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getVexpandSet_ = _import "gtk_widget_get_vexpand_set" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getVisible_ = _import "gtk_widget_get_visible" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val getVisual_ = _import "gtk_widget_get_visual" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkVisualClass.C.notnull GdkVisualClass.C.p;
    val getWindow_ = _import "gtk_widget_get_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val grabAdd_ = _import "gtk_grab_add" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val grabDefault_ = _import "gtk_widget_grab_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val grabFocus_ = _import "gtk_widget_grab_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val grabRemove_ = _import "gtk_grab_remove" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val hasDefault_ = _import "gtk_widget_has_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hasFocus_ = _import "gtk_widget_has_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hasGrab_ = _import "gtk_widget_has_grab" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hasRcStyle_ = _import "gtk_widget_has_rc_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hasScreen_ = _import "gtk_widget_has_screen" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hasVisibleFocus_ = _import "gtk_widget_has_visible_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val hide_ = _import "gtk_widget_hide" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val hideOnDelete_ = _import "gtk_widget_hide_on_delete" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val inDestruction_ = _import "gtk_widget_in_destruction" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val inputShapeCombineRegion_ = fn x1 & x2 => (_import "gtk_widget_input_shape_combine_region" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit CairoRegionRecord.C.p -> unit;) (x1, x2)
    val intersect_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_intersect" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               * GdkRectangleRecord.C.notnull GdkRectangleRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isAncestor_ = fn x1 & x2 => (_import "gtk_widget_is_ancestor" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val isComposited_ = _import "gtk_widget_is_composited" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val isDrawable_ = _import "gtk_widget_is_drawable" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val isFocus_ = _import "gtk_widget_is_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val isSensitive_ = _import "gtk_widget_is_sensitive" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val isToplevel_ = _import "gtk_widget_is_toplevel" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> FFI.Bool.C.val_;
    val keynavFailed_ = fn x1 & x2 => (_import "gtk_widget_keynav_failed" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkDirectionType.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val map_ = _import "gtk_widget_map" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val mnemonicActivate_ = fn x1 & x2 => (_import "gtk_widget_mnemonic_activate" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val modifyBase_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_base" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateType.C.val_
               * unit GdkColorRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateType.C.val_
               * unit GdkColorRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateType.C.val_
               * unit GdkColorRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val modifyFont_ = fn x1 & x2 => (_import "gtk_widget_modify_font" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val modifyStyle_ = fn x1 & x2 => (_import "gtk_widget_modify_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkRcStyleClass.C.notnull GtkRcStyleClass.C.p -> unit;) (x1, x2)
    val modifyText_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_modify_text" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateType.C.val_
               * unit GdkColorRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateFlags.C.val_
               * unit GdkRgbaRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateFlags.C.val_
               * unit GdkRgbaRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * unit GdkRgbaRecord.C.p
               * unit GdkRgbaRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val overrideFont_ = fn x1 & x2 => (_import "gtk_widget_override_font" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit PangoFontDescriptionRecord.C.p -> unit;) (x1, x2)
    val overrideSymbolicColor_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_override_symbolic_color" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GdkRgbaRecord.C.p
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.UInt.C.ref_
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
               * Utf8.MLton.r1
               * (unit, Utf8.C.notnull) Utf8.MLton.r2
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
    val queueComputeExpand_ = _import "gtk_widget_queue_compute_expand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val queueDraw_ = _import "gtk_widget_queue_draw" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val queueDrawArea_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gtk_widget_queue_draw_area" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val queueDrawRegion_ = fn x1 & x2 => (_import "gtk_widget_queue_draw_region" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * CairoRegionRecord.C.notnull CairoRegionRecord.C.p -> unit;) (x1, x2)
    val queueResize_ = _import "gtk_widget_queue_resize" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val queueResizeNoRedraw_ = _import "gtk_widget_queue_resize_no_redraw" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val realize_ = _import "gtk_widget_realize" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val regionIntersect_ = fn x1 & x2 => (_import "gtk_widget_region_intersect" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * CairoRegionRecord.C.notnull CairoRegionRecord.C.p -> CairoRegionRecord.C.notnull CairoRegionRecord.C.p;) (x1, x2)
    val removeAccelerator_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_widget_remove_accelerator" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkAccelGroupClass.C.notnull GtkAccelGroupClass.C.p
               * FFI.UInt.C.val_
               * GdkModifierType.C.val_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val removeMnemonicLabel_ = fn x1 & x2 => (_import "gtk_widget_remove_mnemonic_label" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val renderIconPixbuf_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_render_icon_pixbuf" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Int.C.val_
               -> GdkPixbufPixbufClass.C.notnull GdkPixbufPixbufClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val reparent_ = fn x1 & x2 => (_import "gtk_widget_reparent" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val resetRcStyles_ = _import "gtk_widget_reset_rc_styles" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val resetStyle_ = _import "gtk_widget_reset_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val sendExpose_ = fn x1 & x2 => (_import "gtk_widget_send_expose" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> FFI.Int.C.val_;) (x1, x2)
    val sendFocusChange_ = fn x1 & x2 => (_import "gtk_widget_send_focus_change" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setAccelPath_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_set_accel_path" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * unit GtkAccelGroupClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAllocation_ = fn x1 & x2 => (_import "gtk_widget_set_allocation" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkAllocationRecord.C.notnull GtkAllocationRecord.C.p -> unit;) (x1, x2)
    val setAppPaintable_ = fn x1 & x2 => (_import "gtk_widget_set_app_paintable" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCanDefault_ = fn x1 & x2 => (_import "gtk_widget_set_can_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCanFocus_ = fn x1 & x2 => (_import "gtk_widget_set_can_focus" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setChildVisible_ = fn x1 & x2 => (_import "gtk_widget_set_child_visible" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setCompositeName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_composite_name" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.Bool.C.val_
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkEventMask.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setDirection_ = fn x1 & x2 => (_import "gtk_widget_set_direction" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkTextDirection.C.val_ -> unit;) (x1, x2)
    val setDoubleBuffered_ = fn x1 & x2 => (_import "gtk_widget_set_double_buffered" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setEvents_ = fn x1 & x2 => (_import "gtk_widget_set_events" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setHalign_ = fn x1 & x2 => (_import "gtk_widget_set_halign" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkAlign.C.val_ -> unit;) (x1, x2)
    val setHasTooltip_ = fn x1 & x2 => (_import "gtk_widget_set_has_tooltip" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHasWindow_ = fn x1 & x2 => (_import "gtk_widget_set_has_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHexpand_ = fn x1 & x2 => (_import "gtk_widget_set_hexpand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setHexpandSet_ = fn x1 & x2 => (_import "gtk_widget_set_hexpand_set" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMapped_ = fn x1 & x2 => (_import "gtk_widget_set_mapped" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setMarginBottom_ = fn x1 & x2 => (_import "gtk_widget_set_margin_bottom" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMarginLeft_ = fn x1 & x2 => (_import "gtk_widget_set_margin_left" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMarginRight_ = fn x1 & x2 => (_import "gtk_widget_set_margin_right" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setMarginTop_ = fn x1 & x2 => (_import "gtk_widget_set_margin_top" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
    val setName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_name" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setNoShowAll_ = fn x1 & x2 => (_import "gtk_widget_set_no_show_all" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setParent_ = fn x1 & x2 => (_import "gtk_widget_set_parent" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;) (x1, x2)
    val setParentWindow_ = fn x1 & x2 => (_import "gtk_widget_set_parent_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkWindowClass.C.notnull GdkWindowClass.C.p -> unit;) (x1, x2)
    val setRealized_ = fn x1 & x2 => (_import "gtk_widget_set_realized" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setReceivesDefault_ = fn x1 & x2 => (_import "gtk_widget_set_receives_default" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setRedrawOnAllocate_ = fn x1 & x2 => (_import "gtk_widget_set_redraw_on_allocate" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSensitive_ = fn x1 & x2 => (_import "gtk_widget_set_sensitive" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSizeRequest_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_size_request" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStateFlags_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_widget_set_state_flags" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkStateFlags.C.val_
               * FFI.Bool.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setStyle_ = fn x1 & x2 => (_import "gtk_widget_set_style" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit GtkStyleClass.C.p -> unit;) (x1, x2)
    val setSupportMultidevice_ = fn x1 & x2 => (_import "gtk_widget_set_support_multidevice" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setTooltipMarkup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_widget_set_tooltip_markup" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setTooltipWindow_ = fn x1 & x2 => (_import "gtk_widget_set_tooltip_window" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit GtkWindowClass.C.p -> unit;) (x1, x2)
    val setValign_ = fn x1 & x2 => (_import "gtk_widget_set_valign" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkAlign.C.val_ -> unit;) (x1, x2)
    val setVexpand_ = fn x1 & x2 => (_import "gtk_widget_set_vexpand" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVexpandSet_ = fn x1 & x2 => (_import "gtk_widget_set_vexpand_set" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisible_ = fn x1 & x2 => (_import "gtk_widget_set_visible" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setVisual_ = fn x1 & x2 => (_import "gtk_widget_set_visual" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GdkVisualClass.C.notnull GdkVisualClass.C.p -> unit;) (x1, x2)
    val shapeCombineRegion_ = fn x1 & x2 => (_import "gtk_widget_shape_combine_region" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * unit CairoRegionRecord.C.p -> unit;) (x1, x2)
    val show_ = _import "gtk_widget_show" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val showAll_ = _import "gtk_widget_show_all" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val showNow_ = _import "gtk_widget_show_now" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val sizeAllocate_ = fn x1 & x2 => (_import "gtk_widget_size_allocate" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkAllocationRecord.C.notnull GtkAllocationRecord.C.p -> unit;) (x1, x2)
    val styleGetProperty_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_widget_style_get_property" :
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GObjectValueRecord.C.notnull GObjectValueRecord.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val thawChildNotify_ = _import "gtk_widget_thaw_child_notify" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
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
              GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * GtkWidgetClass.C.notnull GtkWidgetClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
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
    val triggerTooltipQuery_ = _import "gtk_widget_trigger_tooltip_query" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val unmap_ = _import "gtk_widget_unmap" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val unparent_ = _import "gtk_widget_unparent" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val unrealize_ = _import "gtk_widget_unrealize" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p -> unit;
    val unsetStateFlags_ = fn x1 & x2 => (_import "gtk_widget_unset_state_flags" : GtkWidgetClass.C.notnull GtkWidgetClass.C.p * GtkStateFlags.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkWidgetClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type accel_flags_t = GtkAccelFlags.t
    type orientation_t = GtkOrientation.t
    type target_list_t = GtkTargetListRecord.t
    type 'a clipboard_class = 'a GtkClipboardClass.class
    type widget_path_t = GtkWidgetPathRecord.t
    type requisition_t = GtkRequisitionRecord.t
    type size_request_mode_t = GtkSizeRequestMode.t
    type 'a settings_class = 'a GtkSettingsClass.class
    type 'a style_context_class = 'a GtkStyleContextClass.class
    type 'a rc_style_class = 'a GtkRcStyleClass.class
    type state_type_t = GtkStateType.t
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type allocation_t = GtkAllocationRecord.t
    type text_direction_t = GtkTextDirection.t
    type drag_result_t = GtkDragResult.t
    type direction_type_t = GtkDirectionType.t
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type widget_help_type_t = GtkWidgetHelpType.t
    type state_flags_t = GtkStateFlags.t
    type 'a container_class = 'a GtkContainerClass.class
    type 'a style_class = 'a GtkStyleClass.class
    type align_t = GtkAlign.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefaultDirection () = (I ---> GtkTextDirection.C.fromVal) getDefaultDirection_ ()
    fun getDefaultStyle () = (I ---> GtkStyleClass.C.fromPtr false) getDefaultStyle_ ()
    fun popCompositeChild () = (I ---> I) popCompositeChild_ ()
    fun pushCompositeChild () = (I ---> I) pushCompositeChild_ ()
    fun setDefaultDirection dir = (GtkTextDirection.C.withVal ---> I) setDefaultDirection_ dir
    fun activate self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) activate_ self
    fun addAccelerator self accelSignal accelGroup accelKey accelMods accelFlags =
      (
        GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkAccelGroupClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         &&&> GtkAccelFlags.C.withVal
         ---> I
      )
        addAccelerator_
        (
          self
           & accelSignal
           & accelGroup
           & accelKey
           & accelMods
           & accelFlags
        )
    fun addDeviceEvents self device events =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkDeviceClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        addDeviceEvents_
        (
          self
           & device
           & events
        )
    fun addEvents self events = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) addEvents_ (self & events)
    fun addMnemonicLabel self label = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) addMnemonicLabel_ (self & label)
    fun canActivateAccel self signalId = (GtkWidgetClass.C.withPtr &&&> FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) canActivateAccel_ (self & signalId)
    fun childFocus self direction = (GtkWidgetClass.C.withPtr &&&> GtkDirectionType.C.withVal ---> FFI.Bool.C.fromVal) childFocus_ (self & direction)
    fun childNotify self childProperty = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) childNotify_ (self & childProperty)
    fun classPath self =
      let
        val pathLength
         & path
         & pathReversed
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> Utf8.C.withRefOptPtr
             &&&> Utf8.C.withRefOptPtr
             ---> FFI.UInt.C.fromVal
                   && Utf8.C.fromPtr true
                   && Utf8.C.fromPtr true
                   && I
          )
            classPath_
            (
              self
               & FFI.UInt.null
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
    fun computeExpand self orientation = (GtkWidgetClass.C.withPtr &&&> GtkOrientation.C.withVal ---> FFI.Bool.C.fromVal) computeExpand_ (self & orientation)
    fun createPangoContext self = (GtkWidgetClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createPangoContext_ self
    fun createPangoLayout self text = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createPangoLayout_ (self & text)
    fun destroy self = (GtkWidgetClass.C.withPtr ---> I) destroy_ self
    fun destroyed self widgetPointer =
      let
        val widgetPointer & () = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withRefDupPtr ---> GtkWidgetClass.C.fromPtr true && I) destroyed_ (self & widgetPointer)
      in
        widgetPointer
      end
    fun deviceIsShadowed self device = (GtkWidgetClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> FFI.Bool.C.fromVal) deviceIsShadowed_ (self & device)
    fun dragBegin self targets actions button event =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkTargetListRecord.C.withPtr
         &&&> GdkDragAction.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GdkEvent.C.withPtr
         ---> GdkDragContextClass.C.fromPtr false
      )
        dragBegin_
        (
          self
           & targets
           & actions
           & button
           & event
        )
    fun dragCheckThreshold self startX startY currentX currentY =
      (
        GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        dragCheckThreshold_
        (
          self
           & startX
           & startY
           & currentX
           & currentY
        )
    fun dragDestAddImageTargets self = (GtkWidgetClass.C.withPtr ---> I) dragDestAddImageTargets_ self
    fun dragDestAddTextTargets self = (GtkWidgetClass.C.withPtr ---> I) dragDestAddTextTargets_ self
    fun dragDestAddUriTargets self = (GtkWidgetClass.C.withPtr ---> I) dragDestAddUriTargets_ self
    fun dragDestFindTarget self context targetList =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkDragContextClass.C.withPtr
         &&&> GtkTargetListRecord.C.withOptPtr
         ---> GdkAtomRecord.C.fromPtr false
      )
        dragDestFindTarget_
        (
          self
           & context
           & targetList
        )
    fun dragDestGetTargetList self = (GtkWidgetClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) dragDestGetTargetList_ self
    fun dragDestGetTrackMotion self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) dragDestGetTrackMotion_ self
    fun dragDestSetProxy self proxyWindow protocol useCoordinates =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> GdkDragProtocol.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        dragDestSetProxy_
        (
          self
           & proxyWindow
           & protocol
           & useCoordinates
        )
    fun dragDestSetTargetList self targetList = (GtkWidgetClass.C.withPtr &&&> GtkTargetListRecord.C.withOptPtr ---> I) dragDestSetTargetList_ (self & targetList)
    fun dragDestSetTrackMotion self trackMotion = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) dragDestSetTrackMotion_ (self & trackMotion)
    fun dragDestUnset self = (GtkWidgetClass.C.withPtr ---> I) dragDestUnset_ self
    fun dragGetData self context target time =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkDragContextClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        dragGetData_
        (
          self
           & context
           & target
           & time
        )
    fun dragHighlight self = (GtkWidgetClass.C.withPtr ---> I) dragHighlight_ self
    fun dragSourceAddImageTargets self = (GtkWidgetClass.C.withPtr ---> I) dragSourceAddImageTargets_ self
    fun dragSourceAddTextTargets self = (GtkWidgetClass.C.withPtr ---> I) dragSourceAddTextTargets_ self
    fun dragSourceAddUriTargets self = (GtkWidgetClass.C.withPtr ---> I) dragSourceAddUriTargets_ self
    fun dragSourceGetTargetList self = (GtkWidgetClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) dragSourceGetTargetList_ self
    fun dragSourceSetIconGicon self icon = (GtkWidgetClass.C.withPtr &&&> GioIconClass.C.withPtr ---> I) dragSourceSetIconGicon_ (self & icon)
    fun dragSourceSetIconName self iconName = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) dragSourceSetIconName_ (self & iconName)
    fun dragSourceSetIconPixbuf self pixbuf = (GtkWidgetClass.C.withPtr &&&> GdkPixbufPixbufClass.C.withPtr ---> I) dragSourceSetIconPixbuf_ (self & pixbuf)
    fun dragSourceSetIconStock self stockId = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) dragSourceSetIconStock_ (self & stockId)
    fun dragSourceSetTargetList self targetList = (GtkWidgetClass.C.withPtr &&&> GtkTargetListRecord.C.withOptPtr ---> I) dragSourceSetTargetList_ (self & targetList)
    fun dragSourceUnset self = (GtkWidgetClass.C.withPtr ---> I) dragSourceUnset_ self
    fun dragUnhighlight self = (GtkWidgetClass.C.withPtr ---> I) dragUnhighlight_ self
    fun draw self cr = (GtkWidgetClass.C.withPtr &&&> CairoContextRecord.C.withPtr ---> I) draw_ (self & cr)
    fun ensureStyle self = (GtkWidgetClass.C.withPtr ---> I) ensureStyle_ self
    fun errorBell self = (GtkWidgetClass.C.withPtr ---> I) errorBell_ self
    fun event self event = (GtkWidgetClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Bool.C.fromVal) event_ (self & event)
    fun freezeChildNotify self = (GtkWidgetClass.C.withPtr ---> I) freezeChildNotify_ self
    fun getAccessible self = (GtkWidgetClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getAccessible_ self
    fun getAllocatedHeight self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getAllocatedHeight_ self
    fun getAllocatedWidth self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getAllocatedWidth_ self
    fun getAllocation self =
      let
        val allocation & () = (GtkWidgetClass.C.withPtr &&&> GtkAllocationRecord.C.withNewPtr ---> GtkAllocationRecord.C.fromPtr true && I) getAllocation_ (self & ())
      in
        allocation
      end
    fun getAppPaintable self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getAppPaintable_ self
    fun getCanDefault self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanDefault_ self
    fun getCanFocus self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanFocus_ self
    fun getChildVisible self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildVisible_ self
    fun getClipboard self selection = (GtkWidgetClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> GtkClipboardClass.C.fromPtr false) getClipboard_ (self & selection)
    fun getCompositeName self = (GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr true) getCompositeName_ self
    fun getDeviceEnabled self device = (GtkWidgetClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeviceEnabled_ (self & device)
    fun getDeviceEvents self device = (GtkWidgetClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> GdkEventMask.C.fromVal) getDeviceEvents_ (self & device)
    fun getDirection self = (GtkWidgetClass.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getDisplay self = (GtkWidgetClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getDoubleBuffered self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getDoubleBuffered_ self
    fun getEvents self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getEvents_ self
    fun getHalign self = (GtkWidgetClass.C.withPtr ---> GtkAlign.C.fromVal) getHalign_ self
    fun getHasTooltip self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasTooltip_ self
    fun getHasWindow self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasWindow_ self
    fun getHexpand self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getHexpand_ self
    fun getHexpandSet self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getHexpandSet_ self
    fun getMapped self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getMapped_ self
    fun getMarginBottom self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getMarginBottom_ self
    fun getMarginLeft self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getMarginLeft_ self
    fun getMarginRight self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getMarginRight_ self
    fun getMarginTop self = (GtkWidgetClass.C.withPtr ---> FFI.Int.C.fromVal) getMarginTop_ self
    fun getModifierStyle self = (GtkWidgetClass.C.withPtr ---> GtkRcStyleClass.C.fromPtr false) getModifierStyle_ self
    fun getName self = (GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNoShowAll self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getNoShowAll_ self
    fun getPangoContext self = (GtkWidgetClass.C.withPtr ---> PangoContextClass.C.fromPtr false) getPangoContext_ self
    fun getParent self = (GtkWidgetClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getParent_ self
    fun getParentWindow self = (GtkWidgetClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getParentWindow_ self
    fun getPath self = (GtkWidgetClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr false) getPath_ self
    fun getPointer self =
      let
        val x
         & y
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPointer_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (x, y)
      end
    fun getPreferredHeight self =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredHeightForWidth self width =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredSize self =
      let
        val minimumSize
         & naturalSize
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> GtkRequisitionRecord.C.withNewPtr
             &&&> GtkRequisitionRecord.C.withNewPtr
             ---> GtkRequisitionRecord.C.fromPtr true
                   && GtkRequisitionRecord.C.fromPtr true
                   && I
          )
            getPreferredSize_
            (
              self
               & ()
               & ()
            )
      in
        (minimumSize, naturalSize)
      end
    fun getPreferredWidth self =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getPreferredWidthForHeight self height =
      let
        val minimumWidth
         & naturalWidth
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRealized self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getRealized_ self
    fun getReceivesDefault self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getReceivesDefault_ self
    fun getRequestMode self = (GtkWidgetClass.C.withPtr ---> GtkSizeRequestMode.C.fromVal) getRequestMode_ self
    fun getRootWindow self = (GtkWidgetClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getRootWindow_ self
    fun getScreen self = (GtkWidgetClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSensitive self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getSettings self = (GtkWidgetClass.C.withPtr ---> GtkSettingsClass.C.fromPtr false) getSettings_ self
    fun getSizeRequest self =
      let
        val width
         & height
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && I
          )
            getSizeRequest_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        (width, height)
      end
    fun getStateFlags self = (GtkWidgetClass.C.withPtr ---> GtkStateFlags.C.fromVal) getStateFlags_ self
    fun getStyle self = (GtkWidgetClass.C.withPtr ---> GtkStyleClass.C.fromPtr false) getStyle_ self
    fun getStyleContext self = (GtkWidgetClass.C.withPtr ---> GtkStyleContextClass.C.fromPtr false) getStyleContext_ self
    fun getSupportMultidevice self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportMultidevice_ self
    fun getTooltipMarkup self = (GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ self
    fun getTooltipText self = (GtkWidgetClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ self
    fun getTooltipWindow self = (GtkWidgetClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getTooltipWindow_ self
    fun getToplevel self = (GtkWidgetClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getToplevel_ self
    fun getValign self = (GtkWidgetClass.C.withPtr ---> GtkAlign.C.fromVal) getValign_ self
    fun getVexpand self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getVexpand_ self
    fun getVexpandSet self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getVexpandSet_ self
    fun getVisible self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getVisual self = (GtkWidgetClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getVisual_ self
    fun getWindow self = (GtkWidgetClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ self
    fun grabAdd self = (GtkWidgetClass.C.withPtr ---> I) grabAdd_ self
    fun grabDefault self = (GtkWidgetClass.C.withPtr ---> I) grabDefault_ self
    fun grabFocus self = (GtkWidgetClass.C.withPtr ---> I) grabFocus_ self
    fun grabRemove self = (GtkWidgetClass.C.withPtr ---> I) grabRemove_ self
    fun hasDefault self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefault_ self
    fun hasFocus self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasFocus_ self
    fun hasGrab self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasGrab_ self
    fun hasRcStyle self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasRcStyle_ self
    fun hasScreen self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasScreen_ self
    fun hasVisibleFocus self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hasVisibleFocus_ self
    fun hide self = (GtkWidgetClass.C.withPtr ---> I) hide_ self
    fun hideOnDelete self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) hideOnDelete_ self
    fun inDestruction self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) inDestruction_ self
    fun inputShapeCombineRegion self region = (GtkWidgetClass.C.withPtr &&&> CairoRegionRecord.C.withOptPtr ---> I) inputShapeCombineRegion_ (self & region)
    fun intersect self area intersection =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         &&&> GdkRectangleRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        intersect_
        (
          self
           & area
           & intersection
        )
    fun isAncestor self ancestor = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isAncestor_ (self & ancestor)
    fun isComposited self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isComposited_ self
    fun isDrawable self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isDrawable_ self
    fun isFocus self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isFocus_ self
    fun isSensitive self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isSensitive_ self
    fun isToplevel self = (GtkWidgetClass.C.withPtr ---> FFI.Bool.C.fromVal) isToplevel_ self
    fun keynavFailed self direction = (GtkWidgetClass.C.withPtr &&&> GtkDirectionType.C.withVal ---> FFI.Bool.C.fromVal) keynavFailed_ (self & direction)
    fun map self = (GtkWidgetClass.C.withPtr ---> I) map_ self
    fun mnemonicActivate self groupCycling = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) mnemonicActivate_ (self & groupCycling)
    fun modifyBase self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GdkColorRecord.C.withOptPtr
         ---> I
      )
        modifyBase_
        (
          self
           & state
           & color
        )
    fun modifyBg self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GdkColorRecord.C.withOptPtr
         ---> I
      )
        modifyBg_
        (
          self
           & state
           & color
        )
    fun modifyFg self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GdkColorRecord.C.withOptPtr
         ---> I
      )
        modifyFg_
        (
          self
           & state
           & color
        )
    fun modifyFont self fontDesc = (GtkWidgetClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) modifyFont_ (self & fontDesc)
    fun modifyStyle self style = (GtkWidgetClass.C.withPtr &&&> GtkRcStyleClass.C.withPtr ---> I) modifyStyle_ (self & style)
    fun modifyText self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateType.C.withVal
         &&&> GdkColorRecord.C.withOptPtr
         ---> I
      )
        modifyText_
        (
          self
           & state
           & color
        )
    fun overrideBackgroundColor self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateFlags.C.withVal
         &&&> GdkRgbaRecord.C.withOptPtr
         ---> I
      )
        overrideBackgroundColor_
        (
          self
           & state
           & color
        )
    fun overrideColor self state color =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateFlags.C.withVal
         &&&> GdkRgbaRecord.C.withOptPtr
         ---> I
      )
        overrideColor_
        (
          self
           & state
           & color
        )
    fun overrideCursor self cursor secondaryCursor =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkRgbaRecord.C.withOptPtr
         &&&> GdkRgbaRecord.C.withOptPtr
         ---> I
      )
        overrideCursor_
        (
          self
           & cursor
           & secondaryCursor
        )
    fun overrideFont self fontDesc = (GtkWidgetClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) overrideFont_ (self & fontDesc)
    fun overrideSymbolicColor self name color =
      (
        GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GdkRgbaRecord.C.withOptPtr
         ---> I
      )
        overrideSymbolicColor_
        (
          self
           & name
           & color
        )
    fun path self =
      let
        val pathLength
         & path
         & pathReversed
         & () =
          (
            GtkWidgetClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> Utf8.C.withRefOptPtr
             &&&> Utf8.C.withRefOptPtr
             ---> FFI.UInt.C.fromVal
                   && Utf8.C.fromPtr true
                   && Utf8.C.fromPtr true
                   && I
          )
            path_
            (
              self
               & FFI.UInt.null
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
    fun queueComputeExpand self = (GtkWidgetClass.C.withPtr ---> I) queueComputeExpand_ self
    fun queueDraw self = (GtkWidgetClass.C.withPtr ---> I) queueDraw_ self
    fun queueDrawArea self x y width height =
      (
        GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        queueDrawArea_
        (
          self
           & x
           & y
           & width
           & height
        )
    fun queueDrawRegion self region = (GtkWidgetClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) queueDrawRegion_ (self & region)
    fun queueResize self = (GtkWidgetClass.C.withPtr ---> I) queueResize_ self
    fun queueResizeNoRedraw self = (GtkWidgetClass.C.withPtr ---> I) queueResizeNoRedraw_ self
    fun realize self = (GtkWidgetClass.C.withPtr ---> I) realize_ self
    fun regionIntersect self region = (GtkWidgetClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> CairoRegionRecord.C.fromPtr true) regionIntersect_ (self & region)
    fun removeAccelerator self accelGroup accelKey accelMods =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkAccelGroupClass.C.withPtr
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        removeAccelerator_
        (
          self
           & accelGroup
           & accelKey
           & accelMods
        )
    fun removeMnemonicLabel self label = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) removeMnemonicLabel_ (self & label)
    fun renderIconPixbuf self stockId size =
      (
        GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & stockId
           & size
        )
    fun reparent self newParent = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) reparent_ (self & newParent)
    fun resetRcStyles self = (GtkWidgetClass.C.withPtr ---> I) resetRcStyles_ self
    fun resetStyle self = (GtkWidgetClass.C.withPtr ---> I) resetStyle_ self
    fun sendExpose self event = (GtkWidgetClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Int.C.fromVal) sendExpose_ (self & event)
    fun sendFocusChange self event = (GtkWidgetClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Bool.C.fromVal) sendFocusChange_ (self & event)
    fun setAccelPath self accelPath accelGroup =
      (
        GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GtkAccelGroupClass.C.withOptPtr
         ---> I
      )
        setAccelPath_
        (
          self
           & accelPath
           & accelGroup
        )
    fun setAllocation self allocation = (GtkWidgetClass.C.withPtr &&&> GtkAllocationRecord.C.withPtr ---> I) setAllocation_ (self & allocation)
    fun setAppPaintable self appPaintable = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAppPaintable_ (self & appPaintable)
    fun setCanDefault self canDefault = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanDefault_ (self & canDefault)
    fun setCanFocus self canFocus = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanFocus_ (self & canFocus)
    fun setChildVisible self isVisible = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setChildVisible_ (self & isVisible)
    fun setCompositeName self name = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setCompositeName_ (self & name)
    fun setDeviceEnabled self device enabled =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkDeviceClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setDeviceEnabled_
        (
          self
           & device
           & enabled
        )
    fun setDeviceEvents self device events =
      (
        GtkWidgetClass.C.withPtr
         &&&> GdkDeviceClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & events
        )
    fun setDirection self dir = (GtkWidgetClass.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & dir)
    fun setDoubleBuffered self doubleBuffered = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDoubleBuffered_ (self & doubleBuffered)
    fun setEvents self events = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setEvents_ (self & events)
    fun setHalign self align = (GtkWidgetClass.C.withPtr &&&> GtkAlign.C.withVal ---> I) setHalign_ (self & align)
    fun setHasTooltip self hasTooltip = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setHasWindow self hasWindow = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasWindow_ (self & hasWindow)
    fun setHexpand self expand = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHexpand_ (self & expand)
    fun setHexpandSet self set = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHexpandSet_ (self & set)
    fun setMapped self mapped = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMapped_ (self & mapped)
    fun setMarginBottom self margin = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMarginBottom_ (self & margin)
    fun setMarginLeft self margin = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMarginLeft_ (self & margin)
    fun setMarginRight self margin = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMarginRight_ (self & margin)
    fun setMarginTop self margin = (GtkWidgetClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) setMarginTop_ (self & margin)
    fun setName self name = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setNoShowAll self noShowAll = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setNoShowAll_ (self & noShowAll)
    fun setParent self parent = (GtkWidgetClass.C.withPtr &&&> GtkWidgetClass.C.withPtr ---> I) setParent_ (self & parent)
    fun setParentWindow self parentWindow = (GtkWidgetClass.C.withPtr &&&> GdkWindowClass.C.withPtr ---> I) setParentWindow_ (self & parentWindow)
    fun setRealized self realized = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRealized_ (self & realized)
    fun setReceivesDefault self receivesDefault = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReceivesDefault_ (self & receivesDefault)
    fun setRedrawOnAllocate self redrawOnAllocate = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRedrawOnAllocate_ (self & redrawOnAllocate)
    fun setSensitive self sensitive = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setSizeRequest self width height =
      (
        GtkWidgetClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> I
      )
        setSizeRequest_
        (
          self
           & width
           & height
        )
    fun setStateFlags self flags clear =
      (
        GtkWidgetClass.C.withPtr
         &&&> GtkStateFlags.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> I
      )
        setStateFlags_
        (
          self
           & flags
           & clear
        )
    fun setStyle self style = (GtkWidgetClass.C.withPtr &&&> GtkStyleClass.C.withOptPtr ---> I) setStyle_ (self & style)
    fun setSupportMultidevice self supportMultidevice = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTooltipMarkup self markup = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkWidgetClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipText_ (self & text)
    fun setTooltipWindow self customWindow = (GtkWidgetClass.C.withPtr &&&> GtkWindowClass.C.withOptPtr ---> I) setTooltipWindow_ (self & customWindow)
    fun setValign self align = (GtkWidgetClass.C.withPtr &&&> GtkAlign.C.withVal ---> I) setValign_ (self & align)
    fun setVexpand self expand = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVexpand_ (self & expand)
    fun setVexpandSet self set = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVexpandSet_ (self & set)
    fun setVisible self visible = (GtkWidgetClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun setVisual self visual = (GtkWidgetClass.C.withPtr &&&> GdkVisualClass.C.withPtr ---> I) setVisual_ (self & visual)
    fun shapeCombineRegion self region = (GtkWidgetClass.C.withPtr &&&> CairoRegionRecord.C.withOptPtr ---> I) shapeCombineRegion_ (self & region)
    fun show self = (GtkWidgetClass.C.withPtr ---> I) show_ self
    fun showAll self = (GtkWidgetClass.C.withPtr ---> I) showAll_ self
    fun showNow self = (GtkWidgetClass.C.withPtr ---> I) showNow_ self
    fun sizeAllocate self allocation = (GtkWidgetClass.C.withPtr &&&> GtkAllocationRecord.C.withPtr ---> I) sizeAllocate_ (self & allocation)
    fun styleGetProperty self propertyName value =
      (
        GtkWidgetClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectValueRecord.C.withPtr
         ---> I
      )
        styleGetProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawChildNotify self = (GtkWidgetClass.C.withPtr ---> I) thawChildNotify_ self
    fun translateCoordinates self destWidget srcX srcY =
      let
        val destX
         & destY
         & retVal =
          (
            GtkWidgetClass.C.withPtr
             &&&> GtkWidgetClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            translateCoordinates_
            (
              self
               & destWidget
               & srcX
               & srcY
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (destX, destY) else NONE
      end
    fun triggerTooltipQuery self = (GtkWidgetClass.C.withPtr ---> I) triggerTooltipQuery_ self
    fun unmap self = (GtkWidgetClass.C.withPtr ---> I) unmap_ self
    fun unparent self = (GtkWidgetClass.C.withPtr ---> I) unparent_ self
    fun unrealize self = (GtkWidgetClass.C.withPtr ---> I) unrealize_ self
    fun unsetStateFlags self flags = (GtkWidgetClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> I) unsetStateFlags_ (self & flags)
    local
      open ClosureMarshal Signal
    in
      fun accelClosuresChangedSig f = signal "accel-closures-changed" (void ---> ret_void) f
      fun buttonPressEventSig f = signal "button-press-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun buttonReleaseEventSig f = signal "button-release-event" (get 0w1 GdkEventButtonRecord.t ---> ret boolean) f
      fun canActivateAccelSig f = signal "can-activate-accel" (get 0w1 uint ---> ret boolean) f
      fun childNotifySig f = signal "child-notify" (get 0w1 GObjectParamSpecClass.t ---> ret_void) f
      fun compositedChangedSig f = signal "composited-changed" (void ---> ret_void) f
      fun configureEventSig f = signal "configure-event" (get 0w1 GdkEventConfigureRecord.t ---> ret boolean) f
      fun damageEventSig f = signal "damage-event" (get 0w1 GdkEventExposeRecord.t ---> ret boolean) f
      fun deleteEventSig f = signal "delete-event" (get 0w1 GdkEvent.t ---> ret boolean) f
      fun destroySig f = signal "destroy" (void ---> ret_void) f
      fun destroyEventSig f = signal "destroy-event" (get 0w1 GdkEvent.t ---> ret boolean) f
      fun directionChangedSig f = signal "direction-changed" (get 0w1 GtkTextDirection.t ---> ret_void) f
      fun dragBeginSig f = signal "drag-begin" (get 0w1 GdkDragContextClass.t ---> ret_void) f
      fun dragDataDeleteSig f = signal "drag-data-delete" (get 0w1 GdkDragContextClass.t ---> ret_void) f
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
              dragContext
               & data
               & info
               & time =>
                f dragContext data info time
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
              dragContext
               & x
               & y
               & data
               & info
               & time =>
                f dragContext x y data info time
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
              dragContext
               & x
               & y
               & time =>
                f dragContext x y time
          )
      fun dragEndSig f = signal "drag-end" (get 0w1 GdkDragContextClass.t ---> ret_void) f
      fun dragFailedSig f = signal "drag-failed" (get 0w1 GdkDragContextClass.t &&&> get 0w2 GtkDragResult.t ---> ret boolean) (fn dragContext & result => f dragContext result)
      fun dragLeaveSig f = signal "drag-leave" (get 0w1 GdkDragContextClass.t &&&> get 0w2 uint ---> ret_void) (fn dragContext & time => f dragContext time)
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
              dragContext
               & x
               & y
               & time =>
                f dragContext x y time
          )
      fun drawSig f = signal "draw" (get 0w1 CairoContextRecord.t ---> ret boolean) f
      fun enterNotifyEventSig f = signal "enter-notify-event" (get 0w1 GdkEventCrossingRecord.t ---> ret boolean) f
      fun eventSig f = signal "event" (get 0w1 GdkEvent.t ---> ret boolean) f
      fun eventAfterSig f = signal "event-after" (get 0w1 GdkEvent.t ---> ret_void) f
      fun focusSig f = signal "focus" (get 0w1 GtkDirectionType.t ---> ret boolean) f
      fun focusInEventSig f = signal "focus-in-event" (get 0w1 GdkEventFocusRecord.t ---> ret boolean) f
      fun focusOutEventSig f = signal "focus-out-event" (get 0w1 GdkEventFocusRecord.t ---> ret boolean) f
      fun grabBrokenEventSig f = signal "grab-broken-event" (get 0w1 GdkEventGrabBrokenRecord.t ---> ret boolean) f
      fun grabFocusSig f = signal "grab-focus" (void ---> ret_void) f
      fun grabNotifySig f = signal "grab-notify" (get 0w1 boolean ---> ret_void) f
      fun hideSig f = signal "hide" (void ---> ret_void) f
      fun hierarchyChangedSig f = signal "hierarchy-changed" (get 0w1 GtkWidgetClass.tOpt ---> ret_void) f
      fun keyPressEventSig f = signal "key-press-event" (get 0w1 GdkEventKeyRecord.t ---> ret boolean) f
      fun keyReleaseEventSig f = signal "key-release-event" (get 0w1 GdkEventKeyRecord.t ---> ret boolean) f
      fun keynavFailedSig f = signal "keynav-failed" (get 0w1 GtkDirectionType.t ---> ret boolean) f
      fun leaveNotifyEventSig f = signal "leave-notify-event" (get 0w1 GdkEventCrossingRecord.t ---> ret boolean) f
      fun mapSig f = signal "map" (void ---> ret_void) f
      fun mapEventSig f = signal "map-event" (get 0w1 GdkEventAnyRecord.t ---> ret boolean) f
      fun mnemonicActivateSig f = signal "mnemonic-activate" (get 0w1 boolean ---> ret boolean) f
      fun motionNotifyEventSig f = signal "motion-notify-event" (get 0w1 GdkEventMotionRecord.t ---> ret boolean) f
      fun moveFocusSig f = signal "move-focus" (get 0w1 GtkDirectionType.t ---> ret_void) f
      fun parentSetSig f = signal "parent-set" (get 0w1 GtkWidgetClass.tOpt ---> ret_void) f
      fun popupMenuSig f = signal "popup-menu" (void ---> ret boolean) f
      fun propertyNotifyEventSig f = signal "property-notify-event" (get 0w1 GdkEventPropertyRecord.t ---> ret boolean) f
      fun proximityInEventSig f = signal "proximity-in-event" (get 0w1 GdkEventProximityRecord.t ---> ret boolean) f
      fun proximityOutEventSig f = signal "proximity-out-event" (get 0w1 GdkEventProximityRecord.t ---> ret boolean) f
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
                f x y keyboardMode tooltip
          )
      fun realizeSig f = signal "realize" (void ---> ret_void) f
      fun screenChangedSig f = signal "screen-changed" (get 0w1 GdkScreenClass.tOpt ---> ret_void) f
      fun scrollEventSig f = signal "scroll-event" (get 0w1 GdkEventScrollRecord.t ---> ret boolean) f
      fun selectionClearEventSig f = signal "selection-clear-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean) f
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
              object
               & p0
               & p1 =>
                f object p0 p1
          )
      fun selectionNotifyEventSig f = signal "selection-notify-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean) f
      fun selectionReceivedSig f = signal "selection-received" (get 0w1 GtkSelectionDataRecord.t &&&> get 0w2 uint ---> ret_void) (fn object & p0 => f object p0)
      fun selectionRequestEventSig f = signal "selection-request-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean) f
      fun showSig f = signal "show" (void ---> ret_void) f
      fun showHelpSig f = signal "show-help" (get 0w1 GtkWidgetHelpType.t ---> ret boolean) f
      fun sizeAllocateSig f = signal "size-allocate" (get 0w1 CairoRectangleIntRecord.t ---> ret_void) f
      fun stateFlagsChangedSig f = signal "state-flags-changed" (get 0w1 GtkStateFlags.t ---> ret_void) f
      fun styleSetSig f = signal "style-set" (get 0w1 GtkStyleClass.tOpt ---> ret_void) f
      fun styleUpdatedSig f = signal "style-updated" (void ---> ret_void) f
      fun unmapSig f = signal "unmap" (void ---> ret_void) f
      fun unmapEventSig f = signal "unmap-event" (get 0w1 GdkEventAnyRecord.t ---> ret boolean) f
      fun unrealizeSig f = signal "unrealize" (void ---> ret_void) f
      fun visibilityNotifyEventSig f = signal "visibility-notify-event" (get 0w1 GdkEventVisibilityRecord.t ---> ret boolean) f
      fun windowStateEventSig f = signal "window-state-event" (get 0w1 GdkEventWindowStateRecord.t ---> ret boolean) f
    end
    local
      open Property
    in
      val appPaintableProp =
        {
          get = fn x => get "app-paintable" boolean x,
          set = fn x => set "app-paintable" boolean x
        }
      val canDefaultProp =
        {
          get = fn x => get "can-default" boolean x,
          set = fn x => set "can-default" boolean x
        }
      val canFocusProp =
        {
          get = fn x => get "can-focus" boolean x,
          set = fn x => set "can-focus" boolean x
        }
      val compositeChildProp = {get = fn x => get "composite-child" boolean x}
      val doubleBufferedProp =
        {
          get = fn x => get "double-buffered" boolean x,
          set = fn x => set "double-buffered" boolean x
        }
      val eventsProp =
        {
          get = fn x => get "events" GdkEventMask.t x,
          set = fn x => set "events" GdkEventMask.t x
        }
      val expandProp =
        {
          get = fn x => get "expand" boolean x,
          set = fn x => set "expand" boolean x
        }
      val halignProp =
        {
          get = fn x => get "halign" GtkAlign.t x,
          set = fn x => set "halign" GtkAlign.t x
        }
      val hasDefaultProp =
        {
          get = fn x => get "has-default" boolean x,
          set = fn x => set "has-default" boolean x
        }
      val hasFocusProp =
        {
          get = fn x => get "has-focus" boolean x,
          set = fn x => set "has-focus" boolean x
        }
      val hasTooltipProp =
        {
          get = fn x => get "has-tooltip" boolean x,
          set = fn x => set "has-tooltip" boolean x
        }
      val heightRequestProp =
        {
          get = fn x => get "height-request" int x,
          set = fn x => set "height-request" int x
        }
      val hexpandProp =
        {
          get = fn x => get "hexpand" boolean x,
          set = fn x => set "hexpand" boolean x
        }
      val hexpandSetProp =
        {
          get = fn x => get "hexpand-set" boolean x,
          set = fn x => set "hexpand-set" boolean x
        }
      val isFocusProp =
        {
          get = fn x => get "is-focus" boolean x,
          set = fn x => set "is-focus" boolean x
        }
      val marginProp =
        {
          get = fn x => get "margin" int x,
          set = fn x => set "margin" int x
        }
      val marginBottomProp =
        {
          get = fn x => get "margin-bottom" int x,
          set = fn x => set "margin-bottom" int x
        }
      val marginLeftProp =
        {
          get = fn x => get "margin-left" int x,
          set = fn x => set "margin-left" int x
        }
      val marginRightProp =
        {
          get = fn x => get "margin-right" int x,
          set = fn x => set "margin-right" int x
        }
      val marginTopProp =
        {
          get = fn x => get "margin-top" int x,
          set = fn x => set "margin-top" int x
        }
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val noShowAllProp =
        {
          get = fn x => get "no-show-all" boolean x,
          set = fn x => set "no-show-all" boolean x
        }
      val parentProp =
        {
          get = fn x => get "parent" GtkContainerClass.tOpt x,
          set = fn x => set "parent" GtkContainerClass.tOpt x
        }
      val receivesDefaultProp =
        {
          get = fn x => get "receives-default" boolean x,
          set = fn x => set "receives-default" boolean x
        }
      val sensitiveProp =
        {
          get = fn x => get "sensitive" boolean x,
          set = fn x => set "sensitive" boolean x
        }
      val styleProp =
        {
          get = fn x => get "style" GtkStyleClass.tOpt x,
          set = fn x => set "style" GtkStyleClass.tOpt x
        }
      val tooltipMarkupProp =
        {
          get = fn x => get "tooltip-markup" stringOpt x,
          set = fn x => set "tooltip-markup" stringOpt x
        }
      val tooltipTextProp =
        {
          get = fn x => get "tooltip-text" stringOpt x,
          set = fn x => set "tooltip-text" stringOpt x
        }
      val valignProp =
        {
          get = fn x => get "valign" GtkAlign.t x,
          set = fn x => set "valign" GtkAlign.t x
        }
      val vexpandProp =
        {
          get = fn x => get "vexpand" boolean x,
          set = fn x => set "vexpand" boolean x
        }
      val vexpandSetProp =
        {
          get = fn x => get "vexpand-set" boolean x,
          set = fn x => set "vexpand-set" boolean x
        }
      val visibleProp =
        {
          get = fn x => get "visible" boolean x,
          set = fn x => set "visible" boolean x
        }
      val widthRequestProp =
        {
          get = fn x => get "width-request" int x,
          set = fn x => set "width-request" int x
        }
      val windowProp = {get = fn x => get "window" GdkWindowClass.tOpt x}
    end
  end
