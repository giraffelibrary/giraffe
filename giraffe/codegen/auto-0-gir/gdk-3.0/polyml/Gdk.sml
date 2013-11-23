structure Gdk : GDK =
  struct
    local
      open PolyMLFFI
    in
      val atomIntern_ = call (load_sym libgdk "gdk_atom_intern") (FFI.String.PolyML.INPTR &&> FFI.Bool.PolyML.VAL --> GdkAtomRecord.PolyML.PTR)
      val atomInternStaticString_ = call (load_sym libgdk "gdk_atom_intern_static_string") (FFI.String.PolyML.INPTR --> GdkAtomRecord.PolyML.PTR)
      val beep_ = call (load_sym libgdk "gdk_beep") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val cairoCreate_ = call (load_sym libgdk "gdk_cairo_create") (GObjectObjectClass.PolyML.PTR --> CairoContextRecord.PolyML.PTR)
      val cairoGetClipRectangle_ = call (load_sym libgdk "gdk_cairo_get_clip_rectangle") (CairoContextRecord.PolyML.PTR &&> GdkRectangleRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val cairoRectangle_ = call (load_sym libgdk "gdk_cairo_rectangle") (CairoContextRecord.PolyML.PTR &&> GdkRectangleRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val cairoRegion_ = call (load_sym libgdk "gdk_cairo_region") (CairoContextRecord.PolyML.PTR &&> CairoRegionRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val cairoRegionCreateFromSurface_ = call (load_sym libgdk "gdk_cairo_region_create_from_surface") (CairoSurfaceRecord.PolyML.PTR --> CairoRegionRecord.PolyML.PTR)
      val cairoSetSourceColor_ = call (load_sym libgdk "gdk_cairo_set_source_color") (CairoContextRecord.PolyML.PTR &&> GdkColorRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val cairoSetSourcePixbuf_ =
        call (load_sym libgdk "gdk_cairo_set_source_pixbuf")
          (
            CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val cairoSetSourceRgba_ = call (load_sym libgdk "gdk_cairo_set_source_rgba") (CairoContextRecord.PolyML.PTR &&> GdkRgbaRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val cairoSetSourceWindow_ =
        call (load_sym libgdk "gdk_cairo_set_source_window")
          (
            CairoContextRecord.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Double.PolyML.VAL
             &&> FFI.Double.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val colorParse_ = call (load_sym libgdk "gdk_color_parse") (FFI.String.PolyML.INPTR &&> GdkColorRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val disableMultidevice_ = call (load_sym libgdk "gdk_disable_multidevice") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val dragAbort_ = call (load_sym libgdk "gdk_drag_abort") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val dragDrop_ = call (load_sym libgdk "gdk_drag_drop") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val dragDropSucceeded_ = call (load_sym libgdk "gdk_drag_drop_succeeded") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val dragFindWindowForScreen_ =
        call (load_sym libgdk "gdk_drag_find_window_for_screen")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> GdkDragProtocol.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val dragGetSelection_ = call (load_sym libgdk "gdk_drag_get_selection") (GObjectObjectClass.PolyML.PTR --> GdkAtomRecord.PolyML.PTR)
      val dragMotion_ =
        call (load_sym libgdk "gdk_drag_motion")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkDragProtocol.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GdkDragAction.PolyML.VAL
             &&> GdkDragAction.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val dragStatus_ =
        call (load_sym libgdk "gdk_drag_status")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkDragAction.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val dropFinish_ =
        call (load_sym libgdk "gdk_drop_finish")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val dropReply_ =
        call (load_sym libgdk "gdk_drop_reply")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val errorTrapPop_ = call (load_sym libgdk "gdk_error_trap_pop") (FFI.PolyML.VOID --> FFI.Int.PolyML.VAL)
      val errorTrapPopIgnored_ = call (load_sym libgdk "gdk_error_trap_pop_ignored") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val errorTrapPush_ = call (load_sym libgdk "gdk_error_trap_push") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val eventGet_ = call (load_sym libgdk "gdk_event_get") (FFI.PolyML.VOID --> GdkEvent.PolyML.PTR)
      val eventPeek_ = call (load_sym libgdk "gdk_event_peek") (FFI.PolyML.VOID --> GdkEvent.PolyML.PTR)
      val eventRequestMotions_ = call (load_sym libgdk "gdk_event_request_motions") (GdkEventMotionRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val eventsPending_ = call (load_sym libgdk "gdk_events_pending") (FFI.PolyML.VOID --> FFI.Bool.PolyML.VAL)
      val flush_ = call (load_sym libgdk "gdk_flush") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val getDefaultRootWindow_ = call (load_sym libgdk "gdk_get_default_root_window") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDisplay_ = call (load_sym libgdk "gdk_get_display") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val getDisplayArgName_ = call (load_sym libgdk "gdk_get_display_arg_name") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val getProgramClass_ = call (load_sym libgdk "gdk_get_program_class") (FFI.PolyML.VOID --> FFI.String.PolyML.RETPTR)
      val getShowEvents_ = call (load_sym libgdk "gdk_get_show_events") (FFI.PolyML.VOID --> FFI.Bool.PolyML.VAL)
      val keyvalConvertCase_ =
        call (load_sym libgdk "gdk_keyval_convert_case")
          (
            FFI.UInt.PolyML.VAL
             &&> FFI.UInt.PolyML.REF
             &&> FFI.UInt.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val keyvalFromName_ = call (load_sym libgdk "gdk_keyval_from_name") (FFI.String.PolyML.INPTR --> FFI.UInt.PolyML.VAL)
      val keyvalIsLower_ = call (load_sym libgdk "gdk_keyval_is_lower") (FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val keyvalIsUpper_ = call (load_sym libgdk "gdk_keyval_is_upper") (FFI.UInt.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val keyvalName_ = call (load_sym libgdk "gdk_keyval_name") (FFI.UInt.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val keyvalToLower_ = call (load_sym libgdk "gdk_keyval_to_lower") (FFI.UInt.PolyML.VAL --> FFI.UInt.PolyML.VAL)
      val keyvalToUnicode_ = call (load_sym libgdk "gdk_keyval_to_unicode") (FFI.UInt.PolyML.VAL --> FFI.UInt32.PolyML.VAL)
      val keyvalToUpper_ = call (load_sym libgdk "gdk_keyval_to_upper") (FFI.UInt.PolyML.VAL --> FFI.UInt.PolyML.VAL)
      val notifyStartupComplete_ = call (load_sym libgdk "gdk_notify_startup_complete") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val notifyStartupCompleteWithId_ = call (load_sym libgdk "gdk_notify_startup_complete_with_id") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val offscreenWindowGetEmbedder_ = call (load_sym libgdk "gdk_offscreen_window_get_embedder") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val offscreenWindowGetSurface_ = call (load_sym libgdk "gdk_offscreen_window_get_surface") (GObjectObjectClass.PolyML.PTR --> CairoSurfaceRecord.PolyML.PTR)
      val offscreenWindowSetEmbedder_ = call (load_sym libgdk "gdk_offscreen_window_set_embedder") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val pangoContextGet_ = call (load_sym libgdk "gdk_pango_context_get") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val pangoContextGetForScreen_ = call (load_sym libgdk "gdk_pango_context_get_for_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val pixbufGetFromSurface_ =
        call (load_sym libgdk "gdk_pixbuf_get_from_surface")
          (
            CairoSurfaceRecord.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val pixbufGetFromWindow_ =
        call (load_sym libgdk "gdk_pixbuf_get_from_window")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> GObjectObjectClass.PolyML.PTR
          )
      val preParseLibgtkOnly_ = call (load_sym libgdk "gdk_pre_parse_libgtk_only") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val propertyDelete_ = call (load_sym libgdk "gdk_property_delete") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> FFI.PolyML.VOID)
      val rectangleIntersect_ =
        call (load_sym libgdk "gdk_rectangle_intersect")
          (
            GdkRectangleRecord.PolyML.PTR
             &&> GdkRectangleRecord.PolyML.PTR
             &&> GdkRectangleRecord.PolyML.PTR
             --> FFI.Bool.PolyML.VAL
          )
      val rectangleUnion_ =
        call (load_sym libgdk "gdk_rectangle_union")
          (
            GdkRectangleRecord.PolyML.PTR
             &&> GdkRectangleRecord.PolyML.PTR
             &&> GdkRectangleRecord.PolyML.PTR
             --> FFI.PolyML.VOID
          )
      val selectionConvert_ =
        call (load_sym libgdk "gdk_selection_convert")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val selectionOwnerGet_ = call (load_sym libgdk "gdk_selection_owner_get") (GdkAtomRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val selectionOwnerGetForDisplay_ = call (load_sym libgdk "gdk_selection_owner_get_for_display") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val selectionOwnerSet_ =
        call (load_sym libgdk "gdk_selection_owner_set")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val selectionOwnerSetForDisplay_ =
        call (load_sym libgdk "gdk_selection_owner_set_for_display")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val selectionSendNotify_ =
        call (load_sym libgdk "gdk_selection_send_notify")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val selectionSendNotifyForDisplay_ =
        call (load_sym libgdk "gdk_selection_send_notify_for_display")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> GdkAtomRecord.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setDoubleClickTime_ = call (load_sym libgdk "gdk_set_double_click_time") (FFI.UInt.PolyML.VAL --> FFI.PolyML.VOID)
      val setProgramClass_ = call (load_sym libgdk "gdk_set_program_class") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val setShowEvents_ = call (load_sym libgdk "gdk_set_show_events") (FFI.Bool.PolyML.VAL --> FFI.PolyML.VOID)
      val settingGet_ = call (load_sym libgdk "gdk_setting_get") (FFI.String.PolyML.INPTR &&> GObjectValueRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val synthesizeWindowState_ =
        call (load_sym libgdk "gdk_synthesize_window_state")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GdkWindowState.PolyML.VAL
             &&> GdkWindowState.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val testRenderSync_ = call (load_sym libgdk "gdk_test_render_sync") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val testSimulateButton_ =
        call (load_sym libgdk "gdk_test_simulate_button")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             &&> GdkEventType.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val testSimulateKey_ =
        call (load_sym libgdk "gdk_test_simulate_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> FFI.UInt.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             &&> GdkEventType.PolyML.VAL
             --> FFI.Bool.PolyML.VAL
          )
      val threadsEnter_ = call (load_sym libgdk "gdk_threads_enter") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val threadsInit_ = call (load_sym libgdk "gdk_threads_init") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val threadsLeave_ = call (load_sym libgdk "gdk_threads_leave") (FFI.PolyML.VOID --> FFI.PolyML.VOID)
      val unicodeToKeyval_ = call (load_sym libgdk "gdk_unicode_to_keyval") (FFI.UInt32.PolyML.VAL --> FFI.UInt.PolyML.VAL)
      val utf8ToStringTarget_ = call (load_sym libgdk "gdk_utf8_to_string_target") (FFI.String.PolyML.INPTR --> FFI.String.PolyML.RETPTR)
    end
    structure RectangleRecord = GdkRectangleRecord
    structure AppLaunchContextClass = GdkAppLaunchContextClass
    structure AtomRecord = GdkAtomRecord
    structure AxisUse = GdkAxisUse
    structure ByteOrder = GdkByteOrder
    structure ColorRecord = GdkColorRecord
    structure CrossingMode = GdkCrossingMode
    structure CursorClass = GdkCursorClass
    structure CursorType = GdkCursorType
    structure DeviceClass = GdkDeviceClass
    structure DeviceManagerClass = GdkDeviceManagerClass
    structure DeviceType = GdkDeviceType
    structure DisplayClass = GdkDisplayClass
    structure DisplayManagerClass = GdkDisplayManagerClass
    structure DragAction = GdkDragAction
    structure DragContextClass = GdkDragContextClass
    structure DragProtocol = GdkDragProtocol
    structure Event = GdkEvent
    structure EventMask = GdkEventMask
    structure EventType = GdkEventType
    structure ExtensionMode = GdkExtensionMode
    structure FilterReturn = GdkFilterReturn
    structure GeometryRecord = GdkGeometryRecord
    structure GrabOwnership = GdkGrabOwnership
    structure GrabStatus = GdkGrabStatus
    structure Gravity = GdkGravity
    structure InputMode = GdkInputMode
    structure InputSource = GdkInputSource
    structure KeymapClass = GdkKeymapClass
    structure KeymapKeyRecord = GdkKeymapKeyRecord
    structure ModifierType = GdkModifierType
    structure NotifyType = GdkNotifyType
    structure OwnerChange = GdkOwnerChange
    structure PropMode = GdkPropMode
    structure PropertyState = GdkPropertyState
    structure RgbaRecord = GdkRgbaRecord
    structure ScreenClass = GdkScreenClass
    structure ScrollDirection = GdkScrollDirection
    structure SettingAction = GdkSettingAction
    structure Status = GdkStatus
    structure VisibilityState = GdkVisibilityState
    structure VisualClass = GdkVisualClass
    structure VisualType = GdkVisualType
    structure WMDecoration = GdkWMDecoration
    structure WMFunction = GdkWMFunction
    structure WindowClass = GdkWindowClass
    structure WindowAttrRecord = GdkWindowAttrRecord
    structure WindowAttributesType = GdkWindowAttributesType
    structure WindowEdge = GdkWindowEdge
    structure WindowHints = GdkWindowHints
    structure WindowState = GdkWindowState
    structure WindowType = GdkWindowType
    structure WindowTypeHint = GdkWindowTypeHint
    structure WindowWindowClass = GdkWindowWindowClass
    structure EventAnyRecord = GdkEventAnyRecord
    structure EventButtonRecord = GdkEventButtonRecord
    structure EventConfigureRecord = GdkEventConfigureRecord
    structure EventCrossingRecord = GdkEventCrossingRecord
    structure EventDNDRecord = GdkEventDNDRecord
    structure EventExposeRecord = GdkEventExposeRecord
    structure EventFocusRecord = GdkEventFocusRecord
    structure EventGrabBrokenRecord = GdkEventGrabBrokenRecord
    structure EventKeyRecord = GdkEventKeyRecord
    structure EventMotionRecord = GdkEventMotionRecord
    structure EventOwnerChangeRecord = GdkEventOwnerChangeRecord
    structure EventPropertyRecord = GdkEventPropertyRecord
    structure EventProximityRecord = GdkEventProximityRecord
    structure EventScrollRecord = GdkEventScrollRecord
    structure EventSelectionRecord = GdkEventSelectionRecord
    structure EventSettingRecord = GdkEventSettingRecord
    structure EventVisibilityRecord = GdkEventVisibilityRecord
    structure EventWindowStateRecord = GdkEventWindowStateRecord
    structure AppLaunchContext = GdkAppLaunchContext
    structure Atom = GdkAtom
    structure Color = GdkColor
    structure Cursor = GdkCursor
    structure Device = GdkDevice
    structure DeviceManager = GdkDeviceManager
    structure Display = GdkDisplay
    structure DisplayManager = GdkDisplayManager
    structure DragContext = GdkDragContext
    structure Geometry = GdkGeometry
    structure Keymap = GdkKeymap
    structure KeymapKey = GdkKeymapKey
    structure Rgba = GdkRgba
    structure Screen = GdkScreen
    structure Visual = GdkVisual
    structure Window = GdkWindow
    structure WindowAttr = GdkWindowAttr
    val CURRENT_TIME = 0
    val KEY_0 = 48
    val KEY_1 = 49
    val KEY_2 = 50
    val KEY_3 = 51
    val KEY_3270_AltCursor = 64784
    val KEY_3270_Attn = 64782
    val KEY_3270_BackTab = 64773
    val KEY_3270_ChangeScreen = 64793
    val KEY_3270_Copy = 64789
    val KEY_3270_CursorBlink = 64783
    val KEY_3270_CursorSelect = 64796
    val KEY_3270_DeleteWord = 64794
    val KEY_3270_Duplicate = 64769
    val KEY_3270_Enter = 64798
    val KEY_3270_EraseEOF = 64774
    val KEY_3270_EraseInput = 64775
    val KEY_3270_ExSelect = 64795
    val KEY_3270_FieldMark = 64770
    val KEY_3270_Ident = 64787
    val KEY_3270_Jump = 64786
    val KEY_3270_KeyClick = 64785
    val KEY_3270_Left2 = 64772
    val KEY_3270_PA1 = 64778
    val KEY_3270_PA2 = 64779
    val KEY_3270_PA3 = 64780
    val KEY_3270_Play = 64790
    val KEY_3270_PrintScreen = 64797
    val KEY_3270_Quit = 64777
    val KEY_3270_Record = 64792
    val KEY_3270_Reset = 64776
    val KEY_3270_Right2 = 64771
    val KEY_3270_Rule = 64788
    val KEY_3270_Setup = 64791
    val KEY_3270_Test = 64781
    val KEY_4 = 52
    val KEY_5 = 53
    val KEY_6 = 54
    val KEY_7 = 55
    val KEY_8 = 56
    val KEY_9 = 57
    val KEY_A = 65
    val KEY_AE = 198
    val KEY_Aacute = 193
    val KEY_Abelowdot = 16785056
    val KEY_Abreve = 451
    val KEY_Abreveacute = 16785070
    val KEY_Abrevebelowdot = 16785078
    val KEY_Abrevegrave = 16785072
    val KEY_Abrevehook = 16785074
    val KEY_Abrevetilde = 16785076
    val KEY_AccessX_Enable = 65136
    val KEY_AccessX_Feedback_Enable = 65137
    val KEY_Acircumflex = 194
    val KEY_Acircumflexacute = 16785060
    val KEY_Acircumflexbelowdot = 16785068
    val KEY_Acircumflexgrave = 16785062
    val KEY_Acircumflexhook = 16785064
    val KEY_Acircumflextilde = 16785066
    val KEY_AddFavorite = 269025081
    val KEY_Adiaeresis = 196
    val KEY_Agrave = 192
    val KEY_Ahook = 16785058
    val KEY_Alt_L = 65513
    val KEY_Alt_R = 65514
    val KEY_Amacron = 960
    val KEY_Aogonek = 417
    val KEY_ApplicationLeft = 269025104
    val KEY_ApplicationRight = 269025105
    val KEY_Arabic_0 = 16778848
    val KEY_Arabic_1 = 16778849
    val KEY_Arabic_2 = 16778850
    val KEY_Arabic_3 = 16778851
    val KEY_Arabic_4 = 16778852
    val KEY_Arabic_5 = 16778853
    val KEY_Arabic_6 = 16778854
    val KEY_Arabic_7 = 16778855
    val KEY_Arabic_8 = 16778856
    val KEY_Arabic_9 = 16778857
    val KEY_Arabic_ain = 1497
    val KEY_Arabic_alef = 1479
    val KEY_Arabic_alefmaksura = 1513
    val KEY_Arabic_beh = 1480
    val KEY_Arabic_comma = 1452
    val KEY_Arabic_dad = 1494
    val KEY_Arabic_dal = 1487
    val KEY_Arabic_damma = 1519
    val KEY_Arabic_dammatan = 1516
    val KEY_Arabic_ddal = 16778888
    val KEY_Arabic_farsi_yeh = 16778956
    val KEY_Arabic_fatha = 1518
    val KEY_Arabic_fathatan = 1515
    val KEY_Arabic_feh = 1505
    val KEY_Arabic_fullstop = 16778964
    val KEY_Arabic_gaf = 16778927
    val KEY_Arabic_ghain = 1498
    val KEY_Arabic_ha = 1511
    val KEY_Arabic_hah = 1485
    val KEY_Arabic_hamza = 1473
    val KEY_Arabic_hamza_above = 16778836
    val KEY_Arabic_hamza_below = 16778837
    val KEY_Arabic_hamzaonalef = 1475
    val KEY_Arabic_hamzaonwaw = 1476
    val KEY_Arabic_hamzaonyeh = 1478
    val KEY_Arabic_hamzaunderalef = 1477
    val KEY_Arabic_heh = 1511
    val KEY_Arabic_heh_doachashmee = 16778942
    val KEY_Arabic_heh_goal = 16778945
    val KEY_Arabic_jeem = 1484
    val KEY_Arabic_jeh = 16778904
    val KEY_Arabic_kaf = 1507
    val KEY_Arabic_kasra = 1520
    val KEY_Arabic_kasratan = 1517
    val KEY_Arabic_keheh = 16778921
    val KEY_Arabic_khah = 1486
    val KEY_Arabic_lam = 1508
    val KEY_Arabic_madda_above = 16778835
    val KEY_Arabic_maddaonalef = 1474
    val KEY_Arabic_meem = 1509
    val KEY_Arabic_noon = 1510
    val KEY_Arabic_noon_ghunna = 16778938
    val KEY_Arabic_peh = 16778878
    val KEY_Arabic_percent = 16778858
    val KEY_Arabic_qaf = 1506
    val KEY_Arabic_question_mark = 1471
    val KEY_Arabic_ra = 1489
    val KEY_Arabic_rreh = 16778897
    val KEY_Arabic_sad = 1493
    val KEY_Arabic_seen = 1491
    val KEY_Arabic_semicolon = 1467
    val KEY_Arabic_shadda = 1521
    val KEY_Arabic_sheen = 1492
    val KEY_Arabic_sukun = 1522
    val KEY_Arabic_superscript_alef = 16778864
    val KEY_Arabic_switch = 65406
    val KEY_Arabic_tah = 1495
    val KEY_Arabic_tatweel = 1504
    val KEY_Arabic_tcheh = 16778886
    val KEY_Arabic_teh = 1482
    val KEY_Arabic_tehmarbuta = 1481
    val KEY_Arabic_thal = 1488
    val KEY_Arabic_theh = 1483
    val KEY_Arabic_tteh = 16778873
    val KEY_Arabic_veh = 16778916
    val KEY_Arabic_waw = 1512
    val KEY_Arabic_yeh = 1514
    val KEY_Arabic_yeh_baree = 16778962
    val KEY_Arabic_zah = 1496
    val KEY_Arabic_zain = 1490
    val KEY_Aring = 197
    val KEY_Armenian_AT = 16778552
    val KEY_Armenian_AYB = 16778545
    val KEY_Armenian_BEN = 16778546
    val KEY_Armenian_CHA = 16778569
    val KEY_Armenian_DA = 16778548
    val KEY_Armenian_DZA = 16778561
    val KEY_Armenian_E = 16778551
    val KEY_Armenian_FE = 16778582
    val KEY_Armenian_GHAT = 16778562
    val KEY_Armenian_GIM = 16778547
    val KEY_Armenian_HI = 16778565
    val KEY_Armenian_HO = 16778560
    val KEY_Armenian_INI = 16778555
    val KEY_Armenian_JE = 16778571
    val KEY_Armenian_KE = 16778580
    val KEY_Armenian_KEN = 16778559
    val KEY_Armenian_KHE = 16778557
    val KEY_Armenian_LYUN = 16778556
    val KEY_Armenian_MEN = 16778564
    val KEY_Armenian_NU = 16778566
    val KEY_Armenian_O = 16778581
    val KEY_Armenian_PE = 16778570
    val KEY_Armenian_PYUR = 16778579
    val KEY_Armenian_RA = 16778572
    val KEY_Armenian_RE = 16778576
    val KEY_Armenian_SE = 16778573
    val KEY_Armenian_SHA = 16778567
    val KEY_Armenian_TCHE = 16778563
    val KEY_Armenian_TO = 16778553
    val KEY_Armenian_TSA = 16778558
    val KEY_Armenian_TSO = 16778577
    val KEY_Armenian_TYUN = 16778575
    val KEY_Armenian_VEV = 16778574
    val KEY_Armenian_VO = 16778568
    val KEY_Armenian_VYUN = 16778578
    val KEY_Armenian_YECH = 16778549
    val KEY_Armenian_ZA = 16778550
    val KEY_Armenian_ZHE = 16778554
    val KEY_Armenian_accent = 16778587
    val KEY_Armenian_amanak = 16778588
    val KEY_Armenian_apostrophe = 16778586
    val KEY_Armenian_at = 16778600
    val KEY_Armenian_ayb = 16778593
    val KEY_Armenian_ben = 16778594
    val KEY_Armenian_but = 16778589
    val KEY_Armenian_cha = 16778617
    val KEY_Armenian_da = 16778596
    val KEY_Armenian_dza = 16778609
    val KEY_Armenian_e = 16778599
    val KEY_Armenian_exclam = 16778588
    val KEY_Armenian_fe = 16778630
    val KEY_Armenian_full_stop = 16778633
    val KEY_Armenian_ghat = 16778610
    val KEY_Armenian_gim = 16778595
    val KEY_Armenian_hi = 16778613
    val KEY_Armenian_ho = 16778608
    val KEY_Armenian_hyphen = 16778634
    val KEY_Armenian_ini = 16778603
    val KEY_Armenian_je = 16778619
    val KEY_Armenian_ke = 16778628
    val KEY_Armenian_ken = 16778607
    val KEY_Armenian_khe = 16778605
    val KEY_Armenian_ligature_ew = 16778631
    val KEY_Armenian_lyun = 16778604
    val KEY_Armenian_men = 16778612
    val KEY_Armenian_nu = 16778614
    val KEY_Armenian_o = 16778629
    val KEY_Armenian_paruyk = 16778590
    val KEY_Armenian_pe = 16778618
    val KEY_Armenian_pyur = 16778627
    val KEY_Armenian_question = 16778590
    val KEY_Armenian_ra = 16778620
    val KEY_Armenian_re = 16778624
    val KEY_Armenian_se = 16778621
    val KEY_Armenian_separation_mark = 16778589
    val KEY_Armenian_sha = 16778615
    val KEY_Armenian_shesht = 16778587
    val KEY_Armenian_tche = 16778611
    val KEY_Armenian_to = 16778601
    val KEY_Armenian_tsa = 16778606
    val KEY_Armenian_tso = 16778625
    val KEY_Armenian_tyun = 16778623
    val KEY_Armenian_verjaket = 16778633
    val KEY_Armenian_vev = 16778622
    val KEY_Armenian_vo = 16778616
    val KEY_Armenian_vyun = 16778626
    val KEY_Armenian_yech = 16778597
    val KEY_Armenian_yentamna = 16778634
    val KEY_Armenian_za = 16778598
    val KEY_Armenian_zhe = 16778602
    val KEY_Atilde = 195
    val KEY_AudibleBell_Enable = 65146
    val KEY_AudioCycleTrack = 269025179
    val KEY_AudioForward = 269025175
    val KEY_AudioLowerVolume = 269025041
    val KEY_AudioMedia = 269025074
    val KEY_AudioMute = 269025042
    val KEY_AudioNext = 269025047
    val KEY_AudioPause = 269025073
    val KEY_AudioPlay = 269025044
    val KEY_AudioPrev = 269025046
    val KEY_AudioRaiseVolume = 269025043
    val KEY_AudioRandomPlay = 269025177
    val KEY_AudioRecord = 269025052
    val KEY_AudioRepeat = 269025176
    val KEY_AudioRewind = 269025086
    val KEY_AudioStop = 269025045
    val KEY_Away = 269025165
    val KEY_B = 66
    val KEY_Babovedot = 16784898
    val KEY_Back = 269025062
    val KEY_BackForward = 269025087
    val KEY_BackSpace = 65288
    val KEY_Battery = 269025171
    val KEY_Begin = 65368
    val KEY_Blue = 269025190
    val KEY_Bluetooth = 269025172
    val KEY_Book = 269025106
    val KEY_BounceKeys_Enable = 65140
    val KEY_Break = 65387
    val KEY_BrightnessAdjust = 269025083
    val KEY_Byelorussian_SHORTU = 1726
    val KEY_Byelorussian_shortu = 1710
    val KEY_C = 67
    val KEY_CD = 269025107
    val KEY_Cabovedot = 709
    val KEY_Cacute = 454
    val KEY_Calculator = 269025053
    val KEY_Calendar = 269025056
    val KEY_Cancel = 65385
    val KEY_Caps_Lock = 65509
    val KEY_Ccaron = 456
    val KEY_Ccedilla = 199
    val KEY_Ccircumflex = 710
    val KEY_Clear = 65291
    val KEY_ClearGrab = 269024801
    val KEY_Close = 269025110
    val KEY_Codeinput = 65335
    val KEY_ColonSign = 16785569
    val KEY_Community = 269025085
    val KEY_ContrastAdjust = 269025058
    val KEY_Control_L = 65507
    val KEY_Control_R = 65508
    val KEY_Copy = 269025111
    val KEY_CruzeiroSign = 16785570
    val KEY_Cut = 269025112
    val KEY_CycleAngle = 269025180
    val KEY_Cyrillic_A = 1761
    val KEY_Cyrillic_BE = 1762
    val KEY_Cyrillic_CHE = 1790
    val KEY_Cyrillic_CHE_descender = 16778422
    val KEY_Cyrillic_CHE_vertstroke = 16778424
    val KEY_Cyrillic_DE = 1764
    val KEY_Cyrillic_DZHE = 1727
    val KEY_Cyrillic_E = 1788
    val KEY_Cyrillic_EF = 1766
    val KEY_Cyrillic_EL = 1772
    val KEY_Cyrillic_EM = 1773
    val KEY_Cyrillic_EN = 1774
    val KEY_Cyrillic_EN_descender = 16778402
    val KEY_Cyrillic_ER = 1778
    val KEY_Cyrillic_ES = 1779
    val KEY_Cyrillic_GHE = 1767
    val KEY_Cyrillic_GHE_bar = 16778386
    val KEY_Cyrillic_HA = 1768
    val KEY_Cyrillic_HARDSIGN = 1791
    val KEY_Cyrillic_HA_descender = 16778418
    val KEY_Cyrillic_I = 1769
    val KEY_Cyrillic_IE = 1765
    val KEY_Cyrillic_IO = 1715
    val KEY_Cyrillic_I_macron = 16778466
    val KEY_Cyrillic_JE = 1720
    val KEY_Cyrillic_KA = 1771
    val KEY_Cyrillic_KA_descender = 16778394
    val KEY_Cyrillic_KA_vertstroke = 16778396
    val KEY_Cyrillic_LJE = 1721
    val KEY_Cyrillic_NJE = 1722
    val KEY_Cyrillic_O = 1775
    val KEY_Cyrillic_O_bar = 16778472
    val KEY_Cyrillic_PE = 1776
    val KEY_Cyrillic_SCHWA = 16778456
    val KEY_Cyrillic_SHA = 1787
    val KEY_Cyrillic_SHCHA = 1789
    val KEY_Cyrillic_SHHA = 16778426
    val KEY_Cyrillic_SHORTI = 1770
    val KEY_Cyrillic_SOFTSIGN = 1784
    val KEY_Cyrillic_TE = 1780
    val KEY_Cyrillic_TSE = 1763
    val KEY_Cyrillic_U = 1781
    val KEY_Cyrillic_U_macron = 16778478
    val KEY_Cyrillic_U_straight = 16778414
    val KEY_Cyrillic_U_straight_bar = 16778416
    val KEY_Cyrillic_VE = 1783
    val KEY_Cyrillic_YA = 1777
    val KEY_Cyrillic_YERU = 1785
    val KEY_Cyrillic_YU = 1760
    val KEY_Cyrillic_ZE = 1786
    val KEY_Cyrillic_ZHE = 1782
    val KEY_Cyrillic_ZHE_descender = 16778390
    val KEY_Cyrillic_a = 1729
    val KEY_Cyrillic_be = 1730
    val KEY_Cyrillic_che = 1758
    val KEY_Cyrillic_che_descender = 16778423
    val KEY_Cyrillic_che_vertstroke = 16778425
    val KEY_Cyrillic_de = 1732
    val KEY_Cyrillic_dzhe = 1711
    val KEY_Cyrillic_e = 1756
    val KEY_Cyrillic_ef = 1734
    val KEY_Cyrillic_el = 1740
    val KEY_Cyrillic_em = 1741
    val KEY_Cyrillic_en = 1742
    val KEY_Cyrillic_en_descender = 16778403
    val KEY_Cyrillic_er = 1746
    val KEY_Cyrillic_es = 1747
    val KEY_Cyrillic_ghe = 1735
    val KEY_Cyrillic_ghe_bar = 16778387
    val KEY_Cyrillic_ha = 1736
    val KEY_Cyrillic_ha_descender = 16778419
    val KEY_Cyrillic_hardsign = 1759
    val KEY_Cyrillic_i = 1737
    val KEY_Cyrillic_i_macron = 16778467
    val KEY_Cyrillic_ie = 1733
    val KEY_Cyrillic_io = 1699
    val KEY_Cyrillic_je = 1704
    val KEY_Cyrillic_ka = 1739
    val KEY_Cyrillic_ka_descender = 16778395
    val KEY_Cyrillic_ka_vertstroke = 16778397
    val KEY_Cyrillic_lje = 1705
    val KEY_Cyrillic_nje = 1706
    val KEY_Cyrillic_o = 1743
    val KEY_Cyrillic_o_bar = 16778473
    val KEY_Cyrillic_pe = 1744
    val KEY_Cyrillic_schwa = 16778457
    val KEY_Cyrillic_sha = 1755
    val KEY_Cyrillic_shcha = 1757
    val KEY_Cyrillic_shha = 16778427
    val KEY_Cyrillic_shorti = 1738
    val KEY_Cyrillic_softsign = 1752
    val KEY_Cyrillic_te = 1748
    val KEY_Cyrillic_tse = 1731
    val KEY_Cyrillic_u = 1749
    val KEY_Cyrillic_u_macron = 16778479
    val KEY_Cyrillic_u_straight = 16778415
    val KEY_Cyrillic_u_straight_bar = 16778417
    val KEY_Cyrillic_ve = 1751
    val KEY_Cyrillic_ya = 1745
    val KEY_Cyrillic_yeru = 1753
    val KEY_Cyrillic_yu = 1728
    val KEY_Cyrillic_ze = 1754
    val KEY_Cyrillic_zhe = 1750
    val KEY_Cyrillic_zhe_descender = 16778391
    val KEY_D = 68
    val KEY_DOS = 269025114
    val KEY_Dabovedot = 16784906
    val KEY_Dcaron = 463
    val KEY_Delete = 65535
    val KEY_Display = 269025113
    val KEY_Documents = 269025115
    val KEY_DongSign = 16785579
    val KEY_Down = 65364
    val KEY_Dstroke = 464
    val KEY_E = 69
    val KEY_ENG = 957
    val KEY_ETH = 208
    val KEY_Eabovedot = 972
    val KEY_Eacute = 201
    val KEY_Ebelowdot = 16785080
    val KEY_Ecaron = 460
    val KEY_Ecircumflex = 202
    val KEY_Ecircumflexacute = 16785086
    val KEY_Ecircumflexbelowdot = 16785094
    val KEY_Ecircumflexgrave = 16785088
    val KEY_Ecircumflexhook = 16785090
    val KEY_Ecircumflextilde = 16785092
    val KEY_EcuSign = 16785568
    val KEY_Ediaeresis = 203
    val KEY_Egrave = 200
    val KEY_Ehook = 16785082
    val KEY_Eisu_Shift = 65327
    val KEY_Eisu_toggle = 65328
    val KEY_Eject = 269025068
    val KEY_Emacron = 938
    val KEY_End = 65367
    val KEY_Eogonek = 458
    val KEY_Escape = 65307
    val KEY_Eth = 208
    val KEY_Etilde = 16785084
    val KEY_EuroSign = 8364
    val KEY_Excel = 269025116
    val KEY_Execute = 65378
    val KEY_Explorer = 269025117
    val KEY_F = 70
    val KEY_F1 = 65470
    val KEY_F10 = 65479
    val KEY_F11 = 65480
    val KEY_F12 = 65481
    val KEY_F13 = 65482
    val KEY_F14 = 65483
    val KEY_F15 = 65484
    val KEY_F16 = 65485
    val KEY_F17 = 65486
    val KEY_F18 = 65487
    val KEY_F19 = 65488
    val KEY_F2 = 65471
    val KEY_F20 = 65489
    val KEY_F21 = 65490
    val KEY_F22 = 65491
    val KEY_F23 = 65492
    val KEY_F24 = 65493
    val KEY_F25 = 65494
    val KEY_F26 = 65495
    val KEY_F27 = 65496
    val KEY_F28 = 65497
    val KEY_F29 = 65498
    val KEY_F3 = 65472
    val KEY_F30 = 65499
    val KEY_F31 = 65500
    val KEY_F32 = 65501
    val KEY_F33 = 65502
    val KEY_F34 = 65503
    val KEY_F35 = 65504
    val KEY_F4 = 65473
    val KEY_F5 = 65474
    val KEY_F6 = 65475
    val KEY_F7 = 65476
    val KEY_F8 = 65477
    val KEY_F9 = 65478
    val KEY_FFrancSign = 16785571
    val KEY_Fabovedot = 16784926
    val KEY_Farsi_0 = 16778992
    val KEY_Farsi_1 = 16778993
    val KEY_Farsi_2 = 16778994
    val KEY_Farsi_3 = 16778995
    val KEY_Farsi_4 = 16778996
    val KEY_Farsi_5 = 16778997
    val KEY_Farsi_6 = 16778998
    val KEY_Farsi_7 = 16778999
    val KEY_Farsi_8 = 16779000
    val KEY_Farsi_9 = 16779001
    val KEY_Farsi_yeh = 16778956
    val KEY_Favorites = 269025072
    val KEY_Finance = 269025084
    val KEY_Find = 65384
    val KEY_First_Virtual_Screen = 65232
    val KEY_Forward = 269025063
    val KEY_FrameBack = 269025181
    val KEY_FrameForward = 269025182
    val KEY_G = 71
    val KEY_Gabovedot = 725
    val KEY_Game = 269025118
    val KEY_Gbreve = 683
    val KEY_Gcaron = 16777702
    val KEY_Gcedilla = 939
    val KEY_Gcircumflex = 728
    val KEY_Georgian_an = 16781520
    val KEY_Georgian_ban = 16781521
    val KEY_Georgian_can = 16781546
    val KEY_Georgian_char = 16781549
    val KEY_Georgian_chin = 16781545
    val KEY_Georgian_cil = 16781548
    val KEY_Georgian_don = 16781523
    val KEY_Georgian_en = 16781524
    val KEY_Georgian_fi = 16781558
    val KEY_Georgian_gan = 16781522
    val KEY_Georgian_ghan = 16781542
    val KEY_Georgian_hae = 16781552
    val KEY_Georgian_har = 16781556
    val KEY_Georgian_he = 16781553
    val KEY_Georgian_hie = 16781554
    val KEY_Georgian_hoe = 16781557
    val KEY_Georgian_in = 16781528
    val KEY_Georgian_jhan = 16781551
    val KEY_Georgian_jil = 16781547
    val KEY_Georgian_kan = 16781529
    val KEY_Georgian_khar = 16781541
    val KEY_Georgian_las = 16781530
    val KEY_Georgian_man = 16781531
    val KEY_Georgian_nar = 16781532
    val KEY_Georgian_on = 16781533
    val KEY_Georgian_par = 16781534
    val KEY_Georgian_phar = 16781540
    val KEY_Georgian_qar = 16781543
    val KEY_Georgian_rae = 16781536
    val KEY_Georgian_san = 16781537
    val KEY_Georgian_shin = 16781544
    val KEY_Georgian_tan = 16781527
    val KEY_Georgian_tar = 16781538
    val KEY_Georgian_un = 16781539
    val KEY_Georgian_vin = 16781525
    val KEY_Georgian_we = 16781555
    val KEY_Georgian_xan = 16781550
    val KEY_Georgian_zen = 16781526
    val KEY_Georgian_zhar = 16781535
    val KEY_Go = 269025119
    val KEY_Greek_ALPHA = 1985
    val KEY_Greek_ALPHAaccent = 1953
    val KEY_Greek_BETA = 1986
    val KEY_Greek_CHI = 2007
    val KEY_Greek_DELTA = 1988
    val KEY_Greek_EPSILON = 1989
    val KEY_Greek_EPSILONaccent = 1954
    val KEY_Greek_ETA = 1991
    val KEY_Greek_ETAaccent = 1955
    val KEY_Greek_GAMMA = 1987
    val KEY_Greek_IOTA = 1993
    val KEY_Greek_IOTAaccent = 1956
    val KEY_Greek_IOTAdiaeresis = 1957
    val KEY_Greek_IOTAdieresis = 1957
    val KEY_Greek_KAPPA = 1994
    val KEY_Greek_LAMBDA = 1995
    val KEY_Greek_LAMDA = 1995
    val KEY_Greek_MU = 1996
    val KEY_Greek_NU = 1997
    val KEY_Greek_OMEGA = 2009
    val KEY_Greek_OMEGAaccent = 1963
    val KEY_Greek_OMICRON = 1999
    val KEY_Greek_OMICRONaccent = 1959
    val KEY_Greek_PHI = 2006
    val KEY_Greek_PI = 2000
    val KEY_Greek_PSI = 2008
    val KEY_Greek_RHO = 2001
    val KEY_Greek_SIGMA = 2002
    val KEY_Greek_TAU = 2004
    val KEY_Greek_THETA = 1992
    val KEY_Greek_UPSILON = 2005
    val KEY_Greek_UPSILONaccent = 1960
    val KEY_Greek_UPSILONdieresis = 1961
    val KEY_Greek_XI = 1998
    val KEY_Greek_ZETA = 1990
    val KEY_Greek_accentdieresis = 1966
    val KEY_Greek_alpha = 2017
    val KEY_Greek_alphaaccent = 1969
    val KEY_Greek_beta = 2018
    val KEY_Greek_chi = 2039
    val KEY_Greek_delta = 2020
    val KEY_Greek_epsilon = 2021
    val KEY_Greek_epsilonaccent = 1970
    val KEY_Greek_eta = 2023
    val KEY_Greek_etaaccent = 1971
    val KEY_Greek_finalsmallsigma = 2035
    val KEY_Greek_gamma = 2019
    val KEY_Greek_horizbar = 1967
    val KEY_Greek_iota = 2025
    val KEY_Greek_iotaaccent = 1972
    val KEY_Greek_iotaaccentdieresis = 1974
    val KEY_Greek_iotadieresis = 1973
    val KEY_Greek_kappa = 2026
    val KEY_Greek_lambda = 2027
    val KEY_Greek_lamda = 2027
    val KEY_Greek_mu = 2028
    val KEY_Greek_nu = 2029
    val KEY_Greek_omega = 2041
    val KEY_Greek_omegaaccent = 1979
    val KEY_Greek_omicron = 2031
    val KEY_Greek_omicronaccent = 1975
    val KEY_Greek_phi = 2038
    val KEY_Greek_pi = 2032
    val KEY_Greek_psi = 2040
    val KEY_Greek_rho = 2033
    val KEY_Greek_sigma = 2034
    val KEY_Greek_switch = 65406
    val KEY_Greek_tau = 2036
    val KEY_Greek_theta = 2024
    val KEY_Greek_upsilon = 2037
    val KEY_Greek_upsilonaccent = 1976
    val KEY_Greek_upsilonaccentdieresis = 1978
    val KEY_Greek_upsilondieresis = 1977
    val KEY_Greek_xi = 2030
    val KEY_Greek_zeta = 2022
    val KEY_Green = 269025188
    val KEY_H = 72
    val KEY_Hangul = 65329
    val KEY_Hangul_A = 3775
    val KEY_Hangul_AE = 3776
    val KEY_Hangul_AraeA = 3830
    val KEY_Hangul_AraeAE = 3831
    val KEY_Hangul_Banja = 65337
    val KEY_Hangul_Cieuc = 3770
    val KEY_Hangul_Codeinput = 65335
    val KEY_Hangul_Dikeud = 3751
    val KEY_Hangul_E = 3780
    val KEY_Hangul_EO = 3779
    val KEY_Hangul_EU = 3793
    val KEY_Hangul_End = 65331
    val KEY_Hangul_Hanja = 65332
    val KEY_Hangul_Hieuh = 3774
    val KEY_Hangul_I = 3795
    val KEY_Hangul_Ieung = 3767
    val KEY_Hangul_J_Cieuc = 3818
    val KEY_Hangul_J_Dikeud = 3802
    val KEY_Hangul_J_Hieuh = 3822
    val KEY_Hangul_J_Ieung = 3816
    val KEY_Hangul_J_Jieuj = 3817
    val KEY_Hangul_J_Khieuq = 3819
    val KEY_Hangul_J_Kiyeog = 3796
    val KEY_Hangul_J_KiyeogSios = 3798
    val KEY_Hangul_J_KkogjiDalrinIeung = 3833
    val KEY_Hangul_J_Mieum = 3811
    val KEY_Hangul_J_Nieun = 3799
    val KEY_Hangul_J_NieunHieuh = 3801
    val KEY_Hangul_J_NieunJieuj = 3800
    val KEY_Hangul_J_PanSios = 3832
    val KEY_Hangul_J_Phieuf = 3821
    val KEY_Hangul_J_Pieub = 3812
    val KEY_Hangul_J_PieubSios = 3813
    val KEY_Hangul_J_Rieul = 3803
    val KEY_Hangul_J_RieulHieuh = 3810
    val KEY_Hangul_J_RieulKiyeog = 3804
    val KEY_Hangul_J_RieulMieum = 3805
    val KEY_Hangul_J_RieulPhieuf = 3809
    val KEY_Hangul_J_RieulPieub = 3806
    val KEY_Hangul_J_RieulSios = 3807
    val KEY_Hangul_J_RieulTieut = 3808
    val KEY_Hangul_J_Sios = 3814
    val KEY_Hangul_J_SsangKiyeog = 3797
    val KEY_Hangul_J_SsangSios = 3815
    val KEY_Hangul_J_Tieut = 3820
    val KEY_Hangul_J_YeorinHieuh = 3834
    val KEY_Hangul_Jamo = 65333
    val KEY_Hangul_Jeonja = 65336
    val KEY_Hangul_Jieuj = 3768
    val KEY_Hangul_Khieuq = 3771
    val KEY_Hangul_Kiyeog = 3745
    val KEY_Hangul_KiyeogSios = 3747
    val KEY_Hangul_KkogjiDalrinIeung = 3827
    val KEY_Hangul_Mieum = 3761
    val KEY_Hangul_MultipleCandidate = 65341
    val KEY_Hangul_Nieun = 3748
    val KEY_Hangul_NieunHieuh = 3750
    val KEY_Hangul_NieunJieuj = 3749
    val KEY_Hangul_O = 3783
    val KEY_Hangul_OE = 3786
    val KEY_Hangul_PanSios = 3826
    val KEY_Hangul_Phieuf = 3773
    val KEY_Hangul_Pieub = 3762
    val KEY_Hangul_PieubSios = 3764
    val KEY_Hangul_PostHanja = 65339
    val KEY_Hangul_PreHanja = 65338
    val KEY_Hangul_PreviousCandidate = 65342
    val KEY_Hangul_Rieul = 3753
    val KEY_Hangul_RieulHieuh = 3760
    val KEY_Hangul_RieulKiyeog = 3754
    val KEY_Hangul_RieulMieum = 3755
    val KEY_Hangul_RieulPhieuf = 3759
    val KEY_Hangul_RieulPieub = 3756
    val KEY_Hangul_RieulSios = 3757
    val KEY_Hangul_RieulTieut = 3758
    val KEY_Hangul_RieulYeorinHieuh = 3823
    val KEY_Hangul_Romaja = 65334
    val KEY_Hangul_SingleCandidate = 65340
    val KEY_Hangul_Sios = 3765
    val KEY_Hangul_Special = 65343
    val KEY_Hangul_SsangDikeud = 3752
    val KEY_Hangul_SsangJieuj = 3769
    val KEY_Hangul_SsangKiyeog = 3746
    val KEY_Hangul_SsangPieub = 3763
    val KEY_Hangul_SsangSios = 3766
    val KEY_Hangul_Start = 65330
    val KEY_Hangul_SunkyeongeumMieum = 3824
    val KEY_Hangul_SunkyeongeumPhieuf = 3828
    val KEY_Hangul_SunkyeongeumPieub = 3825
    val KEY_Hangul_Tieut = 3772
    val KEY_Hangul_U = 3788
    val KEY_Hangul_WA = 3784
    val KEY_Hangul_WAE = 3785
    val KEY_Hangul_WE = 3790
    val KEY_Hangul_WEO = 3789
    val KEY_Hangul_WI = 3791
    val KEY_Hangul_YA = 3777
    val KEY_Hangul_YAE = 3778
    val KEY_Hangul_YE = 3782
    val KEY_Hangul_YEO = 3781
    val KEY_Hangul_YI = 3794
    val KEY_Hangul_YO = 3787
    val KEY_Hangul_YU = 3792
    val KEY_Hangul_YeorinHieuh = 3829
    val KEY_Hangul_switch = 65406
    val KEY_Hankaku = 65321
    val KEY_Hcircumflex = 678
    val KEY_Hebrew_switch = 65406
    val KEY_Help = 65386
    val KEY_Henkan = 65315
    val KEY_Henkan_Mode = 65315
    val KEY_Hibernate = 269025192
    val KEY_Hiragana = 65317
    val KEY_Hiragana_Katakana = 65319
    val KEY_History = 269025079
    val KEY_Home = 65360
    val KEY_HomePage = 269025048
    val KEY_HotLinks = 269025082
    val KEY_Hstroke = 673
    val KEY_Hyper_L = 65517
    val KEY_Hyper_R = 65518
    val KEY_I = 73
    val KEY_ISO_Center_Object = 65075
    val KEY_ISO_Continuous_Underline = 65072
    val KEY_ISO_Discontinuous_Underline = 65073
    val KEY_ISO_Emphasize = 65074
    val KEY_ISO_Enter = 65076
    val KEY_ISO_Fast_Cursor_Down = 65071
    val KEY_ISO_Fast_Cursor_Left = 65068
    val KEY_ISO_Fast_Cursor_Right = 65069
    val KEY_ISO_Fast_Cursor_Up = 65070
    val KEY_ISO_First_Group = 65036
    val KEY_ISO_First_Group_Lock = 65037
    val KEY_ISO_Group_Latch = 65030
    val KEY_ISO_Group_Lock = 65031
    val KEY_ISO_Group_Shift = 65406
    val KEY_ISO_Last_Group = 65038
    val KEY_ISO_Last_Group_Lock = 65039
    val KEY_ISO_Left_Tab = 65056
    val KEY_ISO_Level2_Latch = 65026
    val KEY_ISO_Level3_Latch = 65028
    val KEY_ISO_Level3_Lock = 65029
    val KEY_ISO_Level3_Shift = 65027
    val KEY_ISO_Level5_Latch = 65042
    val KEY_ISO_Level5_Lock = 65043
    val KEY_ISO_Level5_Shift = 65041
    val KEY_ISO_Lock = 65025
    val KEY_ISO_Move_Line_Down = 65058
    val KEY_ISO_Move_Line_Up = 65057
    val KEY_ISO_Next_Group = 65032
    val KEY_ISO_Next_Group_Lock = 65033
    val KEY_ISO_Partial_Line_Down = 65060
    val KEY_ISO_Partial_Line_Up = 65059
    val KEY_ISO_Partial_Space_Left = 65061
    val KEY_ISO_Partial_Space_Right = 65062
    val KEY_ISO_Prev_Group = 65034
    val KEY_ISO_Prev_Group_Lock = 65035
    val KEY_ISO_Release_Both_Margins = 65067
    val KEY_ISO_Release_Margin_Left = 65065
    val KEY_ISO_Release_Margin_Right = 65066
    val KEY_ISO_Set_Margin_Left = 65063
    val KEY_ISO_Set_Margin_Right = 65064
    val KEY_Iabovedot = 681
    val KEY_Iacute = 205
    val KEY_Ibelowdot = 16785098
    val KEY_Ibreve = 16777516
    val KEY_Icircumflex = 206
    val KEY_Idiaeresis = 207
    val KEY_Igrave = 204
    val KEY_Ihook = 16785096
    val KEY_Imacron = 975
    val KEY_Insert = 65379
    val KEY_Iogonek = 967
    val KEY_Itilde = 933
    val KEY_J = 74
    val KEY_Jcircumflex = 684
    val KEY_K = 75
    val KEY_KP_0 = 65456
    val KEY_KP_1 = 65457
    val KEY_KP_2 = 65458
    val KEY_KP_3 = 65459
    val KEY_KP_4 = 65460
    val KEY_KP_5 = 65461
    val KEY_KP_6 = 65462
    val KEY_KP_7 = 65463
    val KEY_KP_8 = 65464
    val KEY_KP_9 = 65465
    val KEY_KP_Add = 65451
    val KEY_KP_Begin = 65437
    val KEY_KP_Decimal = 65454
    val KEY_KP_Delete = 65439
    val KEY_KP_Divide = 65455
    val KEY_KP_Down = 65433
    val KEY_KP_End = 65436
    val KEY_KP_Enter = 65421
    val KEY_KP_Equal = 65469
    val KEY_KP_F1 = 65425
    val KEY_KP_F2 = 65426
    val KEY_KP_F3 = 65427
    val KEY_KP_F4 = 65428
    val KEY_KP_Home = 65429
    val KEY_KP_Insert = 65438
    val KEY_KP_Left = 65430
    val KEY_KP_Multiply = 65450
    val KEY_KP_Next = 65435
    val KEY_KP_Page_Down = 65435
    val KEY_KP_Page_Up = 65434
    val KEY_KP_Prior = 65434
    val KEY_KP_Right = 65432
    val KEY_KP_Separator = 65452
    val KEY_KP_Space = 65408
    val KEY_KP_Subtract = 65453
    val KEY_KP_Tab = 65417
    val KEY_KP_Up = 65431
    val KEY_Kana_Lock = 65325
    val KEY_Kana_Shift = 65326
    val KEY_Kanji = 65313
    val KEY_Kanji_Bangou = 65335
    val KEY_Katakana = 65318
    val KEY_KbdBrightnessDown = 269025030
    val KEY_KbdBrightnessUp = 269025029
    val KEY_KbdLightOnOff = 269025028
    val KEY_Kcedilla = 979
    val KEY_Korean_Won = 3839
    val KEY_L = 76
    val KEY_L1 = 65480
    val KEY_L10 = 65489
    val KEY_L2 = 65481
    val KEY_L3 = 65482
    val KEY_L4 = 65483
    val KEY_L5 = 65484
    val KEY_L6 = 65485
    val KEY_L7 = 65486
    val KEY_L8 = 65487
    val KEY_L9 = 65488
    val KEY_Lacute = 453
    val KEY_Last_Virtual_Screen = 65236
    val KEY_Launch0 = 269025088
    val KEY_Launch1 = 269025089
    val KEY_Launch2 = 269025090
    val KEY_Launch3 = 269025091
    val KEY_Launch4 = 269025092
    val KEY_Launch5 = 269025093
    val KEY_Launch6 = 269025094
    val KEY_Launch7 = 269025095
    val KEY_Launch8 = 269025096
    val KEY_Launch9 = 269025097
    val KEY_LaunchA = 269025098
    val KEY_LaunchB = 269025099
    val KEY_LaunchC = 269025100
    val KEY_LaunchD = 269025101
    val KEY_LaunchE = 269025102
    val KEY_LaunchF = 269025103
    val KEY_Lbelowdot = 16784950
    val KEY_Lcaron = 421
    val KEY_Lcedilla = 934
    val KEY_Left = 65361
    val KEY_LightBulb = 269025077
    val KEY_Linefeed = 65290
    val KEY_LiraSign = 16785572
    val KEY_LogOff = 269025121
    val KEY_Lstroke = 419
    val KEY_M = 77
    val KEY_Mabovedot = 16784960
    val KEY_Macedonia_DSE = 1717
    val KEY_Macedonia_GJE = 1714
    val KEY_Macedonia_KJE = 1724
    val KEY_Macedonia_dse = 1701
    val KEY_Macedonia_gje = 1698
    val KEY_Macedonia_kje = 1708
    val KEY_Mae_Koho = 65342
    val KEY_Mail = 269025049
    val KEY_MailForward = 269025168
    val KEY_Market = 269025122
    val KEY_Massyo = 65324
    val KEY_Meeting = 269025123
    val KEY_Memo = 269025054
    val KEY_Menu = 65383
    val KEY_MenuKB = 269025125
    val KEY_MenuPB = 269025126
    val KEY_Messenger = 269025166
    val KEY_Meta_L = 65511
    val KEY_Meta_R = 65512
    val KEY_MillSign = 16785573
    val KEY_ModeLock = 269025025
    val KEY_Mode_switch = 65406
    val KEY_MonBrightnessDown = 269025027
    val KEY_MonBrightnessUp = 269025026
    val KEY_MouseKeys_Accel_Enable = 65143
    val KEY_MouseKeys_Enable = 65142
    val KEY_Muhenkan = 65314
    val KEY_Multi_key = 65312
    val KEY_MultipleCandidate = 65341
    val KEY_Music = 269025170
    val KEY_MyComputer = 269025075
    val KEY_MySites = 269025127
    val KEY_N = 78
    val KEY_Nacute = 465
    val KEY_NairaSign = 16785574
    val KEY_Ncaron = 466
    val KEY_Ncedilla = 977
    val KEY_New = 269025128
    val KEY_NewSheqelSign = 16785578
    val KEY_News = 269025129
    val KEY_Next = 65366
    val KEY_Next_VMode = 269024802
    val KEY_Next_Virtual_Screen = 65234
    val KEY_Ntilde = 209
    val KEY_Num_Lock = 65407
    val KEY_O = 79
    val KEY_OE = 5052
    val KEY_Oacute = 211
    val KEY_Obarred = 16777631
    val KEY_Obelowdot = 16785100
    val KEY_Ocaron = 16777681
    val KEY_Ocircumflex = 212
    val KEY_Ocircumflexacute = 16785104
    val KEY_Ocircumflexbelowdot = 16785112
    val KEY_Ocircumflexgrave = 16785106
    val KEY_Ocircumflexhook = 16785108
    val KEY_Ocircumflextilde = 16785110
    val KEY_Odiaeresis = 214
    val KEY_Odoubleacute = 469
    val KEY_OfficeHome = 269025130
    val KEY_Ograve = 210
    val KEY_Ohook = 16785102
    val KEY_Ohorn = 16777632
    val KEY_Ohornacute = 16785114
    val KEY_Ohornbelowdot = 16785122
    val KEY_Ohorngrave = 16785116
    val KEY_Ohornhook = 16785118
    val KEY_Ohorntilde = 16785120
    val KEY_Omacron = 978
    val KEY_Ooblique = 216
    val KEY_Open = 269025131
    val KEY_OpenURL = 269025080
    val KEY_Option = 269025132
    val KEY_Oslash = 216
    val KEY_Otilde = 213
    val KEY_Overlay1_Enable = 65144
    val KEY_Overlay2_Enable = 65145
    val KEY_P = 80
    val KEY_Pabovedot = 16784982
    val KEY_Page_Down = 65366
    val KEY_Page_Up = 65365
    val KEY_Paste = 269025133
    val KEY_Pause = 65299
    val KEY_PesetaSign = 16785575
    val KEY_Phone = 269025134
    val KEY_Pictures = 269025169
    val KEY_Pointer_Accelerate = 65274
    val KEY_Pointer_Button1 = 65257
    val KEY_Pointer_Button2 = 65258
    val KEY_Pointer_Button3 = 65259
    val KEY_Pointer_Button4 = 65260
    val KEY_Pointer_Button5 = 65261
    val KEY_Pointer_Button_Dflt = 65256
    val KEY_Pointer_DblClick1 = 65263
    val KEY_Pointer_DblClick2 = 65264
    val KEY_Pointer_DblClick3 = 65265
    val KEY_Pointer_DblClick4 = 65266
    val KEY_Pointer_DblClick5 = 65267
    val KEY_Pointer_DblClick_Dflt = 65262
    val KEY_Pointer_DfltBtnNext = 65275
    val KEY_Pointer_DfltBtnPrev = 65276
    val KEY_Pointer_Down = 65251
    val KEY_Pointer_DownLeft = 65254
    val KEY_Pointer_DownRight = 65255
    val KEY_Pointer_Drag1 = 65269
    val KEY_Pointer_Drag2 = 65270
    val KEY_Pointer_Drag3 = 65271
    val KEY_Pointer_Drag4 = 65272
    val KEY_Pointer_Drag5 = 65277
    val KEY_Pointer_Drag_Dflt = 65268
    val KEY_Pointer_EnableKeys = 65273
    val KEY_Pointer_Left = 65248
    val KEY_Pointer_Right = 65249
    val KEY_Pointer_Up = 65250
    val KEY_Pointer_UpLeft = 65252
    val KEY_Pointer_UpRight = 65253
    val KEY_PowerDown = 269025057
    val KEY_PowerOff = 269025066
    val KEY_Prev_VMode = 269024803
    val KEY_Prev_Virtual_Screen = 65233
    val KEY_PreviousCandidate = 65342
    val KEY_Print = 65377
    val KEY_Prior = 65365
    val KEY_Q = 81
    val KEY_R = 82
    val KEY_R1 = 65490
    val KEY_R10 = 65499
    val KEY_R11 = 65500
    val KEY_R12 = 65501
    val KEY_R13 = 65502
    val KEY_R14 = 65503
    val KEY_R15 = 65504
    val KEY_R2 = 65491
    val KEY_R3 = 65492
    val KEY_R4 = 65493
    val KEY_R5 = 65494
    val KEY_R6 = 65495
    val KEY_R7 = 65496
    val KEY_R8 = 65497
    val KEY_R9 = 65498
    val KEY_Racute = 448
    val KEY_Rcaron = 472
    val KEY_Rcedilla = 931
    val KEY_Red = 269025187
    val KEY_Redo = 65382
    val KEY_Refresh = 269025065
    val KEY_Reload = 269025139
    val KEY_RepeatKeys_Enable = 65138
    val KEY_Reply = 269025138
    val KEY_Return = 65293
    val KEY_Right = 65363
    val KEY_RockerDown = 269025060
    val KEY_RockerEnter = 269025061
    val KEY_RockerUp = 269025059
    val KEY_Romaji = 65316
    val KEY_RotateWindows = 269025140
    val KEY_RotationKB = 269025142
    val KEY_RotationPB = 269025141
    val KEY_RupeeSign = 16785576
    val KEY_S = 83
    val KEY_SCHWA = 16777615
    val KEY_Sabovedot = 16784992
    val KEY_Sacute = 422
    val KEY_Save = 269025143
    val KEY_Scaron = 425
    val KEY_Scedilla = 426
    val KEY_Scircumflex = 734
    val KEY_ScreenSaver = 269025069
    val KEY_ScrollClick = 269025146
    val KEY_ScrollDown = 269025145
    val KEY_ScrollUp = 269025144
    val KEY_Scroll_Lock = 65300
    val KEY_Search = 269025051
    val KEY_Select = 65376
    val KEY_SelectButton = 269025184
    val KEY_Send = 269025147
    val KEY_Serbian_DJE = 1713
    val KEY_Serbian_DZE = 1727
    val KEY_Serbian_JE = 1720
    val KEY_Serbian_LJE = 1721
    val KEY_Serbian_NJE = 1722
    val KEY_Serbian_TSHE = 1723
    val KEY_Serbian_dje = 1697
    val KEY_Serbian_dze = 1711
    val KEY_Serbian_je = 1704
    val KEY_Serbian_lje = 1705
    val KEY_Serbian_nje = 1706
    val KEY_Serbian_tshe = 1707
    val KEY_Shift_L = 65505
    val KEY_Shift_Lock = 65510
    val KEY_Shift_R = 65506
    val KEY_Shop = 269025078
    val KEY_SingleCandidate = 65340
    val KEY_Sinh_a = 16780677
    val KEY_Sinh_aa = 16780678
    val KEY_Sinh_aa2 = 16780751
    val KEY_Sinh_ae = 16780679
    val KEY_Sinh_ae2 = 16780752
    val KEY_Sinh_aee = 16780680
    val KEY_Sinh_aee2 = 16780753
    val KEY_Sinh_ai = 16780691
    val KEY_Sinh_ai2 = 16780763
    val KEY_Sinh_al = 16780746
    val KEY_Sinh_au = 16780694
    val KEY_Sinh_au2 = 16780766
    val KEY_Sinh_ba = 16780726
    val KEY_Sinh_bha = 16780727
    val KEY_Sinh_ca = 16780704
    val KEY_Sinh_cha = 16780705
    val KEY_Sinh_dda = 16780713
    val KEY_Sinh_ddha = 16780714
    val KEY_Sinh_dha = 16780719
    val KEY_Sinh_dhha = 16780720
    val KEY_Sinh_e = 16780689
    val KEY_Sinh_e2 = 16780761
    val KEY_Sinh_ee = 16780690
    val KEY_Sinh_ee2 = 16780762
    val KEY_Sinh_fa = 16780742
    val KEY_Sinh_ga = 16780700
    val KEY_Sinh_gha = 16780701
    val KEY_Sinh_h2 = 16780675
    val KEY_Sinh_ha = 16780740
    val KEY_Sinh_i = 16780681
    val KEY_Sinh_i2 = 16780754
    val KEY_Sinh_ii = 16780682
    val KEY_Sinh_ii2 = 16780755
    val KEY_Sinh_ja = 16780706
    val KEY_Sinh_jha = 16780707
    val KEY_Sinh_jnya = 16780709
    val KEY_Sinh_ka = 16780698
    val KEY_Sinh_kha = 16780699
    val KEY_Sinh_kunddaliya = 16780788
    val KEY_Sinh_la = 16780733
    val KEY_Sinh_lla = 16780741
    val KEY_Sinh_lu = 16780687
    val KEY_Sinh_lu2 = 16780767
    val KEY_Sinh_luu = 16780688
    val KEY_Sinh_luu2 = 16780787
    val KEY_Sinh_ma = 16780728
    val KEY_Sinh_mba = 16780729
    val KEY_Sinh_na = 16780721
    val KEY_Sinh_ndda = 16780716
    val KEY_Sinh_ndha = 16780723
    val KEY_Sinh_ng = 16780674
    val KEY_Sinh_ng2 = 16780702
    val KEY_Sinh_nga = 16780703
    val KEY_Sinh_nja = 16780710
    val KEY_Sinh_nna = 16780715
    val KEY_Sinh_nya = 16780708
    val KEY_Sinh_o = 16780692
    val KEY_Sinh_o2 = 16780764
    val KEY_Sinh_oo = 16780693
    val KEY_Sinh_oo2 = 16780765
    val KEY_Sinh_pa = 16780724
    val KEY_Sinh_pha = 16780725
    val KEY_Sinh_ra = 16780731
    val KEY_Sinh_ri = 16780685
    val KEY_Sinh_rii = 16780686
    val KEY_Sinh_ru2 = 16780760
    val KEY_Sinh_ruu2 = 16780786
    val KEY_Sinh_sa = 16780739
    val KEY_Sinh_sha = 16780737
    val KEY_Sinh_ssha = 16780738
    val KEY_Sinh_tha = 16780717
    val KEY_Sinh_thha = 16780718
    val KEY_Sinh_tta = 16780711
    val KEY_Sinh_ttha = 16780712
    val KEY_Sinh_u = 16780683
    val KEY_Sinh_u2 = 16780756
    val KEY_Sinh_uu = 16780684
    val KEY_Sinh_uu2 = 16780758
    val KEY_Sinh_va = 16780736
    val KEY_Sinh_ya = 16780730
    val KEY_Sleep = 269025071
    val KEY_SlowKeys_Enable = 65139
    val KEY_Spell = 269025148
    val KEY_SplitScreen = 269025149
    val KEY_Standby = 269025040
    val KEY_Start = 269025050
    val KEY_StickyKeys_Enable = 65141
    val KEY_Stop = 269025064
    val KEY_Subtitle = 269025178
    val KEY_Super_L = 65515
    val KEY_Super_R = 65516
    val KEY_Support = 269025150
    val KEY_Suspend = 269025191
    val KEY_Switch_VT_1 = 269024769
    val KEY_Switch_VT_10 = 269024778
    val KEY_Switch_VT_11 = 269024779
    val KEY_Switch_VT_12 = 269024780
    val KEY_Switch_VT_2 = 269024770
    val KEY_Switch_VT_3 = 269024771
    val KEY_Switch_VT_4 = 269024772
    val KEY_Switch_VT_5 = 269024773
    val KEY_Switch_VT_6 = 269024774
    val KEY_Switch_VT_7 = 269024775
    val KEY_Switch_VT_8 = 269024776
    val KEY_Switch_VT_9 = 269024777
    val KEY_Sys_Req = 65301
    val KEY_T = 84
    val KEY_THORN = 222
    val KEY_Tab = 65289
    val KEY_Tabovedot = 16785002
    val KEY_TaskPane = 269025151
    val KEY_Tcaron = 427
    val KEY_Tcedilla = 478
    val KEY_Terminal = 269025152
    val KEY_Terminate_Server = 65237
    val KEY_Thai_baht = 3551
    val KEY_Thai_bobaimai = 3514
    val KEY_Thai_chochan = 3496
    val KEY_Thai_chochang = 3498
    val KEY_Thai_choching = 3497
    val KEY_Thai_chochoe = 3500
    val KEY_Thai_dochada = 3502
    val KEY_Thai_dodek = 3508
    val KEY_Thai_fofa = 3517
    val KEY_Thai_fofan = 3519
    val KEY_Thai_hohip = 3531
    val KEY_Thai_honokhuk = 3534
    val KEY_Thai_khokhai = 3490
    val KEY_Thai_khokhon = 3493
    val KEY_Thai_khokhuat = 3491
    val KEY_Thai_khokhwai = 3492
    val KEY_Thai_khorakhang = 3494
    val KEY_Thai_kokai = 3489
    val KEY_Thai_lakkhangyao = 3557
    val KEY_Thai_lekchet = 3575
    val KEY_Thai_lekha = 3573
    val KEY_Thai_lekhok = 3574
    val KEY_Thai_lekkao = 3577
    val KEY_Thai_leknung = 3569
    val KEY_Thai_lekpaet = 3576
    val KEY_Thai_leksam = 3571
    val KEY_Thai_leksi = 3572
    val KEY_Thai_leksong = 3570
    val KEY_Thai_leksun = 3568
    val KEY_Thai_lochula = 3532
    val KEY_Thai_loling = 3525
    val KEY_Thai_lu = 3526
    val KEY_Thai_maichattawa = 3563
    val KEY_Thai_maiek = 3560
    val KEY_Thai_maihanakat = 3537
    val KEY_Thai_maihanakat_maitho = 3550
    val KEY_Thai_maitaikhu = 3559
    val KEY_Thai_maitho = 3561
    val KEY_Thai_maitri = 3562
    val KEY_Thai_maiyamok = 3558
    val KEY_Thai_moma = 3521
    val KEY_Thai_ngongu = 3495
    val KEY_Thai_nikhahit = 3565
    val KEY_Thai_nonen = 3507
    val KEY_Thai_nonu = 3513
    val KEY_Thai_oang = 3533
    val KEY_Thai_paiyannoi = 3535
    val KEY_Thai_phinthu = 3546
    val KEY_Thai_phophan = 3518
    val KEY_Thai_phophung = 3516
    val KEY_Thai_phosamphao = 3520
    val KEY_Thai_popla = 3515
    val KEY_Thai_rorua = 3523
    val KEY_Thai_ru = 3524
    val KEY_Thai_saraa = 3536
    val KEY_Thai_saraaa = 3538
    val KEY_Thai_saraae = 3553
    val KEY_Thai_saraaimaimalai = 3556
    val KEY_Thai_saraaimaimuan = 3555
    val KEY_Thai_saraam = 3539
    val KEY_Thai_sarae = 3552
    val KEY_Thai_sarai = 3540
    val KEY_Thai_saraii = 3541
    val KEY_Thai_sarao = 3554
    val KEY_Thai_sarau = 3544
    val KEY_Thai_saraue = 3542
    val KEY_Thai_sarauee = 3543
    val KEY_Thai_sarauu = 3545
    val KEY_Thai_sorusi = 3529
    val KEY_Thai_sosala = 3528
    val KEY_Thai_soso = 3499
    val KEY_Thai_sosua = 3530
    val KEY_Thai_thanthakhat = 3564
    val KEY_Thai_thonangmontho = 3505
    val KEY_Thai_thophuthao = 3506
    val KEY_Thai_thothahan = 3511
    val KEY_Thai_thothan = 3504
    val KEY_Thai_thothong = 3512
    val KEY_Thai_thothung = 3510
    val KEY_Thai_topatak = 3503
    val KEY_Thai_totao = 3509
    val KEY_Thai_wowaen = 3527
    val KEY_Thai_yoyak = 3522
    val KEY_Thai_yoying = 3501
    val KEY_Thorn = 222
    val KEY_Time = 269025183
    val KEY_ToDoList = 269025055
    val KEY_Tools = 269025153
    val KEY_TopMenu = 269025186
    val KEY_TouchpadOff = 269025201
    val KEY_TouchpadOn = 269025200
    val KEY_TouchpadToggle = 269025193
    val KEY_Touroku = 65323
    val KEY_Travel = 269025154
    val KEY_Tslash = 940
    val KEY_U = 85
    val KEY_UWB = 269025174
    val KEY_Uacute = 218
    val KEY_Ubelowdot = 16785124
    val KEY_Ubreve = 733
    val KEY_Ucircumflex = 219
    val KEY_Udiaeresis = 220
    val KEY_Udoubleacute = 475
    val KEY_Ugrave = 217
    val KEY_Uhook = 16785126
    val KEY_Uhorn = 16777647
    val KEY_Uhornacute = 16785128
    val KEY_Uhornbelowdot = 16785136
    val KEY_Uhorngrave = 16785130
    val KEY_Uhornhook = 16785132
    val KEY_Uhorntilde = 16785134
    val KEY_Ukrainian_GHE_WITH_UPTURN = 1725
    val KEY_Ukrainian_I = 1718
    val KEY_Ukrainian_IE = 1716
    val KEY_Ukrainian_YI = 1719
    val KEY_Ukrainian_ghe_with_upturn = 1709
    val KEY_Ukrainian_i = 1702
    val KEY_Ukrainian_ie = 1700
    val KEY_Ukrainian_yi = 1703
    val KEY_Ukranian_I = 1718
    val KEY_Ukranian_JE = 1716
    val KEY_Ukranian_YI = 1719
    val KEY_Ukranian_i = 1702
    val KEY_Ukranian_je = 1700
    val KEY_Ukranian_yi = 1703
    val KEY_Umacron = 990
    val KEY_Undo = 65381
    val KEY_Ungrab = 269024800
    val KEY_Uogonek = 985
    val KEY_Up = 65362
    val KEY_Uring = 473
    val KEY_User1KB = 269025157
    val KEY_User2KB = 269025158
    val KEY_UserPB = 269025156
    val KEY_Utilde = 989
    val KEY_V = 86
    val KEY_VendorHome = 269025076
    val KEY_Video = 269025159
    val KEY_View = 269025185
    val KEY_VoidSymbol = 16777215
    val KEY_W = 87
    val KEY_WLAN = 269025173
    val KEY_WWW = 269025070
    val KEY_Wacute = 16785026
    val KEY_WakeUp = 269025067
    val KEY_Wcircumflex = 16777588
    val KEY_Wdiaeresis = 16785028
    val KEY_WebCam = 269025167
    val KEY_Wgrave = 16785024
    val KEY_WheelButton = 269025160
    val KEY_WindowClear = 269025109
    val KEY_WonSign = 16785577
    val KEY_Word = 269025161
    val KEY_X = 88
    val KEY_Xabovedot = 16785034
    val KEY_Xfer = 269025162
    val KEY_Y = 89
    val KEY_Yacute = 221
    val KEY_Ybelowdot = 16785140
    val KEY_Ycircumflex = 16777590
    val KEY_Ydiaeresis = 5054
    val KEY_Yellow = 269025189
    val KEY_Ygrave = 16785138
    val KEY_Yhook = 16785142
    val KEY_Ytilde = 16785144
    val KEY_Z = 90
    val KEY_Zabovedot = 431
    val KEY_Zacute = 428
    val KEY_Zcaron = 430
    val KEY_Zen_Koho = 65341
    val KEY_Zenkaku = 65320
    val KEY_Zenkaku_Hankaku = 65322
    val KEY_ZoomIn = 269025163
    val KEY_ZoomOut = 269025164
    val KEY_Zstroke = 16777653
    val KEY_a = 97
    val KEY_aacute = 225
    val KEY_abelowdot = 16785057
    val KEY_abovedot = 511
    val KEY_abreve = 483
    val KEY_abreveacute = 16785071
    val KEY_abrevebelowdot = 16785079
    val KEY_abrevegrave = 16785073
    val KEY_abrevehook = 16785075
    val KEY_abrevetilde = 16785077
    val KEY_acircumflex = 226
    val KEY_acircumflexacute = 16785061
    val KEY_acircumflexbelowdot = 16785069
    val KEY_acircumflexgrave = 16785063
    val KEY_acircumflexhook = 16785065
    val KEY_acircumflextilde = 16785067
    val KEY_acute = 180
    val KEY_adiaeresis = 228
    val KEY_ae = 230
    val KEY_agrave = 224
    val KEY_ahook = 16785059
    val KEY_amacron = 992
    val KEY_ampersand = 38
    val KEY_aogonek = 433
    val KEY_apostrophe = 39
    val KEY_approxeq = 16785992
    val KEY_approximate = 2248
    val KEY_aring = 229
    val KEY_asciicircum = 94
    val KEY_asciitilde = 126
    val KEY_asterisk = 42
    val KEY_at = 64
    val KEY_atilde = 227
    val KEY_b = 98
    val KEY_babovedot = 16784899
    val KEY_backslash = 92
    val KEY_ballotcross = 2804
    val KEY_bar = 124
    val KEY_because = 16785973
    val KEY_blank = 2527
    val KEY_botintegral = 2213
    val KEY_botleftparens = 2220
    val KEY_botleftsqbracket = 2216
    val KEY_botleftsummation = 2226
    val KEY_botrightparens = 2222
    val KEY_botrightsqbracket = 2218
    val KEY_botrightsummation = 2230
    val KEY_bott = 2550
    val KEY_botvertsummationconnector = 2228
    val KEY_braceleft = 123
    val KEY_braceright = 125
    val KEY_bracketleft = 91
    val KEY_bracketright = 93
    val KEY_braille_blank = 16787456
    val KEY_braille_dot_1 = 65521
    val KEY_braille_dot_10 = 65530
    val KEY_braille_dot_2 = 65522
    val KEY_braille_dot_3 = 65523
    val KEY_braille_dot_4 = 65524
    val KEY_braille_dot_5 = 65525
    val KEY_braille_dot_6 = 65526
    val KEY_braille_dot_7 = 65527
    val KEY_braille_dot_8 = 65528
    val KEY_braille_dot_9 = 65529
    val KEY_braille_dots_1 = 16787457
    val KEY_braille_dots_12 = 16787459
    val KEY_braille_dots_123 = 16787463
    val KEY_braille_dots_1234 = 16787471
    val KEY_braille_dots_12345 = 16787487
    val KEY_braille_dots_123456 = 16787519
    val KEY_braille_dots_1234567 = 16787583
    val KEY_braille_dots_12345678 = 16787711
    val KEY_braille_dots_1234568 = 16787647
    val KEY_braille_dots_123457 = 16787551
    val KEY_braille_dots_1234578 = 16787679
    val KEY_braille_dots_123458 = 16787615
    val KEY_braille_dots_12346 = 16787503
    val KEY_braille_dots_123467 = 16787567
    val KEY_braille_dots_1234678 = 16787695
    val KEY_braille_dots_123468 = 16787631
    val KEY_braille_dots_12347 = 16787535
    val KEY_braille_dots_123478 = 16787663
    val KEY_braille_dots_12348 = 16787599
    val KEY_braille_dots_1235 = 16787479
    val KEY_braille_dots_12356 = 16787511
    val KEY_braille_dots_123567 = 16787575
    val KEY_braille_dots_1235678 = 16787703
    val KEY_braille_dots_123568 = 16787639
    val KEY_braille_dots_12357 = 16787543
    val KEY_braille_dots_123578 = 16787671
    val KEY_braille_dots_12358 = 16787607
    val KEY_braille_dots_1236 = 16787495
    val KEY_braille_dots_12367 = 16787559
    val KEY_braille_dots_123678 = 16787687
    val KEY_braille_dots_12368 = 16787623
    val KEY_braille_dots_1237 = 16787527
    val KEY_braille_dots_12378 = 16787655
    val KEY_braille_dots_1238 = 16787591
    val KEY_braille_dots_124 = 16787467
    val KEY_braille_dots_1245 = 16787483
    val KEY_braille_dots_12456 = 16787515
    val KEY_braille_dots_124567 = 16787579
    val KEY_braille_dots_1245678 = 16787707
    val KEY_braille_dots_124568 = 16787643
    val KEY_braille_dots_12457 = 16787547
    val KEY_braille_dots_124578 = 16787675
    val KEY_braille_dots_12458 = 16787611
    val KEY_braille_dots_1246 = 16787499
    val KEY_braille_dots_12467 = 16787563
    val KEY_braille_dots_124678 = 16787691
    val KEY_braille_dots_12468 = 16787627
    val KEY_braille_dots_1247 = 16787531
    val KEY_braille_dots_12478 = 16787659
    val KEY_braille_dots_1248 = 16787595
    val KEY_braille_dots_125 = 16787475
    val KEY_braille_dots_1256 = 16787507
    val KEY_braille_dots_12567 = 16787571
    val KEY_braille_dots_125678 = 16787699
    val KEY_braille_dots_12568 = 16787635
    val KEY_braille_dots_1257 = 16787539
    val KEY_braille_dots_12578 = 16787667
    val KEY_braille_dots_1258 = 16787603
    val KEY_braille_dots_126 = 16787491
    val KEY_braille_dots_1267 = 16787555
    val KEY_braille_dots_12678 = 16787683
    val KEY_braille_dots_1268 = 16787619
    val KEY_braille_dots_127 = 16787523
    val KEY_braille_dots_1278 = 16787651
    val KEY_braille_dots_128 = 16787587
    val KEY_braille_dots_13 = 16787461
    val KEY_braille_dots_134 = 16787469
    val KEY_braille_dots_1345 = 16787485
    val KEY_braille_dots_13456 = 16787517
    val KEY_braille_dots_134567 = 16787581
    val KEY_braille_dots_1345678 = 16787709
    val KEY_braille_dots_134568 = 16787645
    val KEY_braille_dots_13457 = 16787549
    val KEY_braille_dots_134578 = 16787677
    val KEY_braille_dots_13458 = 16787613
    val KEY_braille_dots_1346 = 16787501
    val KEY_braille_dots_13467 = 16787565
    val KEY_braille_dots_134678 = 16787693
    val KEY_braille_dots_13468 = 16787629
    val KEY_braille_dots_1347 = 16787533
    val KEY_braille_dots_13478 = 16787661
    val KEY_braille_dots_1348 = 16787597
    val KEY_braille_dots_135 = 16787477
    val KEY_braille_dots_1356 = 16787509
    val KEY_braille_dots_13567 = 16787573
    val KEY_braille_dots_135678 = 16787701
    val KEY_braille_dots_13568 = 16787637
    val KEY_braille_dots_1357 = 16787541
    val KEY_braille_dots_13578 = 16787669
    val KEY_braille_dots_1358 = 16787605
    val KEY_braille_dots_136 = 16787493
    val KEY_braille_dots_1367 = 16787557
    val KEY_braille_dots_13678 = 16787685
    val KEY_braille_dots_1368 = 16787621
    val KEY_braille_dots_137 = 16787525
    val KEY_braille_dots_1378 = 16787653
    val KEY_braille_dots_138 = 16787589
    val KEY_braille_dots_14 = 16787465
    val KEY_braille_dots_145 = 16787481
    val KEY_braille_dots_1456 = 16787513
    val KEY_braille_dots_14567 = 16787577
    val KEY_braille_dots_145678 = 16787705
    val KEY_braille_dots_14568 = 16787641
    val KEY_braille_dots_1457 = 16787545
    val KEY_braille_dots_14578 = 16787673
    val KEY_braille_dots_1458 = 16787609
    val KEY_braille_dots_146 = 16787497
    val KEY_braille_dots_1467 = 16787561
    val KEY_braille_dots_14678 = 16787689
    val KEY_braille_dots_1468 = 16787625
    val KEY_braille_dots_147 = 16787529
    val KEY_braille_dots_1478 = 16787657
    val KEY_braille_dots_148 = 16787593
    val KEY_braille_dots_15 = 16787473
    val KEY_braille_dots_156 = 16787505
    val KEY_braille_dots_1567 = 16787569
    val KEY_braille_dots_15678 = 16787697
    val KEY_braille_dots_1568 = 16787633
    val KEY_braille_dots_157 = 16787537
    val KEY_braille_dots_1578 = 16787665
    val KEY_braille_dots_158 = 16787601
    val KEY_braille_dots_16 = 16787489
    val KEY_braille_dots_167 = 16787553
    val KEY_braille_dots_1678 = 16787681
    val KEY_braille_dots_168 = 16787617
    val KEY_braille_dots_17 = 16787521
    val KEY_braille_dots_178 = 16787649
    val KEY_braille_dots_18 = 16787585
    val KEY_braille_dots_2 = 16787458
    val KEY_braille_dots_23 = 16787462
    val KEY_braille_dots_234 = 16787470
    val KEY_braille_dots_2345 = 16787486
    val KEY_braille_dots_23456 = 16787518
    val KEY_braille_dots_234567 = 16787582
    val KEY_braille_dots_2345678 = 16787710
    val KEY_braille_dots_234568 = 16787646
    val KEY_braille_dots_23457 = 16787550
    val KEY_braille_dots_234578 = 16787678
    val KEY_braille_dots_23458 = 16787614
    val KEY_braille_dots_2346 = 16787502
    val KEY_braille_dots_23467 = 16787566
    val KEY_braille_dots_234678 = 16787694
    val KEY_braille_dots_23468 = 16787630
    val KEY_braille_dots_2347 = 16787534
    val KEY_braille_dots_23478 = 16787662
    val KEY_braille_dots_2348 = 16787598
    val KEY_braille_dots_235 = 16787478
    val KEY_braille_dots_2356 = 16787510
    val KEY_braille_dots_23567 = 16787574
    val KEY_braille_dots_235678 = 16787702
    val KEY_braille_dots_23568 = 16787638
    val KEY_braille_dots_2357 = 16787542
    val KEY_braille_dots_23578 = 16787670
    val KEY_braille_dots_2358 = 16787606
    val KEY_braille_dots_236 = 16787494
    val KEY_braille_dots_2367 = 16787558
    val KEY_braille_dots_23678 = 16787686
    val KEY_braille_dots_2368 = 16787622
    val KEY_braille_dots_237 = 16787526
    val KEY_braille_dots_2378 = 16787654
    val KEY_braille_dots_238 = 16787590
    val KEY_braille_dots_24 = 16787466
    val KEY_braille_dots_245 = 16787482
    val KEY_braille_dots_2456 = 16787514
    val KEY_braille_dots_24567 = 16787578
    val KEY_braille_dots_245678 = 16787706
    val KEY_braille_dots_24568 = 16787642
    val KEY_braille_dots_2457 = 16787546
    val KEY_braille_dots_24578 = 16787674
    val KEY_braille_dots_2458 = 16787610
    val KEY_braille_dots_246 = 16787498
    val KEY_braille_dots_2467 = 16787562
    val KEY_braille_dots_24678 = 16787690
    val KEY_braille_dots_2468 = 16787626
    val KEY_braille_dots_247 = 16787530
    val KEY_braille_dots_2478 = 16787658
    val KEY_braille_dots_248 = 16787594
    val KEY_braille_dots_25 = 16787474
    val KEY_braille_dots_256 = 16787506
    val KEY_braille_dots_2567 = 16787570
    val KEY_braille_dots_25678 = 16787698
    val KEY_braille_dots_2568 = 16787634
    val KEY_braille_dots_257 = 16787538
    val KEY_braille_dots_2578 = 16787666
    val KEY_braille_dots_258 = 16787602
    val KEY_braille_dots_26 = 16787490
    val KEY_braille_dots_267 = 16787554
    val KEY_braille_dots_2678 = 16787682
    val KEY_braille_dots_268 = 16787618
    val KEY_braille_dots_27 = 16787522
    val KEY_braille_dots_278 = 16787650
    val KEY_braille_dots_28 = 16787586
    val KEY_braille_dots_3 = 16787460
    val KEY_braille_dots_34 = 16787468
    val KEY_braille_dots_345 = 16787484
    val KEY_braille_dots_3456 = 16787516
    val KEY_braille_dots_34567 = 16787580
    val KEY_braille_dots_345678 = 16787708
    val KEY_braille_dots_34568 = 16787644
    val KEY_braille_dots_3457 = 16787548
    val KEY_braille_dots_34578 = 16787676
    val KEY_braille_dots_3458 = 16787612
    val KEY_braille_dots_346 = 16787500
    val KEY_braille_dots_3467 = 16787564
    val KEY_braille_dots_34678 = 16787692
    val KEY_braille_dots_3468 = 16787628
    val KEY_braille_dots_347 = 16787532
    val KEY_braille_dots_3478 = 16787660
    val KEY_braille_dots_348 = 16787596
    val KEY_braille_dots_35 = 16787476
    val KEY_braille_dots_356 = 16787508
    val KEY_braille_dots_3567 = 16787572
    val KEY_braille_dots_35678 = 16787700
    val KEY_braille_dots_3568 = 16787636
    val KEY_braille_dots_357 = 16787540
    val KEY_braille_dots_3578 = 16787668
    val KEY_braille_dots_358 = 16787604
    val KEY_braille_dots_36 = 16787492
    val KEY_braille_dots_367 = 16787556
    val KEY_braille_dots_3678 = 16787684
    val KEY_braille_dots_368 = 16787620
    val KEY_braille_dots_37 = 16787524
    val KEY_braille_dots_378 = 16787652
    val KEY_braille_dots_38 = 16787588
    val KEY_braille_dots_4 = 16787464
    val KEY_braille_dots_45 = 16787480
    val KEY_braille_dots_456 = 16787512
    val KEY_braille_dots_4567 = 16787576
    val KEY_braille_dots_45678 = 16787704
    val KEY_braille_dots_4568 = 16787640
    val KEY_braille_dots_457 = 16787544
    val KEY_braille_dots_4578 = 16787672
    val KEY_braille_dots_458 = 16787608
    val KEY_braille_dots_46 = 16787496
    val KEY_braille_dots_467 = 16787560
    val KEY_braille_dots_4678 = 16787688
    val KEY_braille_dots_468 = 16787624
    val KEY_braille_dots_47 = 16787528
    val KEY_braille_dots_478 = 16787656
    val KEY_braille_dots_48 = 16787592
    val KEY_braille_dots_5 = 16787472
    val KEY_braille_dots_56 = 16787504
    val KEY_braille_dots_567 = 16787568
    val KEY_braille_dots_5678 = 16787696
    val KEY_braille_dots_568 = 16787632
    val KEY_braille_dots_57 = 16787536
    val KEY_braille_dots_578 = 16787664
    val KEY_braille_dots_58 = 16787600
    val KEY_braille_dots_6 = 16787488
    val KEY_braille_dots_67 = 16787552
    val KEY_braille_dots_678 = 16787680
    val KEY_braille_dots_68 = 16787616
    val KEY_braille_dots_7 = 16787520
    val KEY_braille_dots_78 = 16787648
    val KEY_braille_dots_8 = 16787584
    val KEY_breve = 418
    val KEY_brokenbar = 166
    val KEY_c = 99
    val KEY_cabovedot = 741
    val KEY_cacute = 486
    val KEY_careof = 2744
    val KEY_caret = 2812
    val KEY_caron = 439
    val KEY_ccaron = 488
    val KEY_ccedilla = 231
    val KEY_ccircumflex = 742
    val KEY_cedilla = 184
    val KEY_cent = 162
    val KEY_checkerboard = 2529
    val KEY_checkmark = 2803
    val KEY_circle = 3023
    val KEY_club = 2796
    val KEY_colon = 58
    val KEY_comma = 44
    val KEY_containsas = 16785931
    val KEY_copyright = 169
    val KEY_cr = 2532
    val KEY_crossinglines = 2542
    val KEY_cuberoot = 16785947
    val KEY_currency = 164
    val KEY_cursor = 2815
    val KEY_d = 100
    val KEY_dabovedot = 16784907
    val KEY_dagger = 2801
    val KEY_dcaron = 495
    val KEY_dead_A = 65153
    val KEY_dead_E = 65155
    val KEY_dead_I = 65157
    val KEY_dead_O = 65159
    val KEY_dead_U = 65161
    val KEY_dead_a = 65152
    val KEY_dead_abovecomma = 65124
    val KEY_dead_abovedot = 65110
    val KEY_dead_abovereversedcomma = 65125
    val KEY_dead_abovering = 65112
    val KEY_dead_acute = 65105
    val KEY_dead_belowbreve = 65131
    val KEY_dead_belowcircumflex = 65129
    val KEY_dead_belowcomma = 65134
    val KEY_dead_belowdiaeresis = 65132
    val KEY_dead_belowdot = 65120
    val KEY_dead_belowmacron = 65128
    val KEY_dead_belowring = 65127
    val KEY_dead_belowtilde = 65130
    val KEY_dead_breve = 65109
    val KEY_dead_capital_schwa = 65163
    val KEY_dead_caron = 65114
    val KEY_dead_cedilla = 65115
    val KEY_dead_circumflex = 65106
    val KEY_dead_currency = 65135
    val KEY_dead_dasia = 65125
    val KEY_dead_diaeresis = 65111
    val KEY_dead_doubleacute = 65113
    val KEY_dead_doublegrave = 65126
    val KEY_dead_e = 65154
    val KEY_dead_grave = 65104
    val KEY_dead_hook = 65121
    val KEY_dead_horn = 65122
    val KEY_dead_i = 65156
    val KEY_dead_invertedbreve = 65133
    val KEY_dead_iota = 65117
    val KEY_dead_macron = 65108
    val KEY_dead_o = 65158
    val KEY_dead_ogonek = 65116
    val KEY_dead_perispomeni = 65107
    val KEY_dead_psili = 65124
    val KEY_dead_semivoiced_sound = 65119
    val KEY_dead_small_schwa = 65162
    val KEY_dead_stroke = 65123
    val KEY_dead_tilde = 65107
    val KEY_dead_u = 65160
    val KEY_dead_voiced_sound = 65118
    val KEY_decimalpoint = 2749
    val KEY_degree = 176
    val KEY_diaeresis = 168
    val KEY_diamond = 2797
    val KEY_digitspace = 2725
    val KEY_dintegral = 16785964
    val KEY_division = 247
    val KEY_dollar = 36
    val KEY_doubbaselinedot = 2735
    val KEY_doubleacute = 445
    val KEY_doubledagger = 2802
    val KEY_doublelowquotemark = 2814
    val KEY_downarrow = 2302
    val KEY_downcaret = 2984
    val KEY_downshoe = 3030
    val KEY_downstile = 3012
    val KEY_downtack = 3010
    val KEY_dstroke = 496
    val KEY_e = 101
    val KEY_eabovedot = 1004
    val KEY_eacute = 233
    val KEY_ebelowdot = 16785081
    val KEY_ecaron = 492
    val KEY_ecircumflex = 234
    val KEY_ecircumflexacute = 16785087
    val KEY_ecircumflexbelowdot = 16785095
    val KEY_ecircumflexgrave = 16785089
    val KEY_ecircumflexhook = 16785091
    val KEY_ecircumflextilde = 16785093
    val KEY_ediaeresis = 235
    val KEY_egrave = 232
    val KEY_ehook = 16785083
    val KEY_eightsubscript = 16785544
    val KEY_eightsuperior = 16785528
    val KEY_elementof = 16785928
    val KEY_ellipsis = 2734
    val KEY_em3space = 2723
    val KEY_em4space = 2724
    val KEY_emacron = 954
    val KEY_emdash = 2729
    val KEY_emfilledcircle = 2782
    val KEY_emfilledrect = 2783
    val KEY_emopencircle = 2766
    val KEY_emopenrectangle = 2767
    val KEY_emptyset = 16785925
    val KEY_emspace = 2721
    val KEY_endash = 2730
    val KEY_enfilledcircbullet = 2790
    val KEY_enfilledsqbullet = 2791
    val KEY_eng = 959
    val KEY_enopencircbullet = 2784
    val KEY_enopensquarebullet = 2785
    val KEY_enspace = 2722
    val KEY_eogonek = 490
    val KEY_equal = 61
    val KEY_eth = 240
    val KEY_etilde = 16785085
    val KEY_exclam = 33
    val KEY_exclamdown = 161
    val KEY_f = 102
    val KEY_fabovedot = 16784927
    val KEY_femalesymbol = 2808
    val KEY_ff = 2531
    val KEY_figdash = 2747
    val KEY_filledlefttribullet = 2780
    val KEY_filledrectbullet = 2779
    val KEY_filledrighttribullet = 2781
    val KEY_filledtribulletdown = 2793
    val KEY_filledtribulletup = 2792
    val KEY_fiveeighths = 2757
    val KEY_fivesixths = 2743
    val KEY_fivesubscript = 16785541
    val KEY_fivesuperior = 16785525
    val KEY_fourfifths = 2741
    val KEY_foursubscript = 16785540
    val KEY_foursuperior = 16785524
    val KEY_fourthroot = 16785948
    val KEY_function = 2294
    val KEY_g = 103
    val KEY_gabovedot = 757
    val KEY_gbreve = 699
    val KEY_gcaron = 16777703
    val KEY_gcedilla = 955
    val KEY_gcircumflex = 760
    val KEY_grave = 96
    val KEY_greater = 62
    val KEY_greaterthanequal = 2238
    val KEY_guillemotleft = 171
    val KEY_guillemotright = 187
    val KEY_h = 104
    val KEY_hairspace = 2728
    val KEY_hcircumflex = 694
    val KEY_heart = 2798
    val KEY_hebrew_aleph = 3296
    val KEY_hebrew_ayin = 3314
    val KEY_hebrew_bet = 3297
    val KEY_hebrew_beth = 3297
    val KEY_hebrew_chet = 3303
    val KEY_hebrew_dalet = 3299
    val KEY_hebrew_daleth = 3299
    val KEY_hebrew_doublelowline = 3295
    val KEY_hebrew_finalkaph = 3306
    val KEY_hebrew_finalmem = 3309
    val KEY_hebrew_finalnun = 3311
    val KEY_hebrew_finalpe = 3315
    val KEY_hebrew_finalzade = 3317
    val KEY_hebrew_finalzadi = 3317
    val KEY_hebrew_gimel = 3298
    val KEY_hebrew_gimmel = 3298
    val KEY_hebrew_he = 3300
    val KEY_hebrew_het = 3303
    val KEY_hebrew_kaph = 3307
    val KEY_hebrew_kuf = 3319
    val KEY_hebrew_lamed = 3308
    val KEY_hebrew_mem = 3310
    val KEY_hebrew_nun = 3312
    val KEY_hebrew_pe = 3316
    val KEY_hebrew_qoph = 3319
    val KEY_hebrew_resh = 3320
    val KEY_hebrew_samech = 3313
    val KEY_hebrew_samekh = 3313
    val KEY_hebrew_shin = 3321
    val KEY_hebrew_taf = 3322
    val KEY_hebrew_taw = 3322
    val KEY_hebrew_tet = 3304
    val KEY_hebrew_teth = 3304
    val KEY_hebrew_waw = 3301
    val KEY_hebrew_yod = 3305
    val KEY_hebrew_zade = 3318
    val KEY_hebrew_zadi = 3318
    val KEY_hebrew_zain = 3302
    val KEY_hebrew_zayin = 3302
    val KEY_hexagram = 2778
    val KEY_horizconnector = 2211
    val KEY_horizlinescan1 = 2543
    val KEY_horizlinescan3 = 2544
    val KEY_horizlinescan5 = 2545
    val KEY_horizlinescan7 = 2546
    val KEY_horizlinescan9 = 2547
    val KEY_hstroke = 689
    val KEY_ht = 2530
    val KEY_hyphen = 173
    val KEY_i = 105
    val KEY_iTouch = 269025120
    val KEY_iacute = 237
    val KEY_ibelowdot = 16785099
    val KEY_ibreve = 16777517
    val KEY_icircumflex = 238
    val KEY_identical = 2255
    val KEY_idiaeresis = 239
    val KEY_idotless = 697
    val KEY_ifonlyif = 2253
    val KEY_igrave = 236
    val KEY_ihook = 16785097
    val KEY_imacron = 1007
    val KEY_implies = 2254
    val KEY_includedin = 2266
    val KEY_includes = 2267
    val KEY_infinity = 2242
    val KEY_integral = 2239
    val KEY_intersection = 2268
    val KEY_iogonek = 999
    val KEY_itilde = 949
    val KEY_j = 106
    val KEY_jcircumflex = 700
    val KEY_jot = 3018
    val KEY_k = 107
    val KEY_kana_A = 1201
    val KEY_kana_CHI = 1217
    val KEY_kana_E = 1204
    val KEY_kana_FU = 1228
    val KEY_kana_HA = 1226
    val KEY_kana_HE = 1229
    val KEY_kana_HI = 1227
    val KEY_kana_HO = 1230
    val KEY_kana_HU = 1228
    val KEY_kana_I = 1202
    val KEY_kana_KA = 1206
    val KEY_kana_KE = 1209
    val KEY_kana_KI = 1207
    val KEY_kana_KO = 1210
    val KEY_kana_KU = 1208
    val KEY_kana_MA = 1231
    val KEY_kana_ME = 1234
    val KEY_kana_MI = 1232
    val KEY_kana_MO = 1235
    val KEY_kana_MU = 1233
    val KEY_kana_N = 1245
    val KEY_kana_NA = 1221
    val KEY_kana_NE = 1224
    val KEY_kana_NI = 1222
    val KEY_kana_NO = 1225
    val KEY_kana_NU = 1223
    val KEY_kana_O = 1205
    val KEY_kana_RA = 1239
    val KEY_kana_RE = 1242
    val KEY_kana_RI = 1240
    val KEY_kana_RO = 1243
    val KEY_kana_RU = 1241
    val KEY_kana_SA = 1211
    val KEY_kana_SE = 1214
    val KEY_kana_SHI = 1212
    val KEY_kana_SO = 1215
    val KEY_kana_SU = 1213
    val KEY_kana_TA = 1216
    val KEY_kana_TE = 1219
    val KEY_kana_TI = 1217
    val KEY_kana_TO = 1220
    val KEY_kana_TSU = 1218
    val KEY_kana_TU = 1218
    val KEY_kana_U = 1203
    val KEY_kana_WA = 1244
    val KEY_kana_WO = 1190
    val KEY_kana_YA = 1236
    val KEY_kana_YO = 1238
    val KEY_kana_YU = 1237
    val KEY_kana_a = 1191
    val KEY_kana_closingbracket = 1187
    val KEY_kana_comma = 1188
    val KEY_kana_conjunctive = 1189
    val KEY_kana_e = 1194
    val KEY_kana_fullstop = 1185
    val KEY_kana_i = 1192
    val KEY_kana_middledot = 1189
    val KEY_kana_o = 1195
    val KEY_kana_openingbracket = 1186
    val KEY_kana_switch = 65406
    val KEY_kana_tsu = 1199
    val KEY_kana_tu = 1199
    val KEY_kana_u = 1193
    val KEY_kana_ya = 1196
    val KEY_kana_yo = 1198
    val KEY_kana_yu = 1197
    val KEY_kappa = 930
    val KEY_kcedilla = 1011
    val KEY_kra = 930
    val KEY_l = 108
    val KEY_lacute = 485
    val KEY_latincross = 2777
    val KEY_lbelowdot = 16784951
    val KEY_lcaron = 437
    val KEY_lcedilla = 950
    val KEY_leftanglebracket = 2748
    val KEY_leftarrow = 2299
    val KEY_leftcaret = 2979
    val KEY_leftdoublequotemark = 2770
    val KEY_leftmiddlecurlybrace = 2223
    val KEY_leftopentriangle = 2764
    val KEY_leftpointer = 2794
    val KEY_leftradical = 2209
    val KEY_leftshoe = 3034
    val KEY_leftsinglequotemark = 2768
    val KEY_leftt = 2548
    val KEY_lefttack = 3036
    val KEY_less = 60
    val KEY_lessthanequal = 2236
    val KEY_lf = 2533
    val KEY_logicaland = 2270
    val KEY_logicalor = 2271
    val KEY_lowleftcorner = 2541
    val KEY_lowrightcorner = 2538
    val KEY_lstroke = 435
    val KEY_m = 109
    val KEY_mabovedot = 16784961
    val KEY_macron = 175
    val KEY_malesymbol = 2807
    val KEY_maltesecross = 2800
    val KEY_marker = 2751
    val KEY_masculine = 186
    val KEY_minus = 45
    val KEY_minutes = 2774
    val KEY_mu = 181
    val KEY_multiply = 215
    val KEY_musicalflat = 2806
    val KEY_musicalsharp = 2805
    val KEY_n = 110
    val KEY_nabla = 2245
    val KEY_nacute = 497
    val KEY_ncaron = 498
    val KEY_ncedilla = 1009
    val KEY_ninesubscript = 16785545
    val KEY_ninesuperior = 16785529
    val KEY_nl = 2536
    val KEY_nobreakspace = 160
    val KEY_notapproxeq = 16785991
    val KEY_notelementof = 16785929
    val KEY_notequal = 2237
    val KEY_notidentical = 16786018
    val KEY_notsign = 172
    val KEY_ntilde = 241
    val KEY_numbersign = 35
    val KEY_numerosign = 1712
    val KEY_o = 111
    val KEY_oacute = 243
    val KEY_obarred = 16777845
    val KEY_obelowdot = 16785101
    val KEY_ocaron = 16777682
    val KEY_ocircumflex = 244
    val KEY_ocircumflexacute = 16785105
    val KEY_ocircumflexbelowdot = 16785113
    val KEY_ocircumflexgrave = 16785107
    val KEY_ocircumflexhook = 16785109
    val KEY_ocircumflextilde = 16785111
    val KEY_odiaeresis = 246
    val KEY_odoubleacute = 501
    val KEY_oe = 5053
    val KEY_ogonek = 434
    val KEY_ograve = 242
    val KEY_ohook = 16785103
    val KEY_ohorn = 16777633
    val KEY_ohornacute = 16785115
    val KEY_ohornbelowdot = 16785123
    val KEY_ohorngrave = 16785117
    val KEY_ohornhook = 16785119
    val KEY_ohorntilde = 16785121
    val KEY_omacron = 1010
    val KEY_oneeighth = 2755
    val KEY_onefifth = 2738
    val KEY_onehalf = 189
    val KEY_onequarter = 188
    val KEY_onesixth = 2742
    val KEY_onesubscript = 16785537
    val KEY_onesuperior = 185
    val KEY_onethird = 2736
    val KEY_ooblique = 248
    val KEY_openrectbullet = 2786
    val KEY_openstar = 2789
    val KEY_opentribulletdown = 2788
    val KEY_opentribulletup = 2787
    val KEY_ordfeminine = 170
    val KEY_oslash = 248
    val KEY_otilde = 245
    val KEY_overbar = 3008
    val KEY_overline = 1150
    val KEY_p = 112
    val KEY_pabovedot = 16784983
    val KEY_paragraph = 182
    val KEY_parenleft = 40
    val KEY_parenright = 41
    val KEY_partdifferential = 16785922
    val KEY_partialderivative = 2287
    val KEY_percent = 37
    val KEY_period = 46
    val KEY_periodcentered = 183
    val KEY_phonographcopyright = 2811
    val KEY_plus = 43
    val KEY_plusminus = 177
    val KEY_prescription = 2772
    val KEY_prolongedsound = 1200
    val KEY_punctspace = 2726
    val KEY_q = 113
    val KEY_quad = 3020
    val KEY_question = 63
    val KEY_questiondown = 191
    val KEY_quotedbl = 34
    val KEY_quoteleft = 96
    val KEY_quoteright = 39
    val KEY_r = 114
    val KEY_racute = 480
    val KEY_radical = 2262
    val KEY_rcaron = 504
    val KEY_rcedilla = 947
    val KEY_registered = 174
    val KEY_rightanglebracket = 2750
    val KEY_rightarrow = 2301
    val KEY_rightcaret = 2982
    val KEY_rightdoublequotemark = 2771
    val KEY_rightmiddlecurlybrace = 2224
    val KEY_rightmiddlesummation = 2231
    val KEY_rightopentriangle = 2765
    val KEY_rightpointer = 2795
    val KEY_rightshoe = 3032
    val KEY_rightsinglequotemark = 2769
    val KEY_rightt = 2549
    val KEY_righttack = 3068
    val KEY_s = 115
    val KEY_sabovedot = 16784993
    val KEY_sacute = 438
    val KEY_scaron = 441
    val KEY_scedilla = 442
    val KEY_schwa = 16777817
    val KEY_scircumflex = 766
    val KEY_script_switch = 65406
    val KEY_seconds = 2775
    val KEY_section = 167
    val KEY_semicolon = 59
    val KEY_semivoicedsound = 1247
    val KEY_seveneighths = 2758
    val KEY_sevensubscript = 16785543
    val KEY_sevensuperior = 16785527
    val KEY_signaturemark = 2762
    val KEY_signifblank = 2732
    val KEY_similarequal = 2249
    val KEY_singlelowquotemark = 2813
    val KEY_sixsubscript = 16785542
    val KEY_sixsuperior = 16785526
    val KEY_slash = 47
    val KEY_soliddiamond = 2528
    val KEY_space = 32
    val KEY_squareroot = 16785946
    val KEY_ssharp = 223
    val KEY_sterling = 163
    val KEY_stricteq = 16786019
    val KEY_t = 116
    val KEY_tabovedot = 16785003
    val KEY_tcaron = 443
    val KEY_tcedilla = 510
    val KEY_telephone = 2809
    val KEY_telephonerecorder = 2810
    val KEY_therefore = 2240
    val KEY_thinspace = 2727
    val KEY_thorn = 254
    val KEY_threeeighths = 2756
    val KEY_threefifths = 2740
    val KEY_threequarters = 190
    val KEY_threesubscript = 16785539
    val KEY_threesuperior = 179
    val KEY_tintegral = 16785965
    val KEY_topintegral = 2212
    val KEY_topleftparens = 2219
    val KEY_topleftradical = 2210
    val KEY_topleftsqbracket = 2215
    val KEY_topleftsummation = 2225
    val KEY_toprightparens = 2221
    val KEY_toprightsqbracket = 2217
    val KEY_toprightsummation = 2229
    val KEY_topt = 2551
    val KEY_topvertsummationconnector = 2227
    val KEY_trademark = 2761
    val KEY_trademarkincircle = 2763
    val KEY_tslash = 956
    val KEY_twofifths = 2739
    val KEY_twosubscript = 16785538
    val KEY_twosuperior = 178
    val KEY_twothirds = 2737
    val KEY_u = 117
    val KEY_uacute = 250
    val KEY_ubelowdot = 16785125
    val KEY_ubreve = 765
    val KEY_ucircumflex = 251
    val KEY_udiaeresis = 252
    val KEY_udoubleacute = 507
    val KEY_ugrave = 249
    val KEY_uhook = 16785127
    val KEY_uhorn = 16777648
    val KEY_uhornacute = 16785129
    val KEY_uhornbelowdot = 16785137
    val KEY_uhorngrave = 16785131
    val KEY_uhornhook = 16785133
    val KEY_uhorntilde = 16785135
    val KEY_umacron = 1022
    val KEY_underbar = 3014
    val KEY_underscore = 95
    val KEY_union = 2269
    val KEY_uogonek = 1017
    val KEY_uparrow = 2300
    val KEY_upcaret = 2985
    val KEY_upleftcorner = 2540
    val KEY_uprightcorner = 2539
    val KEY_upshoe = 3011
    val KEY_upstile = 3027
    val KEY_uptack = 3022
    val KEY_uring = 505
    val KEY_utilde = 1021
    val KEY_v = 118
    val KEY_variation = 2241
    val KEY_vertbar = 2552
    val KEY_vertconnector = 2214
    val KEY_voicedsound = 1246
    val KEY_vt = 2537
    val KEY_w = 119
    val KEY_wacute = 16785027
    val KEY_wcircumflex = 16777589
    val KEY_wdiaeresis = 16785029
    val KEY_wgrave = 16785025
    val KEY_x = 120
    val KEY_xabovedot = 16785035
    val KEY_y = 121
    val KEY_yacute = 253
    val KEY_ybelowdot = 16785141
    val KEY_ycircumflex = 16777591
    val KEY_ydiaeresis = 255
    val KEY_yen = 165
    val KEY_ygrave = 16785139
    val KEY_yhook = 16785143
    val KEY_ytilde = 16785145
    val KEY_z = 122
    val KEY_zabovedot = 447
    val KEY_zacute = 444
    val KEY_zcaron = 446
    val KEY_zerosubscript = 16785536
    val KEY_zerosuperior = 16785520
    val KEY_zstroke = 16777654
    val MAX_TIMECOORD_AXES = 128
    val PARENT_RELATIVE = 1
    val PRIORITY_REDRAW = 20
    fun atomIntern atomName onlyIfExists = (FFI.String.C.withConstPtr &&&> FFI.Bool.C.withVal ---> GdkAtomRecord.C.fromPtr false) atomIntern_ (atomName & onlyIfExists)
    fun atomInternStaticString atomName = (FFI.String.C.withConstPtr ---> GdkAtomRecord.C.fromPtr false) atomInternStaticString_ atomName
    fun beep () = (I ---> I) beep_ ()
    fun cairoCreate window = (GObjectObjectClass.C.withPtr ---> CairoContextRecord.C.fromPtr true) cairoCreate_ window
    fun cairoGetClipRectangle cr =
      let
        val rect & retVal = (CairoContextRecord.C.withPtr &&&> GdkRectangleRecord.C.withNewPtr ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal) cairoGetClipRectangle_ (cr & ())
      in
        if retVal then SOME rect else NONE
      end
    fun cairoRectangle cr rectangle = (CairoContextRecord.C.withPtr &&&> GdkRectangleRecord.C.withPtr ---> I) cairoRectangle_ (cr & rectangle)
    fun cairoRegion cr region = (CairoContextRecord.C.withPtr &&&> CairoRegionRecord.C.withPtr ---> I) cairoRegion_ (cr & region)
    fun cairoRegionCreateFromSurface surface = (CairoSurfaceRecord.C.withPtr ---> CairoRegionRecord.C.fromPtr true) cairoRegionCreateFromSurface_ surface
    fun cairoSetSourceColor cr color = (CairoContextRecord.C.withPtr &&&> GdkColorRecord.C.withPtr ---> I) cairoSetSourceColor_ (cr & color)
    fun cairoSetSourcePixbuf cr pixbuf pixbufX pixbufY =
      (
        CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        cairoSetSourcePixbuf_
        (
          cr
           & pixbuf
           & pixbufX
           & pixbufY
        )
    fun cairoSetSourceRgba cr rgba = (CairoContextRecord.C.withPtr &&&> GdkRgbaRecord.C.withPtr ---> I) cairoSetSourceRgba_ (cr & rgba)
    fun cairoSetSourceWindow cr window x y =
      (
        CairoContextRecord.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Double.C.withVal
         &&&> FFI.Double.C.withVal
         ---> I
      )
        cairoSetSourceWindow_
        (
          cr
           & window
           & x
           & y
        )
    fun colorParse spec =
      let
        val color & retVal = (FFI.String.C.withConstPtr &&&> GdkColorRecord.C.withNewPtr ---> GdkColorRecord.C.fromPtr true && FFI.Bool.C.fromVal) colorParse_ (spec & ())
      in
        if retVal then SOME color else NONE
      end
    fun disableMultidevice () = (I ---> I) disableMultidevice_ ()
    fun dragAbort context time = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) dragAbort_ (context & time)
    fun dragDrop context time = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) dragDrop_ (context & time)
    fun dragDropSucceeded context = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) dragDropSucceeded_ context
    fun dragFindWindowForScreen context dragWindow screen xRoot yRoot =
      let
        val destWindow
         & protocol
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withVal
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> GdkDragProtocol.C.withRefVal
             ---> GdkWindowClass.C.fromPtr true
                   && GdkDragProtocol.C.fromVal
                   && I
          )
            dragFindWindowForScreen_
            (
              context
               & dragWindow
               & screen
               & xRoot
               & yRoot
               & NONE
               & GdkDragProtocol.null
            )
      in
        (destWindow, protocol)
      end
    fun dragGetSelection context = (GObjectObjectClass.C.withPtr ---> GdkAtomRecord.C.fromPtr false) dragGetSelection_ context
    fun dragMotion context destWindow protocol xRoot yRoot suggestedAction possibleActions time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkDragProtocol.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GdkDragAction.C.withVal
         &&&> GdkDragAction.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        dragMotion_
        (
          context
           & destWindow
           & protocol
           & xRoot
           & yRoot
           & suggestedAction
           & possibleActions
           & time
        )
    fun dragStatus context action time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkDragAction.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        dragStatus_
        (
          context
           & action
           & time
        )
    fun dropFinish context success time =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        dropFinish_
        (
          context
           & success
           & time
        )
    fun dropReply context accepted time =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        dropReply_
        (
          context
           & accepted
           & time
        )
    fun errorTrapPop () = (I ---> FFI.Int.C.fromVal) errorTrapPop_ ()
    fun errorTrapPopIgnored () = (I ---> I) errorTrapPopIgnored_ ()
    fun errorTrapPush () = (I ---> I) errorTrapPush_ ()
    fun eventGet () = (I ---> GdkEvent.C.fromPtr true) eventGet_ ()
    fun eventPeek () = (I ---> GdkEvent.C.fromPtr true) eventPeek_ ()
    fun eventRequestMotions event = (GdkEventMotionRecord.C.withPtr ---> I) eventRequestMotions_ event
    fun eventsPending () = (I ---> FFI.Bool.C.fromVal) eventsPending_ ()
    fun flush () = (I ---> I) flush_ ()
    fun getDefaultRootWindow () = (I ---> GdkWindowClass.C.fromPtr false) getDefaultRootWindow_ ()
    fun getDisplay () = (I ---> FFI.String.C.fromPtr true) getDisplay_ ()
    fun getDisplayArgName () = (I ---> FFI.String.C.fromPtr false) getDisplayArgName_ ()
    fun getProgramClass () = (I ---> FFI.String.C.fromPtr false) getProgramClass_ ()
    fun getShowEvents () = (I ---> FFI.Bool.C.fromVal) getShowEvents_ ()
    fun keyvalConvertCase symbol =
      let
        val lower
         & upper
         & () =
          (
            FFI.UInt.C.withVal
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            keyvalConvertCase_
            (
              symbol
               & FFI.UInt.null
               & FFI.UInt.null
            )
      in
        (lower, upper)
      end
    fun keyvalFromName keyvalName = (FFI.String.C.withConstPtr ---> FFI.UInt.C.fromVal) keyvalFromName_ keyvalName
    fun keyvalIsLower keyval = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) keyvalIsLower_ keyval
    fun keyvalIsUpper keyval = (FFI.UInt.C.withVal ---> FFI.Bool.C.fromVal) keyvalIsUpper_ keyval
    fun keyvalName keyval = (FFI.UInt.C.withVal ---> FFI.String.C.fromPtr false) keyvalName_ keyval
    fun keyvalToLower keyval = (FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) keyvalToLower_ keyval
    fun keyvalToUnicode keyval = (FFI.UInt.C.withVal ---> FFI.UInt32.C.fromVal) keyvalToUnicode_ keyval
    fun keyvalToUpper keyval = (FFI.UInt.C.withVal ---> FFI.UInt.C.fromVal) keyvalToUpper_ keyval
    fun notifyStartupComplete () = (I ---> I) notifyStartupComplete_ ()
    fun notifyStartupCompleteWithId startupId = (FFI.String.C.withConstPtr ---> I) notifyStartupCompleteWithId_ startupId
    fun offscreenWindowGetEmbedder window = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) offscreenWindowGetEmbedder_ window
    fun offscreenWindowGetSurface window = (GObjectObjectClass.C.withPtr ---> CairoSurfaceRecord.C.fromPtr false) offscreenWindowGetSurface_ window
    fun offscreenWindowSetEmbedder window embedder = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) offscreenWindowSetEmbedder_ (window & embedder)
    fun pangoContextGet () = (I ---> PangoContextClass.C.fromPtr true) pangoContextGet_ ()
    fun pangoContextGetForScreen screen = (GObjectObjectClass.C.withPtr ---> PangoContextClass.C.fromPtr true) pangoContextGetForScreen_ screen
    fun pixbufGetFromSurface surface srcX srcY width height =
      (
        CairoSurfaceRecord.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        pixbufGetFromSurface_
        (
          surface
           & srcX
           & srcY
           & width
           & height
        )
    fun pixbufGetFromWindow window srcX srcY width height =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> GdkPixbufPixbufClass.C.fromPtr true
      )
        pixbufGetFromWindow_
        (
          window
           & srcX
           & srcY
           & width
           & height
        )
    fun preParseLibgtkOnly () = (I ---> I) preParseLibgtkOnly_ ()
    fun propertyDelete window property = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> I) propertyDelete_ (window & property)
    fun rectangleIntersect src1 src2 =
      let
        val dest & retVal =
          (
            GdkRectangleRecord.C.withPtr
             &&&> GdkRectangleRecord.C.withPtr
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && FFI.Bool.C.fromVal
          )
            rectangleIntersect_
            (
              src1
               & src2
               & ()
            )
      in
        if retVal then SOME dest else NONE
      end
    fun rectangleUnion src1 src2 =
      let
        val dest & () =
          (
            GdkRectangleRecord.C.withPtr
             &&&> GdkRectangleRecord.C.withPtr
             &&&> GdkRectangleRecord.C.withNewPtr
             ---> GdkRectangleRecord.C.fromPtr true && I
          )
            rectangleUnion_
            (
              src1
               & src2
               & ()
            )
      in
        dest
      end
    fun selectionConvert requestor selection target time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        selectionConvert_
        (
          requestor
           & selection
           & target
           & time
        )
    fun selectionOwnerGet selection = (GdkAtomRecord.C.withPtr ---> GdkWindowClass.C.fromPtr false) selectionOwnerGet_ selection
    fun selectionOwnerGetForDisplay display selection = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> GdkWindowClass.C.fromPtr false) selectionOwnerGetForDisplay_ (display & selection)
    fun selectionOwnerSet owner selection time sendEvent =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        selectionOwnerSet_
        (
          owner
           & selection
           & time
           & sendEvent
        )
    fun selectionOwnerSetForDisplay display owner selection time sendEvent =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Bool.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        selectionOwnerSetForDisplay_
        (
          display
           & owner
           & selection
           & time
           & sendEvent
        )
    fun selectionSendNotify requestor selection target property time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        selectionSendNotify_
        (
          requestor
           & selection
           & target
           & property
           & time
        )
    fun selectionSendNotifyForDisplay display requestor selection target property time =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> GdkAtomRecord.C.withPtr
         &&&> FFI.UInt32.C.withVal
         ---> I
      )
        selectionSendNotifyForDisplay_
        (
          display
           & requestor
           & selection
           & target
           & property
           & time
        )
    fun setDoubleClickTime msec = (FFI.UInt.C.withVal ---> I) setDoubleClickTime_ msec
    fun setProgramClass programClass = (FFI.String.C.withConstPtr ---> I) setProgramClass_ programClass
    fun setShowEvents showEvents = (FFI.Bool.C.withVal ---> I) setShowEvents_ showEvents
    fun settingGet name value = (FFI.String.C.withConstPtr &&&> GObjectValueRecord.C.withPtr ---> FFI.Bool.C.fromVal) settingGet_ (name & value)
    fun synthesizeWindowState window unsetFlags setFlags =
      (
        GObjectObjectClass.C.withPtr
         &&&> GdkWindowState.C.withVal
         &&&> GdkWindowState.C.withVal
         ---> I
      )
        synthesizeWindowState_
        (
          window
           & unsetFlags
           & setFlags
        )
    fun testRenderSync window = (GObjectObjectClass.C.withPtr ---> I) testRenderSync_ window
    fun testSimulateButton window x y button modifiers buttonPressrelease =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         &&&> GdkEventType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        testSimulateButton_
        (
          window
           & x
           & y
           & button
           & modifiers
           & buttonPressrelease
        )
    fun testSimulateKey window x y keyval modifiers keyPressrelease =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> FFI.UInt.C.withVal
         &&&> GdkModifierType.C.withVal
         &&&> GdkEventType.C.withVal
         ---> FFI.Bool.C.fromVal
      )
        testSimulateKey_
        (
          window
           & x
           & y
           & keyval
           & modifiers
           & keyPressrelease
        )
    fun threadsEnter () = (I ---> I) threadsEnter_ ()
    fun threadsInit () = (I ---> I) threadsInit_ ()
    fun threadsLeave () = (I ---> I) threadsLeave_ ()
    fun unicodeToKeyval wc = (FFI.UInt32.C.withVal ---> FFI.UInt.C.fromVal) unicodeToKeyval_ wc
    fun utf8ToStringTarget str = (FFI.String.C.withConstPtr ---> FFI.String.C.fromPtr true) utf8ToStringTarget_ str
  end
