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
    local
      open PolyMLFFI
    in
      val getType_ = call (externalFunctionSymbol "gtk_widget_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefaultDirection_ = call (externalFunctionSymbol "gtk_widget_get_default_direction") (cVoid --> GtkTextDirection.PolyML.cVal)
      val getDefaultStyle_ = call (externalFunctionSymbol "gtk_widget_get_default_style") (cVoid --> GtkStyleClass.PolyML.cPtr)
      val popCompositeChild_ = call (externalFunctionSymbol "gtk_widget_pop_composite_child") (cVoid --> cVoid)
      val pushCompositeChild_ = call (externalFunctionSymbol "gtk_widget_push_composite_child") (cVoid --> cVoid)
      val setDefaultDirection_ = call (externalFunctionSymbol "gtk_widget_set_default_direction") (GtkTextDirection.PolyML.cVal --> cVoid)
      val activate_ = call (externalFunctionSymbol "gtk_widget_activate") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val addAccelerator_ =
        call (externalFunctionSymbol "gtk_widget_add_accelerator")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkAccelGroupClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             &&> GtkAccelFlags.PolyML.cVal
             --> cVoid
          )
      val addDeviceEvents_ =
        call (externalFunctionSymbol "gtk_widget_add_device_events")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> cVoid
          )
      val addEvents_ = call (externalFunctionSymbol "gtk_widget_add_events") (GtkWidgetClass.PolyML.cPtr &&> GdkEventMask.PolyML.cVal --> cVoid)
      val addMnemonicLabel_ = call (externalFunctionSymbol "gtk_widget_add_mnemonic_label") (GtkWidgetClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val canActivateAccel_ = call (externalFunctionSymbol "gtk_widget_can_activate_accel") (GtkWidgetClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> GBool.PolyML.cVal)
      val childFocus_ = call (externalFunctionSymbol "gtk_widget_child_focus") (GtkWidgetClass.PolyML.cPtr &&> GtkDirectionType.PolyML.cVal --> GBool.PolyML.cVal)
      val childNotify_ = call (externalFunctionSymbol "gtk_widget_child_notify") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val classPath_ =
        call (externalFunctionSymbol "gtk_widget_class_path")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GUInt.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> cVoid
          )
      val computeExpand_ = call (externalFunctionSymbol "gtk_widget_compute_expand") (GtkWidgetClass.PolyML.cPtr &&> GtkOrientation.PolyML.cVal --> GBool.PolyML.cVal)
      val createPangoContext_ = call (externalFunctionSymbol "gtk_widget_create_pango_context") (GtkWidgetClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val createPangoLayout_ = call (externalFunctionSymbol "gtk_widget_create_pango_layout") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> PangoLayoutClass.PolyML.cPtr)
      val destroy_ = call (externalFunctionSymbol "gtk_widget_destroy") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val deviceIsShadowed_ = call (externalFunctionSymbol "gtk_widget_device_is_shadowed") (GtkWidgetClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val dragBegin_ =
        call (externalFunctionSymbol "gtk_drag_begin")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkTargetListRecord.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             --> GdkDragContextClass.PolyML.cPtr
          )
      val dragBeginWithCoordinates_ =
        call (externalFunctionSymbol "gtk_drag_begin_with_coordinates")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkTargetListRecord.PolyML.cPtr
             &&> GdkDragAction.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GdkEvent.PolyML.cOptPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GdkDragContextClass.PolyML.cPtr
          )
      val dragCheckThreshold_ =
        call (externalFunctionSymbol "gtk_drag_check_threshold")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val dragDestAddImageTargets_ = call (externalFunctionSymbol "gtk_drag_dest_add_image_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragDestAddTextTargets_ = call (externalFunctionSymbol "gtk_drag_dest_add_text_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragDestAddUriTargets_ = call (externalFunctionSymbol "gtk_drag_dest_add_uri_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragDestFindTarget_ =
        call (externalFunctionSymbol "gtk_drag_dest_find_target")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDragContextClass.PolyML.cPtr
             &&> GtkTargetListRecord.PolyML.cOptPtr
             --> GdkAtomRecord.PolyML.cPtr
          )
      val dragDestGetTargetList_ = call (externalFunctionSymbol "gtk_drag_dest_get_target_list") (GtkWidgetClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cOptPtr)
      val dragDestGetTrackMotion_ = call (externalFunctionSymbol "gtk_drag_dest_get_track_motion") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val dragDestSet_ =
        call (externalFunctionSymbol "gtk_drag_dest_set")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkDestDefaults.PolyML.cVal
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val dragDestSetProxy_ =
        call (externalFunctionSymbol "gtk_drag_dest_set_proxy")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkDragProtocol.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val dragDestSetTargetList_ = call (externalFunctionSymbol "gtk_drag_dest_set_target_list") (GtkWidgetClass.PolyML.cPtr &&> GtkTargetListRecord.PolyML.cOptPtr --> cVoid)
      val dragDestSetTrackMotion_ = call (externalFunctionSymbol "gtk_drag_dest_set_track_motion") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val dragDestUnset_ = call (externalFunctionSymbol "gtk_drag_dest_unset") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragGetData_ =
        call (externalFunctionSymbol "gtk_drag_get_data")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDragContextClass.PolyML.cPtr
             &&> GdkAtomRecord.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
      val dragHighlight_ = call (externalFunctionSymbol "gtk_drag_highlight") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragSourceAddImageTargets_ = call (externalFunctionSymbol "gtk_drag_source_add_image_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragSourceAddTextTargets_ = call (externalFunctionSymbol "gtk_drag_source_add_text_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragSourceAddUriTargets_ = call (externalFunctionSymbol "gtk_drag_source_add_uri_targets") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragSourceGetTargetList_ = call (externalFunctionSymbol "gtk_drag_source_get_target_list") (GtkWidgetClass.PolyML.cPtr --> GtkTargetListRecord.PolyML.cOptPtr)
      val dragSourceSet_ =
        call (externalFunctionSymbol "gtk_drag_source_set")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkModifierType.PolyML.cVal
             &&> GtkTargetEntryRecordCArrayN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> GdkDragAction.PolyML.cVal
             --> cVoid
          )
      val dragSourceSetIconGicon_ = call (externalFunctionSymbol "gtk_drag_source_set_icon_gicon") (GtkWidgetClass.PolyML.cPtr &&> GioIconClass.PolyML.cPtr --> cVoid)
      val dragSourceSetIconName_ = call (externalFunctionSymbol "gtk_drag_source_set_icon_name") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val dragSourceSetIconPixbuf_ = call (externalFunctionSymbol "gtk_drag_source_set_icon_pixbuf") (GtkWidgetClass.PolyML.cPtr &&> GdkPixbufPixbufClass.PolyML.cPtr --> cVoid)
      val dragSourceSetIconStock_ = call (externalFunctionSymbol "gtk_drag_source_set_icon_stock") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val dragSourceSetTargetList_ = call (externalFunctionSymbol "gtk_drag_source_set_target_list") (GtkWidgetClass.PolyML.cPtr &&> GtkTargetListRecord.PolyML.cOptPtr --> cVoid)
      val dragSourceUnset_ = call (externalFunctionSymbol "gtk_drag_source_unset") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val dragUnhighlight_ = call (externalFunctionSymbol "gtk_drag_unhighlight") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val draw_ = call (externalFunctionSymbol "gtk_widget_draw") (GtkWidgetClass.PolyML.cPtr &&> CairoContextRecord.PolyML.cPtr --> cVoid)
      val ensureStyle_ = call (externalFunctionSymbol "gtk_widget_ensure_style") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val errorBell_ = call (externalFunctionSymbol "gtk_widget_error_bell") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val event_ = call (externalFunctionSymbol "gtk_widget_event") (GtkWidgetClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
      val freezeChildNotify_ = call (externalFunctionSymbol "gtk_widget_freeze_child_notify") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val getAccessible_ = call (externalFunctionSymbol "gtk_widget_get_accessible") (GtkWidgetClass.PolyML.cPtr --> AtkObjectClass.PolyML.cPtr)
      val getActionGroup_ = call (externalFunctionSymbol "gtk_widget_get_action_group") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioActionGroupClass.PolyML.cOptPtr)
      val getAllocatedBaseline_ = call (externalFunctionSymbol "gtk_widget_get_allocated_baseline") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getAllocatedHeight_ = call (externalFunctionSymbol "gtk_widget_get_allocated_height") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getAllocatedSize_ =
        call (externalFunctionSymbol "gtk_widget_get_allocated_size")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkAllocationRecord.PolyML.cPtr
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getAllocatedWidth_ = call (externalFunctionSymbol "gtk_widget_get_allocated_width") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getAllocation_ = call (externalFunctionSymbol "gtk_widget_get_allocation") (GtkWidgetClass.PolyML.cPtr &&> GtkAllocationRecord.PolyML.cPtr --> cVoid)
      val getAncestor_ = call (externalFunctionSymbol "gtk_widget_get_ancestor") (GtkWidgetClass.PolyML.cPtr &&> GObjectType.PolyML.cVal --> GtkWidgetClass.PolyML.cOptPtr)
      val getAppPaintable_ = call (externalFunctionSymbol "gtk_widget_get_app_paintable") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCanDefault_ = call (externalFunctionSymbol "gtk_widget_get_can_default") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCanFocus_ = call (externalFunctionSymbol "gtk_widget_get_can_focus") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getChildRequisition_ = call (externalFunctionSymbol "gtk_widget_get_child_requisition") (GtkWidgetClass.PolyML.cPtr &&> GtkRequisitionRecord.PolyML.cPtr --> cVoid)
      val getChildVisible_ = call (externalFunctionSymbol "gtk_widget_get_child_visible") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getClip_ = call (externalFunctionSymbol "gtk_widget_get_clip") (GtkWidgetClass.PolyML.cPtr &&> GtkAllocationRecord.PolyML.cPtr --> cVoid)
      val getClipboard_ = call (externalFunctionSymbol "gtk_widget_get_clipboard") (GtkWidgetClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GtkClipboardClass.PolyML.cPtr)
      val getCompositeName_ = call (externalFunctionSymbol "gtk_widget_get_composite_name") (GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDeviceEnabled_ = call (externalFunctionSymbol "gtk_widget_get_device_enabled") (GtkWidgetClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDeviceEvents_ = call (externalFunctionSymbol "gtk_widget_get_device_events") (GtkWidgetClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getDirection_ = call (externalFunctionSymbol "gtk_widget_get_direction") (GtkWidgetClass.PolyML.cPtr --> GtkTextDirection.PolyML.cVal)
      val getDisplay_ = call (externalFunctionSymbol "gtk_widget_get_display") (GtkWidgetClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getDoubleBuffered_ = call (externalFunctionSymbol "gtk_widget_get_double_buffered") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getEvents_ = call (externalFunctionSymbol "gtk_widget_get_events") (GtkWidgetClass.PolyML.cPtr --> GdkEventMask.PolyML.cVal)
      val getFocusOnClick_ = call (externalFunctionSymbol "gtk_widget_get_focus_on_click") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFontMap_ = call (externalFunctionSymbol "gtk_widget_get_font_map") (GtkWidgetClass.PolyML.cPtr --> PangoFontMapClass.PolyML.cOptPtr)
      val getFontOptions_ = call (externalFunctionSymbol "gtk_widget_get_font_options") (GtkWidgetClass.PolyML.cPtr --> CairoFontOptionsRecord.PolyML.cOptPtr)
      val getFrameClock_ = call (externalFunctionSymbol "gtk_widget_get_frame_clock") (GtkWidgetClass.PolyML.cPtr --> GdkFrameClockClass.PolyML.cOptPtr)
      val getHalign_ = call (externalFunctionSymbol "gtk_widget_get_halign") (GtkWidgetClass.PolyML.cPtr --> GtkAlign.PolyML.cVal)
      val getHasTooltip_ = call (externalFunctionSymbol "gtk_widget_get_has_tooltip") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHasWindow_ = call (externalFunctionSymbol "gtk_widget_get_has_window") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHexpand_ = call (externalFunctionSymbol "gtk_widget_get_hexpand") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHexpandSet_ = call (externalFunctionSymbol "gtk_widget_get_hexpand_set") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMapped_ = call (externalFunctionSymbol "gtk_widget_get_mapped") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMarginBottom_ = call (externalFunctionSymbol "gtk_widget_get_margin_bottom") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarginEnd_ = call (externalFunctionSymbol "gtk_widget_get_margin_end") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarginLeft_ = call (externalFunctionSymbol "gtk_widget_get_margin_left") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarginRight_ = call (externalFunctionSymbol "gtk_widget_get_margin_right") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarginStart_ = call (externalFunctionSymbol "gtk_widget_get_margin_start") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getMarginTop_ = call (externalFunctionSymbol "gtk_widget_get_margin_top") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getModifierMask_ = call (externalFunctionSymbol "gtk_widget_get_modifier_mask") (GtkWidgetClass.PolyML.cPtr &&> GdkModifierIntent.PolyML.cVal --> GdkModifierType.PolyML.cVal)
      val getModifierStyle_ = call (externalFunctionSymbol "gtk_widget_get_modifier_style") (GtkWidgetClass.PolyML.cPtr --> GtkRcStyleClass.PolyML.cPtr)
      val getName_ = call (externalFunctionSymbol "gtk_widget_get_name") (GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getNoShowAll_ = call (externalFunctionSymbol "gtk_widget_get_no_show_all") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getOpacity_ = call (externalFunctionSymbol "gtk_widget_get_opacity") (GtkWidgetClass.PolyML.cPtr --> GDouble.PolyML.cVal)
      val getPangoContext_ = call (externalFunctionSymbol "gtk_widget_get_pango_context") (GtkWidgetClass.PolyML.cPtr --> PangoContextClass.PolyML.cPtr)
      val getParent_ = call (externalFunctionSymbol "gtk_widget_get_parent") (GtkWidgetClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getParentWindow_ = call (externalFunctionSymbol "gtk_widget_get_parent_window") (GtkWidgetClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val getPath_ = call (externalFunctionSymbol "gtk_widget_get_path") (GtkWidgetClass.PolyML.cPtr --> GtkWidgetPathRecord.PolyML.cPtr)
      val getPointer_ =
        call (externalFunctionSymbol "gtk_widget_get_pointer")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeight_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_height")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeightAndBaselineForWidth_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_height_and_baseline_for_width")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredHeightForWidth_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_height_for_width")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredSize_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_size")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             &&> GtkRequisitionRecord.PolyML.cPtr
             --> cVoid
          )
      val getPreferredWidth_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_width")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPreferredWidthForHeight_ =
        call (externalFunctionSymbol "gtk_widget_get_preferred_width_for_height")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getRealized_ = call (externalFunctionSymbol "gtk_widget_get_realized") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getReceivesDefault_ = call (externalFunctionSymbol "gtk_widget_get_receives_default") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRequestMode_ = call (externalFunctionSymbol "gtk_widget_get_request_mode") (GtkWidgetClass.PolyML.cPtr --> GtkSizeRequestMode.PolyML.cVal)
      val getRequisition_ = call (externalFunctionSymbol "gtk_widget_get_requisition") (GtkWidgetClass.PolyML.cPtr &&> GtkRequisitionRecord.PolyML.cPtr --> cVoid)
      val getRootWindow_ = call (externalFunctionSymbol "gtk_widget_get_root_window") (GtkWidgetClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getScaleFactor_ = call (externalFunctionSymbol "gtk_widget_get_scale_factor") (GtkWidgetClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getScreen_ = call (externalFunctionSymbol "gtk_widget_get_screen") (GtkWidgetClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getSensitive_ = call (externalFunctionSymbol "gtk_widget_get_sensitive") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSettings_ = call (externalFunctionSymbol "gtk_widget_get_settings") (GtkWidgetClass.PolyML.cPtr --> GtkSettingsClass.PolyML.cPtr)
      val getSizeRequest_ =
        call (externalFunctionSymbol "gtk_widget_get_size_request")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getState_ = call (externalFunctionSymbol "gtk_widget_get_state") (GtkWidgetClass.PolyML.cPtr --> GtkStateType.PolyML.cVal)
      val getStateFlags_ = call (externalFunctionSymbol "gtk_widget_get_state_flags") (GtkWidgetClass.PolyML.cPtr --> GtkStateFlags.PolyML.cVal)
      val getStyle_ = call (externalFunctionSymbol "gtk_widget_get_style") (GtkWidgetClass.PolyML.cPtr --> GtkStyleClass.PolyML.cPtr)
      val getStyleContext_ = call (externalFunctionSymbol "gtk_widget_get_style_context") (GtkWidgetClass.PolyML.cPtr --> GtkStyleContextClass.PolyML.cPtr)
      val getSupportMultidevice_ = call (externalFunctionSymbol "gtk_widget_get_support_multidevice") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTemplateChild_ =
        call (externalFunctionSymbol "gtk_widget_get_template_child")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GObjectType.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getTooltipMarkup_ = call (externalFunctionSymbol "gtk_widget_get_tooltip_markup") (GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTooltipText_ = call (externalFunctionSymbol "gtk_widget_get_tooltip_text") (GtkWidgetClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getTooltipWindow_ = call (externalFunctionSymbol "gtk_widget_get_tooltip_window") (GtkWidgetClass.PolyML.cPtr --> GtkWindowClass.PolyML.cPtr)
      val getToplevel_ = call (externalFunctionSymbol "gtk_widget_get_toplevel") (GtkWidgetClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getValign_ = call (externalFunctionSymbol "gtk_widget_get_valign") (GtkWidgetClass.PolyML.cPtr --> GtkAlign.PolyML.cVal)
      val getValignWithBaseline_ = call (externalFunctionSymbol "gtk_widget_get_valign_with_baseline") (GtkWidgetClass.PolyML.cPtr --> GtkAlign.PolyML.cVal)
      val getVexpand_ = call (externalFunctionSymbol "gtk_widget_get_vexpand") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVexpandSet_ = call (externalFunctionSymbol "gtk_widget_get_vexpand_set") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisible_ = call (externalFunctionSymbol "gtk_widget_get_visible") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisual_ = call (externalFunctionSymbol "gtk_widget_get_visual") (GtkWidgetClass.PolyML.cPtr --> GdkVisualClass.PolyML.cPtr)
      val getWindow_ = call (externalFunctionSymbol "gtk_widget_get_window") (GtkWidgetClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val grabAdd_ = call (externalFunctionSymbol "gtk_grab_add") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val grabDefault_ = call (externalFunctionSymbol "gtk_widget_grab_default") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val grabFocus_ = call (externalFunctionSymbol "gtk_widget_grab_focus") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val grabRemove_ = call (externalFunctionSymbol "gtk_grab_remove") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val hasDefault_ = call (externalFunctionSymbol "gtk_widget_has_default") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasFocus_ = call (externalFunctionSymbol "gtk_widget_has_focus") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasGrab_ = call (externalFunctionSymbol "gtk_widget_has_grab") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasRcStyle_ = call (externalFunctionSymbol "gtk_widget_has_rc_style") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasScreen_ = call (externalFunctionSymbol "gtk_widget_has_screen") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hasVisibleFocus_ = call (externalFunctionSymbol "gtk_widget_has_visible_focus") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val hide_ = call (externalFunctionSymbol "gtk_widget_hide") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val hideOnDelete_ = call (externalFunctionSymbol "gtk_widget_hide_on_delete") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val inDestruction_ = call (externalFunctionSymbol "gtk_widget_in_destruction") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val initTemplate_ = call (externalFunctionSymbol "gtk_widget_init_template") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val inputShapeCombineRegion_ = call (externalFunctionSymbol "gtk_widget_input_shape_combine_region") (GtkWidgetClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cOptPtr --> cVoid)
      val insertActionGroup_ =
        call (externalFunctionSymbol "gtk_widget_insert_action_group")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GioActionGroupClass.PolyML.cOptPtr
             --> cVoid
          )
      val intersect_ =
        call (externalFunctionSymbol "gtk_widget_intersect")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             &&> GdkRectangleRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val isAncestor_ = call (externalFunctionSymbol "gtk_widget_is_ancestor") (GtkWidgetClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isComposited_ = call (externalFunctionSymbol "gtk_widget_is_composited") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isDrawable_ = call (externalFunctionSymbol "gtk_widget_is_drawable") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isFocus_ = call (externalFunctionSymbol "gtk_widget_is_focus") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isSensitive_ = call (externalFunctionSymbol "gtk_widget_is_sensitive") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isToplevel_ = call (externalFunctionSymbol "gtk_widget_is_toplevel") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isVisible_ = call (externalFunctionSymbol "gtk_widget_is_visible") (GtkWidgetClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val keynavFailed_ = call (externalFunctionSymbol "gtk_widget_keynav_failed") (GtkWidgetClass.PolyML.cPtr &&> GtkDirectionType.PolyML.cVal --> GBool.PolyML.cVal)
      val listActionPrefixes_ = call (externalFunctionSymbol "gtk_widget_list_action_prefixes") (GtkWidgetClass.PolyML.cPtr --> Utf8CPtrArray.PolyML.cOutPtr)
      val map_ = call (externalFunctionSymbol "gtk_widget_map") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val mnemonicActivate_ = call (externalFunctionSymbol "gtk_widget_mnemonic_activate") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> GBool.PolyML.cVal)
      val modifyBase_ =
        call (externalFunctionSymbol "gtk_widget_modify_base")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val modifyBg_ =
        call (externalFunctionSymbol "gtk_widget_modify_bg")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val modifyCursor_ =
        call (externalFunctionSymbol "gtk_widget_modify_cursor")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             &&> GdkColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val modifyFg_ =
        call (externalFunctionSymbol "gtk_widget_modify_fg")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val modifyFont_ = call (externalFunctionSymbol "gtk_widget_modify_font") (GtkWidgetClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val modifyStyle_ = call (externalFunctionSymbol "gtk_widget_modify_style") (GtkWidgetClass.PolyML.cPtr &&> GtkRcStyleClass.PolyML.cPtr --> cVoid)
      val modifyText_ =
        call (externalFunctionSymbol "gtk_widget_modify_text")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateType.PolyML.cVal
             &&> GdkColorRecord.PolyML.cOptPtr
             --> cVoid
          )
      val overrideBackgroundColor_ =
        call (externalFunctionSymbol "gtk_widget_override_background_color")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> cVoid
          )
      val overrideColor_ =
        call (externalFunctionSymbol "gtk_widget_override_color")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> cVoid
          )
      val overrideCursor_ =
        call (externalFunctionSymbol "gtk_widget_override_cursor")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> cVoid
          )
      val overrideFont_ = call (externalFunctionSymbol "gtk_widget_override_font") (GtkWidgetClass.PolyML.cPtr &&> PangoFontDescriptionRecord.PolyML.cOptPtr --> cVoid)
      val overrideSymbolicColor_ =
        call (externalFunctionSymbol "gtk_widget_override_symbolic_color")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GdkRgbaRecord.PolyML.cOptPtr
             --> cVoid
          )
      val path_ =
        call (externalFunctionSymbol "gtk_widget_path")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GUInt.PolyML.cRef
             &&> Utf8.PolyML.cOutRef
             &&> Utf8.PolyML.cOutRef
             --> cVoid
          )
      val queueAllocate_ = call (externalFunctionSymbol "gtk_widget_queue_allocate") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val queueComputeExpand_ = call (externalFunctionSymbol "gtk_widget_queue_compute_expand") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val queueDraw_ = call (externalFunctionSymbol "gtk_widget_queue_draw") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val queueDrawArea_ =
        call (externalFunctionSymbol "gtk_widget_queue_draw_area")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val queueDrawRegion_ = call (externalFunctionSymbol "gtk_widget_queue_draw_region") (GtkWidgetClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> cVoid)
      val queueResize_ = call (externalFunctionSymbol "gtk_widget_queue_resize") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val queueResizeNoRedraw_ = call (externalFunctionSymbol "gtk_widget_queue_resize_no_redraw") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val realize_ = call (externalFunctionSymbol "gtk_widget_realize") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val regionIntersect_ = call (externalFunctionSymbol "gtk_widget_region_intersect") (GtkWidgetClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cPtr --> CairoRegionRecord.PolyML.cPtr)
      val registerWindow_ = call (externalFunctionSymbol "gtk_widget_register_window") (GtkWidgetClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val removeAccelerator_ =
        call (externalFunctionSymbol "gtk_widget_remove_accelerator")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkAccelGroupClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> GBool.PolyML.cVal
          )
      val removeMnemonicLabel_ = call (externalFunctionSymbol "gtk_widget_remove_mnemonic_label") (GtkWidgetClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val removeTickCallback_ = call (externalFunctionSymbol "gtk_widget_remove_tick_callback") (GtkWidgetClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val renderIcon_ =
        call (externalFunctionSymbol "gtk_widget_render_icon")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInOptPtr
             --> GdkPixbufPixbufClass.PolyML.cOptPtr
          )
      val renderIconPixbuf_ =
        call (externalFunctionSymbol "gtk_widget_render_icon_pixbuf")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GInt.PolyML.cVal
             --> GdkPixbufPixbufClass.PolyML.cOptPtr
          )
      val reparent_ = call (externalFunctionSymbol "gtk_widget_reparent") (GtkWidgetClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val resetRcStyles_ = call (externalFunctionSymbol "gtk_widget_reset_rc_styles") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val resetStyle_ = call (externalFunctionSymbol "gtk_widget_reset_style") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val sendExpose_ = call (externalFunctionSymbol "gtk_widget_send_expose") (GtkWidgetClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GInt.PolyML.cVal)
      val sendFocusChange_ = call (externalFunctionSymbol "gtk_widget_send_focus_change") (GtkWidgetClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccelPath_ =
        call (externalFunctionSymbol "gtk_widget_set_accel_path")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GtkAccelGroupClass.PolyML.cOptPtr
             --> cVoid
          )
      val setAllocation_ = call (externalFunctionSymbol "gtk_widget_set_allocation") (GtkWidgetClass.PolyML.cPtr &&> GtkAllocationRecord.PolyML.cPtr --> cVoid)
      val setAppPaintable_ = call (externalFunctionSymbol "gtk_widget_set_app_paintable") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCanDefault_ = call (externalFunctionSymbol "gtk_widget_set_can_default") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setCanFocus_ = call (externalFunctionSymbol "gtk_widget_set_can_focus") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setChildVisible_ = call (externalFunctionSymbol "gtk_widget_set_child_visible") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setClip_ = call (externalFunctionSymbol "gtk_widget_set_clip") (GtkWidgetClass.PolyML.cPtr &&> GtkAllocationRecord.PolyML.cPtr --> cVoid)
      val setCompositeName_ = call (externalFunctionSymbol "gtk_widget_set_composite_name") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setDeviceEnabled_ =
        call (externalFunctionSymbol "gtk_widget_set_device_enabled")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setDeviceEvents_ =
        call (externalFunctionSymbol "gtk_widget_set_device_events")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkEventMask.PolyML.cVal
             --> cVoid
          )
      val setDirection_ = call (externalFunctionSymbol "gtk_widget_set_direction") (GtkWidgetClass.PolyML.cPtr &&> GtkTextDirection.PolyML.cVal --> cVoid)
      val setDoubleBuffered_ = call (externalFunctionSymbol "gtk_widget_set_double_buffered") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setEvents_ = call (externalFunctionSymbol "gtk_widget_set_events") (GtkWidgetClass.PolyML.cPtr &&> GdkEventMask.PolyML.cVal --> cVoid)
      val setFocusOnClick_ = call (externalFunctionSymbol "gtk_widget_set_focus_on_click") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setFontMap_ = call (externalFunctionSymbol "gtk_widget_set_font_map") (GtkWidgetClass.PolyML.cPtr &&> PangoFontMapClass.PolyML.cOptPtr --> cVoid)
      val setFontOptions_ = call (externalFunctionSymbol "gtk_widget_set_font_options") (GtkWidgetClass.PolyML.cPtr &&> CairoFontOptionsRecord.PolyML.cOptPtr --> cVoid)
      val setHalign_ = call (externalFunctionSymbol "gtk_widget_set_halign") (GtkWidgetClass.PolyML.cPtr &&> GtkAlign.PolyML.cVal --> cVoid)
      val setHasTooltip_ = call (externalFunctionSymbol "gtk_widget_set_has_tooltip") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHasWindow_ = call (externalFunctionSymbol "gtk_widget_set_has_window") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHexpand_ = call (externalFunctionSymbol "gtk_widget_set_hexpand") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHexpandSet_ = call (externalFunctionSymbol "gtk_widget_set_hexpand_set") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMapped_ = call (externalFunctionSymbol "gtk_widget_set_mapped") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMarginBottom_ = call (externalFunctionSymbol "gtk_widget_set_margin_bottom") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarginEnd_ = call (externalFunctionSymbol "gtk_widget_set_margin_end") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarginLeft_ = call (externalFunctionSymbol "gtk_widget_set_margin_left") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarginRight_ = call (externalFunctionSymbol "gtk_widget_set_margin_right") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarginStart_ = call (externalFunctionSymbol "gtk_widget_set_margin_start") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setMarginTop_ = call (externalFunctionSymbol "gtk_widget_set_margin_top") (GtkWidgetClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
      val setName_ = call (externalFunctionSymbol "gtk_widget_set_name") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setNoShowAll_ = call (externalFunctionSymbol "gtk_widget_set_no_show_all") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setOpacity_ = call (externalFunctionSymbol "gtk_widget_set_opacity") (GtkWidgetClass.PolyML.cPtr &&> GDouble.PolyML.cVal --> cVoid)
      val setParent_ = call (externalFunctionSymbol "gtk_widget_set_parent") (GtkWidgetClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setParentWindow_ = call (externalFunctionSymbol "gtk_widget_set_parent_window") (GtkWidgetClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val setRealized_ = call (externalFunctionSymbol "gtk_widget_set_realized") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setReceivesDefault_ = call (externalFunctionSymbol "gtk_widget_set_receives_default") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRedrawOnAllocate_ = call (externalFunctionSymbol "gtk_widget_set_redraw_on_allocate") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSensitive_ = call (externalFunctionSymbol "gtk_widget_set_sensitive") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSizeRequest_ =
        call (externalFunctionSymbol "gtk_widget_set_size_request")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setState_ = call (externalFunctionSymbol "gtk_widget_set_state") (GtkWidgetClass.PolyML.cPtr &&> GtkStateType.PolyML.cVal --> cVoid)
      val setStateFlags_ =
        call (externalFunctionSymbol "gtk_widget_set_state_flags")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkStateFlags.PolyML.cVal
             &&> GBool.PolyML.cVal
             --> cVoid
          )
      val setStyle_ = call (externalFunctionSymbol "gtk_widget_set_style") (GtkWidgetClass.PolyML.cPtr &&> GtkStyleClass.PolyML.cOptPtr --> cVoid)
      val setSupportMultidevice_ = call (externalFunctionSymbol "gtk_widget_set_support_multidevice") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTooltipMarkup_ = call (externalFunctionSymbol "gtk_widget_set_tooltip_markup") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setTooltipText_ = call (externalFunctionSymbol "gtk_widget_set_tooltip_text") (GtkWidgetClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setTooltipWindow_ = call (externalFunctionSymbol "gtk_widget_set_tooltip_window") (GtkWidgetClass.PolyML.cPtr &&> GtkWindowClass.PolyML.cOptPtr --> cVoid)
      val setValign_ = call (externalFunctionSymbol "gtk_widget_set_valign") (GtkWidgetClass.PolyML.cPtr &&> GtkAlign.PolyML.cVal --> cVoid)
      val setVexpand_ = call (externalFunctionSymbol "gtk_widget_set_vexpand") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVexpandSet_ = call (externalFunctionSymbol "gtk_widget_set_vexpand_set") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisible_ = call (externalFunctionSymbol "gtk_widget_set_visible") (GtkWidgetClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisual_ = call (externalFunctionSymbol "gtk_widget_set_visual") (GtkWidgetClass.PolyML.cPtr &&> GdkVisualClass.PolyML.cOptPtr --> cVoid)
      val setWindow_ = call (externalFunctionSymbol "gtk_widget_set_window") (GtkWidgetClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val shapeCombineRegion_ = call (externalFunctionSymbol "gtk_widget_shape_combine_region") (GtkWidgetClass.PolyML.cPtr &&> CairoRegionRecord.PolyML.cOptPtr --> cVoid)
      val show_ = call (externalFunctionSymbol "gtk_widget_show") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val showAll_ = call (externalFunctionSymbol "gtk_widget_show_all") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val showNow_ = call (externalFunctionSymbol "gtk_widget_show_now") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val sizeAllocate_ = call (externalFunctionSymbol "gtk_widget_size_allocate") (GtkWidgetClass.PolyML.cPtr &&> GtkAllocationRecord.PolyML.cPtr --> cVoid)
      val sizeAllocateWithBaseline_ =
        call (externalFunctionSymbol "gtk_widget_size_allocate_with_baseline")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkAllocationRecord.PolyML.cPtr
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val sizeRequest_ = call (externalFunctionSymbol "gtk_widget_size_request") (GtkWidgetClass.PolyML.cPtr &&> GtkRequisitionRecord.PolyML.cPtr --> cVoid)
      val styleAttach_ = call (externalFunctionSymbol "gtk_widget_style_attach") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val styleGetProperty_ =
        call (externalFunctionSymbol "gtk_widget_style_get_property")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GObjectValueRecord.PolyML.cPtr
             --> cVoid
          )
      val thawChildNotify_ = call (externalFunctionSymbol "gtk_widget_thaw_child_notify") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val translateCoordinates_ =
        call (externalFunctionSymbol "gtk_widget_translate_coordinates")
          (
            GtkWidgetClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val triggerTooltipQuery_ = call (externalFunctionSymbol "gtk_widget_trigger_tooltip_query") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val unmap_ = call (externalFunctionSymbol "gtk_widget_unmap") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val unparent_ = call (externalFunctionSymbol "gtk_widget_unparent") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val unrealize_ = call (externalFunctionSymbol "gtk_widget_unrealize") (GtkWidgetClass.PolyML.cPtr --> cVoid)
      val unregisterWindow_ = call (externalFunctionSymbol "gtk_widget_unregister_window") (GtkWidgetClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> cVoid)
      val unsetStateFlags_ = call (externalFunctionSymbol "gtk_widget_unset_state_flags") (GtkWidgetClass.PolyML.cPtr &&> GtkStateFlags.PolyML.cVal --> cVoid)
    end
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
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val accelClosuresChangedSig =
          {
            name = "accel-closures-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventButtonRecord.t ---> ret boolean
      in
        val buttonPressEventSig =
          {
            name = "button-press-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventButtonRecord.t ---> ret boolean
      in
        val buttonReleaseEventSig =
          {
            name = "button-release-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 uint ---> ret boolean
      in
        val canActivateAccelSig =
          {
            name = "can-activate-accel",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & signalId => () & signalId,
                      fn self & signalId => GtkWidgetClass.toBase self & signalId,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GObjectParamSpecClass.t ---> retVoid
      in
        val childNotifySig =
          {
            name = "child-notify",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & childProperty => () & childProperty,
                      fn self & childProperty => GtkWidgetClass.toBase self & GObjectParamSpecClass.toBase childProperty,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val compositedChangedSig =
          {
            name = "composited-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventConfigureRecord.t ---> ret boolean
      in
        val configureEventSig =
          {
            name = "configure-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventExposeRecord.t ---> ret boolean
      in
        val damageEventSig =
          {
            name = "damage-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEvent.t ---> ret boolean
      in
        val deleteEventSig =
          {
            name = "delete-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & GdkEvent.toBase event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val destroySig =
          {
            name = "destroy",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEvent.t ---> ret boolean
      in
        val destroyEventSig =
          {
            name = "destroy-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & GdkEvent.toBase event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkTextDirection.t ---> retVoid
      in
        val directionChangedSig =
          {
            name = "direction-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & previousDirection => () & previousDirection,
                      fn self & previousDirection => GtkWidgetClass.toBase self & previousDirection,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkDragContextClass.t ---> retVoid
      in
        val dragBeginSig =
          {
            name = "drag-begin",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & context => () & context,
                      fn self & context => GtkWidgetClass.toBase self & GdkDragContextClass.toBase context,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkDragContextClass.t ---> retVoid
      in
        val dragDataDeleteSig =
          {
            name = "drag-data-delete",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & context => () & context,
                      fn self & context => GtkWidgetClass.toBase self & GdkDragContextClass.toBase context,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 GtkSelectionDataRecord.t
           &&&> parIn 3 uint
           &&&> parIn 4 uint
           ---> retVoid
      in
        val dragDataGetSig =
          {
            name = "drag-data-get",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & data
                         & info
                         & time =>
                          ()
                           & (
                               context,
                               data,
                               info,
                               time
                             ),
                      fn
                        self
                         & (
                             context,
                             data,
                             info,
                             time
                           ) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & data
                           & info
                           & time,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 int
           &&&> parIn 3 int
           &&&> parIn 4 GtkSelectionDataRecord.t
           &&&> parIn 5 uint
           &&&> parIn 6 uint
           ---> retVoid
      in
        val dragDataReceivedSig =
          {
            name = "drag-data-received",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & x
                         & y
                         & data
                         & info
                         & time =>
                          ()
                           & (
                               context,
                               x,
                               y,
                               data,
                               info,
                               time
                             ),
                      fn
                        self
                         & (
                             context,
                             x,
                             y,
                             data,
                             info,
                             time
                           ) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & x
                           & y
                           & data
                           & info
                           & time,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 int
           &&&> parIn 3 int
           &&&> parIn 4 uint
           ---> ret boolean
      in
        val dragDropSig =
          {
            name = "drag-drop",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & x
                         & y
                         & time =>
                          ()
                           & (
                               context,
                               x,
                               y,
                               time
                             ),
                      fn
                        self
                         & (
                             context,
                             x,
                             y,
                             time
                           ) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & x
                           & y
                           & time,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkDragContextClass.t ---> retVoid
      in
        val dragEndSig =
          {
            name = "drag-end",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & context => () & context,
                      fn self & context => GtkWidgetClass.toBase self & GdkDragContextClass.toBase context,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 GtkDragResult.t
           ---> ret boolean
      in
        val dragFailedSig =
          {
            name = "drag-failed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & result =>
                          () & (context, result),
                      fn
                        self & (context, result) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & result,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 uint
           ---> retVoid
      in
        val dragLeaveSig =
          {
            name = "drag-leave",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & time =>
                          () & (context, time),
                      fn
                        self & (context, time) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & time,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GdkDragContextClass.t
           &&&> parIn 2 int
           &&&> parIn 3 int
           &&&> parIn 4 uint
           ---> ret boolean
      in
        val dragMotionSig =
          {
            name = "drag-motion",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & context
                         & x
                         & y
                         & time =>
                          ()
                           & (
                               context,
                               x,
                               y,
                               time
                             ),
                      fn
                        self
                         & (
                             context,
                             x,
                             y,
                             time
                           ) =>
                          GtkWidgetClass.toBase self
                           & GdkDragContextClass.toBase context
                           & x
                           & y
                           & time,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 CairoContextRecord.t ---> ret boolean
      in
        val drawSig =
          {
            name = "draw",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & cr => () & cr,
                      fn self & cr => GtkWidgetClass.toBase self & cr,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventCrossingRecord.t ---> ret boolean
      in
        val enterNotifyEventSig =
          {
            name = "enter-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEvent.t ---> ret boolean
      in
        val eventSig =
          {
            name = "event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & GdkEvent.toBase event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEvent.t ---> retVoid
      in
        val eventAfterSig =
          {
            name = "event-after",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & GdkEvent.toBase event,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkDirectionType.t ---> ret boolean
      in
        val focusSig =
          {
            name = "focus",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & direction => () & direction,
                      fn self & direction => GtkWidgetClass.toBase self & direction,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventFocusRecord.t ---> ret boolean
      in
        val focusInEventSig =
          {
            name = "focus-in-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventFocusRecord.t ---> ret boolean
      in
        val focusOutEventSig =
          {
            name = "focus-out-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventGrabBrokenRecord.t ---> ret boolean
      in
        val grabBrokenEventSig =
          {
            name = "grab-broken-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val grabFocusSig =
          {
            name = "grab-focus",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 boolean ---> retVoid
      in
        val grabNotifySig =
          {
            name = "grab-notify",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & wasGrabbed => () & wasGrabbed,
                      fn self & wasGrabbed => GtkWidgetClass.toBase self & wasGrabbed,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val hideSig =
          {
            name = "hide",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkWidgetClass.tOpt ---> retVoid
      in
        val hierarchyChangedSig =
          {
            name = "hierarchy-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & previousToplevel => () & previousToplevel,
                      fn self & previousToplevel => GtkWidgetClass.toBase self & Option.map GtkWidgetClass.toBase previousToplevel,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventKeyRecord.t ---> ret boolean
      in
        val keyPressEventSig =
          {
            name = "key-press-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventKeyRecord.t ---> ret boolean
      in
        val keyReleaseEventSig =
          {
            name = "key-release-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkDirectionType.t ---> ret boolean
      in
        val keynavFailedSig =
          {
            name = "keynav-failed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & direction => () & direction,
                      fn self & direction => GtkWidgetClass.toBase self & direction,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventCrossingRecord.t ---> ret boolean
      in
        val leaveNotifyEventSig =
          {
            name = "leave-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val mapSig =
          {
            name = "map",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventAnyRecord.t ---> ret boolean
      in
        val mapEventSig =
          {
            name = "map-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 boolean ---> ret boolean
      in
        val mnemonicActivateSig =
          {
            name = "mnemonic-activate",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & groupCycling => () & groupCycling,
                      fn self & groupCycling => GtkWidgetClass.toBase self & groupCycling,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventMotionRecord.t ---> ret boolean
      in
        val motionNotifyEventSig =
          {
            name = "motion-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkDirectionType.t ---> retVoid
      in
        val moveFocusSig =
          {
            name = "move-focus",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & direction => () & direction,
                      fn self & direction => GtkWidgetClass.toBase self & direction,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkWidgetClass.tOpt ---> retVoid
      in
        val parentSetSig =
          {
            name = "parent-set",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & oldParent => () & oldParent,
                      fn self & oldParent => GtkWidgetClass.toBase self & Option.map GtkWidgetClass.toBase oldParent,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> ret boolean
      in
        val popupMenuSig =
          {
            name = "popup-menu",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventPropertyRecord.t ---> ret boolean
      in
        val propertyNotifyEventSig =
          {
            name = "property-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventProximityRecord.t ---> ret boolean
      in
        val proximityInEventSig =
          {
            name = "proximity-in-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventProximityRecord.t ---> ret boolean
      in
        val proximityOutEventSig =
          {
            name = "proximity-out-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 int
           &&&> parIn 2 int
           &&&> parIn 3 boolean
           &&&> parIn 4 GtkTooltipClass.t
           ---> ret boolean
      in
        val queryTooltipSig =
          {
            name = "query-tooltip",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & x
                         & y
                         & keyboardMode
                         & tooltip =>
                          ()
                           & (
                               x,
                               y,
                               keyboardMode,
                               tooltip
                             ),
                      fn
                        self
                         & (
                             x,
                             y,
                             keyboardMode,
                             tooltip
                           ) =>
                          GtkWidgetClass.toBase self
                           & x
                           & y
                           & keyboardMode
                           & GtkTooltipClass.toBase tooltip,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val realizeSig =
          {
            name = "realize",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkScreenClass.tOpt ---> retVoid
      in
        val screenChangedSig =
          {
            name = "screen-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & previousScreen => () & previousScreen,
                      fn self & previousScreen => GtkWidgetClass.toBase self & Option.map GdkScreenClass.toBase previousScreen,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventScrollRecord.t ---> ret boolean
      in
        val scrollEventSig =
          {
            name = "scroll-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventSelectionRecord.t ---> ret boolean
      in
        val selectionClearEventSig =
          {
            name = "selection-clear-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GtkSelectionDataRecord.t
           &&&> parIn 2 uint
           &&&> parIn 3 uint
           ---> retVoid
      in
        val selectionGetSig =
          {
            name = "selection-get",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & data
                         & info
                         & time =>
                          ()
                           & (
                               data,
                               info,
                               time
                             ),
                      fn
                        self
                         & (
                             data,
                             info,
                             time
                           ) =>
                          GtkWidgetClass.toBase self
                           & data
                           & info
                           & time,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventSelectionRecord.t ---> ret boolean
      in
        val selectionNotifyEventSig =
          {
            name = "selection-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller =
          parInst GtkWidgetClass.t
           &&&> parIn 1 GtkSelectionDataRecord.t
           &&&> parIn 2 uint
           ---> retVoid
      in
        val selectionReceivedSig =
          {
            name = "selection-received",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn
                        ()
                         & data
                         & time =>
                          () & (data, time),
                      fn
                        self & (data, time) =>
                          GtkWidgetClass.toBase self
                           & data
                           & time,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventSelectionRecord.t ---> ret boolean
      in
        val selectionRequestEventSig =
          {
            name = "selection-request-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val showSig =
          {
            name = "show",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkWidgetHelpType.t ---> ret boolean
      in
        val showHelpSig =
          {
            name = "show-help",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & helpType => () & helpType,
                      fn self & helpType => GtkWidgetClass.toBase self & helpType,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkAllocationRecord.t ---> retVoid
      in
        val sizeAllocateSig =
          {
            name = "size-allocate",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & allocation => () & allocation,
                      fn self & allocation => GtkWidgetClass.toBase self & allocation,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkStateType.t ---> retVoid
      in
        val stateChangedSig =
          {
            name = "state-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & state => () & state,
                      fn self & state => GtkWidgetClass.toBase self & state,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkStateFlags.t ---> retVoid
      in
        val stateFlagsChangedSig =
          {
            name = "state-flags-changed",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & flags => () & flags,
                      fn self & flags => GtkWidgetClass.toBase self & flags,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GtkStyleClass.tOpt ---> retVoid
      in
        val styleSetSig =
          {
            name = "style-set",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & previousStyle => () & previousStyle,
                      fn self & previousStyle => GtkWidgetClass.toBase self & Option.map GtkStyleClass.toBase previousStyle,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val styleUpdatedSig =
          {
            name = "style-updated",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEvent.t ---> ret boolean
      in
        val touchEventSig =
          {
            name = "touch-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & object => () & object,
                      fn self & object => GtkWidgetClass.toBase self & GdkEvent.toBase object,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val unmapSig =
          {
            name = "unmap",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventAnyRecord.t ---> ret boolean
      in
        val unmapEventSig =
          {
            name = "unmap-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t ---> retVoid
      in
        val unrealizeSig =
          {
            name = "unrealize",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () => () & (),
                      fn self & () => GtkWidgetClass.toBase self,
                      fn () => (),
                      fn () => ()
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventVisibilityRecord.t ---> ret boolean
      in
        val visibilityNotifyEventSig =
          {
            name = "visibility-notify-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
      local
        val marshaller = parInst GtkWidgetClass.t &&&> parIn 1 GdkEventWindowStateRecord.t ---> ret boolean
      in
        val windowStateEventSig =
          {
            name = "window-state-event",
            detail = "",
            marshaller =
              fn
                () =>
                  map
                    (
                      fn () & event => () & event,
                      fn self & event => GtkWidgetClass.toBase self & event,
                      fn retVal => retVal,
                      fn retVal => retVal
                    )
                    marshaller
          }
      end
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
