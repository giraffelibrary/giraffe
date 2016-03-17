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
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a window_class = 'a GtkWindowClass.class
    where type text_direction_t = GtkTextDirection.t
    where type drag_result_t = GtkDragResult.t
    where type direction_type_t = GtkDirectionType.t
    where type 'a tooltip_class = 'a GtkTooltipClass.class
    where type selection_data_t = GtkSelectionDataRecord.t
    where type widget_help_type_t = GtkWidgetHelpType.t
    where type state_type_t = GtkStateType.t
    where type state_flags_t = GtkStateFlags.t
    where type 'a container_class = 'a GtkContainerClass.class
    where type 'a style_class = 'a GtkStyleClass.class
    where type align_t = GtkAlign.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_widget_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefaultDirection_ = call (load_sym libgtk "gtk_widget_get_default_direction") (FFI.PolyML.cVoid --> GtkTextDirection.PolyML.cVal)
      val getDefaultStyle_ = call (load_sym libgtk "gtk_widget_get_default_style") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val popCompositeChild_ = call (load_sym libgtk "gtk_widget_pop_composite_child") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val pushCompositeChild_ = call (load_sym libgtk "gtk_widget_push_composite_child") (FFI.PolyML.cVoid --> FFI.PolyML.cVoid)
      val setDefaultDirection_ = call (load_sym libgtk "gtk_widget_set_default_direction") (GtkTextDirection.PolyML.cVal --> FFI.PolyML.cVoid)
      val activate_ = call (load_sym libgtk "gtk_widget_activate") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val addAccelerator_ =
        call (load_sym libgtk "gtk_widget_add_accelerator")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GtkAccelFlags.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val addDeviceEvents_ =
        call (load_sym libgtk "gtk_widget_add_device_events")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val addEvents_ = call (load_sym libgtk "gtk_widget_add_events") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val addMnemonicLabel_ = call (load_sym libgtk "gtk_widget_add_mnemonic_label") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val canActivateAccel_ = call (load_sym libgtk "gtk_widget_can_activate_accel") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val childFocus_ = call (load_sym libgtk "gtk_widget_child_focus") (GObjectObjectClass.PolyML.cPtr &&> GtkDirectionType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val childNotify_ = call (load_sym libgtk "gtk_widget_child_notify") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val classPath_ =
        call (load_sym libgtk "gtk_widget_class_path")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> FFI.PolyML.cVoid
          )
      val computeExpand_ = call (load_sym libgtk "gtk_widget_compute_expand") (GObjectObjectClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val createPangoContext_ = call (load_sym libgtk "gtk_widget_create_pango_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val createPangoLayout_ = call (load_sym libgtk "gtk_widget_create_pango_layout") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val destroy_ = call (load_sym libgtk "gtk_widget_destroy") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val destroyed_ = call (load_sym libgtk "gtk_widget_destroyed") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cInOutRef --> FFI.PolyML.cVoid)
      val deviceIsShadowed_ = call (load_sym libgtk "gtk_widget_device_is_shadowed") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val dragBegin_ =
        call (load_sym libgtk "gtk_drag_begin")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkTargetListRecord.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GdkEvent.PolyML.cPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val dragCheckThreshold_ =
        call (load_sym libgtk "gtk_drag_check_threshold")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val dragDestAddImageTargets_ = call (load_sym libgtk "gtk_drag_dest_add_image_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragDestAddTextTargets_ = call (load_sym libgtk "gtk_drag_dest_add_text_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragDestAddUriTargets_ = call (load_sym libgtk "gtk_drag_dest_add_uri_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragDestFindTarget_ =
        call (load_sym libgtk "gtk_drag_dest_find_target")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GtkTargetListRecord.PolyML.cOptPtr
             --> GdkAtomRecord.PolyML.cPtr
          )
      val dragDestGetTargetList_ = call (load_sym libgtk "gtk_drag_dest_get_target_list") (GObjectObjectClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val dragDestGetTrackMotion_ = call (load_sym libgtk "gtk_drag_dest_get_track_motion") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val dragDestSetProxy_ =
        call (load_sym libgtk "gtk_drag_dest_set_proxy")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkDragProtocol.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val dragDestSetTargetList_ = call (load_sym libgtk "gtk_drag_dest_set_target_list") (GObjectObjectClass.PolyML.cPtr &&> GtkTargetListRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val dragDestSetTrackMotion_ = call (load_sym libgtk "gtk_drag_dest_set_track_motion") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val dragDestUnset_ = call (load_sym libgtk "gtk_drag_dest_unset") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragGetData_ =
        call (load_sym libgtk "gtk_drag_get_data")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val dragHighlight_ = call (load_sym libgtk "gtk_drag_highlight") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceAddImageTargets_ = call (load_sym libgtk "gtk_drag_source_add_image_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceAddTextTargets_ = call (load_sym libgtk "gtk_drag_source_add_text_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceAddUriTargets_ = call (load_sym libgtk "gtk_drag_source_add_uri_targets") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceGetTargetList_ = call (load_sym libgtk "gtk_drag_source_get_target_list") (GObjectObjectClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cPtr)
      val dragSourceSetIconGicon_ = call (load_sym libgtk "gtk_drag_source_set_icon_gicon") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceSetIconName_ = call (load_sym libgtk "gtk_drag_source_set_icon_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val dragSourceSetIconPixbuf_ = call (load_sym libgtk "gtk_drag_source_set_icon_pixbuf") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragSourceSetIconStock_ = call (load_sym libgtk "gtk_drag_source_set_icon_stock") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val dragSourceSetTargetList_ = call (load_sym libgtk "gtk_drag_source_set_target_list") (GObjectObjectClass.PolyML.cPtr &&> GtkTargetListRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val dragSourceUnset_ = call (load_sym libgtk "gtk_drag_source_unset") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val dragUnhighlight_ = call (load_sym libgtk "gtk_drag_unhighlight") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val draw_ = call (load_sym libgtk "gtk_widget_draw") (GObjectObjectClass.PolyML.cPtr &&> CairoContextRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val ensureStyle_ = call (load_sym libgtk "gtk_widget_ensure_style") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val errorBell_ = call (load_sym libgtk "gtk_widget_error_bell") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val event_ = call (load_sym libgtk "gtk_widget_event") (GObjectObjectClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val freezeChildNotify_ = call (load_sym libgtk "gtk_widget_freeze_child_notify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAccessible_ = call (load_sym libgtk "gtk_widget_get_accessible") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAllocatedHeight_ = call (load_sym libgtk "gtk_widget_get_allocated_height") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getAllocatedWidth_ = call (load_sym libgtk "gtk_widget_get_allocated_width") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getAllocation_ = call (load_sym libgtk "gtk_widget_get_allocation") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAppPaintable_ = call (load_sym libgtk "gtk_widget_get_app_paintable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCanDefault_ = call (load_sym libgtk "gtk_widget_get_can_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCanFocus_ = call (load_sym libgtk "gtk_widget_get_can_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getChildVisible_ = call (load_sym libgtk "gtk_widget_get_child_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getClipboard_ = call (load_sym libgtk "gtk_widget_get_clipboard") (GObjectObjectClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getCompositeName_ = call (load_sym libgtk "gtk_widget_get_composite_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDeviceEnabled_ = call (load_sym libgtk "gtk_widget_get_device_enabled") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDeviceEvents_ = call (load_sym libgtk "gtk_widget_get_device_events") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getDirection_ = call (load_sym libgtk "gtk_widget_get_direction") (GObjectObjectClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getDisplay_ = call (load_sym libgtk "gtk_widget_get_display") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDoubleBuffered_ = call (load_sym libgtk "gtk_widget_get_double_buffered") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getEvents_ = call (load_sym libgtk "gtk_widget_get_events") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getHalign_ = call (load_sym libgtk "gtk_widget_get_halign") (GObjectObjectClass.PolyML.cPtr --> GtkAlign.PolyML.cVal)
      val getHasTooltip_ = call (load_sym libgtk "gtk_widget_get_has_tooltip") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHasWindow_ = call (load_sym libgtk "gtk_widget_get_has_window") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHexpand_ = call (load_sym libgtk "gtk_widget_get_hexpand") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getHexpandSet_ = call (load_sym libgtk "gtk_widget_get_hexpand_set") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMapped_ = call (load_sym libgtk "gtk_widget_get_mapped") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMarginBottom_ = call (load_sym libgtk "gtk_widget_get_margin_bottom") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMarginLeft_ = call (load_sym libgtk "gtk_widget_get_margin_left") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMarginRight_ = call (load_sym libgtk "gtk_widget_get_margin_right") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getMarginTop_ = call (load_sym libgtk "gtk_widget_get_margin_top") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getModifierStyle_ = call (load_sym libgtk "gtk_widget_get_modifier_style") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getName_ = call (load_sym libgtk "gtk_widget_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNoShowAll_ = call (load_sym libgtk "gtk_widget_get_no_show_all") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getPangoContext_ = call (load_sym libgtk "gtk_widget_get_pango_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getParent_ = call (load_sym libgtk "gtk_widget_get_parent") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getParentWindow_ = call (load_sym libgtk "gtk_widget_get_parent_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getPath_ = call (load_sym libgtk "gtk_widget_get_path") (GObjectObjectClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getPointer_ =
        call (load_sym libgtk "gtk_widget_get_pointer")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredHeight_ =
        call (load_sym libgtk "gtk_widget_get_preferred_height")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredHeightForWidth_ =
        call (load_sym libgtk "gtk_widget_get_preferred_height_for_width")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredSize_ =
        call (load_sym libgtk "gtk_widget_get_preferred_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val getPreferredWidth_ =
        call (load_sym libgtk "gtk_widget_get_preferred_width")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getPreferredWidthForHeight_ =
        call (load_sym libgtk "gtk_widget_get_preferred_width_for_height")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getRealized_ = call (load_sym libgtk "gtk_widget_get_realized") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getReceivesDefault_ = call (load_sym libgtk "gtk_widget_get_receives_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getRequestMode_ = call (load_sym libgtk "gtk_widget_get_request_mode") (GObjectObjectClass.PolyML.cPtr --> GtkSizeRequestMode.PolyML.cVal)
      val getRootWindow_ = call (load_sym libgtk "gtk_widget_get_root_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getScreen_ = call (load_sym libgtk "gtk_widget_get_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSensitive_ = call (load_sym libgtk "gtk_widget_get_sensitive") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSettings_ = call (load_sym libgtk "gtk_widget_get_settings") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSizeRequest_ =
        call (load_sym libgtk "gtk_widget_get_size_request")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getStateFlags_ = call (load_sym libgtk "gtk_widget_get_state_flags") (GObjectObjectClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyle_ = call (load_sym libgtk "gtk_widget_get_style") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getStyleContext_ = call (load_sym libgtk "gtk_widget_get_style_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getSupportMultidevice_ = call (load_sym libgtk "gtk_widget_get_support_multidevice") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getTooltipMarkup_ = call (load_sym libgtk "gtk_widget_get_tooltip_markup") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipText_ = call (load_sym libgtk "gtk_widget_get_tooltip_text") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getTooltipWindow_ = call (load_sym libgtk "gtk_widget_get_tooltip_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getToplevel_ = call (load_sym libgtk "gtk_widget_get_toplevel") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getValign_ = call (load_sym libgtk "gtk_widget_get_valign") (GObjectObjectClass.PolyML.cPtr --> GtkAlign.PolyML.cVal)
      val getVexpand_ = call (load_sym libgtk "gtk_widget_get_vexpand") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getVexpandSet_ = call (load_sym libgtk "gtk_widget_get_vexpand_set") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getVisible_ = call (load_sym libgtk "gtk_widget_get_visible") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getVisual_ = call (load_sym libgtk "gtk_widget_get_visual") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getWindow_ = call (load_sym libgtk "gtk_widget_get_window") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val grabAdd_ = call (load_sym libgtk "gtk_grab_add") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val grabDefault_ = call (load_sym libgtk "gtk_widget_grab_default") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val grabFocus_ = call (load_sym libgtk "gtk_widget_grab_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val grabRemove_ = call (load_sym libgtk "gtk_grab_remove") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hasDefault_ = call (load_sym libgtk "gtk_widget_has_default") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasFocus_ = call (load_sym libgtk "gtk_widget_has_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasGrab_ = call (load_sym libgtk "gtk_widget_has_grab") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasRcStyle_ = call (load_sym libgtk "gtk_widget_has_rc_style") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasScreen_ = call (load_sym libgtk "gtk_widget_has_screen") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hasVisibleFocus_ = call (load_sym libgtk "gtk_widget_has_visible_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val hide_ = call (load_sym libgtk "gtk_widget_hide") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val hideOnDelete_ = call (load_sym libgtk "gtk_widget_hide_on_delete") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val inDestruction_ = call (load_sym libgtk "gtk_widget_in_destruction") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val inputShapeCombineRegion_ = call (load_sym libgtk "gtk_widget_input_shape_combine_region") (GObjectObjectClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val intersect_ =
        call (load_sym libgtk "gtk_widget_intersect")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> CairoRectangleIntRecord.PolyML.cPtr
             &&> CairoRectangleIntRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val isAncestor_ = call (load_sym libgtk "gtk_widget_is_ancestor") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isComposited_ = call (load_sym libgtk "gtk_widget_is_composited") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isDrawable_ = call (load_sym libgtk "gtk_widget_is_drawable") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isFocus_ = call (load_sym libgtk "gtk_widget_is_focus") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isSensitive_ = call (load_sym libgtk "gtk_widget_is_sensitive") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isToplevel_ = call (load_sym libgtk "gtk_widget_is_toplevel") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val keynavFailed_ = call (load_sym libgtk "gtk_widget_keynav_failed") (GObjectObjectClass.PolyML.cPtr &&> GtkDirectionType.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val map_ = call (load_sym libgtk "gtk_widget_map") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val mnemonicActivate_ = call (load_sym libgtk "gtk_widget_mnemonic_activate") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.Bool.PolyML.cVal)
      val modifyBase_ =
        call (load_sym libgtk "gtk_widget_modify_base")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val modifyBg_ =
        call (load_sym libgtk "gtk_widget_modify_bg")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val modifyFg_ =
        call (load_sym libgtk "gtk_widget_modify_fg")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val modifyFont_ = call (load_sym libgtk "gtk_widget_modify_font") (GObjectObjectClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val modifyStyle_ = call (load_sym libgtk "gtk_widget_modify_style") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val modifyText_ =
        call (load_sym libgtk "gtk_widget_modify_text")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val overrideBackgroundColor_ =
        call (load_sym libgtk "gtk_widget_override_background_color")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val overrideColor_ =
        call (load_sym libgtk "gtk_widget_override_color")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val overrideCursor_ =
        call (load_sym libgtk "gtk_widget_override_cursor")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val overrideFont_ = call (load_sym libgtk "gtk_widget_override_font") (GObjectObjectClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val overrideSymbolicColor_ =
        call (load_sym libgtk "gtk_widget_override_symbolic_color")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val path_ =
        call (load_sym libgtk "gtk_widget_path")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> FFI.PolyML.cVoid
          )
      val queueComputeExpand_ = call (load_sym libgtk "gtk_widget_queue_compute_expand") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val queueDraw_ = call (load_sym libgtk "gtk_widget_queue_draw") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val queueDrawArea_ =
        call (load_sym libgtk "gtk_widget_queue_draw_area")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val queueDrawRegion_ = call (load_sym libgtk "gtk_widget_queue_draw_region") (GObjectObjectClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val queueResize_ = call (load_sym libgtk "gtk_widget_queue_resize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val queueResizeNoRedraw_ = call (load_sym libgtk "gtk_widget_queue_resize_no_redraw") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val realize_ = call (load_sym libgtk "gtk_widget_realize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val regionIntersect_ = call (load_sym libgtk "gtk_widget_region_intersect") (GObjectObjectClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val removeAccelerator_ =
        call (load_sym libgtk "gtk_widget_remove_accelerator")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> FFI.Bool.PolyML.cVal
          )
      val removeMnemonicLabel_ = call (load_sym libgtk "gtk_widget_remove_mnemonic_label") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val renderIconPixbuf_ =
        call (load_sym libgtk "gtk_widget_render_icon_pixbuf")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             --> GObjectObjectClass.PolyML.cPtr
          )
      val reparent_ = call (load_sym libgtk "gtk_widget_reparent") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val resetRcStyles_ = call (load_sym libgtk "gtk_widget_reset_rc_styles") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val resetStyle_ = call (load_sym libgtk "gtk_widget_reset_style") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val sendExpose_ = call (load_sym libgtk "gtk_widget_send_expose") (GObjectObjectClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val sendFocusChange_ = call (load_sym libgtk "gtk_widget_send_focus_change") (GObjectObjectClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAccelPath_ =
        call (load_sym libgtk "gtk_widget_set_accel_path")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
      val setAllocation_ = call (load_sym libgtk "gtk_widget_set_allocation") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAppPaintable_ = call (load_sym libgtk "gtk_widget_set_app_paintable") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCanDefault_ = call (load_sym libgtk "gtk_widget_set_can_default") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCanFocus_ = call (load_sym libgtk "gtk_widget_set_can_focus") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setChildVisible_ = call (load_sym libgtk "gtk_widget_set_child_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setCompositeName_ = call (load_sym libgtk "gtk_widget_set_composite_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setDeviceEnabled_ =
        call (load_sym libgtk "gtk_widget_set_device_enabled")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDeviceEvents_ =
        call (load_sym libgtk "gtk_widget_set_device_events")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setDirection_ = call (load_sym libgtk "gtk_widget_set_direction") (GObjectObjectClass.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDoubleBuffered_ = call (load_sym libgtk "gtk_widget_set_double_buffered") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setEvents_ = call (load_sym libgtk "gtk_widget_set_events") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHalign_ = call (load_sym libgtk "gtk_widget_set_halign") (GObjectObjectClass.PolyML.cPtr &&> GtkAlign.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHasTooltip_ = call (load_sym libgtk "gtk_widget_set_has_tooltip") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHasWindow_ = call (load_sym libgtk "gtk_widget_set_has_window") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHexpand_ = call (load_sym libgtk "gtk_widget_set_hexpand") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setHexpandSet_ = call (load_sym libgtk "gtk_widget_set_hexpand_set") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMapped_ = call (load_sym libgtk "gtk_widget_set_mapped") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMarginBottom_ = call (load_sym libgtk "gtk_widget_set_margin_bottom") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMarginLeft_ = call (load_sym libgtk "gtk_widget_set_margin_left") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMarginRight_ = call (load_sym libgtk "gtk_widget_set_margin_right") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMarginTop_ = call (load_sym libgtk "gtk_widget_set_margin_top") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setName_ = call (load_sym libgtk "gtk_widget_set_name") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setNoShowAll_ = call (load_sym libgtk "gtk_widget_set_no_show_all") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setParent_ = call (load_sym libgtk "gtk_widget_set_parent") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setParentWindow_ = call (load_sym libgtk "gtk_widget_set_parent_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setRealized_ = call (load_sym libgtk "gtk_widget_set_realized") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setReceivesDefault_ = call (load_sym libgtk "gtk_widget_set_receives_default") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setRedrawOnAllocate_ = call (load_sym libgtk "gtk_widget_set_redraw_on_allocate") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSensitive_ = call (load_sym libgtk "gtk_widget_set_sensitive") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSizeRequest_ =
        call (load_sym libgtk "gtk_widget_set_size_request")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setStateFlags_ =
        call (load_sym libgtk "gtk_widget_set_state_flags")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> FFI.Bool.PolyML.cVal
             --> FFI.PolyML.cVoid
          )
      val setStyle_ = call (load_sym libgtk "gtk_widget_set_style") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setSupportMultidevice_ = call (load_sym libgtk "gtk_widget_set_support_multidevice") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setTooltipMarkup_ = call (load_sym libgtk "gtk_widget_set_tooltip_markup") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setTooltipText_ = call (load_sym libgtk "gtk_widget_set_tooltip_text") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setTooltipWindow_ = call (load_sym libgtk "gtk_widget_set_tooltip_window") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setValign_ = call (load_sym libgtk "gtk_widget_set_valign") (GObjectObjectClass.PolyML.cPtr &&> GtkAlign.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVexpand_ = call (load_sym libgtk "gtk_widget_set_vexpand") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVexpandSet_ = call (load_sym libgtk "gtk_widget_set_vexpand_set") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVisible_ = call (load_sym libgtk "gtk_widget_set_visible") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setVisual_ = call (load_sym libgtk "gtk_widget_set_visual") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val shapeCombineRegion_ = call (load_sym libgtk "gtk_widget_shape_combine_region") (GObjectObjectClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val show_ = call (load_sym libgtk "gtk_widget_show") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showAll_ = call (load_sym libgtk "gtk_widget_show_all") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val showNow_ = call (load_sym libgtk "gtk_widget_show_now") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val sizeAllocate_ = call (load_sym libgtk "gtk_widget_size_allocate") (GObjectObjectClass.PolyML.cPtr &&> CairoRectangleIntRecord.PolyML.cPtr --> FFI.PolyML.cVoid)
      val styleGetProperty_ =
        call (load_sym libgtk "gtk_widget_style_get_property")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> FFI.PolyML.cVoid
          )
      val thawChildNotify_ = call (load_sym libgtk "gtk_widget_thaw_child_notify") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val translateCoordinates_ =
        call (load_sym libgtk "gtk_widget_translate_coordinates")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val triggerTooltipQuery_ = call (load_sym libgtk "gtk_widget_trigger_tooltip_query") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unmap_ = call (load_sym libgtk "gtk_widget_unmap") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unparent_ = call (load_sym libgtk "gtk_widget_unparent") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unrealize_ = call (load_sym libgtk "gtk_widget_unrealize") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val unsetStateFlags_ = call (load_sym libgtk "gtk_widget_unset_state_flags") (GObjectObjectClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> FFI.PolyML.cVoid)
    end
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
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a window_class = 'a GtkWindowClass.class
    type text_direction_t = GtkTextDirection.t
    type drag_result_t = GtkDragResult.t
    type direction_type_t = GtkDirectionType.t
    type 'a tooltip_class = 'a GtkTooltipClass.class
    type selection_data_t = GtkSelectionDataRecord.t
    type widget_help_type_t = GtkWidgetHelpType.t
    type state_type_t = GtkStateType.t
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
    fun activate self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) activate_ self
    fun addAccelerator self accelSignal accelGroup accelKey accelMods accelFlags =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        addDeviceEvents_
        (
          self
           & device
           & events
        )
    fun addEvents self events = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) addEvents_ (self & events)
    fun addMnemonicLabel self label = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) addMnemonicLabel_ (self & label)
    fun canActivateAccel self signalId = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> FFI.Bool.C.fromVal) canActivateAccel_ (self & signalId)
    fun childFocus self direction = (GObjectObjectClass.C.withPtr &&&> GtkDirectionType.C.withVal ---> FFI.Bool.C.fromVal) childFocus_ (self & direction)
    fun childNotify self childProperty = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) childNotify_ (self & childProperty)
    fun classPath self =
      let
        val pathLength
         & path
         & pathReversed
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> Utf8.C.withRefOptPtr
             &&&> Utf8.C.withRefOptPtr
             ---> FFI.UInt32.C.fromVal
                   && Utf8.C.fromPtr true
                   && Utf8.C.fromPtr true
                   && I
          )
            classPath_
            (
              self
               & FFI.UInt32.null
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
    fun computeExpand self orientation = (GObjectObjectClass.C.withPtr &&&> GtkOrientation.C.withVal ---> FFI.Bool.C.fromVal) computeExpand_ (self & orientation)
    fun createPangoContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr true) createPangoContext_ self
    fun createPangoLayout self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> PangoLayoutClass.C.fromPtr true) createPangoLayout_ (self & text)
    fun destroy self = (GObjectObjectClass.C.withPtr ---> I) destroy_ self
    fun destroyed self widgetPointer =
      let
        val widgetPointer & () = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withRefDupPtr ---> GtkWidgetClass.C.fromPtr true && I) destroyed_ (self & widgetPointer)
      in
        widgetPointer
      end
    fun deviceIsShadowed self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) deviceIsShadowed_ (self & device)
    fun dragBegin self targets actions button event =
      (
        GObjectObjectClass.C.withPtr
         &&&> GtkTargetListRecord.C.withPtr
         &&&> GdkDragAction.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun dragDestAddImageTargets self = (GObjectObjectClass.C.withPtr ---> I) dragDestAddImageTargets_ self
    fun dragDestAddTextTargets self = (GObjectObjectClass.C.withPtr ---> I) dragDestAddTextTargets_ self
    fun dragDestAddUriTargets self = (GObjectObjectClass.C.withPtr ---> I) dragDestAddUriTargets_ self
    fun dragDestFindTarget self context targetList =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GtkTargetListRecord.C.withOptPtr
         ---> GdkAtomRecord.C.fromPtr false
      )
        dragDestFindTarget_
        (
          self
           & context
           & targetList
        )
    fun dragDestGetTargetList self = (GObjectObjectClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) dragDestGetTargetList_ self
    fun dragDestGetTrackMotion self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) dragDestGetTrackMotion_ self
    fun dragDestSetProxy self proxyWindow protocol useCoordinates =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun dragDestSetTargetList self targetList = (GObjectObjectClass.C.withPtr &&&> GtkTargetListRecord.C.withOptPtr ---> I) dragDestSetTargetList_ (self & targetList)
    fun dragDestSetTrackMotion self trackMotion = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) dragDestSetTrackMotion_ (self & trackMotion)
    fun dragDestUnset self = (GObjectObjectClass.C.withPtr ---> I) dragDestUnset_ self
    fun dragGetData self context target time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
    fun dragHighlight self = (GObjectObjectClass.C.withPtr ---> I) dragHighlight_ self
    fun dragSourceAddImageTargets self = (GObjectObjectClass.C.withPtr ---> I) dragSourceAddImageTargets_ self
    fun dragSourceAddTextTargets self = (GObjectObjectClass.C.withPtr ---> I) dragSourceAddTextTargets_ self
    fun dragSourceAddUriTargets self = (GObjectObjectClass.C.withPtr ---> I) dragSourceAddUriTargets_ self
    fun dragSourceGetTargetList self = (GObjectObjectClass.C.withPtr ---> GtkTargetListRecord.C.fromPtr false) dragSourceGetTargetList_ self
    fun dragSourceSetIconGicon self icon = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) dragSourceSetIconGicon_ (self & icon)
    fun dragSourceSetIconName self iconName = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) dragSourceSetIconName_ (self & iconName)
    fun dragSourceSetIconPixbuf self pixbuf = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) dragSourceSetIconPixbuf_ (self & pixbuf)
    fun dragSourceSetIconStock self stockId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) dragSourceSetIconStock_ (self & stockId)
    fun dragSourceSetTargetList self targetList = (GObjectObjectClass.C.withPtr &&&> GtkTargetListRecord.C.withOptPtr ---> I) dragSourceSetTargetList_ (self & targetList)
    fun dragSourceUnset self = (GObjectObjectClass.C.withPtr ---> I) dragSourceUnset_ self
    fun dragUnhighlight self = (GObjectObjectClass.C.withPtr ---> I) dragUnhighlight_ self
    fun draw self cr = (GObjectObjectClass.C.withPtr &&&> CairoContextRecord.C.withPtr ---> I) draw_ (self & cr)
    fun ensureStyle self = (GObjectObjectClass.C.withPtr ---> I) ensureStyle_ self
    fun errorBell self = (GObjectObjectClass.C.withPtr ---> I) errorBell_ self
    fun event self event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Bool.C.fromVal) event_ (self & event)
    fun freezeChildNotify self = (GObjectObjectClass.C.withPtr ---> I) freezeChildNotify_ self
    fun getAccessible self = (GObjectObjectClass.C.withPtr ---> AtkObjectClass.C.fromPtr false) getAccessible_ self
    fun getAllocatedHeight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getAllocatedHeight_ self
    fun getAllocatedWidth self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getAllocatedWidth_ self
    fun getAllocation self =
      let
        val allocation & () = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withNewPtr ---> CairoRectangleIntRecord.C.fromPtr true && I) getAllocation_ (self & ())
      in
        allocation
      end
    fun getAppPaintable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAppPaintable_ self
    fun getCanDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanDefault_ self
    fun getCanFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getCanFocus_ self
    fun getChildVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getChildVisible_ self
    fun getClipboard self selection = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> GtkClipboardClass.C.fromPtr false) getClipboard_ (self & selection)
    fun getCompositeName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getCompositeName_ self
    fun getDeviceEnabled self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDeviceEnabled_ (self & device)
    fun getDeviceEvents self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> GdkEventMask.C.fromVal) getDeviceEvents_ (self & device)
    fun getDirection self = (GObjectObjectClass.C.withPtr ---> GtkTextDirection.C.fromVal) getDirection_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getDoubleBuffered self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDoubleBuffered_ self
    fun getEvents self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getEvents_ self
    fun getHalign self = (GObjectObjectClass.C.withPtr ---> GtkAlign.C.fromVal) getHalign_ self
    fun getHasTooltip self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasTooltip_ self
    fun getHasWindow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasWindow_ self
    fun getHexpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHexpand_ self
    fun getHexpandSet self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHexpandSet_ self
    fun getMapped self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMapped_ self
    fun getMarginBottom self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMarginBottom_ self
    fun getMarginLeft self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMarginLeft_ self
    fun getMarginRight self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMarginRight_ self
    fun getMarginTop self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getMarginTop_ self
    fun getModifierStyle self = (GObjectObjectClass.C.withPtr ---> GtkRcStyleClass.C.fromPtr false) getModifierStyle_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getNoShowAll self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getNoShowAll_ self
    fun getPangoContext self = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr false) getPangoContext_ self
    fun getParent self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getParent_ self
    fun getParentWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getParentWindow_ self
    fun getPath self = (GObjectObjectClass.C.withPtr ---> GtkWidgetPathRecord.C.fromPtr false) getPath_ self
    fun getPointer self =
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
            getPointer_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
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
            GObjectObjectClass.C.withPtr
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
               & width
               & FFI.Int32.null
               & FFI.Int32.null
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
            GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
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
            GObjectObjectClass.C.withPtr
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
               & height
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRealized self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getRealized_ self
    fun getReceivesDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReceivesDefault_ self
    fun getRequestMode self = (GObjectObjectClass.C.withPtr ---> GtkSizeRequestMode.C.fromVal) getRequestMode_ self
    fun getRootWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getRootWindow_ self
    fun getScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getScreen_ self
    fun getSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSensitive_ self
    fun getSettings self = (GObjectObjectClass.C.withPtr ---> GtkSettingsClass.C.fromPtr false) getSettings_ self
    fun getSizeRequest self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getSizeRequest_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (width, height)
      end
    fun getStateFlags self = (GObjectObjectClass.C.withPtr ---> GtkStateFlags.C.fromVal) getStateFlags_ self
    fun getStyle self = (GObjectObjectClass.C.withPtr ---> GtkStyleClass.C.fromPtr false) getStyle_ self
    fun getStyleContext self = (GObjectObjectClass.C.withPtr ---> GtkStyleContextClass.C.fromPtr false) getStyleContext_ self
    fun getSupportMultidevice self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getSupportMultidevice_ self
    fun getTooltipMarkup self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipMarkup_ self
    fun getTooltipText self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) getTooltipText_ self
    fun getTooltipWindow self = (GObjectObjectClass.C.withPtr ---> GtkWindowClass.C.fromPtr false) getTooltipWindow_ self
    fun getToplevel self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getToplevel_ self
    fun getValign self = (GObjectObjectClass.C.withPtr ---> GtkAlign.C.fromVal) getValign_ self
    fun getVexpand self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVexpand_ self
    fun getVexpandSet self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVexpandSet_ self
    fun getVisible self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getVisible_ self
    fun getVisual self = (GObjectObjectClass.C.withPtr ---> GdkVisualClass.C.fromPtr false) getVisual_ self
    fun getWindow self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getWindow_ self
    fun grabAdd self = (GObjectObjectClass.C.withPtr ---> I) grabAdd_ self
    fun grabDefault self = (GObjectObjectClass.C.withPtr ---> I) grabDefault_ self
    fun grabFocus self = (GObjectObjectClass.C.withPtr ---> I) grabFocus_ self
    fun grabRemove self = (GObjectObjectClass.C.withPtr ---> I) grabRemove_ self
    fun hasDefault self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasDefault_ self
    fun hasFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasFocus_ self
    fun hasGrab self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasGrab_ self
    fun hasRcStyle self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasRcStyle_ self
    fun hasScreen self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasScreen_ self
    fun hasVisibleFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasVisibleFocus_ self
    fun hide self = (GObjectObjectClass.C.withPtr ---> I) hide_ self
    fun hideOnDelete self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hideOnDelete_ self
    fun inDestruction self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) inDestruction_ self
    fun inputShapeCombineRegion self region = (GObjectObjectClass.C.withPtr &&&> CairoRegionRecord.C.withOptPtr ---> I) inputShapeCombineRegion_ (self & region)
    fun intersect self area intersection =
      (
        GObjectObjectClass.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         &&&> CairoRectangleIntRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        intersect_
        (
          self
           & area
           & intersection
        )
    fun isAncestor self ancestor = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isAncestor_ (self & ancestor)
    fun isComposited self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isComposited_ self
    fun isDrawable self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isDrawable_ self
    fun isFocus self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isFocus_ self
    fun isSensitive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isSensitive_ self
    fun isToplevel self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isToplevel_ self
    fun keynavFailed self direction = (GObjectObjectClass.C.withPtr &&&> GtkDirectionType.C.withVal ---> FFI.Bool.C.fromVal) keynavFailed_ (self & direction)
    fun map self = (GObjectObjectClass.C.withPtr ---> I) map_ self
    fun mnemonicActivate self groupCycling = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> FFI.Bool.C.fromVal) mnemonicActivate_ (self & groupCycling)
    fun modifyBase self state color =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun modifyFont self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) modifyFont_ (self & fontDesc)
    fun modifyStyle self style = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) modifyStyle_ (self & style)
    fun modifyText self state color =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun overrideFont self fontDesc = (GObjectObjectClass.C.withPtr &&&> PangoFontDescriptionRecord.C.withOptPtr ---> I) overrideFont_ (self & fontDesc)
    fun overrideSymbolicColor self name color =
      (
        GObjectObjectClass.C.withPtr
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
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> Utf8.C.withRefOptPtr
             &&&> Utf8.C.withRefOptPtr
             ---> FFI.UInt32.C.fromVal
                   && Utf8.C.fromPtr true
                   && Utf8.C.fromPtr true
                   && I
          )
            path_
            (
              self
               & FFI.UInt32.null
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
    fun queueComputeExpand self = (GObjectObjectClass.C.withPtr ---> I) queueComputeExpand_ self
    fun queueDraw self = (GObjectObjectClass.C.withPtr ---> I) queueDraw_ self
    fun queueDrawArea self x y width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun queueDrawRegion self region = (GObjectObjectClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) queueDrawRegion_ (self & region)
    fun queueResize self = (GObjectObjectClass.C.withPtr ---> I) queueResize_ self
    fun queueResizeNoRedraw self = (GObjectObjectClass.C.withPtr ---> I) queueResizeNoRedraw_ self
    fun realize self = (GObjectObjectClass.C.withPtr ---> I) realize_ self
    fun regionIntersect self region = (GObjectObjectClass.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> CairoRegionRecord.C.fromPtr true) regionIntersect_ (self & region)
    fun removeAccelerator self accelGroup accelKey accelMods =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
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
    fun removeMnemonicLabel self label = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) removeMnemonicLabel_ (self & label)
    fun renderIconPixbuf self stockId size =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        renderIconPixbuf_
        (
          self
           & stockId
           & size
        )
    fun reparent self newParent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) reparent_ (self & newParent)
    fun resetRcStyles self = (GObjectObjectClass.C.withPtr ---> I) resetRcStyles_ self
    fun resetStyle self = (GObjectObjectClass.C.withPtr ---> I) resetStyle_ self
    fun sendExpose self event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Int32.C.fromVal) sendExpose_ (self & event)
    fun sendFocusChange self event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withPtr ---> FFI.Bool.C.fromVal) sendFocusChange_ (self & event)
    fun setAccelPath self accelPath accelGroup =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        setAccelPath_
        (
          self
           & accelPath
           & accelGroup
        )
    fun setAllocation self allocation = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) setAllocation_ (self & allocation)
    fun setAppPaintable self appPaintable = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAppPaintable_ (self & appPaintable)
    fun setCanDefault self canDefault = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanDefault_ (self & canDefault)
    fun setCanFocus self canFocus = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setCanFocus_ (self & canFocus)
    fun setChildVisible self isVisible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setChildVisible_ (self & isVisible)
    fun setCompositeName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setCompositeName_ (self & name)
    fun setDeviceEnabled self device enabled =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkEventMask.C.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & events
        )
    fun setDirection self dir = (GObjectObjectClass.C.withPtr &&&> GtkTextDirection.C.withVal ---> I) setDirection_ (self & dir)
    fun setDoubleBuffered self doubleBuffered = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDoubleBuffered_ (self & doubleBuffered)
    fun setEvents self events = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setEvents_ (self & events)
    fun setHalign self align = (GObjectObjectClass.C.withPtr &&&> GtkAlign.C.withVal ---> I) setHalign_ (self & align)
    fun setHasTooltip self hasTooltip = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setHasWindow self hasWindow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHasWindow_ (self & hasWindow)
    fun setHexpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHexpand_ (self & expand)
    fun setHexpandSet self set = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setHexpandSet_ (self & set)
    fun setMapped self mapped = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMapped_ (self & mapped)
    fun setMarginBottom self margin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMarginBottom_ (self & margin)
    fun setMarginLeft self margin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMarginLeft_ (self & margin)
    fun setMarginRight self margin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMarginRight_ (self & margin)
    fun setMarginTop self margin = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setMarginTop_ (self & margin)
    fun setName self name = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setName_ (self & name)
    fun setNoShowAll self noShowAll = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setNoShowAll_ (self & noShowAll)
    fun setParent self parent = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setParent_ (self & parent)
    fun setParentWindow self parentWindow = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setParentWindow_ (self & parentWindow)
    fun setRealized self realized = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRealized_ (self & realized)
    fun setReceivesDefault self receivesDefault = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReceivesDefault_ (self & receivesDefault)
    fun setRedrawOnAllocate self redrawOnAllocate = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setRedrawOnAllocate_ (self & redrawOnAllocate)
    fun setSensitive self sensitive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSensitive_ (self & sensitive)
    fun setSizeRequest self width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
        GObjectObjectClass.C.withPtr
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
    fun setStyle self style = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setStyle_ (self & style)
    fun setSupportMultidevice self supportMultidevice = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTooltipMarkup self markup = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setTooltipText_ (self & text)
    fun setTooltipWindow self customWindow = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setTooltipWindow_ (self & customWindow)
    fun setValign self align = (GObjectObjectClass.C.withPtr &&&> GtkAlign.C.withVal ---> I) setValign_ (self & align)
    fun setVexpand self expand = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVexpand_ (self & expand)
    fun setVexpandSet self set = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVexpandSet_ (self & set)
    fun setVisible self visible = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setVisible_ (self & visible)
    fun setVisual self visual = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setVisual_ (self & visual)
    fun shapeCombineRegion self region = (GObjectObjectClass.C.withPtr &&&> CairoRegionRecord.C.withOptPtr ---> I) shapeCombineRegion_ (self & region)
    fun show self = (GObjectObjectClass.C.withPtr ---> I) show_ self
    fun showAll self = (GObjectObjectClass.C.withPtr ---> I) showAll_ self
    fun showNow self = (GObjectObjectClass.C.withPtr ---> I) showNow_ self
    fun sizeAllocate self allocation = (GObjectObjectClass.C.withPtr &&&> CairoRectangleIntRecord.C.withPtr ---> I) sizeAllocate_ (self & allocation)
    fun styleGetProperty self propertyName value =
      (
        GObjectObjectClass.C.withPtr
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
    fun thawChildNotify self = (GObjectObjectClass.C.withPtr ---> I) thawChildNotify_ self
    fun translateCoordinates self destWidget srcX srcY =
      let
        val destX
         & destY
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            translateCoordinates_
            (
              self
               & destWidget
               & srcX
               & srcY
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (destX, destY) else NONE
      end
    fun triggerTooltipQuery self = (GObjectObjectClass.C.withPtr ---> I) triggerTooltipQuery_ self
    fun unmap self = (GObjectObjectClass.C.withPtr ---> I) unmap_ self
    fun unparent self = (GObjectObjectClass.C.withPtr ---> I) unparent_ self
    fun unrealize self = (GObjectObjectClass.C.withPtr ---> I) unrealize_ self
    fun unsetStateFlags self flags = (GObjectObjectClass.C.withPtr &&&> GtkStateFlags.C.withVal ---> I) unsetStateFlags_ (self & flags)
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
      fun stateChangedSig f = signal "state-changed" (get 0w1 GtkStateType.t ---> ret_void) f
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
