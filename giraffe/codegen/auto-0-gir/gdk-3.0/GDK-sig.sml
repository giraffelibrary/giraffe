signature GDK =
  sig
    structure AnchorHints : GDK_ANCHOR_HINTS
    structure AppLaunchContextClass : GDK_APP_LAUNCH_CONTEXT_CLASS
    structure AtomRecord : GDK_ATOM_RECORD
    structure AxisFlags : GDK_AXIS_FLAGS
    structure AxisUse : GDK_AXIS_USE
    structure ByteOrder : GDK_BYTE_ORDER
    structure ColorRecord : GDK_COLOR_RECORD
    structure CrossingMode : GDK_CROSSING_MODE
    structure CursorClass : GDK_CURSOR_CLASS
    structure CursorType : GDK_CURSOR_TYPE
    structure DeviceClass : GDK_DEVICE_CLASS
    structure DeviceManagerClass : GDK_DEVICE_MANAGER_CLASS
    structure DevicePadClass : GDK_DEVICE_PAD_CLASS
    structure DevicePadFeature : GDK_DEVICE_PAD_FEATURE
    structure DeviceToolClass : GDK_DEVICE_TOOL_CLASS
    structure DeviceToolType : GDK_DEVICE_TOOL_TYPE
    structure DeviceType : GDK_DEVICE_TYPE
    structure DisplayClass : GDK_DISPLAY_CLASS
    structure DisplayManagerClass : GDK_DISPLAY_MANAGER_CLASS
    structure DragAction : GDK_DRAG_ACTION
    structure DragCancelReason : GDK_DRAG_CANCEL_REASON
    structure DragContextClass : GDK_DRAG_CONTEXT_CLASS
    structure DragProtocol : GDK_DRAG_PROTOCOL
    structure DrawingContextClass : GDK_DRAWING_CONTEXT_CLASS
    structure Event : GDK_EVENT
    structure EventMask : GDK_EVENT_MASK
    structure EventSequenceRecord : GDK_EVENT_SEQUENCE_RECORD
    structure EventType : GDK_EVENT_TYPE
    structure FilterReturn : GDK_FILTER_RETURN
    structure FrameClockClass : GDK_FRAME_CLOCK_CLASS
    structure FrameClockPhase : GDK_FRAME_CLOCK_PHASE
    structure FrameTimingsRecord : GDK_FRAME_TIMINGS_RECORD
    structure FullscreenMode : GDK_FULLSCREEN_MODE
    structure GLContextClass : GDK_G_L_CONTEXT_CLASS
    structure GLError : GDK_G_L_ERROR
    exception GLError of GLError.t
    structure GeometryRecord : GDK_GEOMETRY_RECORD
    structure GrabOwnership : GDK_GRAB_OWNERSHIP
    structure GrabStatus : GDK_GRAB_STATUS
    structure Gravity : GDK_GRAVITY
    structure InputMode : GDK_INPUT_MODE
    structure InputSource : GDK_INPUT_SOURCE
    structure KeymapClass : GDK_KEYMAP_CLASS
    structure KeymapKeyRecord : GDK_KEYMAP_KEY_RECORD
    structure ModifierIntent : GDK_MODIFIER_INTENT
    structure ModifierType : GDK_MODIFIER_TYPE
    structure MonitorClass : GDK_MONITOR_CLASS
    structure NotifyType : GDK_NOTIFY_TYPE
    structure OwnerChange : GDK_OWNER_CHANGE
    structure PointRecord : GDK_POINT_RECORD
    structure PropMode : GDK_PROP_MODE
    structure PropertyState : GDK_PROPERTY_STATE
    structure RgbaRecord : GDK_RGBA_RECORD
    structure RectangleRecord : GDK_RECTANGLE_RECORD
    structure ScreenClass : GDK_SCREEN_CLASS
    structure ScrollDirection : GDK_SCROLL_DIRECTION
    structure SeatClass : GDK_SEAT_CLASS
    structure SeatCapabilities : GDK_SEAT_CAPABILITIES
    structure SettingAction : GDK_SETTING_ACTION
    structure Status : GDK_STATUS
    structure SubpixelLayout : GDK_SUBPIXEL_LAYOUT
    structure TouchpadGesturePhase : GDK_TOUCHPAD_GESTURE_PHASE
    structure VisibilityState : GDK_VISIBILITY_STATE
    structure VisualClass : GDK_VISUAL_CLASS
    structure VisualType : GDK_VISUAL_TYPE
    structure WMDecoration : GDK_W_M_DECORATION
    structure WMFunction : GDK_W_M_FUNCTION
    structure WindowClass : GDK_WINDOW_CLASS
    structure WindowAttrRecord : GDK_WINDOW_ATTR_RECORD
    structure WindowAttributesType : GDK_WINDOW_ATTRIBUTES_TYPE
    structure WindowEdge : GDK_WINDOW_EDGE
    structure WindowHints : GDK_WINDOW_HINTS
    structure WindowState : GDK_WINDOW_STATE
    structure WindowType : GDK_WINDOW_TYPE
    structure WindowTypeHint : GDK_WINDOW_TYPE_HINT
    structure WindowWindowClass : GDK_WINDOW_WINDOW_CLASS
    structure AppLaunchContext :
      GDK_APP_LAUNCH_CONTEXT
        where type 'a class = 'a AppLaunchContextClass.class
        where type 'a screen_class = 'a ScreenClass.class
        where type 'a display_class = 'a DisplayClass.class
    structure Atom :
      GDK_ATOM
        where type t = AtomRecord.t
    structure Color :
      GDK_COLOR
        where type t = ColorRecord.t
    structure Cursor :
      GDK_CURSOR
        where type 'a class = 'a CursorClass.class
        where type cursor_type_t = CursorType.t
        where type 'a display_class = 'a DisplayClass.class
    structure Device :
      GDK_DEVICE
        where type 'a class = 'a DeviceClass.class
        where type grab_status_t = GrabStatus.t
        where type 'a cursor_class = 'a CursorClass.class
        where type event_mask_t = EventMask.t
        where type grab_ownership_t = GrabOwnership.t
        where type 'a window_class = 'a WindowClass.class
        where type axis_use_t = AxisUse.t
        where type modifier_type_t = ModifierType.t
        where type 'a screen_class = 'a ScreenClass.class
        where type axis_flags_t = AxisFlags.t
        where type 'a device_manager_class = 'a DeviceManagerClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type input_mode_t = InputMode.t
        where type input_source_t = InputSource.t
        where type 'a seat_class = 'a SeatClass.class
        where type 'a device_tool_class = 'a DeviceToolClass.class
        where type device_type_t = DeviceType.t
    structure DeviceManager :
      GDK_DEVICE_MANAGER
        where type 'a class = 'a DeviceManagerClass.class
        where type 'a device_class = 'a DeviceClass.class
        where type 'a display_class = 'a DisplayClass.class
    structure DevicePad :
      GDK_DEVICE_PAD
        where type 'a class = 'a DevicePadClass.class
        where type device_pad_feature_t = DevicePadFeature.t
    structure DeviceTool :
      GDK_DEVICE_TOOL
        where type 'a class = 'a DeviceToolClass.class
        where type axis_flags_t = AxisFlags.t
        where type device_tool_type_t = DeviceToolType.t
    structure AtomRecordCPtrArrayN :
      C_ARRAY
        where type elem = AtomRecord.t
    structure DisplayManager :
      GDK_DISPLAY_MANAGER
        where type 'a class = 'a DisplayManagerClass.class
        where type 'a display_class = 'a DisplayClass.class
    structure DragContext :
      GDK_DRAG_CONTEXT
        where type 'a class = 'a DragContextClass.class
        where type drag_protocol_t = DragProtocol.t
        where type 'a window_class = 'a WindowClass.class
        where type 'a device_class = 'a DeviceClass.class
        where type drag_action_t = DragAction.t
        where type drag_cancel_reason_t = DragCancelReason.t
    structure DrawingContext :
      GDK_DRAWING_CONTEXT
        where type 'a class = 'a DrawingContextClass.class
        where type 'a window_class = 'a WindowClass.class
    structure EventAnyRecord :
      GDK_EVENT_ANY_RECORD
        where type 'a event_union = 'a Event.union
    structure EventButtonRecord :
      GDK_EVENT_BUTTON_RECORD
        where type 'a event_union = 'a Event.union
    structure EventConfigureRecord :
      GDK_EVENT_CONFIGURE_RECORD
        where type 'a event_union = 'a Event.union
    structure EventCrossingRecord :
      GDK_EVENT_CROSSING_RECORD
        where type 'a event_union = 'a Event.union
    structure EventDNDRecord :
      GDK_EVENT_D_N_D_RECORD
        where type 'a event_union = 'a Event.union
    structure EventExposeRecord :
      GDK_EVENT_EXPOSE_RECORD
        where type 'a event_union = 'a Event.union
    structure EventFocusRecord :
      GDK_EVENT_FOCUS_RECORD
        where type 'a event_union = 'a Event.union
    structure EventGrabBrokenRecord :
      GDK_EVENT_GRAB_BROKEN_RECORD
        where type 'a event_union = 'a Event.union
    structure EventKeyRecord :
      GDK_EVENT_KEY_RECORD
        where type 'a event_union = 'a Event.union
    structure EventMotionRecord :
      GDK_EVENT_MOTION_RECORD
        where type 'a event_union = 'a Event.union
    structure EventOwnerChangeRecord :
      GDK_EVENT_OWNER_CHANGE_RECORD
        where type 'a event_union = 'a Event.union
    structure EventPadAxisRecord :
      GDK_EVENT_PAD_AXIS_RECORD
        where type 'a event_union = 'a Event.union
    structure EventPadButtonRecord :
      GDK_EVENT_PAD_BUTTON_RECORD
        where type 'a event_union = 'a Event.union
    structure EventPadGroupModeRecord :
      GDK_EVENT_PAD_GROUP_MODE_RECORD
        where type 'a event_union = 'a Event.union
    structure EventPropertyRecord :
      GDK_EVENT_PROPERTY_RECORD
        where type 'a event_union = 'a Event.union
    structure EventProximityRecord :
      GDK_EVENT_PROXIMITY_RECORD
        where type 'a event_union = 'a Event.union
    structure EventScrollRecord :
      GDK_EVENT_SCROLL_RECORD
        where type 'a event_union = 'a Event.union
    structure EventSelectionRecord :
      GDK_EVENT_SELECTION_RECORD
        where type 'a event_union = 'a Event.union
    structure EventSequence :
      GDK_EVENT_SEQUENCE
        where type t = EventSequenceRecord.t
    structure EventSettingRecord :
      GDK_EVENT_SETTING_RECORD
        where type 'a event_union = 'a Event.union
    structure EventTouchRecord :
      GDK_EVENT_TOUCH_RECORD
        where type 'a event_union = 'a Event.union
    structure EventTouchpadPinchRecord :
      GDK_EVENT_TOUCHPAD_PINCH_RECORD
        where type 'a event_union = 'a Event.union
    structure EventTouchpadSwipeRecord :
      GDK_EVENT_TOUCHPAD_SWIPE_RECORD
        where type 'a event_union = 'a Event.union
    structure EventVisibilityRecord :
      GDK_EVENT_VISIBILITY_RECORD
        where type 'a event_union = 'a Event.union
    structure EventWindowStateRecord :
      GDK_EVENT_WINDOW_STATE_RECORD
        where type 'a event_union = 'a Event.union
    structure FrameClock :
      GDK_FRAME_CLOCK
        where type 'a class = 'a FrameClockClass.class
        where type frame_timings_t = FrameTimingsRecord.t
        where type frame_clock_phase_t = FrameClockPhase.t
    structure FrameTimings :
      GDK_FRAME_TIMINGS
        where type t = FrameTimingsRecord.t
    structure GLContext :
      GDK_G_L_CONTEXT
        where type 'a class = 'a GLContextClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type 'a window_class = 'a WindowClass.class
    structure Geometry :
      GDK_GEOMETRY
        where type t = GeometryRecord.t
    structure KeymapKeyRecordCArrayN :
      C_ARRAY
        where type elem = KeymapKeyRecord.t
    structure KeymapKey :
      GDK_KEYMAP_KEY
        where type t = KeymapKeyRecord.t
    structure Monitor :
      GDK_MONITOR
        where type 'a class = 'a MonitorClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type subpixel_layout_t = SubpixelLayout.t
        where type rectangle_t = RectangleRecord.t
    structure Point :
      GDK_POINT
        where type t = PointRecord.t
    structure Rgba :
      GDK_RGBA
        where type t = RgbaRecord.t
    structure Rectangle :
      GDK_RECTANGLE
        where type t = RectangleRecord.t
    structure Screen :
      GDK_SCREEN
        where type 'a class = 'a ScreenClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type rectangle_t = RectangleRecord.t
        where type 'a window_class = 'a WindowClass.class
        where type 'a visual_class = 'a VisualClass.class
    structure Seat :
      GDK_SEAT
        where type 'a class = 'a SeatClass.class
        where type seat_capabilities_t = SeatCapabilities.t
        where type 'a device_class = 'a DeviceClass.class
        where type 'a device_tool_class = 'a DeviceToolClass.class
        where type 'a display_class = 'a DisplayClass.class
    structure Visual :
      GDK_VISUAL
        where type 'a class = 'a VisualClass.class
        where type byte_order_t = ByteOrder.t
        where type 'a screen_class = 'a ScreenClass.class
        where type visual_type_t = VisualType.t
    structure Window :
      GDK_WINDOW
        where type 'a class = 'a WindowClass.class
        where type window_attributes_type_t = WindowAttributesType.t
        where type window_attr_t = WindowAttrRecord.t
        where type window_edge_t = WindowEdge.t
        where type 'a g_l_context_class = 'a GLContextClass.class
        where type 'a drawing_context_class = 'a DrawingContextClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type drag_protocol_t = DragProtocol.t
        where type 'a frame_clock_class = 'a FrameClockClass.class
        where type modifier_type_t = ModifierType.t
        where type 'a screen_class = 'a ScreenClass.class
        where type window_state_t = WindowState.t
        where type 'a visual_class = 'a VisualClass.class
        where type window_type_t = WindowType.t
        where type rectangle_t = RectangleRecord.t
        where type color_t = ColorRecord.t
        where type rgba_t = RgbaRecord.t
        where type w_m_decoration_t = WMDecoration.t
        where type 'a device_class = 'a DeviceClass.class
        where type fullscreen_mode_t = FullscreenMode.t
        where type w_m_function_t = WMFunction.t
        where type window_hints_t = WindowHints.t
        where type geometry_t = GeometryRecord.t
        where type event_mask_t = EventMask.t
        where type input_source_t = InputSource.t
        where type window_type_hint_t = WindowTypeHint.t
        where type 'a event_union = 'a Event.union
        where type 'a cursor_class = 'a CursorClass.class
    structure WindowAttr :
      GDK_WINDOW_ATTR
        where type t = WindowAttrRecord.t
    structure VisualTypeCArrayN :
      C_ARRAY
        where type elem = VisualType.t
    structure Display :
      GDK_DISPLAY
        where type 'a class = 'a DisplayClass.class
        where type 'a device_class = 'a DeviceClass.class
        where type 'a app_launch_context_class = 'a AppLaunchContextClass.class
        where type 'a device_manager_class = 'a DeviceManagerClass.class
        where type modifier_type_t = ModifierType.t
        where type 'a event_union = 'a Event.union
        where type atom_t = AtomRecord.t
        where type atom_record_c_ptr_array_n_t = AtomRecordCPtrArrayN.t
        where type 'a window_class = 'a WindowClass.class
        where type 'a screen_class = 'a ScreenClass.class
        where type 'a monitor_class = 'a MonitorClass.class
        where type 'a seat_class = 'a SeatClass.class
    structure EventAny :
      GDK_EVENT_ANY
        where type t = EventAnyRecord.t
    structure EventButton :
      GDK_EVENT_BUTTON
        where type t = EventButtonRecord.t
    structure EventConfigure :
      GDK_EVENT_CONFIGURE
        where type t = EventConfigureRecord.t
    structure EventCrossing :
      GDK_EVENT_CROSSING
        where type t = EventCrossingRecord.t
    structure EventDND :
      GDK_EVENT_D_N_D
        where type t = EventDNDRecord.t
    structure EventExpose :
      GDK_EVENT_EXPOSE
        where type t = EventExposeRecord.t
    structure EventFocus :
      GDK_EVENT_FOCUS
        where type t = EventFocusRecord.t
    structure EventGrabBroken :
      GDK_EVENT_GRAB_BROKEN
        where type t = EventGrabBrokenRecord.t
    structure EventKey :
      GDK_EVENT_KEY
        where type t = EventKeyRecord.t
    structure EventMotion :
      GDK_EVENT_MOTION
        where type t = EventMotionRecord.t
    structure EventOwnerChange :
      GDK_EVENT_OWNER_CHANGE
        where type t = EventOwnerChangeRecord.t
    structure EventPadAxis :
      GDK_EVENT_PAD_AXIS
        where type t = EventPadAxisRecord.t
    structure EventPadButton :
      GDK_EVENT_PAD_BUTTON
        where type t = EventPadButtonRecord.t
    structure EventPadGroupMode :
      GDK_EVENT_PAD_GROUP_MODE
        where type t = EventPadGroupModeRecord.t
    structure EventProperty :
      GDK_EVENT_PROPERTY
        where type t = EventPropertyRecord.t
    structure EventProximity :
      GDK_EVENT_PROXIMITY
        where type t = EventProximityRecord.t
    structure EventScroll :
      GDK_EVENT_SCROLL
        where type t = EventScrollRecord.t
    structure EventSelection :
      GDK_EVENT_SELECTION
        where type t = EventSelectionRecord.t
    structure EventSetting :
      GDK_EVENT_SETTING
        where type t = EventSettingRecord.t
    structure EventTouch :
      GDK_EVENT_TOUCH
        where type t = EventTouchRecord.t
    structure EventTouchpadPinch :
      GDK_EVENT_TOUCHPAD_PINCH
        where type t = EventTouchpadPinchRecord.t
    structure EventTouchpadSwipe :
      GDK_EVENT_TOUCHPAD_SWIPE
        where type t = EventTouchpadSwipeRecord.t
    structure EventVisibility :
      GDK_EVENT_VISIBILITY
        where type t = EventVisibilityRecord.t
    structure EventWindowState :
      GDK_EVENT_WINDOW_STATE
        where type t = EventWindowStateRecord.t
    structure Keymap :
      GDK_KEYMAP
        where type 'a class = 'a KeymapClass.class
        where type 'a display_class = 'a DisplayClass.class
        where type keymap_key_record_c_array_n_t = KeymapKeyRecordCArrayN.t
        where type modifier_intent_t = ModifierIntent.t
        where type keymap_key_t = KeymapKeyRecord.t
        where type modifier_type_t = ModifierType.t
    val BUTTON_MIDDLE : LargeInt.int
    val BUTTON_PRIMARY : LargeInt.int
    val BUTTON_SECONDARY : LargeInt.int
    val CURRENT_TIME : LargeInt.int
    val EVENT_PROPAGATE : bool
    val EVENT_STOP : bool
    val KEY_0 : LargeInt.int
    val KEY_1 : LargeInt.int
    val KEY_2 : LargeInt.int
    val KEY_3 : LargeInt.int
    val KEY_3270_AltCursor : LargeInt.int
    val KEY_3270_Attn : LargeInt.int
    val KEY_3270_BackTab : LargeInt.int
    val KEY_3270_ChangeScreen : LargeInt.int
    val KEY_3270_Copy : LargeInt.int
    val KEY_3270_CursorBlink : LargeInt.int
    val KEY_3270_CursorSelect : LargeInt.int
    val KEY_3270_DeleteWord : LargeInt.int
    val KEY_3270_Duplicate : LargeInt.int
    val KEY_3270_Enter : LargeInt.int
    val KEY_3270_EraseEOF : LargeInt.int
    val KEY_3270_EraseInput : LargeInt.int
    val KEY_3270_ExSelect : LargeInt.int
    val KEY_3270_FieldMark : LargeInt.int
    val KEY_3270_Ident : LargeInt.int
    val KEY_3270_Jump : LargeInt.int
    val KEY_3270_KeyClick : LargeInt.int
    val KEY_3270_Left2 : LargeInt.int
    val KEY_3270_PA1 : LargeInt.int
    val KEY_3270_PA2 : LargeInt.int
    val KEY_3270_PA3 : LargeInt.int
    val KEY_3270_Play : LargeInt.int
    val KEY_3270_PrintScreen : LargeInt.int
    val KEY_3270_Quit : LargeInt.int
    val KEY_3270_Record : LargeInt.int
    val KEY_3270_Reset : LargeInt.int
    val KEY_3270_Right2 : LargeInt.int
    val KEY_3270_Rule : LargeInt.int
    val KEY_3270_Setup : LargeInt.int
    val KEY_3270_Test : LargeInt.int
    val KEY_4 : LargeInt.int
    val KEY_5 : LargeInt.int
    val KEY_6 : LargeInt.int
    val KEY_7 : LargeInt.int
    val KEY_8 : LargeInt.int
    val KEY_9 : LargeInt.int
    val KEY_A : LargeInt.int
    val KEY_AE : LargeInt.int
    val KEY_Aacute : LargeInt.int
    val KEY_Abelowdot : LargeInt.int
    val KEY_Abreve : LargeInt.int
    val KEY_Abreveacute : LargeInt.int
    val KEY_Abrevebelowdot : LargeInt.int
    val KEY_Abrevegrave : LargeInt.int
    val KEY_Abrevehook : LargeInt.int
    val KEY_Abrevetilde : LargeInt.int
    val KEY_AccessX_Enable : LargeInt.int
    val KEY_AccessX_Feedback_Enable : LargeInt.int
    val KEY_Acircumflex : LargeInt.int
    val KEY_Acircumflexacute : LargeInt.int
    val KEY_Acircumflexbelowdot : LargeInt.int
    val KEY_Acircumflexgrave : LargeInt.int
    val KEY_Acircumflexhook : LargeInt.int
    val KEY_Acircumflextilde : LargeInt.int
    val KEY_AddFavorite : LargeInt.int
    val KEY_Adiaeresis : LargeInt.int
    val KEY_Agrave : LargeInt.int
    val KEY_Ahook : LargeInt.int
    val KEY_Alt_L : LargeInt.int
    val KEY_Alt_R : LargeInt.int
    val KEY_Amacron : LargeInt.int
    val KEY_Aogonek : LargeInt.int
    val KEY_ApplicationLeft : LargeInt.int
    val KEY_ApplicationRight : LargeInt.int
    val KEY_Arabic_0 : LargeInt.int
    val KEY_Arabic_1 : LargeInt.int
    val KEY_Arabic_2 : LargeInt.int
    val KEY_Arabic_3 : LargeInt.int
    val KEY_Arabic_4 : LargeInt.int
    val KEY_Arabic_5 : LargeInt.int
    val KEY_Arabic_6 : LargeInt.int
    val KEY_Arabic_7 : LargeInt.int
    val KEY_Arabic_8 : LargeInt.int
    val KEY_Arabic_9 : LargeInt.int
    val KEY_Arabic_ain : LargeInt.int
    val KEY_Arabic_alef : LargeInt.int
    val KEY_Arabic_alefmaksura : LargeInt.int
    val KEY_Arabic_beh : LargeInt.int
    val KEY_Arabic_comma : LargeInt.int
    val KEY_Arabic_dad : LargeInt.int
    val KEY_Arabic_dal : LargeInt.int
    val KEY_Arabic_damma : LargeInt.int
    val KEY_Arabic_dammatan : LargeInt.int
    val KEY_Arabic_ddal : LargeInt.int
    val KEY_Arabic_farsi_yeh : LargeInt.int
    val KEY_Arabic_fatha : LargeInt.int
    val KEY_Arabic_fathatan : LargeInt.int
    val KEY_Arabic_feh : LargeInt.int
    val KEY_Arabic_fullstop : LargeInt.int
    val KEY_Arabic_gaf : LargeInt.int
    val KEY_Arabic_ghain : LargeInt.int
    val KEY_Arabic_ha : LargeInt.int
    val KEY_Arabic_hah : LargeInt.int
    val KEY_Arabic_hamza : LargeInt.int
    val KEY_Arabic_hamza_above : LargeInt.int
    val KEY_Arabic_hamza_below : LargeInt.int
    val KEY_Arabic_hamzaonalef : LargeInt.int
    val KEY_Arabic_hamzaonwaw : LargeInt.int
    val KEY_Arabic_hamzaonyeh : LargeInt.int
    val KEY_Arabic_hamzaunderalef : LargeInt.int
    val KEY_Arabic_heh : LargeInt.int
    val KEY_Arabic_heh_doachashmee : LargeInt.int
    val KEY_Arabic_heh_goal : LargeInt.int
    val KEY_Arabic_jeem : LargeInt.int
    val KEY_Arabic_jeh : LargeInt.int
    val KEY_Arabic_kaf : LargeInt.int
    val KEY_Arabic_kasra : LargeInt.int
    val KEY_Arabic_kasratan : LargeInt.int
    val KEY_Arabic_keheh : LargeInt.int
    val KEY_Arabic_khah : LargeInt.int
    val KEY_Arabic_lam : LargeInt.int
    val KEY_Arabic_madda_above : LargeInt.int
    val KEY_Arabic_maddaonalef : LargeInt.int
    val KEY_Arabic_meem : LargeInt.int
    val KEY_Arabic_noon : LargeInt.int
    val KEY_Arabic_noon_ghunna : LargeInt.int
    val KEY_Arabic_peh : LargeInt.int
    val KEY_Arabic_percent : LargeInt.int
    val KEY_Arabic_qaf : LargeInt.int
    val KEY_Arabic_question_mark : LargeInt.int
    val KEY_Arabic_ra : LargeInt.int
    val KEY_Arabic_rreh : LargeInt.int
    val KEY_Arabic_sad : LargeInt.int
    val KEY_Arabic_seen : LargeInt.int
    val KEY_Arabic_semicolon : LargeInt.int
    val KEY_Arabic_shadda : LargeInt.int
    val KEY_Arabic_sheen : LargeInt.int
    val KEY_Arabic_sukun : LargeInt.int
    val KEY_Arabic_superscript_alef : LargeInt.int
    val KEY_Arabic_switch : LargeInt.int
    val KEY_Arabic_tah : LargeInt.int
    val KEY_Arabic_tatweel : LargeInt.int
    val KEY_Arabic_tcheh : LargeInt.int
    val KEY_Arabic_teh : LargeInt.int
    val KEY_Arabic_tehmarbuta : LargeInt.int
    val KEY_Arabic_thal : LargeInt.int
    val KEY_Arabic_theh : LargeInt.int
    val KEY_Arabic_tteh : LargeInt.int
    val KEY_Arabic_veh : LargeInt.int
    val KEY_Arabic_waw : LargeInt.int
    val KEY_Arabic_yeh : LargeInt.int
    val KEY_Arabic_yeh_baree : LargeInt.int
    val KEY_Arabic_zah : LargeInt.int
    val KEY_Arabic_zain : LargeInt.int
    val KEY_Aring : LargeInt.int
    val KEY_Armenian_AT : LargeInt.int
    val KEY_Armenian_AYB : LargeInt.int
    val KEY_Armenian_BEN : LargeInt.int
    val KEY_Armenian_CHA : LargeInt.int
    val KEY_Armenian_DA : LargeInt.int
    val KEY_Armenian_DZA : LargeInt.int
    val KEY_Armenian_E : LargeInt.int
    val KEY_Armenian_FE : LargeInt.int
    val KEY_Armenian_GHAT : LargeInt.int
    val KEY_Armenian_GIM : LargeInt.int
    val KEY_Armenian_HI : LargeInt.int
    val KEY_Armenian_HO : LargeInt.int
    val KEY_Armenian_INI : LargeInt.int
    val KEY_Armenian_JE : LargeInt.int
    val KEY_Armenian_KE : LargeInt.int
    val KEY_Armenian_KEN : LargeInt.int
    val KEY_Armenian_KHE : LargeInt.int
    val KEY_Armenian_LYUN : LargeInt.int
    val KEY_Armenian_MEN : LargeInt.int
    val KEY_Armenian_NU : LargeInt.int
    val KEY_Armenian_O : LargeInt.int
    val KEY_Armenian_PE : LargeInt.int
    val KEY_Armenian_PYUR : LargeInt.int
    val KEY_Armenian_RA : LargeInt.int
    val KEY_Armenian_RE : LargeInt.int
    val KEY_Armenian_SE : LargeInt.int
    val KEY_Armenian_SHA : LargeInt.int
    val KEY_Armenian_TCHE : LargeInt.int
    val KEY_Armenian_TO : LargeInt.int
    val KEY_Armenian_TSA : LargeInt.int
    val KEY_Armenian_TSO : LargeInt.int
    val KEY_Armenian_TYUN : LargeInt.int
    val KEY_Armenian_VEV : LargeInt.int
    val KEY_Armenian_VO : LargeInt.int
    val KEY_Armenian_VYUN : LargeInt.int
    val KEY_Armenian_YECH : LargeInt.int
    val KEY_Armenian_ZA : LargeInt.int
    val KEY_Armenian_ZHE : LargeInt.int
    val KEY_Armenian_accent : LargeInt.int
    val KEY_Armenian_amanak : LargeInt.int
    val KEY_Armenian_apostrophe : LargeInt.int
    val KEY_Armenian_at : LargeInt.int
    val KEY_Armenian_ayb : LargeInt.int
    val KEY_Armenian_ben : LargeInt.int
    val KEY_Armenian_but : LargeInt.int
    val KEY_Armenian_cha : LargeInt.int
    val KEY_Armenian_da : LargeInt.int
    val KEY_Armenian_dza : LargeInt.int
    val KEY_Armenian_e : LargeInt.int
    val KEY_Armenian_exclam : LargeInt.int
    val KEY_Armenian_fe : LargeInt.int
    val KEY_Armenian_full_stop : LargeInt.int
    val KEY_Armenian_ghat : LargeInt.int
    val KEY_Armenian_gim : LargeInt.int
    val KEY_Armenian_hi : LargeInt.int
    val KEY_Armenian_ho : LargeInt.int
    val KEY_Armenian_hyphen : LargeInt.int
    val KEY_Armenian_ini : LargeInt.int
    val KEY_Armenian_je : LargeInt.int
    val KEY_Armenian_ke : LargeInt.int
    val KEY_Armenian_ken : LargeInt.int
    val KEY_Armenian_khe : LargeInt.int
    val KEY_Armenian_ligature_ew : LargeInt.int
    val KEY_Armenian_lyun : LargeInt.int
    val KEY_Armenian_men : LargeInt.int
    val KEY_Armenian_nu : LargeInt.int
    val KEY_Armenian_o : LargeInt.int
    val KEY_Armenian_paruyk : LargeInt.int
    val KEY_Armenian_pe : LargeInt.int
    val KEY_Armenian_pyur : LargeInt.int
    val KEY_Armenian_question : LargeInt.int
    val KEY_Armenian_ra : LargeInt.int
    val KEY_Armenian_re : LargeInt.int
    val KEY_Armenian_se : LargeInt.int
    val KEY_Armenian_separation_mark : LargeInt.int
    val KEY_Armenian_sha : LargeInt.int
    val KEY_Armenian_shesht : LargeInt.int
    val KEY_Armenian_tche : LargeInt.int
    val KEY_Armenian_to : LargeInt.int
    val KEY_Armenian_tsa : LargeInt.int
    val KEY_Armenian_tso : LargeInt.int
    val KEY_Armenian_tyun : LargeInt.int
    val KEY_Armenian_verjaket : LargeInt.int
    val KEY_Armenian_vev : LargeInt.int
    val KEY_Armenian_vo : LargeInt.int
    val KEY_Armenian_vyun : LargeInt.int
    val KEY_Armenian_yech : LargeInt.int
    val KEY_Armenian_yentamna : LargeInt.int
    val KEY_Armenian_za : LargeInt.int
    val KEY_Armenian_zhe : LargeInt.int
    val KEY_Atilde : LargeInt.int
    val KEY_AudibleBell_Enable : LargeInt.int
    val KEY_AudioCycleTrack : LargeInt.int
    val KEY_AudioForward : LargeInt.int
    val KEY_AudioLowerVolume : LargeInt.int
    val KEY_AudioMedia : LargeInt.int
    val KEY_AudioMicMute : LargeInt.int
    val KEY_AudioMute : LargeInt.int
    val KEY_AudioNext : LargeInt.int
    val KEY_AudioPause : LargeInt.int
    val KEY_AudioPlay : LargeInt.int
    val KEY_AudioPrev : LargeInt.int
    val KEY_AudioRaiseVolume : LargeInt.int
    val KEY_AudioRandomPlay : LargeInt.int
    val KEY_AudioRecord : LargeInt.int
    val KEY_AudioRepeat : LargeInt.int
    val KEY_AudioRewind : LargeInt.int
    val KEY_AudioStop : LargeInt.int
    val KEY_Away : LargeInt.int
    val KEY_B : LargeInt.int
    val KEY_Babovedot : LargeInt.int
    val KEY_Back : LargeInt.int
    val KEY_BackForward : LargeInt.int
    val KEY_BackSpace : LargeInt.int
    val KEY_Battery : LargeInt.int
    val KEY_Begin : LargeInt.int
    val KEY_Blue : LargeInt.int
    val KEY_Bluetooth : LargeInt.int
    val KEY_Book : LargeInt.int
    val KEY_BounceKeys_Enable : LargeInt.int
    val KEY_Break : LargeInt.int
    val KEY_BrightnessAdjust : LargeInt.int
    val KEY_Byelorussian_SHORTU : LargeInt.int
    val KEY_Byelorussian_shortu : LargeInt.int
    val KEY_C : LargeInt.int
    val KEY_CD : LargeInt.int
    val KEY_CH : LargeInt.int
    val KEY_C_H : LargeInt.int
    val KEY_C_h : LargeInt.int
    val KEY_Cabovedot : LargeInt.int
    val KEY_Cacute : LargeInt.int
    val KEY_Calculator : LargeInt.int
    val KEY_Calendar : LargeInt.int
    val KEY_Cancel : LargeInt.int
    val KEY_Caps_Lock : LargeInt.int
    val KEY_Ccaron : LargeInt.int
    val KEY_Ccedilla : LargeInt.int
    val KEY_Ccircumflex : LargeInt.int
    val KEY_Ch : LargeInt.int
    val KEY_Clear : LargeInt.int
    val KEY_ClearGrab : LargeInt.int
    val KEY_Close : LargeInt.int
    val KEY_Codeinput : LargeInt.int
    val KEY_ColonSign : LargeInt.int
    val KEY_Community : LargeInt.int
    val KEY_ContrastAdjust : LargeInt.int
    val KEY_Control_L : LargeInt.int
    val KEY_Control_R : LargeInt.int
    val KEY_Copy : LargeInt.int
    val KEY_CruzeiroSign : LargeInt.int
    val KEY_Cut : LargeInt.int
    val KEY_CycleAngle : LargeInt.int
    val KEY_Cyrillic_A : LargeInt.int
    val KEY_Cyrillic_BE : LargeInt.int
    val KEY_Cyrillic_CHE : LargeInt.int
    val KEY_Cyrillic_CHE_descender : LargeInt.int
    val KEY_Cyrillic_CHE_vertstroke : LargeInt.int
    val KEY_Cyrillic_DE : LargeInt.int
    val KEY_Cyrillic_DZHE : LargeInt.int
    val KEY_Cyrillic_E : LargeInt.int
    val KEY_Cyrillic_EF : LargeInt.int
    val KEY_Cyrillic_EL : LargeInt.int
    val KEY_Cyrillic_EM : LargeInt.int
    val KEY_Cyrillic_EN : LargeInt.int
    val KEY_Cyrillic_EN_descender : LargeInt.int
    val KEY_Cyrillic_ER : LargeInt.int
    val KEY_Cyrillic_ES : LargeInt.int
    val KEY_Cyrillic_GHE : LargeInt.int
    val KEY_Cyrillic_GHE_bar : LargeInt.int
    val KEY_Cyrillic_HA : LargeInt.int
    val KEY_Cyrillic_HARDSIGN : LargeInt.int
    val KEY_Cyrillic_HA_descender : LargeInt.int
    val KEY_Cyrillic_I : LargeInt.int
    val KEY_Cyrillic_IE : LargeInt.int
    val KEY_Cyrillic_IO : LargeInt.int
    val KEY_Cyrillic_I_macron : LargeInt.int
    val KEY_Cyrillic_JE : LargeInt.int
    val KEY_Cyrillic_KA : LargeInt.int
    val KEY_Cyrillic_KA_descender : LargeInt.int
    val KEY_Cyrillic_KA_vertstroke : LargeInt.int
    val KEY_Cyrillic_LJE : LargeInt.int
    val KEY_Cyrillic_NJE : LargeInt.int
    val KEY_Cyrillic_O : LargeInt.int
    val KEY_Cyrillic_O_bar : LargeInt.int
    val KEY_Cyrillic_PE : LargeInt.int
    val KEY_Cyrillic_SCHWA : LargeInt.int
    val KEY_Cyrillic_SHA : LargeInt.int
    val KEY_Cyrillic_SHCHA : LargeInt.int
    val KEY_Cyrillic_SHHA : LargeInt.int
    val KEY_Cyrillic_SHORTI : LargeInt.int
    val KEY_Cyrillic_SOFTSIGN : LargeInt.int
    val KEY_Cyrillic_TE : LargeInt.int
    val KEY_Cyrillic_TSE : LargeInt.int
    val KEY_Cyrillic_U : LargeInt.int
    val KEY_Cyrillic_U_macron : LargeInt.int
    val KEY_Cyrillic_U_straight : LargeInt.int
    val KEY_Cyrillic_U_straight_bar : LargeInt.int
    val KEY_Cyrillic_VE : LargeInt.int
    val KEY_Cyrillic_YA : LargeInt.int
    val KEY_Cyrillic_YERU : LargeInt.int
    val KEY_Cyrillic_YU : LargeInt.int
    val KEY_Cyrillic_ZE : LargeInt.int
    val KEY_Cyrillic_ZHE : LargeInt.int
    val KEY_Cyrillic_ZHE_descender : LargeInt.int
    val KEY_Cyrillic_a : LargeInt.int
    val KEY_Cyrillic_be : LargeInt.int
    val KEY_Cyrillic_che : LargeInt.int
    val KEY_Cyrillic_che_descender : LargeInt.int
    val KEY_Cyrillic_che_vertstroke : LargeInt.int
    val KEY_Cyrillic_de : LargeInt.int
    val KEY_Cyrillic_dzhe : LargeInt.int
    val KEY_Cyrillic_e : LargeInt.int
    val KEY_Cyrillic_ef : LargeInt.int
    val KEY_Cyrillic_el : LargeInt.int
    val KEY_Cyrillic_em : LargeInt.int
    val KEY_Cyrillic_en : LargeInt.int
    val KEY_Cyrillic_en_descender : LargeInt.int
    val KEY_Cyrillic_er : LargeInt.int
    val KEY_Cyrillic_es : LargeInt.int
    val KEY_Cyrillic_ghe : LargeInt.int
    val KEY_Cyrillic_ghe_bar : LargeInt.int
    val KEY_Cyrillic_ha : LargeInt.int
    val KEY_Cyrillic_ha_descender : LargeInt.int
    val KEY_Cyrillic_hardsign : LargeInt.int
    val KEY_Cyrillic_i : LargeInt.int
    val KEY_Cyrillic_i_macron : LargeInt.int
    val KEY_Cyrillic_ie : LargeInt.int
    val KEY_Cyrillic_io : LargeInt.int
    val KEY_Cyrillic_je : LargeInt.int
    val KEY_Cyrillic_ka : LargeInt.int
    val KEY_Cyrillic_ka_descender : LargeInt.int
    val KEY_Cyrillic_ka_vertstroke : LargeInt.int
    val KEY_Cyrillic_lje : LargeInt.int
    val KEY_Cyrillic_nje : LargeInt.int
    val KEY_Cyrillic_o : LargeInt.int
    val KEY_Cyrillic_o_bar : LargeInt.int
    val KEY_Cyrillic_pe : LargeInt.int
    val KEY_Cyrillic_schwa : LargeInt.int
    val KEY_Cyrillic_sha : LargeInt.int
    val KEY_Cyrillic_shcha : LargeInt.int
    val KEY_Cyrillic_shha : LargeInt.int
    val KEY_Cyrillic_shorti : LargeInt.int
    val KEY_Cyrillic_softsign : LargeInt.int
    val KEY_Cyrillic_te : LargeInt.int
    val KEY_Cyrillic_tse : LargeInt.int
    val KEY_Cyrillic_u : LargeInt.int
    val KEY_Cyrillic_u_macron : LargeInt.int
    val KEY_Cyrillic_u_straight : LargeInt.int
    val KEY_Cyrillic_u_straight_bar : LargeInt.int
    val KEY_Cyrillic_ve : LargeInt.int
    val KEY_Cyrillic_ya : LargeInt.int
    val KEY_Cyrillic_yeru : LargeInt.int
    val KEY_Cyrillic_yu : LargeInt.int
    val KEY_Cyrillic_ze : LargeInt.int
    val KEY_Cyrillic_zhe : LargeInt.int
    val KEY_Cyrillic_zhe_descender : LargeInt.int
    val KEY_D : LargeInt.int
    val KEY_DOS : LargeInt.int
    val KEY_Dabovedot : LargeInt.int
    val KEY_Dcaron : LargeInt.int
    val KEY_Delete : LargeInt.int
    val KEY_Display : LargeInt.int
    val KEY_Documents : LargeInt.int
    val KEY_DongSign : LargeInt.int
    val KEY_Down : LargeInt.int
    val KEY_Dstroke : LargeInt.int
    val KEY_E : LargeInt.int
    val KEY_ENG : LargeInt.int
    val KEY_ETH : LargeInt.int
    val KEY_EZH : LargeInt.int
    val KEY_Eabovedot : LargeInt.int
    val KEY_Eacute : LargeInt.int
    val KEY_Ebelowdot : LargeInt.int
    val KEY_Ecaron : LargeInt.int
    val KEY_Ecircumflex : LargeInt.int
    val KEY_Ecircumflexacute : LargeInt.int
    val KEY_Ecircumflexbelowdot : LargeInt.int
    val KEY_Ecircumflexgrave : LargeInt.int
    val KEY_Ecircumflexhook : LargeInt.int
    val KEY_Ecircumflextilde : LargeInt.int
    val KEY_EcuSign : LargeInt.int
    val KEY_Ediaeresis : LargeInt.int
    val KEY_Egrave : LargeInt.int
    val KEY_Ehook : LargeInt.int
    val KEY_Eisu_Shift : LargeInt.int
    val KEY_Eisu_toggle : LargeInt.int
    val KEY_Eject : LargeInt.int
    val KEY_Emacron : LargeInt.int
    val KEY_End : LargeInt.int
    val KEY_Eogonek : LargeInt.int
    val KEY_Escape : LargeInt.int
    val KEY_Eth : LargeInt.int
    val KEY_Etilde : LargeInt.int
    val KEY_EuroSign : LargeInt.int
    val KEY_Excel : LargeInt.int
    val KEY_Execute : LargeInt.int
    val KEY_Explorer : LargeInt.int
    val KEY_F : LargeInt.int
    val KEY_F1 : LargeInt.int
    val KEY_F10 : LargeInt.int
    val KEY_F11 : LargeInt.int
    val KEY_F12 : LargeInt.int
    val KEY_F13 : LargeInt.int
    val KEY_F14 : LargeInt.int
    val KEY_F15 : LargeInt.int
    val KEY_F16 : LargeInt.int
    val KEY_F17 : LargeInt.int
    val KEY_F18 : LargeInt.int
    val KEY_F19 : LargeInt.int
    val KEY_F2 : LargeInt.int
    val KEY_F20 : LargeInt.int
    val KEY_F21 : LargeInt.int
    val KEY_F22 : LargeInt.int
    val KEY_F23 : LargeInt.int
    val KEY_F24 : LargeInt.int
    val KEY_F25 : LargeInt.int
    val KEY_F26 : LargeInt.int
    val KEY_F27 : LargeInt.int
    val KEY_F28 : LargeInt.int
    val KEY_F29 : LargeInt.int
    val KEY_F3 : LargeInt.int
    val KEY_F30 : LargeInt.int
    val KEY_F31 : LargeInt.int
    val KEY_F32 : LargeInt.int
    val KEY_F33 : LargeInt.int
    val KEY_F34 : LargeInt.int
    val KEY_F35 : LargeInt.int
    val KEY_F4 : LargeInt.int
    val KEY_F5 : LargeInt.int
    val KEY_F6 : LargeInt.int
    val KEY_F7 : LargeInt.int
    val KEY_F8 : LargeInt.int
    val KEY_F9 : LargeInt.int
    val KEY_FFrancSign : LargeInt.int
    val KEY_Fabovedot : LargeInt.int
    val KEY_Farsi_0 : LargeInt.int
    val KEY_Farsi_1 : LargeInt.int
    val KEY_Farsi_2 : LargeInt.int
    val KEY_Farsi_3 : LargeInt.int
    val KEY_Farsi_4 : LargeInt.int
    val KEY_Farsi_5 : LargeInt.int
    val KEY_Farsi_6 : LargeInt.int
    val KEY_Farsi_7 : LargeInt.int
    val KEY_Farsi_8 : LargeInt.int
    val KEY_Farsi_9 : LargeInt.int
    val KEY_Farsi_yeh : LargeInt.int
    val KEY_Favorites : LargeInt.int
    val KEY_Finance : LargeInt.int
    val KEY_Find : LargeInt.int
    val KEY_First_Virtual_Screen : LargeInt.int
    val KEY_Forward : LargeInt.int
    val KEY_FrameBack : LargeInt.int
    val KEY_FrameForward : LargeInt.int
    val KEY_G : LargeInt.int
    val KEY_Gabovedot : LargeInt.int
    val KEY_Game : LargeInt.int
    val KEY_Gbreve : LargeInt.int
    val KEY_Gcaron : LargeInt.int
    val KEY_Gcedilla : LargeInt.int
    val KEY_Gcircumflex : LargeInt.int
    val KEY_Georgian_an : LargeInt.int
    val KEY_Georgian_ban : LargeInt.int
    val KEY_Georgian_can : LargeInt.int
    val KEY_Georgian_char : LargeInt.int
    val KEY_Georgian_chin : LargeInt.int
    val KEY_Georgian_cil : LargeInt.int
    val KEY_Georgian_don : LargeInt.int
    val KEY_Georgian_en : LargeInt.int
    val KEY_Georgian_fi : LargeInt.int
    val KEY_Georgian_gan : LargeInt.int
    val KEY_Georgian_ghan : LargeInt.int
    val KEY_Georgian_hae : LargeInt.int
    val KEY_Georgian_har : LargeInt.int
    val KEY_Georgian_he : LargeInt.int
    val KEY_Georgian_hie : LargeInt.int
    val KEY_Georgian_hoe : LargeInt.int
    val KEY_Georgian_in : LargeInt.int
    val KEY_Georgian_jhan : LargeInt.int
    val KEY_Georgian_jil : LargeInt.int
    val KEY_Georgian_kan : LargeInt.int
    val KEY_Georgian_khar : LargeInt.int
    val KEY_Georgian_las : LargeInt.int
    val KEY_Georgian_man : LargeInt.int
    val KEY_Georgian_nar : LargeInt.int
    val KEY_Georgian_on : LargeInt.int
    val KEY_Georgian_par : LargeInt.int
    val KEY_Georgian_phar : LargeInt.int
    val KEY_Georgian_qar : LargeInt.int
    val KEY_Georgian_rae : LargeInt.int
    val KEY_Georgian_san : LargeInt.int
    val KEY_Georgian_shin : LargeInt.int
    val KEY_Georgian_tan : LargeInt.int
    val KEY_Georgian_tar : LargeInt.int
    val KEY_Georgian_un : LargeInt.int
    val KEY_Georgian_vin : LargeInt.int
    val KEY_Georgian_we : LargeInt.int
    val KEY_Georgian_xan : LargeInt.int
    val KEY_Georgian_zen : LargeInt.int
    val KEY_Georgian_zhar : LargeInt.int
    val KEY_Go : LargeInt.int
    val KEY_Greek_ALPHA : LargeInt.int
    val KEY_Greek_ALPHAaccent : LargeInt.int
    val KEY_Greek_BETA : LargeInt.int
    val KEY_Greek_CHI : LargeInt.int
    val KEY_Greek_DELTA : LargeInt.int
    val KEY_Greek_EPSILON : LargeInt.int
    val KEY_Greek_EPSILONaccent : LargeInt.int
    val KEY_Greek_ETA : LargeInt.int
    val KEY_Greek_ETAaccent : LargeInt.int
    val KEY_Greek_GAMMA : LargeInt.int
    val KEY_Greek_IOTA : LargeInt.int
    val KEY_Greek_IOTAaccent : LargeInt.int
    val KEY_Greek_IOTAdiaeresis : LargeInt.int
    val KEY_Greek_IOTAdieresis : LargeInt.int
    val KEY_Greek_KAPPA : LargeInt.int
    val KEY_Greek_LAMBDA : LargeInt.int
    val KEY_Greek_LAMDA : LargeInt.int
    val KEY_Greek_MU : LargeInt.int
    val KEY_Greek_NU : LargeInt.int
    val KEY_Greek_OMEGA : LargeInt.int
    val KEY_Greek_OMEGAaccent : LargeInt.int
    val KEY_Greek_OMICRON : LargeInt.int
    val KEY_Greek_OMICRONaccent : LargeInt.int
    val KEY_Greek_PHI : LargeInt.int
    val KEY_Greek_PI : LargeInt.int
    val KEY_Greek_PSI : LargeInt.int
    val KEY_Greek_RHO : LargeInt.int
    val KEY_Greek_SIGMA : LargeInt.int
    val KEY_Greek_TAU : LargeInt.int
    val KEY_Greek_THETA : LargeInt.int
    val KEY_Greek_UPSILON : LargeInt.int
    val KEY_Greek_UPSILONaccent : LargeInt.int
    val KEY_Greek_UPSILONdieresis : LargeInt.int
    val KEY_Greek_XI : LargeInt.int
    val KEY_Greek_ZETA : LargeInt.int
    val KEY_Greek_accentdieresis : LargeInt.int
    val KEY_Greek_alpha : LargeInt.int
    val KEY_Greek_alphaaccent : LargeInt.int
    val KEY_Greek_beta : LargeInt.int
    val KEY_Greek_chi : LargeInt.int
    val KEY_Greek_delta : LargeInt.int
    val KEY_Greek_epsilon : LargeInt.int
    val KEY_Greek_epsilonaccent : LargeInt.int
    val KEY_Greek_eta : LargeInt.int
    val KEY_Greek_etaaccent : LargeInt.int
    val KEY_Greek_finalsmallsigma : LargeInt.int
    val KEY_Greek_gamma : LargeInt.int
    val KEY_Greek_horizbar : LargeInt.int
    val KEY_Greek_iota : LargeInt.int
    val KEY_Greek_iotaaccent : LargeInt.int
    val KEY_Greek_iotaaccentdieresis : LargeInt.int
    val KEY_Greek_iotadieresis : LargeInt.int
    val KEY_Greek_kappa : LargeInt.int
    val KEY_Greek_lambda : LargeInt.int
    val KEY_Greek_lamda : LargeInt.int
    val KEY_Greek_mu : LargeInt.int
    val KEY_Greek_nu : LargeInt.int
    val KEY_Greek_omega : LargeInt.int
    val KEY_Greek_omegaaccent : LargeInt.int
    val KEY_Greek_omicron : LargeInt.int
    val KEY_Greek_omicronaccent : LargeInt.int
    val KEY_Greek_phi : LargeInt.int
    val KEY_Greek_pi : LargeInt.int
    val KEY_Greek_psi : LargeInt.int
    val KEY_Greek_rho : LargeInt.int
    val KEY_Greek_sigma : LargeInt.int
    val KEY_Greek_switch : LargeInt.int
    val KEY_Greek_tau : LargeInt.int
    val KEY_Greek_theta : LargeInt.int
    val KEY_Greek_upsilon : LargeInt.int
    val KEY_Greek_upsilonaccent : LargeInt.int
    val KEY_Greek_upsilonaccentdieresis : LargeInt.int
    val KEY_Greek_upsilondieresis : LargeInt.int
    val KEY_Greek_xi : LargeInt.int
    val KEY_Greek_zeta : LargeInt.int
    val KEY_Green : LargeInt.int
    val KEY_H : LargeInt.int
    val KEY_Hangul : LargeInt.int
    val KEY_Hangul_A : LargeInt.int
    val KEY_Hangul_AE : LargeInt.int
    val KEY_Hangul_AraeA : LargeInt.int
    val KEY_Hangul_AraeAE : LargeInt.int
    val KEY_Hangul_Banja : LargeInt.int
    val KEY_Hangul_Cieuc : LargeInt.int
    val KEY_Hangul_Codeinput : LargeInt.int
    val KEY_Hangul_Dikeud : LargeInt.int
    val KEY_Hangul_E : LargeInt.int
    val KEY_Hangul_EO : LargeInt.int
    val KEY_Hangul_EU : LargeInt.int
    val KEY_Hangul_End : LargeInt.int
    val KEY_Hangul_Hanja : LargeInt.int
    val KEY_Hangul_Hieuh : LargeInt.int
    val KEY_Hangul_I : LargeInt.int
    val KEY_Hangul_Ieung : LargeInt.int
    val KEY_Hangul_J_Cieuc : LargeInt.int
    val KEY_Hangul_J_Dikeud : LargeInt.int
    val KEY_Hangul_J_Hieuh : LargeInt.int
    val KEY_Hangul_J_Ieung : LargeInt.int
    val KEY_Hangul_J_Jieuj : LargeInt.int
    val KEY_Hangul_J_Khieuq : LargeInt.int
    val KEY_Hangul_J_Kiyeog : LargeInt.int
    val KEY_Hangul_J_KiyeogSios : LargeInt.int
    val KEY_Hangul_J_KkogjiDalrinIeung : LargeInt.int
    val KEY_Hangul_J_Mieum : LargeInt.int
    val KEY_Hangul_J_Nieun : LargeInt.int
    val KEY_Hangul_J_NieunHieuh : LargeInt.int
    val KEY_Hangul_J_NieunJieuj : LargeInt.int
    val KEY_Hangul_J_PanSios : LargeInt.int
    val KEY_Hangul_J_Phieuf : LargeInt.int
    val KEY_Hangul_J_Pieub : LargeInt.int
    val KEY_Hangul_J_PieubSios : LargeInt.int
    val KEY_Hangul_J_Rieul : LargeInt.int
    val KEY_Hangul_J_RieulHieuh : LargeInt.int
    val KEY_Hangul_J_RieulKiyeog : LargeInt.int
    val KEY_Hangul_J_RieulMieum : LargeInt.int
    val KEY_Hangul_J_RieulPhieuf : LargeInt.int
    val KEY_Hangul_J_RieulPieub : LargeInt.int
    val KEY_Hangul_J_RieulSios : LargeInt.int
    val KEY_Hangul_J_RieulTieut : LargeInt.int
    val KEY_Hangul_J_Sios : LargeInt.int
    val KEY_Hangul_J_SsangKiyeog : LargeInt.int
    val KEY_Hangul_J_SsangSios : LargeInt.int
    val KEY_Hangul_J_Tieut : LargeInt.int
    val KEY_Hangul_J_YeorinHieuh : LargeInt.int
    val KEY_Hangul_Jamo : LargeInt.int
    val KEY_Hangul_Jeonja : LargeInt.int
    val KEY_Hangul_Jieuj : LargeInt.int
    val KEY_Hangul_Khieuq : LargeInt.int
    val KEY_Hangul_Kiyeog : LargeInt.int
    val KEY_Hangul_KiyeogSios : LargeInt.int
    val KEY_Hangul_KkogjiDalrinIeung : LargeInt.int
    val KEY_Hangul_Mieum : LargeInt.int
    val KEY_Hangul_MultipleCandidate : LargeInt.int
    val KEY_Hangul_Nieun : LargeInt.int
    val KEY_Hangul_NieunHieuh : LargeInt.int
    val KEY_Hangul_NieunJieuj : LargeInt.int
    val KEY_Hangul_O : LargeInt.int
    val KEY_Hangul_OE : LargeInt.int
    val KEY_Hangul_PanSios : LargeInt.int
    val KEY_Hangul_Phieuf : LargeInt.int
    val KEY_Hangul_Pieub : LargeInt.int
    val KEY_Hangul_PieubSios : LargeInt.int
    val KEY_Hangul_PostHanja : LargeInt.int
    val KEY_Hangul_PreHanja : LargeInt.int
    val KEY_Hangul_PreviousCandidate : LargeInt.int
    val KEY_Hangul_Rieul : LargeInt.int
    val KEY_Hangul_RieulHieuh : LargeInt.int
    val KEY_Hangul_RieulKiyeog : LargeInt.int
    val KEY_Hangul_RieulMieum : LargeInt.int
    val KEY_Hangul_RieulPhieuf : LargeInt.int
    val KEY_Hangul_RieulPieub : LargeInt.int
    val KEY_Hangul_RieulSios : LargeInt.int
    val KEY_Hangul_RieulTieut : LargeInt.int
    val KEY_Hangul_RieulYeorinHieuh : LargeInt.int
    val KEY_Hangul_Romaja : LargeInt.int
    val KEY_Hangul_SingleCandidate : LargeInt.int
    val KEY_Hangul_Sios : LargeInt.int
    val KEY_Hangul_Special : LargeInt.int
    val KEY_Hangul_SsangDikeud : LargeInt.int
    val KEY_Hangul_SsangJieuj : LargeInt.int
    val KEY_Hangul_SsangKiyeog : LargeInt.int
    val KEY_Hangul_SsangPieub : LargeInt.int
    val KEY_Hangul_SsangSios : LargeInt.int
    val KEY_Hangul_Start : LargeInt.int
    val KEY_Hangul_SunkyeongeumMieum : LargeInt.int
    val KEY_Hangul_SunkyeongeumPhieuf : LargeInt.int
    val KEY_Hangul_SunkyeongeumPieub : LargeInt.int
    val KEY_Hangul_Tieut : LargeInt.int
    val KEY_Hangul_U : LargeInt.int
    val KEY_Hangul_WA : LargeInt.int
    val KEY_Hangul_WAE : LargeInt.int
    val KEY_Hangul_WE : LargeInt.int
    val KEY_Hangul_WEO : LargeInt.int
    val KEY_Hangul_WI : LargeInt.int
    val KEY_Hangul_YA : LargeInt.int
    val KEY_Hangul_YAE : LargeInt.int
    val KEY_Hangul_YE : LargeInt.int
    val KEY_Hangul_YEO : LargeInt.int
    val KEY_Hangul_YI : LargeInt.int
    val KEY_Hangul_YO : LargeInt.int
    val KEY_Hangul_YU : LargeInt.int
    val KEY_Hangul_YeorinHieuh : LargeInt.int
    val KEY_Hangul_switch : LargeInt.int
    val KEY_Hankaku : LargeInt.int
    val KEY_Hcircumflex : LargeInt.int
    val KEY_Hebrew_switch : LargeInt.int
    val KEY_Help : LargeInt.int
    val KEY_Henkan : LargeInt.int
    val KEY_Henkan_Mode : LargeInt.int
    val KEY_Hibernate : LargeInt.int
    val KEY_Hiragana : LargeInt.int
    val KEY_Hiragana_Katakana : LargeInt.int
    val KEY_History : LargeInt.int
    val KEY_Home : LargeInt.int
    val KEY_HomePage : LargeInt.int
    val KEY_HotLinks : LargeInt.int
    val KEY_Hstroke : LargeInt.int
    val KEY_Hyper_L : LargeInt.int
    val KEY_Hyper_R : LargeInt.int
    val KEY_I : LargeInt.int
    val KEY_ISO_Center_Object : LargeInt.int
    val KEY_ISO_Continuous_Underline : LargeInt.int
    val KEY_ISO_Discontinuous_Underline : LargeInt.int
    val KEY_ISO_Emphasize : LargeInt.int
    val KEY_ISO_Enter : LargeInt.int
    val KEY_ISO_Fast_Cursor_Down : LargeInt.int
    val KEY_ISO_Fast_Cursor_Left : LargeInt.int
    val KEY_ISO_Fast_Cursor_Right : LargeInt.int
    val KEY_ISO_Fast_Cursor_Up : LargeInt.int
    val KEY_ISO_First_Group : LargeInt.int
    val KEY_ISO_First_Group_Lock : LargeInt.int
    val KEY_ISO_Group_Latch : LargeInt.int
    val KEY_ISO_Group_Lock : LargeInt.int
    val KEY_ISO_Group_Shift : LargeInt.int
    val KEY_ISO_Last_Group : LargeInt.int
    val KEY_ISO_Last_Group_Lock : LargeInt.int
    val KEY_ISO_Left_Tab : LargeInt.int
    val KEY_ISO_Level2_Latch : LargeInt.int
    val KEY_ISO_Level3_Latch : LargeInt.int
    val KEY_ISO_Level3_Lock : LargeInt.int
    val KEY_ISO_Level3_Shift : LargeInt.int
    val KEY_ISO_Level5_Latch : LargeInt.int
    val KEY_ISO_Level5_Lock : LargeInt.int
    val KEY_ISO_Level5_Shift : LargeInt.int
    val KEY_ISO_Lock : LargeInt.int
    val KEY_ISO_Move_Line_Down : LargeInt.int
    val KEY_ISO_Move_Line_Up : LargeInt.int
    val KEY_ISO_Next_Group : LargeInt.int
    val KEY_ISO_Next_Group_Lock : LargeInt.int
    val KEY_ISO_Partial_Line_Down : LargeInt.int
    val KEY_ISO_Partial_Line_Up : LargeInt.int
    val KEY_ISO_Partial_Space_Left : LargeInt.int
    val KEY_ISO_Partial_Space_Right : LargeInt.int
    val KEY_ISO_Prev_Group : LargeInt.int
    val KEY_ISO_Prev_Group_Lock : LargeInt.int
    val KEY_ISO_Release_Both_Margins : LargeInt.int
    val KEY_ISO_Release_Margin_Left : LargeInt.int
    val KEY_ISO_Release_Margin_Right : LargeInt.int
    val KEY_ISO_Set_Margin_Left : LargeInt.int
    val KEY_ISO_Set_Margin_Right : LargeInt.int
    val KEY_Iabovedot : LargeInt.int
    val KEY_Iacute : LargeInt.int
    val KEY_Ibelowdot : LargeInt.int
    val KEY_Ibreve : LargeInt.int
    val KEY_Icircumflex : LargeInt.int
    val KEY_Idiaeresis : LargeInt.int
    val KEY_Igrave : LargeInt.int
    val KEY_Ihook : LargeInt.int
    val KEY_Imacron : LargeInt.int
    val KEY_Insert : LargeInt.int
    val KEY_Iogonek : LargeInt.int
    val KEY_Itilde : LargeInt.int
    val KEY_J : LargeInt.int
    val KEY_Jcircumflex : LargeInt.int
    val KEY_K : LargeInt.int
    val KEY_KP_0 : LargeInt.int
    val KEY_KP_1 : LargeInt.int
    val KEY_KP_2 : LargeInt.int
    val KEY_KP_3 : LargeInt.int
    val KEY_KP_4 : LargeInt.int
    val KEY_KP_5 : LargeInt.int
    val KEY_KP_6 : LargeInt.int
    val KEY_KP_7 : LargeInt.int
    val KEY_KP_8 : LargeInt.int
    val KEY_KP_9 : LargeInt.int
    val KEY_KP_Add : LargeInt.int
    val KEY_KP_Begin : LargeInt.int
    val KEY_KP_Decimal : LargeInt.int
    val KEY_KP_Delete : LargeInt.int
    val KEY_KP_Divide : LargeInt.int
    val KEY_KP_Down : LargeInt.int
    val KEY_KP_End : LargeInt.int
    val KEY_KP_Enter : LargeInt.int
    val KEY_KP_Equal : LargeInt.int
    val KEY_KP_F1 : LargeInt.int
    val KEY_KP_F2 : LargeInt.int
    val KEY_KP_F3 : LargeInt.int
    val KEY_KP_F4 : LargeInt.int
    val KEY_KP_Home : LargeInt.int
    val KEY_KP_Insert : LargeInt.int
    val KEY_KP_Left : LargeInt.int
    val KEY_KP_Multiply : LargeInt.int
    val KEY_KP_Next : LargeInt.int
    val KEY_KP_Page_Down : LargeInt.int
    val KEY_KP_Page_Up : LargeInt.int
    val KEY_KP_Prior : LargeInt.int
    val KEY_KP_Right : LargeInt.int
    val KEY_KP_Separator : LargeInt.int
    val KEY_KP_Space : LargeInt.int
    val KEY_KP_Subtract : LargeInt.int
    val KEY_KP_Tab : LargeInt.int
    val KEY_KP_Up : LargeInt.int
    val KEY_Kana_Lock : LargeInt.int
    val KEY_Kana_Shift : LargeInt.int
    val KEY_Kanji : LargeInt.int
    val KEY_Kanji_Bangou : LargeInt.int
    val KEY_Katakana : LargeInt.int
    val KEY_KbdBrightnessDown : LargeInt.int
    val KEY_KbdBrightnessUp : LargeInt.int
    val KEY_KbdLightOnOff : LargeInt.int
    val KEY_Kcedilla : LargeInt.int
    val KEY_Korean_Won : LargeInt.int
    val KEY_L : LargeInt.int
    val KEY_L1 : LargeInt.int
    val KEY_L10 : LargeInt.int
    val KEY_L2 : LargeInt.int
    val KEY_L3 : LargeInt.int
    val KEY_L4 : LargeInt.int
    val KEY_L5 : LargeInt.int
    val KEY_L6 : LargeInt.int
    val KEY_L7 : LargeInt.int
    val KEY_L8 : LargeInt.int
    val KEY_L9 : LargeInt.int
    val KEY_Lacute : LargeInt.int
    val KEY_Last_Virtual_Screen : LargeInt.int
    val KEY_Launch0 : LargeInt.int
    val KEY_Launch1 : LargeInt.int
    val KEY_Launch2 : LargeInt.int
    val KEY_Launch3 : LargeInt.int
    val KEY_Launch4 : LargeInt.int
    val KEY_Launch5 : LargeInt.int
    val KEY_Launch6 : LargeInt.int
    val KEY_Launch7 : LargeInt.int
    val KEY_Launch8 : LargeInt.int
    val KEY_Launch9 : LargeInt.int
    val KEY_LaunchA : LargeInt.int
    val KEY_LaunchB : LargeInt.int
    val KEY_LaunchC : LargeInt.int
    val KEY_LaunchD : LargeInt.int
    val KEY_LaunchE : LargeInt.int
    val KEY_LaunchF : LargeInt.int
    val KEY_Lbelowdot : LargeInt.int
    val KEY_Lcaron : LargeInt.int
    val KEY_Lcedilla : LargeInt.int
    val KEY_Left : LargeInt.int
    val KEY_LightBulb : LargeInt.int
    val KEY_Linefeed : LargeInt.int
    val KEY_LiraSign : LargeInt.int
    val KEY_LogGrabInfo : LargeInt.int
    val KEY_LogOff : LargeInt.int
    val KEY_LogWindowTree : LargeInt.int
    val KEY_Lstroke : LargeInt.int
    val KEY_M : LargeInt.int
    val KEY_Mabovedot : LargeInt.int
    val KEY_Macedonia_DSE : LargeInt.int
    val KEY_Macedonia_GJE : LargeInt.int
    val KEY_Macedonia_KJE : LargeInt.int
    val KEY_Macedonia_dse : LargeInt.int
    val KEY_Macedonia_gje : LargeInt.int
    val KEY_Macedonia_kje : LargeInt.int
    val KEY_Mae_Koho : LargeInt.int
    val KEY_Mail : LargeInt.int
    val KEY_MailForward : LargeInt.int
    val KEY_Market : LargeInt.int
    val KEY_Massyo : LargeInt.int
    val KEY_Meeting : LargeInt.int
    val KEY_Memo : LargeInt.int
    val KEY_Menu : LargeInt.int
    val KEY_MenuKB : LargeInt.int
    val KEY_MenuPB : LargeInt.int
    val KEY_Messenger : LargeInt.int
    val KEY_Meta_L : LargeInt.int
    val KEY_Meta_R : LargeInt.int
    val KEY_MillSign : LargeInt.int
    val KEY_ModeLock : LargeInt.int
    val KEY_Mode_switch : LargeInt.int
    val KEY_MonBrightnessDown : LargeInt.int
    val KEY_MonBrightnessUp : LargeInt.int
    val KEY_MouseKeys_Accel_Enable : LargeInt.int
    val KEY_MouseKeys_Enable : LargeInt.int
    val KEY_Muhenkan : LargeInt.int
    val KEY_Multi_key : LargeInt.int
    val KEY_MultipleCandidate : LargeInt.int
    val KEY_Music : LargeInt.int
    val KEY_MyComputer : LargeInt.int
    val KEY_MySites : LargeInt.int
    val KEY_N : LargeInt.int
    val KEY_Nacute : LargeInt.int
    val KEY_NairaSign : LargeInt.int
    val KEY_Ncaron : LargeInt.int
    val KEY_Ncedilla : LargeInt.int
    val KEY_New : LargeInt.int
    val KEY_NewSheqelSign : LargeInt.int
    val KEY_News : LargeInt.int
    val KEY_Next : LargeInt.int
    val KEY_Next_VMode : LargeInt.int
    val KEY_Next_Virtual_Screen : LargeInt.int
    val KEY_Ntilde : LargeInt.int
    val KEY_Num_Lock : LargeInt.int
    val KEY_O : LargeInt.int
    val KEY_OE : LargeInt.int
    val KEY_Oacute : LargeInt.int
    val KEY_Obarred : LargeInt.int
    val KEY_Obelowdot : LargeInt.int
    val KEY_Ocaron : LargeInt.int
    val KEY_Ocircumflex : LargeInt.int
    val KEY_Ocircumflexacute : LargeInt.int
    val KEY_Ocircumflexbelowdot : LargeInt.int
    val KEY_Ocircumflexgrave : LargeInt.int
    val KEY_Ocircumflexhook : LargeInt.int
    val KEY_Ocircumflextilde : LargeInt.int
    val KEY_Odiaeresis : LargeInt.int
    val KEY_Odoubleacute : LargeInt.int
    val KEY_OfficeHome : LargeInt.int
    val KEY_Ograve : LargeInt.int
    val KEY_Ohook : LargeInt.int
    val KEY_Ohorn : LargeInt.int
    val KEY_Ohornacute : LargeInt.int
    val KEY_Ohornbelowdot : LargeInt.int
    val KEY_Ohorngrave : LargeInt.int
    val KEY_Ohornhook : LargeInt.int
    val KEY_Ohorntilde : LargeInt.int
    val KEY_Omacron : LargeInt.int
    val KEY_Ooblique : LargeInt.int
    val KEY_Open : LargeInt.int
    val KEY_OpenURL : LargeInt.int
    val KEY_Option : LargeInt.int
    val KEY_Oslash : LargeInt.int
    val KEY_Otilde : LargeInt.int
    val KEY_Overlay1_Enable : LargeInt.int
    val KEY_Overlay2_Enable : LargeInt.int
    val KEY_P : LargeInt.int
    val KEY_Pabovedot : LargeInt.int
    val KEY_Page_Down : LargeInt.int
    val KEY_Page_Up : LargeInt.int
    val KEY_Paste : LargeInt.int
    val KEY_Pause : LargeInt.int
    val KEY_PesetaSign : LargeInt.int
    val KEY_Phone : LargeInt.int
    val KEY_Pictures : LargeInt.int
    val KEY_Pointer_Accelerate : LargeInt.int
    val KEY_Pointer_Button1 : LargeInt.int
    val KEY_Pointer_Button2 : LargeInt.int
    val KEY_Pointer_Button3 : LargeInt.int
    val KEY_Pointer_Button4 : LargeInt.int
    val KEY_Pointer_Button5 : LargeInt.int
    val KEY_Pointer_Button_Dflt : LargeInt.int
    val KEY_Pointer_DblClick1 : LargeInt.int
    val KEY_Pointer_DblClick2 : LargeInt.int
    val KEY_Pointer_DblClick3 : LargeInt.int
    val KEY_Pointer_DblClick4 : LargeInt.int
    val KEY_Pointer_DblClick5 : LargeInt.int
    val KEY_Pointer_DblClick_Dflt : LargeInt.int
    val KEY_Pointer_DfltBtnNext : LargeInt.int
    val KEY_Pointer_DfltBtnPrev : LargeInt.int
    val KEY_Pointer_Down : LargeInt.int
    val KEY_Pointer_DownLeft : LargeInt.int
    val KEY_Pointer_DownRight : LargeInt.int
    val KEY_Pointer_Drag1 : LargeInt.int
    val KEY_Pointer_Drag2 : LargeInt.int
    val KEY_Pointer_Drag3 : LargeInt.int
    val KEY_Pointer_Drag4 : LargeInt.int
    val KEY_Pointer_Drag5 : LargeInt.int
    val KEY_Pointer_Drag_Dflt : LargeInt.int
    val KEY_Pointer_EnableKeys : LargeInt.int
    val KEY_Pointer_Left : LargeInt.int
    val KEY_Pointer_Right : LargeInt.int
    val KEY_Pointer_Up : LargeInt.int
    val KEY_Pointer_UpLeft : LargeInt.int
    val KEY_Pointer_UpRight : LargeInt.int
    val KEY_PowerDown : LargeInt.int
    val KEY_PowerOff : LargeInt.int
    val KEY_Prev_VMode : LargeInt.int
    val KEY_Prev_Virtual_Screen : LargeInt.int
    val KEY_PreviousCandidate : LargeInt.int
    val KEY_Print : LargeInt.int
    val KEY_Prior : LargeInt.int
    val KEY_Q : LargeInt.int
    val KEY_R : LargeInt.int
    val KEY_R1 : LargeInt.int
    val KEY_R10 : LargeInt.int
    val KEY_R11 : LargeInt.int
    val KEY_R12 : LargeInt.int
    val KEY_R13 : LargeInt.int
    val KEY_R14 : LargeInt.int
    val KEY_R15 : LargeInt.int
    val KEY_R2 : LargeInt.int
    val KEY_R3 : LargeInt.int
    val KEY_R4 : LargeInt.int
    val KEY_R5 : LargeInt.int
    val KEY_R6 : LargeInt.int
    val KEY_R7 : LargeInt.int
    val KEY_R8 : LargeInt.int
    val KEY_R9 : LargeInt.int
    val KEY_Racute : LargeInt.int
    val KEY_Rcaron : LargeInt.int
    val KEY_Rcedilla : LargeInt.int
    val KEY_Red : LargeInt.int
    val KEY_Redo : LargeInt.int
    val KEY_Refresh : LargeInt.int
    val KEY_Reload : LargeInt.int
    val KEY_RepeatKeys_Enable : LargeInt.int
    val KEY_Reply : LargeInt.int
    val KEY_Return : LargeInt.int
    val KEY_Right : LargeInt.int
    val KEY_RockerDown : LargeInt.int
    val KEY_RockerEnter : LargeInt.int
    val KEY_RockerUp : LargeInt.int
    val KEY_Romaji : LargeInt.int
    val KEY_RotateWindows : LargeInt.int
    val KEY_RotationKB : LargeInt.int
    val KEY_RotationPB : LargeInt.int
    val KEY_RupeeSign : LargeInt.int
    val KEY_S : LargeInt.int
    val KEY_SCHWA : LargeInt.int
    val KEY_Sabovedot : LargeInt.int
    val KEY_Sacute : LargeInt.int
    val KEY_Save : LargeInt.int
    val KEY_Scaron : LargeInt.int
    val KEY_Scedilla : LargeInt.int
    val KEY_Scircumflex : LargeInt.int
    val KEY_ScreenSaver : LargeInt.int
    val KEY_ScrollClick : LargeInt.int
    val KEY_ScrollDown : LargeInt.int
    val KEY_ScrollUp : LargeInt.int
    val KEY_Scroll_Lock : LargeInt.int
    val KEY_Search : LargeInt.int
    val KEY_Select : LargeInt.int
    val KEY_SelectButton : LargeInt.int
    val KEY_Send : LargeInt.int
    val KEY_Serbian_DJE : LargeInt.int
    val KEY_Serbian_DZE : LargeInt.int
    val KEY_Serbian_JE : LargeInt.int
    val KEY_Serbian_LJE : LargeInt.int
    val KEY_Serbian_NJE : LargeInt.int
    val KEY_Serbian_TSHE : LargeInt.int
    val KEY_Serbian_dje : LargeInt.int
    val KEY_Serbian_dze : LargeInt.int
    val KEY_Serbian_je : LargeInt.int
    val KEY_Serbian_lje : LargeInt.int
    val KEY_Serbian_nje : LargeInt.int
    val KEY_Serbian_tshe : LargeInt.int
    val KEY_Shift_L : LargeInt.int
    val KEY_Shift_Lock : LargeInt.int
    val KEY_Shift_R : LargeInt.int
    val KEY_Shop : LargeInt.int
    val KEY_SingleCandidate : LargeInt.int
    val KEY_Sinh_a : LargeInt.int
    val KEY_Sinh_aa : LargeInt.int
    val KEY_Sinh_aa2 : LargeInt.int
    val KEY_Sinh_ae : LargeInt.int
    val KEY_Sinh_ae2 : LargeInt.int
    val KEY_Sinh_aee : LargeInt.int
    val KEY_Sinh_aee2 : LargeInt.int
    val KEY_Sinh_ai : LargeInt.int
    val KEY_Sinh_ai2 : LargeInt.int
    val KEY_Sinh_al : LargeInt.int
    val KEY_Sinh_au : LargeInt.int
    val KEY_Sinh_au2 : LargeInt.int
    val KEY_Sinh_ba : LargeInt.int
    val KEY_Sinh_bha : LargeInt.int
    val KEY_Sinh_ca : LargeInt.int
    val KEY_Sinh_cha : LargeInt.int
    val KEY_Sinh_dda : LargeInt.int
    val KEY_Sinh_ddha : LargeInt.int
    val KEY_Sinh_dha : LargeInt.int
    val KEY_Sinh_dhha : LargeInt.int
    val KEY_Sinh_e : LargeInt.int
    val KEY_Sinh_e2 : LargeInt.int
    val KEY_Sinh_ee : LargeInt.int
    val KEY_Sinh_ee2 : LargeInt.int
    val KEY_Sinh_fa : LargeInt.int
    val KEY_Sinh_ga : LargeInt.int
    val KEY_Sinh_gha : LargeInt.int
    val KEY_Sinh_h2 : LargeInt.int
    val KEY_Sinh_ha : LargeInt.int
    val KEY_Sinh_i : LargeInt.int
    val KEY_Sinh_i2 : LargeInt.int
    val KEY_Sinh_ii : LargeInt.int
    val KEY_Sinh_ii2 : LargeInt.int
    val KEY_Sinh_ja : LargeInt.int
    val KEY_Sinh_jha : LargeInt.int
    val KEY_Sinh_jnya : LargeInt.int
    val KEY_Sinh_ka : LargeInt.int
    val KEY_Sinh_kha : LargeInt.int
    val KEY_Sinh_kunddaliya : LargeInt.int
    val KEY_Sinh_la : LargeInt.int
    val KEY_Sinh_lla : LargeInt.int
    val KEY_Sinh_lu : LargeInt.int
    val KEY_Sinh_lu2 : LargeInt.int
    val KEY_Sinh_luu : LargeInt.int
    val KEY_Sinh_luu2 : LargeInt.int
    val KEY_Sinh_ma : LargeInt.int
    val KEY_Sinh_mba : LargeInt.int
    val KEY_Sinh_na : LargeInt.int
    val KEY_Sinh_ndda : LargeInt.int
    val KEY_Sinh_ndha : LargeInt.int
    val KEY_Sinh_ng : LargeInt.int
    val KEY_Sinh_ng2 : LargeInt.int
    val KEY_Sinh_nga : LargeInt.int
    val KEY_Sinh_nja : LargeInt.int
    val KEY_Sinh_nna : LargeInt.int
    val KEY_Sinh_nya : LargeInt.int
    val KEY_Sinh_o : LargeInt.int
    val KEY_Sinh_o2 : LargeInt.int
    val KEY_Sinh_oo : LargeInt.int
    val KEY_Sinh_oo2 : LargeInt.int
    val KEY_Sinh_pa : LargeInt.int
    val KEY_Sinh_pha : LargeInt.int
    val KEY_Sinh_ra : LargeInt.int
    val KEY_Sinh_ri : LargeInt.int
    val KEY_Sinh_rii : LargeInt.int
    val KEY_Sinh_ru2 : LargeInt.int
    val KEY_Sinh_ruu2 : LargeInt.int
    val KEY_Sinh_sa : LargeInt.int
    val KEY_Sinh_sha : LargeInt.int
    val KEY_Sinh_ssha : LargeInt.int
    val KEY_Sinh_tha : LargeInt.int
    val KEY_Sinh_thha : LargeInt.int
    val KEY_Sinh_tta : LargeInt.int
    val KEY_Sinh_ttha : LargeInt.int
    val KEY_Sinh_u : LargeInt.int
    val KEY_Sinh_u2 : LargeInt.int
    val KEY_Sinh_uu : LargeInt.int
    val KEY_Sinh_uu2 : LargeInt.int
    val KEY_Sinh_va : LargeInt.int
    val KEY_Sinh_ya : LargeInt.int
    val KEY_Sleep : LargeInt.int
    val KEY_SlowKeys_Enable : LargeInt.int
    val KEY_Spell : LargeInt.int
    val KEY_SplitScreen : LargeInt.int
    val KEY_Standby : LargeInt.int
    val KEY_Start : LargeInt.int
    val KEY_StickyKeys_Enable : LargeInt.int
    val KEY_Stop : LargeInt.int
    val KEY_Subtitle : LargeInt.int
    val KEY_Super_L : LargeInt.int
    val KEY_Super_R : LargeInt.int
    val KEY_Support : LargeInt.int
    val KEY_Suspend : LargeInt.int
    val KEY_Switch_VT_1 : LargeInt.int
    val KEY_Switch_VT_10 : LargeInt.int
    val KEY_Switch_VT_11 : LargeInt.int
    val KEY_Switch_VT_12 : LargeInt.int
    val KEY_Switch_VT_2 : LargeInt.int
    val KEY_Switch_VT_3 : LargeInt.int
    val KEY_Switch_VT_4 : LargeInt.int
    val KEY_Switch_VT_5 : LargeInt.int
    val KEY_Switch_VT_6 : LargeInt.int
    val KEY_Switch_VT_7 : LargeInt.int
    val KEY_Switch_VT_8 : LargeInt.int
    val KEY_Switch_VT_9 : LargeInt.int
    val KEY_Sys_Req : LargeInt.int
    val KEY_T : LargeInt.int
    val KEY_THORN : LargeInt.int
    val KEY_Tab : LargeInt.int
    val KEY_Tabovedot : LargeInt.int
    val KEY_TaskPane : LargeInt.int
    val KEY_Tcaron : LargeInt.int
    val KEY_Tcedilla : LargeInt.int
    val KEY_Terminal : LargeInt.int
    val KEY_Terminate_Server : LargeInt.int
    val KEY_Thai_baht : LargeInt.int
    val KEY_Thai_bobaimai : LargeInt.int
    val KEY_Thai_chochan : LargeInt.int
    val KEY_Thai_chochang : LargeInt.int
    val KEY_Thai_choching : LargeInt.int
    val KEY_Thai_chochoe : LargeInt.int
    val KEY_Thai_dochada : LargeInt.int
    val KEY_Thai_dodek : LargeInt.int
    val KEY_Thai_fofa : LargeInt.int
    val KEY_Thai_fofan : LargeInt.int
    val KEY_Thai_hohip : LargeInt.int
    val KEY_Thai_honokhuk : LargeInt.int
    val KEY_Thai_khokhai : LargeInt.int
    val KEY_Thai_khokhon : LargeInt.int
    val KEY_Thai_khokhuat : LargeInt.int
    val KEY_Thai_khokhwai : LargeInt.int
    val KEY_Thai_khorakhang : LargeInt.int
    val KEY_Thai_kokai : LargeInt.int
    val KEY_Thai_lakkhangyao : LargeInt.int
    val KEY_Thai_lekchet : LargeInt.int
    val KEY_Thai_lekha : LargeInt.int
    val KEY_Thai_lekhok : LargeInt.int
    val KEY_Thai_lekkao : LargeInt.int
    val KEY_Thai_leknung : LargeInt.int
    val KEY_Thai_lekpaet : LargeInt.int
    val KEY_Thai_leksam : LargeInt.int
    val KEY_Thai_leksi : LargeInt.int
    val KEY_Thai_leksong : LargeInt.int
    val KEY_Thai_leksun : LargeInt.int
    val KEY_Thai_lochula : LargeInt.int
    val KEY_Thai_loling : LargeInt.int
    val KEY_Thai_lu : LargeInt.int
    val KEY_Thai_maichattawa : LargeInt.int
    val KEY_Thai_maiek : LargeInt.int
    val KEY_Thai_maihanakat : LargeInt.int
    val KEY_Thai_maihanakat_maitho : LargeInt.int
    val KEY_Thai_maitaikhu : LargeInt.int
    val KEY_Thai_maitho : LargeInt.int
    val KEY_Thai_maitri : LargeInt.int
    val KEY_Thai_maiyamok : LargeInt.int
    val KEY_Thai_moma : LargeInt.int
    val KEY_Thai_ngongu : LargeInt.int
    val KEY_Thai_nikhahit : LargeInt.int
    val KEY_Thai_nonen : LargeInt.int
    val KEY_Thai_nonu : LargeInt.int
    val KEY_Thai_oang : LargeInt.int
    val KEY_Thai_paiyannoi : LargeInt.int
    val KEY_Thai_phinthu : LargeInt.int
    val KEY_Thai_phophan : LargeInt.int
    val KEY_Thai_phophung : LargeInt.int
    val KEY_Thai_phosamphao : LargeInt.int
    val KEY_Thai_popla : LargeInt.int
    val KEY_Thai_rorua : LargeInt.int
    val KEY_Thai_ru : LargeInt.int
    val KEY_Thai_saraa : LargeInt.int
    val KEY_Thai_saraaa : LargeInt.int
    val KEY_Thai_saraae : LargeInt.int
    val KEY_Thai_saraaimaimalai : LargeInt.int
    val KEY_Thai_saraaimaimuan : LargeInt.int
    val KEY_Thai_saraam : LargeInt.int
    val KEY_Thai_sarae : LargeInt.int
    val KEY_Thai_sarai : LargeInt.int
    val KEY_Thai_saraii : LargeInt.int
    val KEY_Thai_sarao : LargeInt.int
    val KEY_Thai_sarau : LargeInt.int
    val KEY_Thai_saraue : LargeInt.int
    val KEY_Thai_sarauee : LargeInt.int
    val KEY_Thai_sarauu : LargeInt.int
    val KEY_Thai_sorusi : LargeInt.int
    val KEY_Thai_sosala : LargeInt.int
    val KEY_Thai_soso : LargeInt.int
    val KEY_Thai_sosua : LargeInt.int
    val KEY_Thai_thanthakhat : LargeInt.int
    val KEY_Thai_thonangmontho : LargeInt.int
    val KEY_Thai_thophuthao : LargeInt.int
    val KEY_Thai_thothahan : LargeInt.int
    val KEY_Thai_thothan : LargeInt.int
    val KEY_Thai_thothong : LargeInt.int
    val KEY_Thai_thothung : LargeInt.int
    val KEY_Thai_topatak : LargeInt.int
    val KEY_Thai_totao : LargeInt.int
    val KEY_Thai_wowaen : LargeInt.int
    val KEY_Thai_yoyak : LargeInt.int
    val KEY_Thai_yoying : LargeInt.int
    val KEY_Thorn : LargeInt.int
    val KEY_Time : LargeInt.int
    val KEY_ToDoList : LargeInt.int
    val KEY_Tools : LargeInt.int
    val KEY_TopMenu : LargeInt.int
    val KEY_TouchpadOff : LargeInt.int
    val KEY_TouchpadOn : LargeInt.int
    val KEY_TouchpadToggle : LargeInt.int
    val KEY_Touroku : LargeInt.int
    val KEY_Travel : LargeInt.int
    val KEY_Tslash : LargeInt.int
    val KEY_U : LargeInt.int
    val KEY_UWB : LargeInt.int
    val KEY_Uacute : LargeInt.int
    val KEY_Ubelowdot : LargeInt.int
    val KEY_Ubreve : LargeInt.int
    val KEY_Ucircumflex : LargeInt.int
    val KEY_Udiaeresis : LargeInt.int
    val KEY_Udoubleacute : LargeInt.int
    val KEY_Ugrave : LargeInt.int
    val KEY_Uhook : LargeInt.int
    val KEY_Uhorn : LargeInt.int
    val KEY_Uhornacute : LargeInt.int
    val KEY_Uhornbelowdot : LargeInt.int
    val KEY_Uhorngrave : LargeInt.int
    val KEY_Uhornhook : LargeInt.int
    val KEY_Uhorntilde : LargeInt.int
    val KEY_Ukrainian_GHE_WITH_UPTURN : LargeInt.int
    val KEY_Ukrainian_I : LargeInt.int
    val KEY_Ukrainian_IE : LargeInt.int
    val KEY_Ukrainian_YI : LargeInt.int
    val KEY_Ukrainian_ghe_with_upturn : LargeInt.int
    val KEY_Ukrainian_i : LargeInt.int
    val KEY_Ukrainian_ie : LargeInt.int
    val KEY_Ukrainian_yi : LargeInt.int
    val KEY_Ukranian_I : LargeInt.int
    val KEY_Ukranian_JE : LargeInt.int
    val KEY_Ukranian_YI : LargeInt.int
    val KEY_Ukranian_i : LargeInt.int
    val KEY_Ukranian_je : LargeInt.int
    val KEY_Ukranian_yi : LargeInt.int
    val KEY_Umacron : LargeInt.int
    val KEY_Undo : LargeInt.int
    val KEY_Ungrab : LargeInt.int
    val KEY_Uogonek : LargeInt.int
    val KEY_Up : LargeInt.int
    val KEY_Uring : LargeInt.int
    val KEY_User1KB : LargeInt.int
    val KEY_User2KB : LargeInt.int
    val KEY_UserPB : LargeInt.int
    val KEY_Utilde : LargeInt.int
    val KEY_V : LargeInt.int
    val KEY_VendorHome : LargeInt.int
    val KEY_Video : LargeInt.int
    val KEY_View : LargeInt.int
    val KEY_VoidSymbol : LargeInt.int
    val KEY_W : LargeInt.int
    val KEY_WLAN : LargeInt.int
    val KEY_WWW : LargeInt.int
    val KEY_Wacute : LargeInt.int
    val KEY_WakeUp : LargeInt.int
    val KEY_Wcircumflex : LargeInt.int
    val KEY_Wdiaeresis : LargeInt.int
    val KEY_WebCam : LargeInt.int
    val KEY_Wgrave : LargeInt.int
    val KEY_WheelButton : LargeInt.int
    val KEY_WindowClear : LargeInt.int
    val KEY_WonSign : LargeInt.int
    val KEY_Word : LargeInt.int
    val KEY_X : LargeInt.int
    val KEY_Xabovedot : LargeInt.int
    val KEY_Xfer : LargeInt.int
    val KEY_Y : LargeInt.int
    val KEY_Yacute : LargeInt.int
    val KEY_Ybelowdot : LargeInt.int
    val KEY_Ycircumflex : LargeInt.int
    val KEY_Ydiaeresis : LargeInt.int
    val KEY_Yellow : LargeInt.int
    val KEY_Ygrave : LargeInt.int
    val KEY_Yhook : LargeInt.int
    val KEY_Ytilde : LargeInt.int
    val KEY_Z : LargeInt.int
    val KEY_Zabovedot : LargeInt.int
    val KEY_Zacute : LargeInt.int
    val KEY_Zcaron : LargeInt.int
    val KEY_Zen_Koho : LargeInt.int
    val KEY_Zenkaku : LargeInt.int
    val KEY_Zenkaku_Hankaku : LargeInt.int
    val KEY_ZoomIn : LargeInt.int
    val KEY_ZoomOut : LargeInt.int
    val KEY_Zstroke : LargeInt.int
    val KEY_a : LargeInt.int
    val KEY_aacute : LargeInt.int
    val KEY_abelowdot : LargeInt.int
    val KEY_abovedot : LargeInt.int
    val KEY_abreve : LargeInt.int
    val KEY_abreveacute : LargeInt.int
    val KEY_abrevebelowdot : LargeInt.int
    val KEY_abrevegrave : LargeInt.int
    val KEY_abrevehook : LargeInt.int
    val KEY_abrevetilde : LargeInt.int
    val KEY_acircumflex : LargeInt.int
    val KEY_acircumflexacute : LargeInt.int
    val KEY_acircumflexbelowdot : LargeInt.int
    val KEY_acircumflexgrave : LargeInt.int
    val KEY_acircumflexhook : LargeInt.int
    val KEY_acircumflextilde : LargeInt.int
    val KEY_acute : LargeInt.int
    val KEY_adiaeresis : LargeInt.int
    val KEY_ae : LargeInt.int
    val KEY_agrave : LargeInt.int
    val KEY_ahook : LargeInt.int
    val KEY_amacron : LargeInt.int
    val KEY_ampersand : LargeInt.int
    val KEY_aogonek : LargeInt.int
    val KEY_apostrophe : LargeInt.int
    val KEY_approxeq : LargeInt.int
    val KEY_approximate : LargeInt.int
    val KEY_aring : LargeInt.int
    val KEY_asciicircum : LargeInt.int
    val KEY_asciitilde : LargeInt.int
    val KEY_asterisk : LargeInt.int
    val KEY_at : LargeInt.int
    val KEY_atilde : LargeInt.int
    val KEY_b : LargeInt.int
    val KEY_babovedot : LargeInt.int
    val KEY_backslash : LargeInt.int
    val KEY_ballotcross : LargeInt.int
    val KEY_bar : LargeInt.int
    val KEY_because : LargeInt.int
    val KEY_blank : LargeInt.int
    val KEY_botintegral : LargeInt.int
    val KEY_botleftparens : LargeInt.int
    val KEY_botleftsqbracket : LargeInt.int
    val KEY_botleftsummation : LargeInt.int
    val KEY_botrightparens : LargeInt.int
    val KEY_botrightsqbracket : LargeInt.int
    val KEY_botrightsummation : LargeInt.int
    val KEY_bott : LargeInt.int
    val KEY_botvertsummationconnector : LargeInt.int
    val KEY_braceleft : LargeInt.int
    val KEY_braceright : LargeInt.int
    val KEY_bracketleft : LargeInt.int
    val KEY_bracketright : LargeInt.int
    val KEY_braille_blank : LargeInt.int
    val KEY_braille_dot_1 : LargeInt.int
    val KEY_braille_dot_10 : LargeInt.int
    val KEY_braille_dot_2 : LargeInt.int
    val KEY_braille_dot_3 : LargeInt.int
    val KEY_braille_dot_4 : LargeInt.int
    val KEY_braille_dot_5 : LargeInt.int
    val KEY_braille_dot_6 : LargeInt.int
    val KEY_braille_dot_7 : LargeInt.int
    val KEY_braille_dot_8 : LargeInt.int
    val KEY_braille_dot_9 : LargeInt.int
    val KEY_braille_dots_1 : LargeInt.int
    val KEY_braille_dots_12 : LargeInt.int
    val KEY_braille_dots_123 : LargeInt.int
    val KEY_braille_dots_1234 : LargeInt.int
    val KEY_braille_dots_12345 : LargeInt.int
    val KEY_braille_dots_123456 : LargeInt.int
    val KEY_braille_dots_1234567 : LargeInt.int
    val KEY_braille_dots_12345678 : LargeInt.int
    val KEY_braille_dots_1234568 : LargeInt.int
    val KEY_braille_dots_123457 : LargeInt.int
    val KEY_braille_dots_1234578 : LargeInt.int
    val KEY_braille_dots_123458 : LargeInt.int
    val KEY_braille_dots_12346 : LargeInt.int
    val KEY_braille_dots_123467 : LargeInt.int
    val KEY_braille_dots_1234678 : LargeInt.int
    val KEY_braille_dots_123468 : LargeInt.int
    val KEY_braille_dots_12347 : LargeInt.int
    val KEY_braille_dots_123478 : LargeInt.int
    val KEY_braille_dots_12348 : LargeInt.int
    val KEY_braille_dots_1235 : LargeInt.int
    val KEY_braille_dots_12356 : LargeInt.int
    val KEY_braille_dots_123567 : LargeInt.int
    val KEY_braille_dots_1235678 : LargeInt.int
    val KEY_braille_dots_123568 : LargeInt.int
    val KEY_braille_dots_12357 : LargeInt.int
    val KEY_braille_dots_123578 : LargeInt.int
    val KEY_braille_dots_12358 : LargeInt.int
    val KEY_braille_dots_1236 : LargeInt.int
    val KEY_braille_dots_12367 : LargeInt.int
    val KEY_braille_dots_123678 : LargeInt.int
    val KEY_braille_dots_12368 : LargeInt.int
    val KEY_braille_dots_1237 : LargeInt.int
    val KEY_braille_dots_12378 : LargeInt.int
    val KEY_braille_dots_1238 : LargeInt.int
    val KEY_braille_dots_124 : LargeInt.int
    val KEY_braille_dots_1245 : LargeInt.int
    val KEY_braille_dots_12456 : LargeInt.int
    val KEY_braille_dots_124567 : LargeInt.int
    val KEY_braille_dots_1245678 : LargeInt.int
    val KEY_braille_dots_124568 : LargeInt.int
    val KEY_braille_dots_12457 : LargeInt.int
    val KEY_braille_dots_124578 : LargeInt.int
    val KEY_braille_dots_12458 : LargeInt.int
    val KEY_braille_dots_1246 : LargeInt.int
    val KEY_braille_dots_12467 : LargeInt.int
    val KEY_braille_dots_124678 : LargeInt.int
    val KEY_braille_dots_12468 : LargeInt.int
    val KEY_braille_dots_1247 : LargeInt.int
    val KEY_braille_dots_12478 : LargeInt.int
    val KEY_braille_dots_1248 : LargeInt.int
    val KEY_braille_dots_125 : LargeInt.int
    val KEY_braille_dots_1256 : LargeInt.int
    val KEY_braille_dots_12567 : LargeInt.int
    val KEY_braille_dots_125678 : LargeInt.int
    val KEY_braille_dots_12568 : LargeInt.int
    val KEY_braille_dots_1257 : LargeInt.int
    val KEY_braille_dots_12578 : LargeInt.int
    val KEY_braille_dots_1258 : LargeInt.int
    val KEY_braille_dots_126 : LargeInt.int
    val KEY_braille_dots_1267 : LargeInt.int
    val KEY_braille_dots_12678 : LargeInt.int
    val KEY_braille_dots_1268 : LargeInt.int
    val KEY_braille_dots_127 : LargeInt.int
    val KEY_braille_dots_1278 : LargeInt.int
    val KEY_braille_dots_128 : LargeInt.int
    val KEY_braille_dots_13 : LargeInt.int
    val KEY_braille_dots_134 : LargeInt.int
    val KEY_braille_dots_1345 : LargeInt.int
    val KEY_braille_dots_13456 : LargeInt.int
    val KEY_braille_dots_134567 : LargeInt.int
    val KEY_braille_dots_1345678 : LargeInt.int
    val KEY_braille_dots_134568 : LargeInt.int
    val KEY_braille_dots_13457 : LargeInt.int
    val KEY_braille_dots_134578 : LargeInt.int
    val KEY_braille_dots_13458 : LargeInt.int
    val KEY_braille_dots_1346 : LargeInt.int
    val KEY_braille_dots_13467 : LargeInt.int
    val KEY_braille_dots_134678 : LargeInt.int
    val KEY_braille_dots_13468 : LargeInt.int
    val KEY_braille_dots_1347 : LargeInt.int
    val KEY_braille_dots_13478 : LargeInt.int
    val KEY_braille_dots_1348 : LargeInt.int
    val KEY_braille_dots_135 : LargeInt.int
    val KEY_braille_dots_1356 : LargeInt.int
    val KEY_braille_dots_13567 : LargeInt.int
    val KEY_braille_dots_135678 : LargeInt.int
    val KEY_braille_dots_13568 : LargeInt.int
    val KEY_braille_dots_1357 : LargeInt.int
    val KEY_braille_dots_13578 : LargeInt.int
    val KEY_braille_dots_1358 : LargeInt.int
    val KEY_braille_dots_136 : LargeInt.int
    val KEY_braille_dots_1367 : LargeInt.int
    val KEY_braille_dots_13678 : LargeInt.int
    val KEY_braille_dots_1368 : LargeInt.int
    val KEY_braille_dots_137 : LargeInt.int
    val KEY_braille_dots_1378 : LargeInt.int
    val KEY_braille_dots_138 : LargeInt.int
    val KEY_braille_dots_14 : LargeInt.int
    val KEY_braille_dots_145 : LargeInt.int
    val KEY_braille_dots_1456 : LargeInt.int
    val KEY_braille_dots_14567 : LargeInt.int
    val KEY_braille_dots_145678 : LargeInt.int
    val KEY_braille_dots_14568 : LargeInt.int
    val KEY_braille_dots_1457 : LargeInt.int
    val KEY_braille_dots_14578 : LargeInt.int
    val KEY_braille_dots_1458 : LargeInt.int
    val KEY_braille_dots_146 : LargeInt.int
    val KEY_braille_dots_1467 : LargeInt.int
    val KEY_braille_dots_14678 : LargeInt.int
    val KEY_braille_dots_1468 : LargeInt.int
    val KEY_braille_dots_147 : LargeInt.int
    val KEY_braille_dots_1478 : LargeInt.int
    val KEY_braille_dots_148 : LargeInt.int
    val KEY_braille_dots_15 : LargeInt.int
    val KEY_braille_dots_156 : LargeInt.int
    val KEY_braille_dots_1567 : LargeInt.int
    val KEY_braille_dots_15678 : LargeInt.int
    val KEY_braille_dots_1568 : LargeInt.int
    val KEY_braille_dots_157 : LargeInt.int
    val KEY_braille_dots_1578 : LargeInt.int
    val KEY_braille_dots_158 : LargeInt.int
    val KEY_braille_dots_16 : LargeInt.int
    val KEY_braille_dots_167 : LargeInt.int
    val KEY_braille_dots_1678 : LargeInt.int
    val KEY_braille_dots_168 : LargeInt.int
    val KEY_braille_dots_17 : LargeInt.int
    val KEY_braille_dots_178 : LargeInt.int
    val KEY_braille_dots_18 : LargeInt.int
    val KEY_braille_dots_2 : LargeInt.int
    val KEY_braille_dots_23 : LargeInt.int
    val KEY_braille_dots_234 : LargeInt.int
    val KEY_braille_dots_2345 : LargeInt.int
    val KEY_braille_dots_23456 : LargeInt.int
    val KEY_braille_dots_234567 : LargeInt.int
    val KEY_braille_dots_2345678 : LargeInt.int
    val KEY_braille_dots_234568 : LargeInt.int
    val KEY_braille_dots_23457 : LargeInt.int
    val KEY_braille_dots_234578 : LargeInt.int
    val KEY_braille_dots_23458 : LargeInt.int
    val KEY_braille_dots_2346 : LargeInt.int
    val KEY_braille_dots_23467 : LargeInt.int
    val KEY_braille_dots_234678 : LargeInt.int
    val KEY_braille_dots_23468 : LargeInt.int
    val KEY_braille_dots_2347 : LargeInt.int
    val KEY_braille_dots_23478 : LargeInt.int
    val KEY_braille_dots_2348 : LargeInt.int
    val KEY_braille_dots_235 : LargeInt.int
    val KEY_braille_dots_2356 : LargeInt.int
    val KEY_braille_dots_23567 : LargeInt.int
    val KEY_braille_dots_235678 : LargeInt.int
    val KEY_braille_dots_23568 : LargeInt.int
    val KEY_braille_dots_2357 : LargeInt.int
    val KEY_braille_dots_23578 : LargeInt.int
    val KEY_braille_dots_2358 : LargeInt.int
    val KEY_braille_dots_236 : LargeInt.int
    val KEY_braille_dots_2367 : LargeInt.int
    val KEY_braille_dots_23678 : LargeInt.int
    val KEY_braille_dots_2368 : LargeInt.int
    val KEY_braille_dots_237 : LargeInt.int
    val KEY_braille_dots_2378 : LargeInt.int
    val KEY_braille_dots_238 : LargeInt.int
    val KEY_braille_dots_24 : LargeInt.int
    val KEY_braille_dots_245 : LargeInt.int
    val KEY_braille_dots_2456 : LargeInt.int
    val KEY_braille_dots_24567 : LargeInt.int
    val KEY_braille_dots_245678 : LargeInt.int
    val KEY_braille_dots_24568 : LargeInt.int
    val KEY_braille_dots_2457 : LargeInt.int
    val KEY_braille_dots_24578 : LargeInt.int
    val KEY_braille_dots_2458 : LargeInt.int
    val KEY_braille_dots_246 : LargeInt.int
    val KEY_braille_dots_2467 : LargeInt.int
    val KEY_braille_dots_24678 : LargeInt.int
    val KEY_braille_dots_2468 : LargeInt.int
    val KEY_braille_dots_247 : LargeInt.int
    val KEY_braille_dots_2478 : LargeInt.int
    val KEY_braille_dots_248 : LargeInt.int
    val KEY_braille_dots_25 : LargeInt.int
    val KEY_braille_dots_256 : LargeInt.int
    val KEY_braille_dots_2567 : LargeInt.int
    val KEY_braille_dots_25678 : LargeInt.int
    val KEY_braille_dots_2568 : LargeInt.int
    val KEY_braille_dots_257 : LargeInt.int
    val KEY_braille_dots_2578 : LargeInt.int
    val KEY_braille_dots_258 : LargeInt.int
    val KEY_braille_dots_26 : LargeInt.int
    val KEY_braille_dots_267 : LargeInt.int
    val KEY_braille_dots_2678 : LargeInt.int
    val KEY_braille_dots_268 : LargeInt.int
    val KEY_braille_dots_27 : LargeInt.int
    val KEY_braille_dots_278 : LargeInt.int
    val KEY_braille_dots_28 : LargeInt.int
    val KEY_braille_dots_3 : LargeInt.int
    val KEY_braille_dots_34 : LargeInt.int
    val KEY_braille_dots_345 : LargeInt.int
    val KEY_braille_dots_3456 : LargeInt.int
    val KEY_braille_dots_34567 : LargeInt.int
    val KEY_braille_dots_345678 : LargeInt.int
    val KEY_braille_dots_34568 : LargeInt.int
    val KEY_braille_dots_3457 : LargeInt.int
    val KEY_braille_dots_34578 : LargeInt.int
    val KEY_braille_dots_3458 : LargeInt.int
    val KEY_braille_dots_346 : LargeInt.int
    val KEY_braille_dots_3467 : LargeInt.int
    val KEY_braille_dots_34678 : LargeInt.int
    val KEY_braille_dots_3468 : LargeInt.int
    val KEY_braille_dots_347 : LargeInt.int
    val KEY_braille_dots_3478 : LargeInt.int
    val KEY_braille_dots_348 : LargeInt.int
    val KEY_braille_dots_35 : LargeInt.int
    val KEY_braille_dots_356 : LargeInt.int
    val KEY_braille_dots_3567 : LargeInt.int
    val KEY_braille_dots_35678 : LargeInt.int
    val KEY_braille_dots_3568 : LargeInt.int
    val KEY_braille_dots_357 : LargeInt.int
    val KEY_braille_dots_3578 : LargeInt.int
    val KEY_braille_dots_358 : LargeInt.int
    val KEY_braille_dots_36 : LargeInt.int
    val KEY_braille_dots_367 : LargeInt.int
    val KEY_braille_dots_3678 : LargeInt.int
    val KEY_braille_dots_368 : LargeInt.int
    val KEY_braille_dots_37 : LargeInt.int
    val KEY_braille_dots_378 : LargeInt.int
    val KEY_braille_dots_38 : LargeInt.int
    val KEY_braille_dots_4 : LargeInt.int
    val KEY_braille_dots_45 : LargeInt.int
    val KEY_braille_dots_456 : LargeInt.int
    val KEY_braille_dots_4567 : LargeInt.int
    val KEY_braille_dots_45678 : LargeInt.int
    val KEY_braille_dots_4568 : LargeInt.int
    val KEY_braille_dots_457 : LargeInt.int
    val KEY_braille_dots_4578 : LargeInt.int
    val KEY_braille_dots_458 : LargeInt.int
    val KEY_braille_dots_46 : LargeInt.int
    val KEY_braille_dots_467 : LargeInt.int
    val KEY_braille_dots_4678 : LargeInt.int
    val KEY_braille_dots_468 : LargeInt.int
    val KEY_braille_dots_47 : LargeInt.int
    val KEY_braille_dots_478 : LargeInt.int
    val KEY_braille_dots_48 : LargeInt.int
    val KEY_braille_dots_5 : LargeInt.int
    val KEY_braille_dots_56 : LargeInt.int
    val KEY_braille_dots_567 : LargeInt.int
    val KEY_braille_dots_5678 : LargeInt.int
    val KEY_braille_dots_568 : LargeInt.int
    val KEY_braille_dots_57 : LargeInt.int
    val KEY_braille_dots_578 : LargeInt.int
    val KEY_braille_dots_58 : LargeInt.int
    val KEY_braille_dots_6 : LargeInt.int
    val KEY_braille_dots_67 : LargeInt.int
    val KEY_braille_dots_678 : LargeInt.int
    val KEY_braille_dots_68 : LargeInt.int
    val KEY_braille_dots_7 : LargeInt.int
    val KEY_braille_dots_78 : LargeInt.int
    val KEY_braille_dots_8 : LargeInt.int
    val KEY_breve : LargeInt.int
    val KEY_brokenbar : LargeInt.int
    val KEY_c : LargeInt.int
    val KEY_c_h : LargeInt.int
    val KEY_cabovedot : LargeInt.int
    val KEY_cacute : LargeInt.int
    val KEY_careof : LargeInt.int
    val KEY_caret : LargeInt.int
    val KEY_caron : LargeInt.int
    val KEY_ccaron : LargeInt.int
    val KEY_ccedilla : LargeInt.int
    val KEY_ccircumflex : LargeInt.int
    val KEY_cedilla : LargeInt.int
    val KEY_cent : LargeInt.int
    val KEY_ch : LargeInt.int
    val KEY_checkerboard : LargeInt.int
    val KEY_checkmark : LargeInt.int
    val KEY_circle : LargeInt.int
    val KEY_club : LargeInt.int
    val KEY_colon : LargeInt.int
    val KEY_comma : LargeInt.int
    val KEY_containsas : LargeInt.int
    val KEY_copyright : LargeInt.int
    val KEY_cr : LargeInt.int
    val KEY_crossinglines : LargeInt.int
    val KEY_cuberoot : LargeInt.int
    val KEY_currency : LargeInt.int
    val KEY_cursor : LargeInt.int
    val KEY_d : LargeInt.int
    val KEY_dabovedot : LargeInt.int
    val KEY_dagger : LargeInt.int
    val KEY_dcaron : LargeInt.int
    val KEY_dead_A : LargeInt.int
    val KEY_dead_E : LargeInt.int
    val KEY_dead_I : LargeInt.int
    val KEY_dead_O : LargeInt.int
    val KEY_dead_U : LargeInt.int
    val KEY_dead_a : LargeInt.int
    val KEY_dead_abovecomma : LargeInt.int
    val KEY_dead_abovedot : LargeInt.int
    val KEY_dead_abovereversedcomma : LargeInt.int
    val KEY_dead_abovering : LargeInt.int
    val KEY_dead_acute : LargeInt.int
    val KEY_dead_belowbreve : LargeInt.int
    val KEY_dead_belowcircumflex : LargeInt.int
    val KEY_dead_belowcomma : LargeInt.int
    val KEY_dead_belowdiaeresis : LargeInt.int
    val KEY_dead_belowdot : LargeInt.int
    val KEY_dead_belowmacron : LargeInt.int
    val KEY_dead_belowring : LargeInt.int
    val KEY_dead_belowtilde : LargeInt.int
    val KEY_dead_breve : LargeInt.int
    val KEY_dead_capital_schwa : LargeInt.int
    val KEY_dead_caron : LargeInt.int
    val KEY_dead_cedilla : LargeInt.int
    val KEY_dead_circumflex : LargeInt.int
    val KEY_dead_currency : LargeInt.int
    val KEY_dead_dasia : LargeInt.int
    val KEY_dead_diaeresis : LargeInt.int
    val KEY_dead_doubleacute : LargeInt.int
    val KEY_dead_doublegrave : LargeInt.int
    val KEY_dead_e : LargeInt.int
    val KEY_dead_grave : LargeInt.int
    val KEY_dead_greek : LargeInt.int
    val KEY_dead_hook : LargeInt.int
    val KEY_dead_horn : LargeInt.int
    val KEY_dead_i : LargeInt.int
    val KEY_dead_invertedbreve : LargeInt.int
    val KEY_dead_iota : LargeInt.int
    val KEY_dead_macron : LargeInt.int
    val KEY_dead_o : LargeInt.int
    val KEY_dead_ogonek : LargeInt.int
    val KEY_dead_perispomeni : LargeInt.int
    val KEY_dead_psili : LargeInt.int
    val KEY_dead_semivoiced_sound : LargeInt.int
    val KEY_dead_small_schwa : LargeInt.int
    val KEY_dead_stroke : LargeInt.int
    val KEY_dead_tilde : LargeInt.int
    val KEY_dead_u : LargeInt.int
    val KEY_dead_voiced_sound : LargeInt.int
    val KEY_decimalpoint : LargeInt.int
    val KEY_degree : LargeInt.int
    val KEY_diaeresis : LargeInt.int
    val KEY_diamond : LargeInt.int
    val KEY_digitspace : LargeInt.int
    val KEY_dintegral : LargeInt.int
    val KEY_division : LargeInt.int
    val KEY_dollar : LargeInt.int
    val KEY_doubbaselinedot : LargeInt.int
    val KEY_doubleacute : LargeInt.int
    val KEY_doubledagger : LargeInt.int
    val KEY_doublelowquotemark : LargeInt.int
    val KEY_downarrow : LargeInt.int
    val KEY_downcaret : LargeInt.int
    val KEY_downshoe : LargeInt.int
    val KEY_downstile : LargeInt.int
    val KEY_downtack : LargeInt.int
    val KEY_dstroke : LargeInt.int
    val KEY_e : LargeInt.int
    val KEY_eabovedot : LargeInt.int
    val KEY_eacute : LargeInt.int
    val KEY_ebelowdot : LargeInt.int
    val KEY_ecaron : LargeInt.int
    val KEY_ecircumflex : LargeInt.int
    val KEY_ecircumflexacute : LargeInt.int
    val KEY_ecircumflexbelowdot : LargeInt.int
    val KEY_ecircumflexgrave : LargeInt.int
    val KEY_ecircumflexhook : LargeInt.int
    val KEY_ecircumflextilde : LargeInt.int
    val KEY_ediaeresis : LargeInt.int
    val KEY_egrave : LargeInt.int
    val KEY_ehook : LargeInt.int
    val KEY_eightsubscript : LargeInt.int
    val KEY_eightsuperior : LargeInt.int
    val KEY_elementof : LargeInt.int
    val KEY_ellipsis : LargeInt.int
    val KEY_em3space : LargeInt.int
    val KEY_em4space : LargeInt.int
    val KEY_emacron : LargeInt.int
    val KEY_emdash : LargeInt.int
    val KEY_emfilledcircle : LargeInt.int
    val KEY_emfilledrect : LargeInt.int
    val KEY_emopencircle : LargeInt.int
    val KEY_emopenrectangle : LargeInt.int
    val KEY_emptyset : LargeInt.int
    val KEY_emspace : LargeInt.int
    val KEY_endash : LargeInt.int
    val KEY_enfilledcircbullet : LargeInt.int
    val KEY_enfilledsqbullet : LargeInt.int
    val KEY_eng : LargeInt.int
    val KEY_enopencircbullet : LargeInt.int
    val KEY_enopensquarebullet : LargeInt.int
    val KEY_enspace : LargeInt.int
    val KEY_eogonek : LargeInt.int
    val KEY_equal : LargeInt.int
    val KEY_eth : LargeInt.int
    val KEY_etilde : LargeInt.int
    val KEY_exclam : LargeInt.int
    val KEY_exclamdown : LargeInt.int
    val KEY_ezh : LargeInt.int
    val KEY_f : LargeInt.int
    val KEY_fabovedot : LargeInt.int
    val KEY_femalesymbol : LargeInt.int
    val KEY_ff : LargeInt.int
    val KEY_figdash : LargeInt.int
    val KEY_filledlefttribullet : LargeInt.int
    val KEY_filledrectbullet : LargeInt.int
    val KEY_filledrighttribullet : LargeInt.int
    val KEY_filledtribulletdown : LargeInt.int
    val KEY_filledtribulletup : LargeInt.int
    val KEY_fiveeighths : LargeInt.int
    val KEY_fivesixths : LargeInt.int
    val KEY_fivesubscript : LargeInt.int
    val KEY_fivesuperior : LargeInt.int
    val KEY_fourfifths : LargeInt.int
    val KEY_foursubscript : LargeInt.int
    val KEY_foursuperior : LargeInt.int
    val KEY_fourthroot : LargeInt.int
    val KEY_function : LargeInt.int
    val KEY_g : LargeInt.int
    val KEY_gabovedot : LargeInt.int
    val KEY_gbreve : LargeInt.int
    val KEY_gcaron : LargeInt.int
    val KEY_gcedilla : LargeInt.int
    val KEY_gcircumflex : LargeInt.int
    val KEY_grave : LargeInt.int
    val KEY_greater : LargeInt.int
    val KEY_greaterthanequal : LargeInt.int
    val KEY_guillemotleft : LargeInt.int
    val KEY_guillemotright : LargeInt.int
    val KEY_h : LargeInt.int
    val KEY_hairspace : LargeInt.int
    val KEY_hcircumflex : LargeInt.int
    val KEY_heart : LargeInt.int
    val KEY_hebrew_aleph : LargeInt.int
    val KEY_hebrew_ayin : LargeInt.int
    val KEY_hebrew_bet : LargeInt.int
    val KEY_hebrew_beth : LargeInt.int
    val KEY_hebrew_chet : LargeInt.int
    val KEY_hebrew_dalet : LargeInt.int
    val KEY_hebrew_daleth : LargeInt.int
    val KEY_hebrew_doublelowline : LargeInt.int
    val KEY_hebrew_finalkaph : LargeInt.int
    val KEY_hebrew_finalmem : LargeInt.int
    val KEY_hebrew_finalnun : LargeInt.int
    val KEY_hebrew_finalpe : LargeInt.int
    val KEY_hebrew_finalzade : LargeInt.int
    val KEY_hebrew_finalzadi : LargeInt.int
    val KEY_hebrew_gimel : LargeInt.int
    val KEY_hebrew_gimmel : LargeInt.int
    val KEY_hebrew_he : LargeInt.int
    val KEY_hebrew_het : LargeInt.int
    val KEY_hebrew_kaph : LargeInt.int
    val KEY_hebrew_kuf : LargeInt.int
    val KEY_hebrew_lamed : LargeInt.int
    val KEY_hebrew_mem : LargeInt.int
    val KEY_hebrew_nun : LargeInt.int
    val KEY_hebrew_pe : LargeInt.int
    val KEY_hebrew_qoph : LargeInt.int
    val KEY_hebrew_resh : LargeInt.int
    val KEY_hebrew_samech : LargeInt.int
    val KEY_hebrew_samekh : LargeInt.int
    val KEY_hebrew_shin : LargeInt.int
    val KEY_hebrew_taf : LargeInt.int
    val KEY_hebrew_taw : LargeInt.int
    val KEY_hebrew_tet : LargeInt.int
    val KEY_hebrew_teth : LargeInt.int
    val KEY_hebrew_waw : LargeInt.int
    val KEY_hebrew_yod : LargeInt.int
    val KEY_hebrew_zade : LargeInt.int
    val KEY_hebrew_zadi : LargeInt.int
    val KEY_hebrew_zain : LargeInt.int
    val KEY_hebrew_zayin : LargeInt.int
    val KEY_hexagram : LargeInt.int
    val KEY_horizconnector : LargeInt.int
    val KEY_horizlinescan1 : LargeInt.int
    val KEY_horizlinescan3 : LargeInt.int
    val KEY_horizlinescan5 : LargeInt.int
    val KEY_horizlinescan7 : LargeInt.int
    val KEY_horizlinescan9 : LargeInt.int
    val KEY_hstroke : LargeInt.int
    val KEY_ht : LargeInt.int
    val KEY_hyphen : LargeInt.int
    val KEY_i : LargeInt.int
    val KEY_iTouch : LargeInt.int
    val KEY_iacute : LargeInt.int
    val KEY_ibelowdot : LargeInt.int
    val KEY_ibreve : LargeInt.int
    val KEY_icircumflex : LargeInt.int
    val KEY_identical : LargeInt.int
    val KEY_idiaeresis : LargeInt.int
    val KEY_idotless : LargeInt.int
    val KEY_ifonlyif : LargeInt.int
    val KEY_igrave : LargeInt.int
    val KEY_ihook : LargeInt.int
    val KEY_imacron : LargeInt.int
    val KEY_implies : LargeInt.int
    val KEY_includedin : LargeInt.int
    val KEY_includes : LargeInt.int
    val KEY_infinity : LargeInt.int
    val KEY_integral : LargeInt.int
    val KEY_intersection : LargeInt.int
    val KEY_iogonek : LargeInt.int
    val KEY_itilde : LargeInt.int
    val KEY_j : LargeInt.int
    val KEY_jcircumflex : LargeInt.int
    val KEY_jot : LargeInt.int
    val KEY_k : LargeInt.int
    val KEY_kana_A : LargeInt.int
    val KEY_kana_CHI : LargeInt.int
    val KEY_kana_E : LargeInt.int
    val KEY_kana_FU : LargeInt.int
    val KEY_kana_HA : LargeInt.int
    val KEY_kana_HE : LargeInt.int
    val KEY_kana_HI : LargeInt.int
    val KEY_kana_HO : LargeInt.int
    val KEY_kana_HU : LargeInt.int
    val KEY_kana_I : LargeInt.int
    val KEY_kana_KA : LargeInt.int
    val KEY_kana_KE : LargeInt.int
    val KEY_kana_KI : LargeInt.int
    val KEY_kana_KO : LargeInt.int
    val KEY_kana_KU : LargeInt.int
    val KEY_kana_MA : LargeInt.int
    val KEY_kana_ME : LargeInt.int
    val KEY_kana_MI : LargeInt.int
    val KEY_kana_MO : LargeInt.int
    val KEY_kana_MU : LargeInt.int
    val KEY_kana_N : LargeInt.int
    val KEY_kana_NA : LargeInt.int
    val KEY_kana_NE : LargeInt.int
    val KEY_kana_NI : LargeInt.int
    val KEY_kana_NO : LargeInt.int
    val KEY_kana_NU : LargeInt.int
    val KEY_kana_O : LargeInt.int
    val KEY_kana_RA : LargeInt.int
    val KEY_kana_RE : LargeInt.int
    val KEY_kana_RI : LargeInt.int
    val KEY_kana_RO : LargeInt.int
    val KEY_kana_RU : LargeInt.int
    val KEY_kana_SA : LargeInt.int
    val KEY_kana_SE : LargeInt.int
    val KEY_kana_SHI : LargeInt.int
    val KEY_kana_SO : LargeInt.int
    val KEY_kana_SU : LargeInt.int
    val KEY_kana_TA : LargeInt.int
    val KEY_kana_TE : LargeInt.int
    val KEY_kana_TI : LargeInt.int
    val KEY_kana_TO : LargeInt.int
    val KEY_kana_TSU : LargeInt.int
    val KEY_kana_TU : LargeInt.int
    val KEY_kana_U : LargeInt.int
    val KEY_kana_WA : LargeInt.int
    val KEY_kana_WO : LargeInt.int
    val KEY_kana_YA : LargeInt.int
    val KEY_kana_YO : LargeInt.int
    val KEY_kana_YU : LargeInt.int
    val KEY_kana_a : LargeInt.int
    val KEY_kana_closingbracket : LargeInt.int
    val KEY_kana_comma : LargeInt.int
    val KEY_kana_conjunctive : LargeInt.int
    val KEY_kana_e : LargeInt.int
    val KEY_kana_fullstop : LargeInt.int
    val KEY_kana_i : LargeInt.int
    val KEY_kana_middledot : LargeInt.int
    val KEY_kana_o : LargeInt.int
    val KEY_kana_openingbracket : LargeInt.int
    val KEY_kana_switch : LargeInt.int
    val KEY_kana_tsu : LargeInt.int
    val KEY_kana_tu : LargeInt.int
    val KEY_kana_u : LargeInt.int
    val KEY_kana_ya : LargeInt.int
    val KEY_kana_yo : LargeInt.int
    val KEY_kana_yu : LargeInt.int
    val KEY_kappa : LargeInt.int
    val KEY_kcedilla : LargeInt.int
    val KEY_kra : LargeInt.int
    val KEY_l : LargeInt.int
    val KEY_lacute : LargeInt.int
    val KEY_latincross : LargeInt.int
    val KEY_lbelowdot : LargeInt.int
    val KEY_lcaron : LargeInt.int
    val KEY_lcedilla : LargeInt.int
    val KEY_leftanglebracket : LargeInt.int
    val KEY_leftarrow : LargeInt.int
    val KEY_leftcaret : LargeInt.int
    val KEY_leftdoublequotemark : LargeInt.int
    val KEY_leftmiddlecurlybrace : LargeInt.int
    val KEY_leftopentriangle : LargeInt.int
    val KEY_leftpointer : LargeInt.int
    val KEY_leftradical : LargeInt.int
    val KEY_leftshoe : LargeInt.int
    val KEY_leftsinglequotemark : LargeInt.int
    val KEY_leftt : LargeInt.int
    val KEY_lefttack : LargeInt.int
    val KEY_less : LargeInt.int
    val KEY_lessthanequal : LargeInt.int
    val KEY_lf : LargeInt.int
    val KEY_logicaland : LargeInt.int
    val KEY_logicalor : LargeInt.int
    val KEY_lowleftcorner : LargeInt.int
    val KEY_lowrightcorner : LargeInt.int
    val KEY_lstroke : LargeInt.int
    val KEY_m : LargeInt.int
    val KEY_mabovedot : LargeInt.int
    val KEY_macron : LargeInt.int
    val KEY_malesymbol : LargeInt.int
    val KEY_maltesecross : LargeInt.int
    val KEY_marker : LargeInt.int
    val KEY_masculine : LargeInt.int
    val KEY_minus : LargeInt.int
    val KEY_minutes : LargeInt.int
    val KEY_mu : LargeInt.int
    val KEY_multiply : LargeInt.int
    val KEY_musicalflat : LargeInt.int
    val KEY_musicalsharp : LargeInt.int
    val KEY_n : LargeInt.int
    val KEY_nabla : LargeInt.int
    val KEY_nacute : LargeInt.int
    val KEY_ncaron : LargeInt.int
    val KEY_ncedilla : LargeInt.int
    val KEY_ninesubscript : LargeInt.int
    val KEY_ninesuperior : LargeInt.int
    val KEY_nl : LargeInt.int
    val KEY_nobreakspace : LargeInt.int
    val KEY_notapproxeq : LargeInt.int
    val KEY_notelementof : LargeInt.int
    val KEY_notequal : LargeInt.int
    val KEY_notidentical : LargeInt.int
    val KEY_notsign : LargeInt.int
    val KEY_ntilde : LargeInt.int
    val KEY_numbersign : LargeInt.int
    val KEY_numerosign : LargeInt.int
    val KEY_o : LargeInt.int
    val KEY_oacute : LargeInt.int
    val KEY_obarred : LargeInt.int
    val KEY_obelowdot : LargeInt.int
    val KEY_ocaron : LargeInt.int
    val KEY_ocircumflex : LargeInt.int
    val KEY_ocircumflexacute : LargeInt.int
    val KEY_ocircumflexbelowdot : LargeInt.int
    val KEY_ocircumflexgrave : LargeInt.int
    val KEY_ocircumflexhook : LargeInt.int
    val KEY_ocircumflextilde : LargeInt.int
    val KEY_odiaeresis : LargeInt.int
    val KEY_odoubleacute : LargeInt.int
    val KEY_oe : LargeInt.int
    val KEY_ogonek : LargeInt.int
    val KEY_ograve : LargeInt.int
    val KEY_ohook : LargeInt.int
    val KEY_ohorn : LargeInt.int
    val KEY_ohornacute : LargeInt.int
    val KEY_ohornbelowdot : LargeInt.int
    val KEY_ohorngrave : LargeInt.int
    val KEY_ohornhook : LargeInt.int
    val KEY_ohorntilde : LargeInt.int
    val KEY_omacron : LargeInt.int
    val KEY_oneeighth : LargeInt.int
    val KEY_onefifth : LargeInt.int
    val KEY_onehalf : LargeInt.int
    val KEY_onequarter : LargeInt.int
    val KEY_onesixth : LargeInt.int
    val KEY_onesubscript : LargeInt.int
    val KEY_onesuperior : LargeInt.int
    val KEY_onethird : LargeInt.int
    val KEY_ooblique : LargeInt.int
    val KEY_openrectbullet : LargeInt.int
    val KEY_openstar : LargeInt.int
    val KEY_opentribulletdown : LargeInt.int
    val KEY_opentribulletup : LargeInt.int
    val KEY_ordfeminine : LargeInt.int
    val KEY_oslash : LargeInt.int
    val KEY_otilde : LargeInt.int
    val KEY_overbar : LargeInt.int
    val KEY_overline : LargeInt.int
    val KEY_p : LargeInt.int
    val KEY_pabovedot : LargeInt.int
    val KEY_paragraph : LargeInt.int
    val KEY_parenleft : LargeInt.int
    val KEY_parenright : LargeInt.int
    val KEY_partdifferential : LargeInt.int
    val KEY_partialderivative : LargeInt.int
    val KEY_percent : LargeInt.int
    val KEY_period : LargeInt.int
    val KEY_periodcentered : LargeInt.int
    val KEY_permille : LargeInt.int
    val KEY_phonographcopyright : LargeInt.int
    val KEY_plus : LargeInt.int
    val KEY_plusminus : LargeInt.int
    val KEY_prescription : LargeInt.int
    val KEY_prolongedsound : LargeInt.int
    val KEY_punctspace : LargeInt.int
    val KEY_q : LargeInt.int
    val KEY_quad : LargeInt.int
    val KEY_question : LargeInt.int
    val KEY_questiondown : LargeInt.int
    val KEY_quotedbl : LargeInt.int
    val KEY_quoteleft : LargeInt.int
    val KEY_quoteright : LargeInt.int
    val KEY_r : LargeInt.int
    val KEY_racute : LargeInt.int
    val KEY_radical : LargeInt.int
    val KEY_rcaron : LargeInt.int
    val KEY_rcedilla : LargeInt.int
    val KEY_registered : LargeInt.int
    val KEY_rightanglebracket : LargeInt.int
    val KEY_rightarrow : LargeInt.int
    val KEY_rightcaret : LargeInt.int
    val KEY_rightdoublequotemark : LargeInt.int
    val KEY_rightmiddlecurlybrace : LargeInt.int
    val KEY_rightmiddlesummation : LargeInt.int
    val KEY_rightopentriangle : LargeInt.int
    val KEY_rightpointer : LargeInt.int
    val KEY_rightshoe : LargeInt.int
    val KEY_rightsinglequotemark : LargeInt.int
    val KEY_rightt : LargeInt.int
    val KEY_righttack : LargeInt.int
    val KEY_s : LargeInt.int
    val KEY_sabovedot : LargeInt.int
    val KEY_sacute : LargeInt.int
    val KEY_scaron : LargeInt.int
    val KEY_scedilla : LargeInt.int
    val KEY_schwa : LargeInt.int
    val KEY_scircumflex : LargeInt.int
    val KEY_script_switch : LargeInt.int
    val KEY_seconds : LargeInt.int
    val KEY_section : LargeInt.int
    val KEY_semicolon : LargeInt.int
    val KEY_semivoicedsound : LargeInt.int
    val KEY_seveneighths : LargeInt.int
    val KEY_sevensubscript : LargeInt.int
    val KEY_sevensuperior : LargeInt.int
    val KEY_signaturemark : LargeInt.int
    val KEY_signifblank : LargeInt.int
    val KEY_similarequal : LargeInt.int
    val KEY_singlelowquotemark : LargeInt.int
    val KEY_sixsubscript : LargeInt.int
    val KEY_sixsuperior : LargeInt.int
    val KEY_slash : LargeInt.int
    val KEY_soliddiamond : LargeInt.int
    val KEY_space : LargeInt.int
    val KEY_squareroot : LargeInt.int
    val KEY_ssharp : LargeInt.int
    val KEY_sterling : LargeInt.int
    val KEY_stricteq : LargeInt.int
    val KEY_t : LargeInt.int
    val KEY_tabovedot : LargeInt.int
    val KEY_tcaron : LargeInt.int
    val KEY_tcedilla : LargeInt.int
    val KEY_telephone : LargeInt.int
    val KEY_telephonerecorder : LargeInt.int
    val KEY_therefore : LargeInt.int
    val KEY_thinspace : LargeInt.int
    val KEY_thorn : LargeInt.int
    val KEY_threeeighths : LargeInt.int
    val KEY_threefifths : LargeInt.int
    val KEY_threequarters : LargeInt.int
    val KEY_threesubscript : LargeInt.int
    val KEY_threesuperior : LargeInt.int
    val KEY_tintegral : LargeInt.int
    val KEY_topintegral : LargeInt.int
    val KEY_topleftparens : LargeInt.int
    val KEY_topleftradical : LargeInt.int
    val KEY_topleftsqbracket : LargeInt.int
    val KEY_topleftsummation : LargeInt.int
    val KEY_toprightparens : LargeInt.int
    val KEY_toprightsqbracket : LargeInt.int
    val KEY_toprightsummation : LargeInt.int
    val KEY_topt : LargeInt.int
    val KEY_topvertsummationconnector : LargeInt.int
    val KEY_trademark : LargeInt.int
    val KEY_trademarkincircle : LargeInt.int
    val KEY_tslash : LargeInt.int
    val KEY_twofifths : LargeInt.int
    val KEY_twosubscript : LargeInt.int
    val KEY_twosuperior : LargeInt.int
    val KEY_twothirds : LargeInt.int
    val KEY_u : LargeInt.int
    val KEY_uacute : LargeInt.int
    val KEY_ubelowdot : LargeInt.int
    val KEY_ubreve : LargeInt.int
    val KEY_ucircumflex : LargeInt.int
    val KEY_udiaeresis : LargeInt.int
    val KEY_udoubleacute : LargeInt.int
    val KEY_ugrave : LargeInt.int
    val KEY_uhook : LargeInt.int
    val KEY_uhorn : LargeInt.int
    val KEY_uhornacute : LargeInt.int
    val KEY_uhornbelowdot : LargeInt.int
    val KEY_uhorngrave : LargeInt.int
    val KEY_uhornhook : LargeInt.int
    val KEY_uhorntilde : LargeInt.int
    val KEY_umacron : LargeInt.int
    val KEY_underbar : LargeInt.int
    val KEY_underscore : LargeInt.int
    val KEY_union : LargeInt.int
    val KEY_uogonek : LargeInt.int
    val KEY_uparrow : LargeInt.int
    val KEY_upcaret : LargeInt.int
    val KEY_upleftcorner : LargeInt.int
    val KEY_uprightcorner : LargeInt.int
    val KEY_upshoe : LargeInt.int
    val KEY_upstile : LargeInt.int
    val KEY_uptack : LargeInt.int
    val KEY_uring : LargeInt.int
    val KEY_utilde : LargeInt.int
    val KEY_v : LargeInt.int
    val KEY_variation : LargeInt.int
    val KEY_vertbar : LargeInt.int
    val KEY_vertconnector : LargeInt.int
    val KEY_voicedsound : LargeInt.int
    val KEY_vt : LargeInt.int
    val KEY_w : LargeInt.int
    val KEY_wacute : LargeInt.int
    val KEY_wcircumflex : LargeInt.int
    val KEY_wdiaeresis : LargeInt.int
    val KEY_wgrave : LargeInt.int
    val KEY_x : LargeInt.int
    val KEY_xabovedot : LargeInt.int
    val KEY_y : LargeInt.int
    val KEY_yacute : LargeInt.int
    val KEY_ybelowdot : LargeInt.int
    val KEY_ycircumflex : LargeInt.int
    val KEY_ydiaeresis : LargeInt.int
    val KEY_yen : LargeInt.int
    val KEY_ygrave : LargeInt.int
    val KEY_yhook : LargeInt.int
    val KEY_ytilde : LargeInt.int
    val KEY_z : LargeInt.int
    val KEY_zabovedot : LargeInt.int
    val KEY_zacute : LargeInt.int
    val KEY_zcaron : LargeInt.int
    val KEY_zerosubscript : LargeInt.int
    val KEY_zerosuperior : LargeInt.int
    val KEY_zstroke : LargeInt.int
    val MAX_TIMECOORD_AXES : LargeInt.int
    val PARENT_RELATIVE : LargeInt.int
    val PRIORITY_REDRAW : LargeInt.int
    val beep : unit -> unit
    val cairoCreate : 'a WindowClass.class -> Cairo.ContextRecord.t
    val cairoDrawFromGl :
      Cairo.ContextRecord.t
       * 'a WindowClass.class
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> unit
    val cairoGetClipRectangle : Cairo.ContextRecord.t -> RectangleRecord.t option
    val cairoGetDrawingContext : Cairo.ContextRecord.t -> base DrawingContextClass.class option
    val cairoRectangle : Cairo.ContextRecord.t * RectangleRecord.t -> unit
    val cairoRegion : Cairo.ContextRecord.t * Cairo.RegionRecord.t -> unit
    val cairoRegionCreateFromSurface : Cairo.SurfaceRecord.t -> Cairo.RegionRecord.t
    val cairoSetSourceColor : Cairo.ContextRecord.t * ColorRecord.t -> unit
    val cairoSetSourcePixbuf :
      Cairo.ContextRecord.t
       * 'a GdkPixbuf.PixbufClass.class
       * real
       * real
       -> unit
    val cairoSetSourceRgba : Cairo.ContextRecord.t * RgbaRecord.t -> unit
    val cairoSetSourceWindow :
      Cairo.ContextRecord.t
       * 'a WindowClass.class
       * real
       * real
       -> unit
    val cairoSurfaceCreateFromPixbuf :
      'a GdkPixbuf.PixbufClass.class
       * LargeInt.int
       * 'b WindowClass.class option
       -> Cairo.SurfaceRecord.t
    val disableMultidevice : unit -> unit
    val dragAbort : 'a DragContextClass.class * LargeInt.int -> unit
    val dragDrop : 'a DragContextClass.class * LargeInt.int -> unit
    val dragDropDone : 'a DragContextClass.class * bool -> unit
    val dragDropSucceeded : 'a DragContextClass.class -> bool
    val dragFindWindowForScreen :
      'a DragContextClass.class
       * 'b WindowClass.class
       * 'c ScreenClass.class
       * LargeInt.int
       * LargeInt.int
       -> base WindowClass.class * DragProtocol.t
    val dragGetSelection : 'a DragContextClass.class -> AtomRecord.t
    val dragMotion :
      'a DragContextClass.class
       * 'b WindowClass.class
       * DragProtocol.t
       * LargeInt.int
       * LargeInt.int
       * DragAction.t
       * DragAction.t
       * LargeInt.int
       -> bool
    val dragStatus :
      'a DragContextClass.class
       * DragAction.t
       * LargeInt.int
       -> unit
    val dropFinish :
      'a DragContextClass.class
       * bool
       * LargeInt.int
       -> unit
    val dropReply :
      'a DragContextClass.class
       * bool
       * LargeInt.int
       -> unit
    val errorTrapPop : unit -> LargeInt.int
    val errorTrapPopIgnored : unit -> unit
    val errorTrapPush : unit -> unit
    val eventsGetAngle : 'a Event.union * 'b Event.union -> real option
    val eventsGetCenter : 'a Event.union * 'b Event.union -> (real * real) option
    val eventsGetDistance : 'a Event.union * 'b Event.union -> real option
    val eventsPending : unit -> bool
    val flush : unit -> unit
    val getDefaultRootWindow : unit -> base WindowClass.class
    val getDisplay : unit -> string
    val getDisplayArgName : unit -> string option
    val getProgramClass : unit -> string
    val getShowEvents : unit -> bool
    val init : Utf8CPtrArrayN.t -> Utf8CPtrArrayN.t
    val initCheck : Utf8CPtrArrayN.t -> bool * Utf8CPtrArrayN.t
    val keyboardGrab :
      'a WindowClass.class
       * bool
       * LargeInt.int
       -> GrabStatus.t
    val keyboardUngrab : LargeInt.int -> unit
    val keyvalConvertCase : LargeInt.int -> LargeInt.int * LargeInt.int
    val keyvalFromName : string -> LargeInt.int
    val keyvalIsLower : LargeInt.int -> bool
    val keyvalIsUpper : LargeInt.int -> bool
    val keyvalName : LargeInt.int -> string option
    val keyvalToLower : LargeInt.int -> LargeInt.int
    val keyvalToUnicode : LargeInt.int -> LargeInt.int
    val keyvalToUpper : LargeInt.int -> LargeInt.int
    val notifyStartupComplete : unit -> unit
    val notifyStartupCompleteWithId : string -> unit
    val offscreenWindowGetEmbedder : 'a WindowClass.class -> base WindowClass.class option
    val offscreenWindowGetSurface : 'a WindowClass.class -> Cairo.SurfaceRecord.t option
    val offscreenWindowSetEmbedder : 'a WindowClass.class * 'b WindowClass.class -> unit
    val pangoContextGet : unit -> base Pango.ContextClass.class
    val pangoContextGetForDisplay : 'a DisplayClass.class -> base Pango.ContextClass.class
    val pangoContextGetForScreen : 'a ScreenClass.class -> base Pango.ContextClass.class
    val parseArgs : Utf8CPtrArrayN.t -> Utf8CPtrArrayN.t
    val pixbufGetFromSurface :
      Cairo.SurfaceRecord.t
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class option
    val pixbufGetFromWindow :
      'a WindowClass.class
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> base GdkPixbuf.PixbufClass.class option
    val pointerGrab :
      'a WindowClass.class
       * bool
       * EventMask.t
       * 'b WindowClass.class option
       * 'c CursorClass.class option
       * LargeInt.int
       -> GrabStatus.t
    val pointerIsGrabbed : unit -> bool
    val pointerUngrab : LargeInt.int -> unit
    val preParseLibgtkOnly : unit -> unit
    val propertyDelete : 'a WindowClass.class * AtomRecord.t -> unit
    val propertyGet :
      'a WindowClass.class
       * AtomRecord.t
       * AtomRecord.t
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> (AtomRecord.t
            * LargeInt.int
            * GUInt8CArrayN.t)
            option
    val queryDepths : unit -> GIntCArrayN.t
    val queryVisualTypes : unit -> VisualTypeCArrayN.t
    val selectionConvert :
      'a WindowClass.class
       * AtomRecord.t
       * AtomRecord.t
       * LargeInt.int
       -> unit
    val selectionOwnerGet : AtomRecord.t -> base WindowClass.class option
    val selectionOwnerGetForDisplay : 'a DisplayClass.class * AtomRecord.t -> base WindowClass.class option
    val selectionOwnerSet :
      'a WindowClass.class option
       * AtomRecord.t
       * LargeInt.int
       * bool
       -> bool
    val selectionOwnerSetForDisplay :
      'a DisplayClass.class
       * 'b WindowClass.class option
       * AtomRecord.t
       * LargeInt.int
       * bool
       -> bool
    val selectionSendNotify :
      'a WindowClass.class
       * AtomRecord.t
       * AtomRecord.t
       * AtomRecord.t
       * LargeInt.int
       -> unit
    val selectionSendNotifyForDisplay :
      'a DisplayClass.class
       * 'b WindowClass.class
       * AtomRecord.t
       * AtomRecord.t
       * AtomRecord.t
       * LargeInt.int
       -> unit
    val setAllowedBackends : string -> unit
    val setDoubleClickTime : LargeInt.int -> unit
    val setProgramClass : string -> unit
    val setShowEvents : bool -> unit
    val settingGet : string * GObject.ValueRecord.t -> bool
    val synthesizeWindowState :
      'a WindowClass.class
       * WindowState.t
       * WindowState.t
       -> unit
    val testRenderSync : 'a WindowClass.class -> unit
    val testSimulateButton :
      'a WindowClass.class
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ModifierType.t
       * EventType.t
       -> bool
    val testSimulateKey :
      'a WindowClass.class
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       * ModifierType.t
       * EventType.t
       -> bool
    val textPropertyToUtf8ListForDisplay :
      'a DisplayClass.class
       * AtomRecord.t
       * LargeInt.int
       * GUInt8CArrayN.t
       -> LargeInt.int * Utf8CPtrArray.t
    val threadsEnter : unit -> unit
    val threadsInit : unit -> unit
    val threadsLeave : unit -> unit
    val unicodeToKeyval : LargeInt.int -> LargeInt.int
    val utf8ToStringTarget : string -> string option
  end
