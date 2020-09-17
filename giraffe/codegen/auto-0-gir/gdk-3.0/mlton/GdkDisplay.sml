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
    val getType_ = _import "gdk_display_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "gdk_display_get_default" : unit -> GdkDisplayClass.FFI.opt GdkDisplayClass.FFI.p;
    val open_ = _import "mlton_gdk_display_open" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GdkDisplayClass.FFI.opt GdkDisplayClass.FFI.p;
    val openDefaultLibgtkOnly_ = _import "gdk_display_open_default_libgtk_only" : unit -> GdkDisplayClass.FFI.opt GdkDisplayClass.FFI.p;
    val beep_ = _import "gdk_display_beep" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;
    val close_ = _import "gdk_display_close" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;
    val deviceIsGrabbed_ = fn x1 & x2 => (_import "gdk_display_device_is_grabbed" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkDeviceClass.FFI.non_opt GdkDeviceClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val flush_ = _import "gdk_display_flush" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;
    val getAppLaunchContext_ = _import "gdk_display_get_app_launch_context" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkAppLaunchContextClass.FFI.non_opt GdkAppLaunchContextClass.FFI.p;
    val getDefaultCursorSize_ = _import "gdk_display_get_default_cursor_size" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GUInt.FFI.val_;
    val getDefaultGroup_ = _import "gdk_display_get_default_group" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p;
    val getDefaultScreen_ = _import "gdk_display_get_default_screen" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;
    val getDefaultSeat_ = _import "gdk_display_get_default_seat" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkSeatClass.FFI.non_opt GdkSeatClass.FFI.p;
    val getDeviceManager_ = _import "gdk_display_get_device_manager" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkDeviceManagerClass.FFI.opt GdkDeviceManagerClass.FFI.p;
    val getEvent_ = _import "gdk_display_get_event" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkEvent.FFI.opt GdkEvent.FFI.p;
    val getMaximalCursorSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_maximal_cursor_size" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitor_ = fn x1 & x2 => (_import "gdk_display_get_monitor" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GInt.FFI.val_ -> GdkMonitorClass.FFI.opt GdkMonitorClass.FFI.p;) (x1, x2)
    val getMonitorAtPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_monitor_at_point" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorAtWindow_ = fn x1 & x2 => (_import "gdk_display_get_monitor_at_window" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p -> GdkMonitorClass.FFI.non_opt GdkMonitorClass.FFI.p;) (x1, x2)
    val getNMonitors_ = _import "gdk_display_get_n_monitors" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GInt.FFI.val_;
    val getNScreens_ = _import "gdk_display_get_n_screens" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GInt.FFI.val_;
    val getName_ = _import "gdk_display_get_name" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getPointer_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_display_get_pointer" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * (GdkScreenClass.FFI.opt, GdkScreenClass.FFI.non_opt) GdkScreenClass.FFI.r
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getPrimaryMonitor_ = _import "gdk_display_get_primary_monitor" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkMonitorClass.FFI.opt GdkMonitorClass.FFI.p;
    val getScreen_ = fn x1 & x2 => (_import "gdk_display_get_screen" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GInt.FFI.val_ -> GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p;) (x1, x2)
    val getWindowAtPointer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_window_at_pointer" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "gdk_display_has_pending" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "gdk_display_is_closed" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val keyboardUngrab_ = fn x1 & x2 => (_import "gdk_display_keyboard_ungrab" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val notifyStartupComplete_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_notify_startup_complete" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val peekEvent_ = _import "gdk_display_peek_event" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GdkEvent.FFI.opt GdkEvent.FFI.p;
    val pointerIsGrabbed_ = _import "gdk_display_pointer_is_grabbed" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val pointerUngrab_ = fn x1 & x2 => (_import "gdk_display_pointer_ungrab" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val putEvent_ = fn x1 & x2 => (_import "gdk_display_put_event" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkEvent.FFI.non_opt GdkEvent.FFI.p -> unit;) (x1, x2)
    val requestSelectionNotification_ = fn x1 & x2 => (_import "gdk_display_request_selection_notification" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GdkAtomRecord.FFI.non_opt GdkAtomRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setDoubleClickDistance_ = fn x1 & x2 => (_import "gdk_display_set_double_click_distance" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setDoubleClickTime_ = fn x1 & x2 => (_import "gdk_display_set_double_click_time" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val storeClipboard_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gdk_display_store_clipboard" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GdkWindowClass.FFI.non_opt GdkWindowClass.FFI.p
               * GUInt32.FFI.val_
               * GdkAtomRecordCPtrArrayN.MLton.p1
               * GdkAtomRecordCPtrArrayN.FFI.opt GdkAtomRecordCPtrArrayN.MLton.p2
               * GInt.FFI.val_
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
    val supportsClipboardPersistence_ = _import "gdk_display_supports_clipboard_persistence" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsComposite_ = _import "gdk_display_supports_composite" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsCursorAlpha_ = _import "gdk_display_supports_cursor_alpha" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsCursorColor_ = _import "gdk_display_supports_cursor_color" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsInputShapes_ = _import "gdk_display_supports_input_shapes" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsSelectionNotification_ = _import "gdk_display_supports_selection_notification" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsShapes_ = _import "gdk_display_supports_shapes" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val sync_ = _import "gdk_display_sync" : GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p -> unit;
    val warpPointer_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_display_warp_pointer" :
              GdkDisplayClass.FFI.non_opt GdkDisplayClass.FFI.p
               * GdkScreenClass.FFI.non_opt GdkScreenClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
    fun getDefaultCursorSize self = (GdkDisplayClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getDefaultCursorSize_ self
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
             &&&> GUInt.FFI.withRefVal
             &&&> GUInt.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GUInt.FFI.fromVal
                   && I
          )
            getMaximalCursorSize_
            (
              self
               & GUInt.null
               & GUInt.null
            )
      in
        (width, height)
      end
    fun getMonitor self monitorNum = (GdkDisplayClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GdkMonitorClass.FFI.fromOptPtr false) getMonitor_ (self & monitorNum) before GdkDisplayClass.FFI.touchPtr self
    fun getMonitorAtPoint self (x, y) =
      (
        GdkDisplayClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
    fun getNMonitors self = (GdkDisplayClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNMonitors_ self
    fun getNScreens self = (GdkDisplayClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNScreens_ self
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
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && I
          )
            getPointer_
            (
              self
               & NONE
               & GInt.null
               & GInt.null
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
    fun getScreen self screenNum = (GdkDisplayClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GdkScreenClass.FFI.fromPtr false) getScreen_ (self & screenNum) before GdkDisplayClass.FFI.touchPtr self
    fun getWindowAtPointer self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkWindowClass.FFI.fromOptPtr false
          )
            getWindowAtPointer_
            (
              self
               & GInt.null
               & GInt.null
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
    fun setDoubleClickDistance self distance = (GdkDisplayClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setDoubleClickDistance_ (self & distance)
    fun setDoubleClickTime self msec = (GdkDisplayClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setDoubleClickTime_ (self & msec)
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
          | NONE => GInt.null
        val () =
          (
            GdkDisplayClass.FFI.withPtr false
             &&&> GdkWindowClass.FFI.withPtr false
             &&&> GUInt32.FFI.withVal
             &&&> GdkAtomRecordCPtrArrayN.FFI.withOptPtr 0
             &&&> GInt.FFI.withVal
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
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
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
