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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefaultDirection () = (I ---> GtkTextDirection.FFI.fromVal) getDefaultDirection_ ()
    fun getDefaultStyle () = (I ---> GtkStyleClass.FFI.fromPtr false) getDefaultStyle_ ()
    fun popCompositeChild () = (I ---> I) popCompositeChild_ ()
    fun pushCompositeChild () = (I ---> I) pushCompositeChild_ ()
    fun setDefaultDirection dir = (GtkTextDirection.FFI.withVal ---> I) setDefaultDirection_ dir
    fun activate self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) activate_ self
    fun addAccelerator
      self
      (
        accelSignal,
        accelGroup,
        accelKey,
        accelMods,
        accelFlags
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkAccelGroupClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         &&&> GtkAccelFlags.FFI.withVal
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
    fun addDeviceEvents self (device, events) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        addDeviceEvents_
        (
          self
           & device
           & events
        )
    fun addEvents self events = (GtkWidgetClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I) addEvents_ (self & events)
    fun addMnemonicLabel self label = (GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) addMnemonicLabel_ (self & label)
    fun canActivateAccel self signalId = (GtkWidgetClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> GBool.FFI.fromVal) canActivateAccel_ (self & signalId)
    fun childFocus self direction = (GtkWidgetClass.FFI.withPtr false &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal) childFocus_ (self & direction)
    fun childNotify self childProperty = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) childNotify_ (self & childProperty)
    fun classPath self =
      let
        val pathLength
         & path
         & pathReversed
         & () =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GUInt.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             ---> GUInt.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && Utf8.FFI.fromPtr ~1
                   && I
          )
            classPath_
            (
              self
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
    fun computeExpand self orientation = (GtkWidgetClass.FFI.withPtr false &&&> GtkOrientation.FFI.withVal ---> GBool.FFI.fromVal) computeExpand_ (self & orientation)
    fun createPangoContext self = (GtkWidgetClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr true) createPangoContext_ self
    fun createPangoLayout self text = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> PangoLayoutClass.FFI.fromPtr true) createPangoLayout_ (self & text)
    fun destroy self = (GtkWidgetClass.FFI.withPtr false ---> I) destroy_ self
    fun deviceIsShadowed self device = (GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal) deviceIsShadowed_ (self & device)
    fun dragBegin
      self
      (
        targets,
        actions,
        button,
        event
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         ---> GdkDragContextClass.FFI.fromPtr false
      )
        dragBegin_
        (
          self
           & targets
           & actions
           & button
           & event
        )
       before GtkWidgetClass.FFI.touchPtr self
       before GtkTargetListRecord.FFI.touchPtr targets
       before GdkEvent.FFI.touchOptPtr event
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
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withPtr false
         &&&> GdkDragAction.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GdkEvent.FFI.withOptPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GdkDragContextClass.FFI.fromPtr false
      )
        dragBeginWithCoordinates_
        (
          self
           & targets
           & actions
           & button
           & event
           & x
           & y
        )
       before GtkWidgetClass.FFI.touchPtr self
       before GtkTargetListRecord.FFI.touchPtr targets
       before GdkEvent.FFI.touchOptPtr event
    fun dragCheckThreshold
      self
      (
        startX,
        startY,
        currentX,
        currentY
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        dragCheckThreshold_
        (
          self
           & startX
           & startY
           & currentX
           & currentY
        )
    fun dragDestAddImageTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragDestAddImageTargets_ self
    fun dragDestAddTextTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragDestAddTextTargets_ self
    fun dragDestAddUriTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragDestAddUriTargets_ self
    fun dragDestFindTarget self (context, targetList) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDragContextClass.FFI.withPtr false
         &&&> GtkTargetListRecord.FFI.withOptPtr false
         ---> GdkAtomRecord.FFI.fromPtr false
      )
        dragDestFindTarget_
        (
          self
           & context
           & targetList
        )
       before GtkWidgetClass.FFI.touchPtr self
       before GdkDragContextClass.FFI.touchPtr context
       before GtkTargetListRecord.FFI.touchOptPtr targetList
    fun dragDestGetTargetList self = (GtkWidgetClass.FFI.withPtr false ---> GtkTargetListRecord.FFI.fromOptPtr false) dragDestGetTargetList_ self before GtkWidgetClass.FFI.touchPtr self
    fun dragDestGetTrackMotion self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) dragDestGetTrackMotion_ self
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
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GtkDestDefaults.FFI.withVal
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> GdkDragAction.FFI.withVal
             ---> I
          )
            dragDestSet_
            (
              self
               & flags
               & targets
               & nTargets
               & actions
            )
      in
        ()
      end
    fun dragDestSetProxy
      self
      (
        proxyWindow,
        protocol,
        useCoordinates
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkWindowClass.FFI.withPtr false
         &&&> GdkDragProtocol.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        dragDestSetProxy_
        (
          self
           & proxyWindow
           & protocol
           & useCoordinates
        )
    fun dragDestSetTargetList self targetList = (GtkWidgetClass.FFI.withPtr false &&&> GtkTargetListRecord.FFI.withOptPtr false ---> I) dragDestSetTargetList_ (self & targetList)
    fun dragDestSetTrackMotion self trackMotion = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) dragDestSetTrackMotion_ (self & trackMotion)
    fun dragDestUnset self = (GtkWidgetClass.FFI.withPtr false ---> I) dragDestUnset_ self
    fun dragGetData
      self
      (
        context,
        target,
        time
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDragContextClass.FFI.withPtr false
         &&&> GdkAtomRecord.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         ---> I
      )
        dragGetData_
        (
          self
           & context
           & target
           & time
        )
    fun dragHighlight self = (GtkWidgetClass.FFI.withPtr false ---> I) dragHighlight_ self
    fun dragSourceAddImageTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragSourceAddImageTargets_ self
    fun dragSourceAddTextTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragSourceAddTextTargets_ self
    fun dragSourceAddUriTargets self = (GtkWidgetClass.FFI.withPtr false ---> I) dragSourceAddUriTargets_ self
    fun dragSourceGetTargetList self = (GtkWidgetClass.FFI.withPtr false ---> GtkTargetListRecord.FFI.fromOptPtr false) dragSourceGetTargetList_ self before GtkWidgetClass.FFI.touchPtr self
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
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GdkModifierType.FFI.withVal
             &&&> GtkTargetEntryRecordCArrayN.FFI.withPtr 0
             &&&> GInt.FFI.withVal
             &&&> GdkDragAction.FFI.withVal
             ---> I
          )
            dragSourceSet_
            (
              self
               & startButtonMask
               & targets
               & nTargets
               & actions
            )
      in
        ()
      end
    fun dragSourceSetIconGicon self icon = (GtkWidgetClass.FFI.withPtr false &&&> GioIconClass.FFI.withPtr false ---> I) dragSourceSetIconGicon_ (self & icon)
    fun dragSourceSetIconName self iconName = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) dragSourceSetIconName_ (self & iconName)
    fun dragSourceSetIconPixbuf self pixbuf = (GtkWidgetClass.FFI.withPtr false &&&> GdkPixbufPixbufClass.FFI.withPtr false ---> I) dragSourceSetIconPixbuf_ (self & pixbuf)
    fun dragSourceSetIconStock self stockId = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) dragSourceSetIconStock_ (self & stockId)
    fun dragSourceSetTargetList self targetList = (GtkWidgetClass.FFI.withPtr false &&&> GtkTargetListRecord.FFI.withOptPtr false ---> I) dragSourceSetTargetList_ (self & targetList)
    fun dragSourceUnset self = (GtkWidgetClass.FFI.withPtr false ---> I) dragSourceUnset_ self
    fun dragUnhighlight self = (GtkWidgetClass.FFI.withPtr false ---> I) dragUnhighlight_ self
    fun draw self cr = (GtkWidgetClass.FFI.withPtr false &&&> CairoContextRecord.FFI.withPtr false ---> I) draw_ (self & cr)
    fun ensureStyle self = (GtkWidgetClass.FFI.withPtr false ---> I) ensureStyle_ self
    fun errorBell self = (GtkWidgetClass.FFI.withPtr false ---> I) errorBell_ self
    fun event self event = (GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) event_ (self & event)
    fun freezeChildNotify self = (GtkWidgetClass.FFI.withPtr false ---> I) freezeChildNotify_ self
    fun getAccessible self = (GtkWidgetClass.FFI.withPtr false ---> AtkObjectClass.FFI.fromPtr false) getAccessible_ self before GtkWidgetClass.FFI.touchPtr self
    fun getActionGroup self prefix = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GioActionGroupClass.FFI.fromOptPtr false) getActionGroup_ (self & prefix) before GtkWidgetClass.FFI.touchPtr self before Utf8.FFI.touchPtr prefix
    fun getAllocatedBaseline self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getAllocatedBaseline_ self
    fun getAllocatedHeight self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getAllocatedHeight_ self
    fun getAllocatedSize self =
      let
        val allocation
         & baseline
         & () =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GtkAllocationRecord.FFI.withNewPtr
             &&&> GInt.FFI.withRefVal
             ---> GtkAllocationRecord.FFI.fromPtr true
                   && GInt.FFI.fromVal
                   && I
          )
            getAllocatedSize_
            (
              self
               & ()
               & GInt.null
            )
      in
        (allocation, baseline)
      end
    fun getAllocatedWidth self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getAllocatedWidth_ self
    fun getAllocation self =
      let
        val allocation & () = (GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withNewPtr ---> GtkAllocationRecord.FFI.fromPtr true && I) getAllocation_ (self & ())
      in
        allocation
      end
    fun getAncestor self widgetType = (GtkWidgetClass.FFI.withPtr false &&&> GObjectType.FFI.withVal ---> GtkWidgetClass.FFI.fromOptPtr false) getAncestor_ (self & widgetType) before GtkWidgetClass.FFI.touchPtr self
    fun getAppPaintable self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAppPaintable_ self
    fun getCanDefault self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCanDefault_ self
    fun getCanFocus self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getCanFocus_ self
    fun getChildRequisition self =
      let
        val requisition & () = (GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I) getChildRequisition_ (self & ())
      in
        requisition
      end
    fun getChildVisible self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getChildVisible_ self
    fun getClip self =
      let
        val clip & () = (GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withNewPtr ---> GtkAllocationRecord.FFI.fromPtr true && I) getClip_ (self & ())
      in
        clip
      end
    fun getClipboard self selection = (GtkWidgetClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GtkClipboardClass.FFI.fromPtr false) getClipboard_ (self & selection) before GtkWidgetClass.FFI.touchPtr self before GdkAtomRecord.FFI.touchPtr selection
    fun getCompositeName self = (GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getCompositeName_ self
    fun getDeviceEnabled self device = (GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDeviceEnabled_ (self & device)
    fun getDeviceEvents self device = (GtkWidgetClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getDeviceEvents_ (self & device)
    fun getDirection self = (GtkWidgetClass.FFI.withPtr false ---> GtkTextDirection.FFI.fromVal) getDirection_ self
    fun getDisplay self = (GtkWidgetClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self before GtkWidgetClass.FFI.touchPtr self
    fun getDoubleBuffered self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDoubleBuffered_ self
    fun getEvents self = (GtkWidgetClass.FFI.withPtr false ---> GdkEventMask.FFI.fromVal) getEvents_ self
    fun getFocusOnClick self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getFocusOnClick_ self
    fun getFontMap self = (GtkWidgetClass.FFI.withPtr false ---> PangoFontMapClass.FFI.fromOptPtr false) getFontMap_ self before GtkWidgetClass.FFI.touchPtr self
    fun getFontOptions self = (GtkWidgetClass.FFI.withPtr false ---> CairoFontOptionsRecord.FFI.fromOptPtr false) getFontOptions_ self before GtkWidgetClass.FFI.touchPtr self
    fun getFrameClock self = (GtkWidgetClass.FFI.withPtr false ---> GdkFrameClockClass.FFI.fromOptPtr false) getFrameClock_ self before GtkWidgetClass.FFI.touchPtr self
    fun getHalign self = (GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal) getHalign_ self
    fun getHasTooltip self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasTooltip_ self
    fun getHasWindow self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHasWindow_ self
    fun getHexpand self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHexpand_ self
    fun getHexpandSet self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHexpandSet_ self
    fun getMapped self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMapped_ self
    fun getMarginBottom self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginBottom_ self
    fun getMarginEnd self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginEnd_ self
    fun getMarginLeft self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginLeft_ self
    fun getMarginRight self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginRight_ self
    fun getMarginStart self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginStart_ self
    fun getMarginTop self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getMarginTop_ self
    fun getModifierMask self intent = (GtkWidgetClass.FFI.withPtr false &&&> GdkModifierIntent.FFI.withVal ---> GdkModifierType.FFI.fromVal) getModifierMask_ (self & intent)
    fun getModifierStyle self = (GtkWidgetClass.FFI.withPtr false ---> GtkRcStyleClass.FFI.fromPtr false) getModifierStyle_ self before GtkWidgetClass.FFI.touchPtr self
    fun getName self = (GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GtkWidgetClass.FFI.touchPtr self
    fun getNoShowAll self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getNoShowAll_ self
    fun getOpacity self = (GtkWidgetClass.FFI.withPtr false ---> GDouble.FFI.fromVal) getOpacity_ self
    fun getPangoContext self = (GtkWidgetClass.FFI.withPtr false ---> PangoContextClass.FFI.fromPtr false) getPangoContext_ self before GtkWidgetClass.FFI.touchPtr self
    fun getParent self = (GtkWidgetClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getParent_ self before GtkWidgetClass.FFI.touchPtr self
    fun getParentWindow self = (GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getParentWindow_ self before GtkWidgetClass.FFI.touchPtr self
    fun getPath self = (GtkWidgetClass.FFI.withPtr false ---> GtkWidgetPathRecord.FFI.fromPtr false) getPath_ self before GtkWidgetClass.FFI.touchPtr self
    fun getPointer self =
      let
        val x
         & y
         & () =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPointer_
            (
              self
               & GInt.null
               & GInt.null
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
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeight_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (minimumHeight, naturalHeight)
      end
    fun getPreferredHeightAndBaselineForWidth self width =
      let
        val minimumHeight
         & naturalHeight
         & minimumBaseline
         & naturalBaseline
         & () =
          (
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
          )
            getPreferredHeightAndBaselineForWidth_
            (
              self
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
    fun getPreferredHeightForWidth self width =
      let
        val minimumHeight
         & naturalHeight
         & () =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredHeightForWidth_
            (
              self
               & width
               & GInt.null
               & GInt.null
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
            GtkWidgetClass.FFI.withPtr false
             &&&> GtkRequisitionRecord.FFI.withNewPtr
             &&&> GtkRequisitionRecord.FFI.withNewPtr
             ---> GtkRequisitionRecord.FFI.fromPtr true
                   && GtkRequisitionRecord.FFI.fromPtr true
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
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidth_
            (
              self
               & GInt.null
               & GInt.null
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
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPreferredWidthForHeight_
            (
              self
               & height
               & GInt.null
               & GInt.null
            )
      in
        (minimumWidth, naturalWidth)
      end
    fun getRealized self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRealized_ self
    fun getReceivesDefault self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getReceivesDefault_ self
    fun getRequestMode self = (GtkWidgetClass.FFI.withPtr false ---> GtkSizeRequestMode.FFI.fromVal) getRequestMode_ self
    fun getRequisition self =
      let
        val requisition & () = (GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I) getRequisition_ (self & ())
      in
        requisition
      end
    fun getRootWindow self = (GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getRootWindow_ self before GtkWidgetClass.FFI.touchPtr self
    fun getScaleFactor self = (GtkWidgetClass.FFI.withPtr false ---> GInt.FFI.fromVal) getScaleFactor_ self
    fun getScreen self = (GtkWidgetClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getScreen_ self before GtkWidgetClass.FFI.touchPtr self
    fun getSensitive self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSensitive_ self
    fun getSettings self = (GtkWidgetClass.FFI.withPtr false ---> GtkSettingsClass.FFI.fromPtr false) getSettings_ self before GtkWidgetClass.FFI.touchPtr self
    fun getSizeRequest self =
      let
        val width
         & height
         & () =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getSizeRequest_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (width, height)
      end
    fun getState self = (GtkWidgetClass.FFI.withPtr false ---> GtkStateType.FFI.fromVal) getState_ self
    fun getStateFlags self = (GtkWidgetClass.FFI.withPtr false ---> GtkStateFlags.FFI.fromVal) getStateFlags_ self
    fun getStyle self = (GtkWidgetClass.FFI.withPtr false ---> GtkStyleClass.FFI.fromPtr false) getStyle_ self before GtkWidgetClass.FFI.touchPtr self
    fun getStyleContext self = (GtkWidgetClass.FFI.withPtr false ---> GtkStyleContextClass.FFI.fromPtr false) getStyleContext_ self before GtkWidgetClass.FFI.touchPtr self
    fun getSupportMultidevice self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getSupportMultidevice_ self
    fun getTemplateChild self (widgetType, name) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GObjectType.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GObjectObjectClass.FFI.fromPtr false
      )
        getTemplateChild_
        (
          self
           & widgetType
           & name
        )
       before GtkWidgetClass.FFI.touchPtr self
       before Utf8.FFI.touchPtr name
    fun getTooltipMarkup self = (GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getTooltipMarkup_ self
    fun getTooltipText self = (GtkWidgetClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getTooltipText_ self
    fun getTooltipWindow self = (GtkWidgetClass.FFI.withPtr false ---> GtkWindowClass.FFI.fromPtr false) getTooltipWindow_ self before GtkWidgetClass.FFI.touchPtr self
    fun getToplevel self = (GtkWidgetClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getToplevel_ self before GtkWidgetClass.FFI.touchPtr self
    fun getValign self = (GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal) getValign_ self
    fun getValignWithBaseline self = (GtkWidgetClass.FFI.withPtr false ---> GtkAlign.FFI.fromVal) getValignWithBaseline_ self
    fun getVexpand self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVexpand_ self
    fun getVexpandSet self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVexpandSet_ self
    fun getVisible self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVisible_ self
    fun getVisual self = (GtkWidgetClass.FFI.withPtr false ---> GdkVisualClass.FFI.fromPtr false) getVisual_ self before GtkWidgetClass.FFI.touchPtr self
    fun getWindow self = (GtkWidgetClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ self before GtkWidgetClass.FFI.touchPtr self
    fun grabAdd self = (GtkWidgetClass.FFI.withPtr false ---> I) grabAdd_ self
    fun grabDefault self = (GtkWidgetClass.FFI.withPtr false ---> I) grabDefault_ self
    fun grabFocus self = (GtkWidgetClass.FFI.withPtr false ---> I) grabFocus_ self
    fun grabRemove self = (GtkWidgetClass.FFI.withPtr false ---> I) grabRemove_ self
    fun hasDefault self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasDefault_ self
    fun hasFocus self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasFocus_ self
    fun hasGrab self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasGrab_ self
    fun hasRcStyle self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasRcStyle_ self
    fun hasScreen self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasScreen_ self
    fun hasVisibleFocus self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasVisibleFocus_ self
    fun hide self = (GtkWidgetClass.FFI.withPtr false ---> I) hide_ self
    fun hideOnDelete self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) hideOnDelete_ self
    fun inDestruction self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) inDestruction_ self
    fun initTemplate self = (GtkWidgetClass.FFI.withPtr false ---> I) initTemplate_ self
    fun inputShapeCombineRegion self region = (GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I) inputShapeCombineRegion_ (self & region)
    fun insertActionGroup self (name, group) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GioActionGroupClass.FFI.withOptPtr false
         ---> I
      )
        insertActionGroup_
        (
          self
           & name
           & group
        )
    fun intersect self area =
      let
        val intersection & retVal =
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withPtr false
             &&&> GdkRectangleRecord.FFI.withNewPtr
             ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal
          )
            intersect_
            (
              self
               & area
               & ()
            )
      in
        if retVal then SOME intersection else NONE
      end
    fun isAncestor self ancestor = (GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isAncestor_ (self & ancestor)
    fun isComposited self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isComposited_ self
    fun isDrawable self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isDrawable_ self
    fun isFocus self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isFocus_ self
    fun isSensitive self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isSensitive_ self
    fun isToplevel self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isToplevel_ self
    fun isVisible self = (GtkWidgetClass.FFI.withPtr false ---> GBool.FFI.fromVal) isVisible_ self
    fun keynavFailed self direction = (GtkWidgetClass.FFI.withPtr false &&&> GtkDirectionType.FFI.withVal ---> GBool.FFI.fromVal) keynavFailed_ (self & direction)
    fun listActionPrefixes self = (GtkWidgetClass.FFI.withPtr false ---> Utf8CPtrArray.FFI.fromPtr 1) listActionPrefixes_ self before GtkWidgetClass.FFI.touchPtr self
    fun map self = (GtkWidgetClass.FFI.withPtr false ---> I) map_ self
    fun mnemonicActivate self groupCycling = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> GBool.FFI.fromVal) mnemonicActivate_ (self & groupCycling)
    fun modifyBase self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
      )
        modifyBase_
        (
          self
           & state
           & color
        )
    fun modifyBg self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
      )
        modifyBg_
        (
          self
           & state
           & color
        )
    fun modifyCursor self (primary, secondary) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
      )
        modifyCursor_
        (
          self
           & primary
           & secondary
        )
    fun modifyFg self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
      )
        modifyFg_
        (
          self
           & state
           & color
        )
    fun modifyFont self fontDesc = (GtkWidgetClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I) modifyFont_ (self & fontDesc)
    fun modifyStyle self style = (GtkWidgetClass.FFI.withPtr false &&&> GtkRcStyleClass.FFI.withPtr false ---> I) modifyStyle_ (self & style)
    fun modifyText self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateType.FFI.withVal
         &&&> GdkColorRecord.FFI.withOptPtr false
         ---> I
      )
        modifyText_
        (
          self
           & state
           & color
        )
    fun overrideBackgroundColor self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
      )
        overrideBackgroundColor_
        (
          self
           & state
           & color
        )
    fun overrideColor self (state, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
      )
        overrideColor_
        (
          self
           & state
           & color
        )
    fun overrideCursor self (cursor, secondaryCursor) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         &&&> GdkRgbaRecord.FFI.withOptPtr false
         ---> I
      )
        overrideCursor_
        (
          self
           & cursor
           & secondaryCursor
        )
    fun overrideFont self fontDesc = (GtkWidgetClass.FFI.withPtr false &&&> PangoFontDescriptionRecord.FFI.withOptPtr false ---> I) overrideFont_ (self & fontDesc)
    fun overrideSymbolicColor self (name, color) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GdkRgbaRecord.FFI.withOptPtr false
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
            GtkWidgetClass.FFI.withPtr false
             &&&> GUInt.FFI.withRefVal
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             ---> GUInt.FFI.fromVal
                   && Utf8.FFI.fromPtr ~1
                   && Utf8.FFI.fromPtr ~1
                   && I
          )
            path_
            (
              self
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
    fun queueAllocate self = (GtkWidgetClass.FFI.withPtr false ---> I) queueAllocate_ self
    fun queueComputeExpand self = (GtkWidgetClass.FFI.withPtr false ---> I) queueComputeExpand_ self
    fun queueDraw self = (GtkWidgetClass.FFI.withPtr false ---> I) queueDraw_ self
    fun queueDrawArea
      self
      (
        x,
        y,
        width,
        height
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun queueDrawRegion self region = (GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> I) queueDrawRegion_ (self & region)
    fun queueResize self = (GtkWidgetClass.FFI.withPtr false ---> I) queueResize_ self
    fun queueResizeNoRedraw self = (GtkWidgetClass.FFI.withPtr false ---> I) queueResizeNoRedraw_ self
    fun realize self = (GtkWidgetClass.FFI.withPtr false ---> I) realize_ self
    fun regionIntersect self region = (GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withPtr false ---> CairoRegionRecord.FFI.fromPtr true) regionIntersect_ (self & region)
    fun registerWindow self window = (GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) registerWindow_ (self & window)
    fun removeAccelerator
      self
      (
        accelGroup,
        accelKey,
        accelMods
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkAccelGroupClass.FFI.withPtr false
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> GBool.FFI.fromVal
      )
        removeAccelerator_
        (
          self
           & accelGroup
           & accelKey
           & accelMods
        )
    fun removeMnemonicLabel self label = (GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) removeMnemonicLabel_ (self & label)
    fun removeTickCallback self id = (GtkWidgetClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) removeTickCallback_ (self & id)
    fun renderIcon
      self
      (
        stockId,
        size,
        detail
      ) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withOptPtr 0
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
      )
        renderIcon_
        (
          self
           & stockId
           & size
           & detail
        )
    fun renderIconPixbuf self (stockId, size) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GInt.FFI.withVal
         ---> GdkPixbufPixbufClass.FFI.fromOptPtr true
      )
        renderIconPixbuf_
        (
          self
           & stockId
           & size
        )
    fun reparent self newParent = (GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) reparent_ (self & newParent)
    fun resetRcStyles self = (GtkWidgetClass.FFI.withPtr false ---> I) resetRcStyles_ self
    fun resetStyle self = (GtkWidgetClass.FFI.withPtr false ---> I) resetStyle_ self
    fun sendExpose self event = (GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GInt.FFI.fromVal) sendExpose_ (self & event)
    fun sendFocusChange self event = (GtkWidgetClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> GBool.FFI.fromVal) sendFocusChange_ (self & event)
    fun setAccelPath self (accelPath, accelGroup) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GtkAccelGroupClass.FFI.withOptPtr false
         ---> I
      )
        setAccelPath_
        (
          self
           & accelPath
           & accelGroup
        )
    fun setAllocation self allocation = (GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I) setAllocation_ (self & allocation)
    fun setAppPaintable self appPaintable = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAppPaintable_ (self & appPaintable)
    fun setCanDefault self canDefault = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCanDefault_ (self & canDefault)
    fun setCanFocus self canFocus = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setCanFocus_ (self & canFocus)
    fun setChildVisible self isVisible = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setChildVisible_ (self & isVisible)
    fun setClip self clip = (GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I) setClip_ (self & clip)
    fun setCompositeName self name = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setCompositeName_ (self & name)
    fun setDeviceEnabled self (device, enabled) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         ---> I
      )
        setDeviceEnabled_
        (
          self
           & device
           & enabled
        )
    fun setDeviceEvents self (device, events) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GdkDeviceClass.FFI.withPtr false
         &&&> GdkEventMask.FFI.withVal
         ---> I
      )
        setDeviceEvents_
        (
          self
           & device
           & events
        )
    fun setDirection self dir = (GtkWidgetClass.FFI.withPtr false &&&> GtkTextDirection.FFI.withVal ---> I) setDirection_ (self & dir)
    fun setDoubleBuffered self doubleBuffered = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDoubleBuffered_ (self & doubleBuffered)
    fun setEvents self events = (GtkWidgetClass.FFI.withPtr false &&&> GdkEventMask.FFI.withVal ---> I) setEvents_ (self & events)
    fun setFocusOnClick self focusOnClick = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setFocusOnClick_ (self & focusOnClick)
    fun setFontMap self fontMap = (GtkWidgetClass.FFI.withPtr false &&&> PangoFontMapClass.FFI.withOptPtr false ---> I) setFontMap_ (self & fontMap)
    fun setFontOptions self options = (GtkWidgetClass.FFI.withPtr false &&&> CairoFontOptionsRecord.FFI.withOptPtr false ---> I) setFontOptions_ (self & options)
    fun setHalign self align = (GtkWidgetClass.FFI.withPtr false &&&> GtkAlign.FFI.withVal ---> I) setHalign_ (self & align)
    fun setHasTooltip self hasTooltip = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasTooltip_ (self & hasTooltip)
    fun setHasWindow self hasWindow = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHasWindow_ (self & hasWindow)
    fun setHexpand self expand = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHexpand_ (self & expand)
    fun setHexpandSet self set = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHexpandSet_ (self & set)
    fun setMapped self mapped = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMapped_ (self & mapped)
    fun setMarginBottom self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginBottom_ (self & margin)
    fun setMarginEnd self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginEnd_ (self & margin)
    fun setMarginLeft self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginLeft_ (self & margin)
    fun setMarginRight self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginRight_ (self & margin)
    fun setMarginStart self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginStart_ (self & margin)
    fun setMarginTop self margin = (GtkWidgetClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setMarginTop_ (self & margin)
    fun setName self name = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setName_ (self & name)
    fun setNoShowAll self noShowAll = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setNoShowAll_ (self & noShowAll)
    fun setOpacity self opacity = (GtkWidgetClass.FFI.withPtr false &&&> GDouble.FFI.withVal ---> I) setOpacity_ (self & opacity)
    fun setParent self parent = (GtkWidgetClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setParent_ (self & parent)
    fun setParentWindow self parentWindow = (GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) setParentWindow_ (self & parentWindow)
    fun setRealized self realized = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRealized_ (self & realized)
    fun setReceivesDefault self receivesDefault = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setReceivesDefault_ (self & receivesDefault)
    fun setRedrawOnAllocate self redrawOnAllocate = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRedrawOnAllocate_ (self & redrawOnAllocate)
    fun setSensitive self sensitive = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSensitive_ (self & sensitive)
    fun setSizeRequest self (width, height) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setSizeRequest_
        (
          self
           & width
           & height
        )
    fun setState self state = (GtkWidgetClass.FFI.withPtr false &&&> GtkStateType.FFI.withVal ---> I) setState_ (self & state)
    fun setStateFlags self (flags, clear) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkStateFlags.FFI.withVal
         &&&> GBool.FFI.withVal
         ---> I
      )
        setStateFlags_
        (
          self
           & flags
           & clear
        )
    fun setStyle self style = (GtkWidgetClass.FFI.withPtr false &&&> GtkStyleClass.FFI.withOptPtr false ---> I) setStyle_ (self & style)
    fun setSupportMultidevice self supportMultidevice = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setSupportMultidevice_ (self & supportMultidevice)
    fun setTooltipMarkup self markup = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTooltipMarkup_ (self & markup)
    fun setTooltipText self text = (GtkWidgetClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTooltipText_ (self & text)
    fun setTooltipWindow self customWindow = (GtkWidgetClass.FFI.withPtr false &&&> GtkWindowClass.FFI.withOptPtr false ---> I) setTooltipWindow_ (self & customWindow)
    fun setValign self align = (GtkWidgetClass.FFI.withPtr false &&&> GtkAlign.FFI.withVal ---> I) setValign_ (self & align)
    fun setVexpand self expand = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVexpand_ (self & expand)
    fun setVexpandSet self set = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVexpandSet_ (self & set)
    fun setVisible self visible = (GtkWidgetClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVisible_ (self & visible)
    fun setVisual self visual = (GtkWidgetClass.FFI.withPtr false &&&> GdkVisualClass.FFI.withOptPtr false ---> I) setVisual_ (self & visual)
    fun setWindow self window = (GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr true ---> I) setWindow_ (self & window)
    fun shapeCombineRegion self region = (GtkWidgetClass.FFI.withPtr false &&&> CairoRegionRecord.FFI.withOptPtr false ---> I) shapeCombineRegion_ (self & region)
    fun show self = (GtkWidgetClass.FFI.withPtr false ---> I) show_ self
    fun showAll self = (GtkWidgetClass.FFI.withPtr false ---> I) showAll_ self
    fun showNow self = (GtkWidgetClass.FFI.withPtr false ---> I) showNow_ self
    fun sizeAllocate self allocation = (GtkWidgetClass.FFI.withPtr false &&&> GtkAllocationRecord.FFI.withPtr false ---> I) sizeAllocate_ (self & allocation)
    fun sizeAllocateWithBaseline self (allocation, baseline) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> GtkAllocationRecord.FFI.withPtr false
         &&&> GInt.FFI.withVal
         ---> I
      )
        sizeAllocateWithBaseline_
        (
          self
           & allocation
           & baseline
        )
    fun sizeRequest self =
      let
        val requisition & () = (GtkWidgetClass.FFI.withPtr false &&&> GtkRequisitionRecord.FFI.withNewPtr ---> GtkRequisitionRecord.FFI.fromPtr true && I) sizeRequest_ (self & ())
      in
        requisition
      end
    fun styleAttach self = (GtkWidgetClass.FFI.withPtr false ---> I) styleAttach_ self
    fun styleGetProperty self (propertyName, value) =
      (
        GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GObjectValueRecord.FFI.withPtr false
         ---> I
      )
        styleGetProperty_
        (
          self
           & propertyName
           & value
        )
    fun thawChildNotify self = (GtkWidgetClass.FFI.withPtr false ---> I) thawChildNotify_ self
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
          (
            GtkWidgetClass.FFI.withPtr false
             &&&> GtkWidgetClass.FFI.withPtr false
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            translateCoordinates_
            (
              self
               & destWidget
               & srcX
               & srcY
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (destX, destY) else NONE
      end
    fun triggerTooltipQuery self = (GtkWidgetClass.FFI.withPtr false ---> I) triggerTooltipQuery_ self
    fun unmap self = (GtkWidgetClass.FFI.withPtr false ---> I) unmap_ self
    fun unparent self = (GtkWidgetClass.FFI.withPtr false ---> I) unparent_ self
    fun unrealize self = (GtkWidgetClass.FFI.withPtr false ---> I) unrealize_ self
    fun unregisterWindow self window = (GtkWidgetClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> I) unregisterWindow_ (self & window)
    fun unsetStateFlags self flags = (GtkWidgetClass.FFI.withPtr false &&&> GtkStateFlags.FFI.withVal ---> I) unsetStateFlags_ (self & flags)
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
              context
               & data
               & info
               & time =>
                f
                  (
                    context,
                    data,
                    info,
                    time
                  )
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
                f
                  (
                    context,
                    x,
                    y,
                    data,
                    info,
                    time
                  )
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
                f
                  (
                    context,
                    x,
                    y,
                    time
                  )
          )
      fun dragEndSig f = signal "drag-end" (get 0w1 GdkDragContextClass.t ---> ret_void) f
      fun dragFailedSig f = signal "drag-failed" (get 0w1 GdkDragContextClass.t &&&> get 0w2 GtkDragResult.t ---> ret boolean) (fn context & result => f (context, result))
      fun dragLeaveSig f = signal "drag-leave" (get 0w1 GdkDragContextClass.t &&&> get 0w2 uint ---> ret_void) (fn context & time => f (context, time))
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
                f
                  (
                    context,
                    x,
                    y,
                    time
                  )
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
                f
                  (
                    x,
                    y,
                    keyboardMode,
                    tooltip
                  )
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
              data
               & info
               & time =>
                f
                  (
                    data,
                    info,
                    time
                  )
          )
      fun selectionNotifyEventSig f = signal "selection-notify-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean) f
      fun selectionReceivedSig f = signal "selection-received" (get 0w1 GtkSelectionDataRecord.t &&&> get 0w2 uint ---> ret_void) (fn data & time => f (data, time))
      fun selectionRequestEventSig f = signal "selection-request-event" (get 0w1 GdkEventSelectionRecord.t ---> ret boolean) f
      fun showSig f = signal "show" (void ---> ret_void) f
      fun showHelpSig f = signal "show-help" (get 0w1 GtkWidgetHelpType.t ---> ret boolean) f
      fun sizeAllocateSig f = signal "size-allocate" (get 0w1 GtkAllocationRecord.t ---> ret_void) f
      fun stateChangedSig f = signal "state-changed" (get 0w1 GtkStateType.t ---> ret_void) f
      fun stateFlagsChangedSig f = signal "state-flags-changed" (get 0w1 GtkStateFlags.t ---> ret_void) f
      fun styleSetSig f = signal "style-set" (get 0w1 GtkStyleClass.tOpt ---> ret_void) f
      fun styleUpdatedSig f = signal "style-updated" (void ---> ret_void) f
      fun touchEventSig f = signal "touch-event" (get 0w1 GdkEvent.t ---> ret boolean) f
      fun unmapSig f = signal "unmap" (void ---> ret_void) f
      fun unmapEventSig f = signal "unmap-event" (get 0w1 GdkEventAnyRecord.t ---> ret boolean) f
      fun unrealizeSig f = signal "unrealize" (void ---> ret_void) f
      fun visibilityNotifyEventSig f = signal "visibility-notify-event" (get 0w1 GdkEventVisibilityRecord.t ---> ret boolean) f
      fun windowStateEventSig f = signal "window-state-event" (get 0w1 GdkEventWindowStateRecord.t ---> ret boolean) f
    end
    local
      open ValueAccessor
    in
      val appPaintableProp =
        {
          name = "app-paintable",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val canDefaultProp =
        {
          name = "can-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val canFocusProp =
        {
          name = "can-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val compositeChildProp =
        {
          name = "composite-child",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => ignore,
          init = ignore
        }
      val doubleBufferedProp =
        {
          name = "double-buffered",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val eventsProp =
        {
          name = "events",
          gtype = fn () => C.gtype GdkEventMask.t (),
          get = fn _ => fn x => fn () => C.get GdkEventMask.t x,
          set = fn _ => fn x => C.set GdkEventMask.t x,
          init = fn x => C.set GdkEventMask.t x
        }
      val expandProp =
        {
          name = "expand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val focusOnClickProp =
        {
          name = "focus-on-click",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val halignProp =
        {
          name = "halign",
          gtype = fn () => C.gtype GtkAlign.t (),
          get = fn _ => fn x => fn () => C.get GtkAlign.t x,
          set = fn _ => fn x => C.set GtkAlign.t x,
          init = fn x => C.set GtkAlign.t x
        }
      val hasDefaultProp =
        {
          name = "has-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hasFocusProp =
        {
          name = "has-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hasTooltipProp =
        {
          name = "has-tooltip",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val heightRequestProp =
        {
          name = "height-request",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val hexpandProp =
        {
          name = "hexpand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val hexpandSetProp =
        {
          name = "hexpand-set",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val isFocusProp =
        {
          name = "is-focus",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val marginProp =
        {
          name = "margin",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginBottomProp =
        {
          name = "margin-bottom",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginEndProp =
        {
          name = "margin-end",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginLeftProp =
        {
          name = "margin-left",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginRightProp =
        {
          name = "margin-right",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginStartProp =
        {
          name = "margin-start",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val marginTopProp =
        {
          name = "margin-top",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val nameProp =
        {
          name = "name",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val noShowAllProp =
        {
          name = "no-show-all",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val opacityProp =
        {
          name = "opacity",
          gtype = fn () => C.gtype double (),
          get = fn _ => fn x => fn () => C.get double x,
          set = fn _ => fn x => C.set double x,
          init = fn x => C.set double x
        }
      val parentProp =
        {
          name = "parent",
          gtype = fn () => C.gtype GtkContainerClass.tOpt (),
          get = fn _ => fn x => fn () => C.get GtkContainerClass.tOpt x,
          set = fn _ => fn x => C.set GtkContainerClass.tOpt x,
          init = fn x => C.set GtkContainerClass.tOpt x
        }
      val receivesDefaultProp =
        {
          name = "receives-default",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val scaleFactorProp =
        {
          name = "scale-factor",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => ignore,
          init = ignore
        }
      val sensitiveProp =
        {
          name = "sensitive",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val styleProp =
        {
          name = "style",
          gtype = fn () => C.gtype GtkStyleClass.tOpt (),
          get = fn _ => fn x => fn () => C.get GtkStyleClass.tOpt x,
          set = fn _ => fn x => C.set GtkStyleClass.tOpt x,
          init = fn x => C.set GtkStyleClass.tOpt x
        }
      val tooltipMarkupProp =
        {
          name = "tooltip-markup",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val tooltipTextProp =
        {
          name = "tooltip-text",
          gtype = fn () => C.gtype stringOpt (),
          get = fn _ => fn x => fn () => C.get stringOpt x,
          set = fn _ => fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
      val valignProp =
        {
          name = "valign",
          gtype = fn () => C.gtype GtkAlign.t (),
          get = fn _ => fn x => fn () => C.get GtkAlign.t x,
          set = fn _ => fn x => C.set GtkAlign.t x,
          init = fn x => C.set GtkAlign.t x
        }
      val vexpandProp =
        {
          name = "vexpand",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val vexpandSetProp =
        {
          name = "vexpand-set",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val visibleProp =
        {
          name = "visible",
          gtype = fn () => C.gtype boolean (),
          get = fn _ => fn x => fn () => C.get boolean x,
          set = fn _ => fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val widthRequestProp =
        {
          name = "width-request",
          gtype = fn () => C.gtype int (),
          get = fn _ => fn x => fn () => C.get int x,
          set = fn _ => fn x => C.set int x,
          init = fn x => C.set int x
        }
      val windowProp =
        {
          name = "window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn _ => fn x => fn () => C.get GdkWindowClass.tOpt x,
          set = fn _ => ignore,
          init = ignore
        }
    end
  end
