structure GdkDisplay :>
  GDK_DISPLAY
    where type 'a class = 'a GdkDisplayClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a app_launch_context_class = 'a GdkAppLaunchContextClass.class
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type modifier_type_t = GdkModifierType.t
    where type 'a event_union = 'a GdkEvent.union
    where type atom_t = GdkAtomRecord.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a monitor_class = 'a GdkMonitorClass.class
    where type 'a seat_class = 'a GdkSeatClass.class =
  struct
    structure GdkAtomRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkAtomRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkAtomRecordCVectorN = CVectorN(GdkAtomRecordCVectorNType)
    val getType_ = _import "gdk_display_get_type" : unit -> GObjectType.FFI.val_;
    val getDefault_ = _import "gdk_display_get_default" : unit -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val open_ = _import "mlton_gdk_display_open" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val openDefaultLibgtkOnly_ = _import "gdk_display_open_default_libgtk_only" : unit -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val beep_ = _import "gdk_display_beep" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> unit;
    val close_ = _import "gdk_display_close" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> unit;
    val deviceIsGrabbed_ = fn x1 & x2 => (_import "gdk_display_device_is_grabbed" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val flush_ = _import "gdk_display_flush" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> unit;
    val getAppLaunchContext_ = _import "gdk_display_get_app_launch_context" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkAppLaunchContextClass.FFI.notnull GdkAppLaunchContextClass.FFI.p;
    val getDefaultCursorSize_ = _import "gdk_display_get_default_cursor_size" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GUInt.FFI.val_;
    val getDefaultGroup_ = _import "gdk_display_get_default_group" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
    val getDefaultScreen_ = _import "gdk_display_get_default_screen" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;
    val getDefaultSeat_ = _import "gdk_display_get_default_seat" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p;
    val getDeviceManager_ = _import "gdk_display_get_device_manager" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkDeviceManagerClass.FFI.notnull GdkDeviceManagerClass.FFI.p;
    val getEvent_ = _import "gdk_display_get_event" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkEvent.FFI.notnull GdkEvent.FFI.p;
    val getMaximalCursorSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_maximal_cursor_size" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GUInt.FFI.ref_
               * GUInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitor_ = fn x1 & x2 => (_import "gdk_display_get_monitor" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GInt.FFI.val_ -> GdkMonitorClass.FFI.notnull GdkMonitorClass.FFI.p;) (x1, x2)
    val getMonitorAtPoint_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_monitor_at_point" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GdkMonitorClass.FFI.notnull GdkMonitorClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getMonitorAtWindow_ = fn x1 & x2 => (_import "gdk_display_get_monitor_at_window" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p -> GdkMonitorClass.FFI.notnull GdkMonitorClass.FFI.p;) (x1, x2)
    val getNMonitors_ = _import "gdk_display_get_n_monitors" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GInt.FFI.val_;
    val getNScreens_ = _import "gdk_display_get_n_screens" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GInt.FFI.val_;
    val getName_ = _import "gdk_display_get_name" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPointer_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5 =>
          (
            _import "gdk_display_get_pointer" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * (unit, GdkScreenClass.FFI.notnull) GdkScreenClass.FFI.r
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
    val getPrimaryMonitor_ = _import "gdk_display_get_primary_monitor" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkMonitorClass.FFI.notnull GdkMonitorClass.FFI.p;
    val getScreen_ = fn x1 & x2 => (_import "gdk_display_get_screen" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GInt.FFI.val_ -> GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p;) (x1, x2)
    val getWindowAtPointer_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_window_at_pointer" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val hasPending_ = _import "gdk_display_has_pending" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val isClosed_ = _import "gdk_display_is_closed" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val keyboardUngrab_ = fn x1 & x2 => (_import "gdk_display_keyboard_ungrab" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val notifyStartupComplete_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_notify_startup_complete" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val peekEvent_ = _import "gdk_display_peek_event" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GdkEvent.FFI.notnull GdkEvent.FFI.p;
    val pointerIsGrabbed_ = _import "gdk_display_pointer_is_grabbed" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val pointerUngrab_ = fn x1 & x2 => (_import "gdk_display_pointer_ungrab" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val putEvent_ = fn x1 & x2 => (_import "gdk_display_put_event" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GdkEvent.FFI.notnull GdkEvent.FFI.p -> unit;) (x1, x2)
    val requestSelectionNotification_ = fn x1 & x2 => (_import "gdk_display_request_selection_notification" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GdkAtomRecord.FFI.notnull GdkAtomRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val setDoubleClickDistance_ = fn x1 & x2 => (_import "gdk_display_set_double_click_distance" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setDoubleClickTime_ = fn x1 & x2 => (_import "gdk_display_set_double_click_time" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val storeClipboard_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gdk_display_store_clipboard" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GUInt32.FFI.val_
               * GdkAtomRecordCVectorN.MLton.p1
               * unit GdkAtomRecordCVectorN.MLton.p2
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
    val supportsClipboardPersistence_ = _import "gdk_display_supports_clipboard_persistence" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsComposite_ = _import "gdk_display_supports_composite" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsCursorAlpha_ = _import "gdk_display_supports_cursor_alpha" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsCursorColor_ = _import "gdk_display_supports_cursor_color" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsInputShapes_ = _import "gdk_display_supports_input_shapes" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsSelectionNotification_ = _import "gdk_display_supports_selection_notification" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val supportsShapes_ = _import "gdk_display_supports_shapes" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> GBool.FFI.val_;
    val sync_ = _import "gdk_display_sync" : GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p -> unit;
    val warpPointer_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_display_warp_pointer" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p
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
    type 'a window_class = 'a GdkWindowClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a monitor_class = 'a GdkMonitorClass.class
    type 'a seat_class = 'a GdkSeatClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefault () = (I ---> GdkDisplayClass.FFI.fromPtr false) getDefault_ ()
    fun open' displayName = (Utf8.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) open_ displayName
    fun openDefaultLibgtkOnly () = (I ---> GdkDisplayClass.FFI.fromPtr false) openDefaultLibgtkOnly_ ()
    fun beep self = (GdkDisplayClass.FFI.withPtr ---> I) beep_ self
    fun close self = (GdkDisplayClass.FFI.withPtr ---> I) close_ self
    fun deviceIsGrabbed self device = (GdkDisplayClass.FFI.withPtr &&&> GdkDeviceClass.FFI.withPtr ---> GBool.FFI.fromVal) deviceIsGrabbed_ (self & device)
    fun flush self = (GdkDisplayClass.FFI.withPtr ---> I) flush_ self
    fun getAppLaunchContext self = (GdkDisplayClass.FFI.withPtr ---> GdkAppLaunchContextClass.FFI.fromPtr true) getAppLaunchContext_ self
    fun getDefaultCursorSize self = (GdkDisplayClass.FFI.withPtr ---> GUInt.FFI.fromVal) getDefaultCursorSize_ self
    fun getDefaultGroup self = (GdkDisplayClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getDefaultGroup_ self
    fun getDefaultScreen self = (GdkDisplayClass.FFI.withPtr ---> GdkScreenClass.FFI.fromPtr false) getDefaultScreen_ self
    fun getDefaultSeat self = (GdkDisplayClass.FFI.withPtr ---> GdkSeatClass.FFI.fromPtr false) getDefaultSeat_ self
    fun getDeviceManager self = (GdkDisplayClass.FFI.withPtr ---> GdkDeviceManagerClass.FFI.fromPtr false) getDeviceManager_ self
    fun getEvent self = (GdkDisplayClass.FFI.withPtr ---> GdkEvent.FFI.fromPtr true) getEvent_ self
    fun getMaximalCursorSize self =
      let
        val width
         & height
         & () =
          (
            GdkDisplayClass.FFI.withPtr
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
    fun getMonitor self monitorNum = (GdkDisplayClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GdkMonitorClass.FFI.fromPtr false) getMonitor_ (self & monitorNum)
    fun getMonitorAtPoint self (x, y) =
      (
        GdkDisplayClass.FFI.withPtr
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
    fun getMonitorAtWindow self window = (GdkDisplayClass.FFI.withPtr &&&> GdkWindowClass.FFI.withPtr ---> GdkMonitorClass.FFI.fromPtr false) getMonitorAtWindow_ (self & window)
    fun getNMonitors self = (GdkDisplayClass.FFI.withPtr ---> GInt.FFI.fromVal) getNMonitors_ self
    fun getNScreens self = (GdkDisplayClass.FFI.withPtr ---> GInt.FFI.fromVal) getNScreens_ self
    fun getName self = (GdkDisplayClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPointer self =
      let
        val screen
         & x
         & y
         & mask
         & () =
          (
            GdkDisplayClass.FFI.withPtr
             &&&> GdkScreenClass.FFI.withRefOptPtr
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
      end
    fun getPrimaryMonitor self = (GdkDisplayClass.FFI.withPtr ---> GdkMonitorClass.FFI.fromPtr false) getPrimaryMonitor_ self
    fun getScreen self screenNum = (GdkDisplayClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GdkScreenClass.FFI.fromPtr false) getScreen_ (self & screenNum)
    fun getWindowAtPointer self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDisplayClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
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
      end
    fun hasPending self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) hasPending_ self
    fun isClosed self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) isClosed_ self
    fun keyboardUngrab self time = (GdkDisplayClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) keyboardUngrab_ (self & time)
    fun notifyStartupComplete self startupId = (GdkDisplayClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) notifyStartupComplete_ (self & startupId)
    fun peekEvent self = (GdkDisplayClass.FFI.withPtr ---> GdkEvent.FFI.fromPtr true) peekEvent_ self
    fun pointerIsGrabbed self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) pointerIsGrabbed_ self
    fun pointerUngrab self time = (GdkDisplayClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) pointerUngrab_ (self & time)
    fun putEvent self event = (GdkDisplayClass.FFI.withPtr &&&> GdkEvent.FFI.withPtr ---> I) putEvent_ (self & event)
    fun requestSelectionNotification self selection = (GdkDisplayClass.FFI.withPtr &&&> GdkAtomRecord.FFI.withPtr ---> GBool.FFI.fromVal) requestSelectionNotification_ (self & selection)
    fun setDoubleClickDistance self distance = (GdkDisplayClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setDoubleClickDistance_ (self & distance)
    fun setDoubleClickTime self msec = (GdkDisplayClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setDoubleClickTime_ (self & msec)
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
            SOME targets => LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
          | NONE => GInt.null
        val () =
          (
            GdkDisplayClass.FFI.withPtr
             &&&> GdkWindowClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GdkAtomRecordCVectorN.FFI.withOptPtr
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
    fun supportsClipboardPersistence self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsClipboardPersistence_ self
    fun supportsComposite self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsComposite_ self
    fun supportsCursorAlpha self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsCursorAlpha_ self
    fun supportsCursorColor self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsCursorColor_ self
    fun supportsInputShapes self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsInputShapes_ self
    fun supportsSelectionNotification self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsSelectionNotification_ self
    fun supportsShapes self = (GdkDisplayClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsShapes_ self
    fun sync self = (GdkDisplayClass.FFI.withPtr ---> I) sync_ self
    fun warpPointer
      self
      (
        screen,
        x,
        y
      ) =
      (
        GdkDisplayClass.FFI.withPtr
         &&&> GdkScreenClass.FFI.withPtr
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
