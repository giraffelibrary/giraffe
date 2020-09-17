structure GdkDisplay :>
  GDK_DISPLAY
    where type 'a class = 'a GdkDisplayClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a app_launch_context_class = 'a GdkAppLaunchContextClass.class
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type modifier_type_t = GdkModifierType.t
    where type 'a event_union = 'a GdkEvent.union
    where type atom_t = GdkAtomRecord.t
    where type atom_record_c_ptr_array_n_t = GdkAtomRecordCPtrArrayN.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a monitor_class = 'a GdkMonitorClass.class
    where type 'a seat_class = 'a GdkSeatClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_display_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "gdk_display_get_default") (cVoid --> GdkDisplayClass.PolyML.cOptPtr)
      val open_ = call (getSymbol "gdk_display_open") (Utf8.PolyML.cInPtr --> GdkDisplayClass.PolyML.cOptPtr)
      val openDefaultLibgtkOnly_ = call (getSymbol "gdk_display_open_default_libgtk_only") (cVoid --> GdkDisplayClass.PolyML.cOptPtr)
      val beep_ = call (getSymbol "gdk_display_beep") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val close_ = call (getSymbol "gdk_display_close") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val deviceIsGrabbed_ = call (getSymbol "gdk_display_device_is_grabbed") (GdkDisplayClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val flush_ = call (getSymbol "gdk_display_flush") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val getAppLaunchContext_ = call (getSymbol "gdk_display_get_app_launch_context") (GdkDisplayClass.PolyML.cPtr --> GdkAppLaunchContextClass.PolyML.cPtr)
      val getDefaultCursorSize_ = call (getSymbol "gdk_display_get_default_cursor_size") (GdkDisplayClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getDefaultGroup_ = call (getSymbol "gdk_display_get_default_group") (GdkDisplayClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getDefaultScreen_ = call (getSymbol "gdk_display_get_default_screen") (GdkDisplayClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getDefaultSeat_ = call (getSymbol "gdk_display_get_default_seat") (GdkDisplayClass.PolyML.cPtr --> GdkSeatClass.PolyML.cPtr)
      val getDeviceManager_ = call (getSymbol "gdk_display_get_device_manager") (GdkDisplayClass.PolyML.cPtr --> GdkDeviceManagerClass.PolyML.cOptPtr)
      val getEvent_ = call (getSymbol "gdk_display_get_event") (GdkDisplayClass.PolyML.cPtr --> GdkEvent.PolyML.cOptPtr)
      val getMaximalCursorSize_ =
        call (getSymbol "gdk_display_get_maximal_cursor_size")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GUInt32.PolyML.cRef
             &&> GUInt32.PolyML.cRef
             --> cVoid
          )
      val getMonitor_ = call (getSymbol "gdk_display_get_monitor") (GdkDisplayClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GdkMonitorClass.PolyML.cOptPtr)
      val getMonitorAtPoint_ =
        call (getSymbol "gdk_display_get_monitor_at_point")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GdkMonitorClass.PolyML.cPtr
          )
      val getMonitorAtWindow_ = call (getSymbol "gdk_display_get_monitor_at_window") (GdkDisplayClass.PolyML.cPtr &&> GdkWindowClass.PolyML.cPtr --> GdkMonitorClass.PolyML.cPtr)
      val getNMonitors_ = call (getSymbol "gdk_display_get_n_monitors") (GdkDisplayClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getNScreens_ = call (getSymbol "gdk_display_get_n_screens") (GdkDisplayClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getName_ = call (getSymbol "gdk_display_get_name") (GdkDisplayClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPointer_ =
        call (getSymbol "gdk_display_get_pointer")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val getPrimaryMonitor_ = call (getSymbol "gdk_display_get_primary_monitor") (GdkDisplayClass.PolyML.cPtr --> GdkMonitorClass.PolyML.cOptPtr)
      val getScreen_ = call (getSymbol "gdk_display_get_screen") (GdkDisplayClass.PolyML.cPtr &&> GInt32.PolyML.cVal --> GdkScreenClass.PolyML.cPtr)
      val getWindowAtPointer_ =
        call (getSymbol "gdk_display_get_window_at_pointer")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GdkWindowClass.PolyML.cOptPtr
          )
      val hasPending_ = call (getSymbol "gdk_display_has_pending") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "gdk_display_is_closed") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val keyboardUngrab_ = call (getSymbol "gdk_display_keyboard_ungrab") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val notifyStartupComplete_ = call (getSymbol "gdk_display_notify_startup_complete") (GdkDisplayClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val peekEvent_ = call (getSymbol "gdk_display_peek_event") (GdkDisplayClass.PolyML.cPtr --> GdkEvent.PolyML.cOptPtr)
      val pointerIsGrabbed_ = call (getSymbol "gdk_display_pointer_is_grabbed") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val pointerUngrab_ = call (getSymbol "gdk_display_pointer_ungrab") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val putEvent_ = call (getSymbol "gdk_display_put_event") (GdkDisplayClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> cVoid)
      val requestSelectionNotification_ = call (getSymbol "gdk_display_request_selection_notification") (GdkDisplayClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDoubleClickDistance_ = call (getSymbol "gdk_display_set_double_click_distance") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setDoubleClickTime_ = call (getSymbol "gdk_display_set_double_click_time") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val storeClipboard_ =
        call (getSymbol "gdk_display_store_clipboard")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkAtomRecordCPtrArrayN.PolyML.cInOptPtr
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
      val supportsClipboardPersistence_ = call (getSymbol "gdk_display_supports_clipboard_persistence") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsComposite_ = call (getSymbol "gdk_display_supports_composite") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsCursorAlpha_ = call (getSymbol "gdk_display_supports_cursor_alpha") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsCursorColor_ = call (getSymbol "gdk_display_supports_cursor_color") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsInputShapes_ = call (getSymbol "gdk_display_supports_input_shapes") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsSelectionNotification_ = call (getSymbol "gdk_display_supports_selection_notification") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsShapes_ = call (getSymbol "gdk_display_supports_shapes") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val sync_ = call (getSymbol "gdk_display_sync") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val warpPointer_ =
        call (getSymbol "gdk_display_warp_pointer")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GdkDisplayClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type 'a app_launch_context_class = 'a GdkAppLaunchContextClass.class
    type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    type modifier_type_t = GdkModifierType.t
    type 'a event_union = 'a GdkEvent.union
    type atom_t = GdkAtomRecord.t
    type atom_record_c_ptr_array_n_t = GdkAtomRecordCPtrArrayN.t
    type 'a window_class = 'a GdkWindowClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a monitor_class = 'a GdkMonitorClass.class
    type 'a seat_class = 'a GdkSeatClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkDisplayClass.FFI.fromOptPtr false) getDefault_ ()
    fun open' displayName = (Utf8.FFI.withPtr 0 ---> GdkDisplayClass.FFI.fromOptPtr false) open_ displayName before Utf8.FFI.touchPtr displayName
    fun openDefaultLibgtkOnly () = (I ---> GdkDisplayClass.FFI.fromOptPtr false) openDefaultLibgtkOnly_ ()
    fun beep self = (GdkDisplayClass.FFI.withPtr false ---> I) beep_ self
    fun close self = (GdkDisplayClass.FFI.withPtr false ---> I) close_ self
    fun deviceIsGrabbed self device = (GdkDisplayClass.FFI.withPtr false &&&> GdkDeviceClass.FFI.withPtr false ---> GBool.FFI.fromVal) deviceIsGrabbed_ (self & device)
    fun flush self = (GdkDisplayClass.FFI.withPtr false ---> I) flush_ self
    fun getAppLaunchContext self = (GdkDisplayClass.FFI.withPtr false ---> GdkAppLaunchContextClass.FFI.fromPtr true) getAppLaunchContext_ self
    fun getDefaultCursorSize self = (GdkDisplayClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getDefaultCursorSize_ self
    fun getDefaultGroup self = (GdkDisplayClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromPtr false) getDefaultGroup_ self before GdkDisplayClass.FFI.touchPtr self
    fun getDefaultScreen self = (GdkDisplayClass.FFI.withPtr false ---> GdkScreenClass.FFI.fromPtr false) getDefaultScreen_ self before GdkDisplayClass.FFI.touchPtr self
    fun getDefaultSeat self = (GdkDisplayClass.FFI.withPtr false ---> GdkSeatClass.FFI.fromPtr false) getDefaultSeat_ self before GdkDisplayClass.FFI.touchPtr self
    fun getDeviceManager self = (GdkDisplayClass.FFI.withPtr false ---> GdkDeviceManagerClass.FFI.fromOptPtr false) getDeviceManager_ self before GdkDisplayClass.FFI.touchPtr self
    fun getEvent self = (GdkDisplayClass.FFI.withPtr false ---> GdkEvent.FFI.fromOptPtr true) getEvent_ self
    fun getMaximalCursorSize self =
      let
        val width
         & height
         & () =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GUInt32.FFI.withRefVal
             &&&> GUInt32.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GUInt32.FFI.fromVal
                   && I
          )
            getMaximalCursorSize_
            (
              self
               & GUInt32.null
               & GUInt32.null
            )
      in
        (width, height)
      end
    fun getMonitor self monitorNum = (GdkDisplayClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GdkMonitorClass.FFI.fromOptPtr false) getMonitor_ (self & monitorNum) before GdkDisplayClass.FFI.touchPtr self
    fun getMonitorAtPoint self (x, y) =
      (
        GdkDisplayClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GdkMonitorClass.FFI.fromPtr false
      )
        getMonitorAtPoint_
        (
          self
           & x
           & y
        )
       before GdkDisplayClass.FFI.touchPtr self
    fun getMonitorAtWindow self window = (GdkDisplayClass.FFI.withPtr false &&&> GdkWindowClass.FFI.withPtr false ---> GdkMonitorClass.FFI.fromPtr false) getMonitorAtWindow_ (self & window) before GdkDisplayClass.FFI.touchPtr self before GdkWindowClass.FFI.touchPtr window
    fun getNMonitors self = (GdkDisplayClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNMonitors_ self
    fun getNScreens self = (GdkDisplayClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNScreens_ self
    fun getName self = (GdkDisplayClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getName_ self before GdkDisplayClass.FFI.touchPtr self
    fun getPointer self =
      let
        val screen
         & x
         & y
         & mask
         & () =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GdkScreenClass.FFI.withRefOptPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            getPointer_
            (
              self
               & NONE
               & GInt32.null
               & GInt32.null
               & GdkModifierType.flags []
            )
      in
        (
          screen,
          x,
          y,
          mask
        )
         before GdkDisplayClass.FFI.touchPtr self
      end
    fun getPrimaryMonitor self = (GdkDisplayClass.FFI.withPtr false ---> GdkMonitorClass.FFI.fromOptPtr false) getPrimaryMonitor_ self before GdkDisplayClass.FFI.touchPtr self
    fun getScreen self screenNum = (GdkDisplayClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GdkScreenClass.FFI.fromPtr false) getScreen_ (self & screenNum) before GdkDisplayClass.FFI.touchPtr self
    fun getWindowAtPointer self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getWindowAtPointer_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (
          retVal,
          winX,
          winY
        )
         before GdkDisplayClass.FFI.touchPtr self
      end
    fun hasPending self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) isClosed_ self
    fun keyboardUngrab self time = (GdkDisplayClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) keyboardUngrab_ (self & time)
    fun notifyStartupComplete self startupId = (GdkDisplayClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) notifyStartupComplete_ (self & startupId)
    fun peekEvent self = (GdkDisplayClass.FFI.withPtr false ---> GdkEvent.FFI.fromOptPtr true) peekEvent_ self
    fun pointerIsGrabbed self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) pointerIsGrabbed_ self
    fun pointerUngrab self time = (GdkDisplayClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) pointerUngrab_ (self & time)
    fun putEvent self event = (GdkDisplayClass.FFI.withPtr false &&&> GdkEvent.FFI.withPtr false ---> I) putEvent_ (self & event)
    fun requestSelectionNotification self selection = (GdkDisplayClass.FFI.withPtr false &&&> GdkAtomRecord.FFI.withPtr false ---> GBool.FFI.fromVal) requestSelectionNotification_ (self & selection)
    fun setDoubleClickDistance self distance = (GdkDisplayClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setDoubleClickDistance_ (self & distance)
    fun setDoubleClickTime self msec = (GdkDisplayClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setDoubleClickTime_ (self & msec)
    fun storeClipboard
      self
      (
        clipboardWindow,
        time,
        targets
      ) =
      let
        val nTargets =
          case targets of
            SOME targets => LargeInt.fromInt (GdkAtomRecordCPtrArrayN.length targets)
          | NONE => GInt32.null
        val () =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GdkWindowClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GdkAtomRecordCPtrArrayN.FFI.withOptPtr 0
             &&&> GInt32.FFI.withVal
             ---> I
          )
            storeClipboard_
            (
              self
               & clipboardWindow
               & time
               & targets
               & nTargets
            )
      in
        ()
      end
    fun supportsClipboardPersistence self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsClipboardPersistence_ self
    fun supportsComposite self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsComposite_ self
    fun supportsCursorAlpha self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsCursorAlpha_ self
    fun supportsCursorColor self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsCursorColor_ self
    fun supportsInputShapes self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsInputShapes_ self
    fun supportsSelectionNotification self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsSelectionNotification_ self
    fun supportsShapes self = (GdkDisplayClass.FFI.withPtr false ---> GBool.FFI.fromVal) supportsShapes_ self
    fun sync self = (GdkDisplayClass.FFI.withPtr false ---> I) sync_ self
    fun warpPointer
      self
      (
        screen,
        x,
        y
      ) =
      (
        GdkDisplayClass.FFI.withPtr false
         &&&> GdkScreenClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        warpPointer_
        (
          self
           & screen
           & x
           & y
        )
    local
      open ClosureMarshal Signal
    in
      fun closedSig f = signal "closed" (get 0w1 boolean ---> ret_void) f
      fun monitorAddedSig f = signal "monitor-added" (get 0w1 GdkMonitorClass.t ---> ret_void) f
      fun monitorRemovedSig f = signal "monitor-removed" (get 0w1 GdkMonitorClass.t ---> ret_void) f
      fun openedSig f = signal "opened" (void ---> ret_void) f
      fun seatAddedSig f = signal "seat-added" (get 0w1 GdkSeatClass.t ---> ret_void) f
      fun seatRemovedSig f = signal "seat-removed" (get 0w1 GdkSeatClass.t ---> ret_void) f
    end
  end
