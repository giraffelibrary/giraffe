structure GdkDisplay :>
  GDK_DISPLAY
    where type 'a class = 'a GdkDisplayClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a app_launch_context_class = 'a GdkAppLaunchContextClass.class
    where type 'a window_class = 'a GdkWindowClass.class
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type 'a screen_class = 'a GdkScreenClass.class
    where type 'a event_union = 'a GdkEvent.union
    where type atom_t = GdkAtomRecord.t =
  struct
    val getType_ = _import "gdk_display_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "gdk_display_get_default" : unit -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val open_ = _import "mlton_gdk_display_open" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val openDefaultLibgtkOnly_ = _import "gdk_display_open_default_libgtk_only" : unit -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val beep_ = _import "gdk_display_beep" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;
    val close_ = _import "gdk_display_close" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;
    val deviceIsGrabbed_ = fn x1 & x2 => (_import "gdk_display_device_is_grabbed" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val flush_ = _import "gdk_display_flush" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;
    val getAppLaunchContext_ = _import "gdk_display_get_app_launch_context" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkAppLaunchContextClass.C.notnull GdkAppLaunchContextClass.C.p;
    val getDefaultCursorSize_ = _import "gdk_display_get_default_cursor_size" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.UInt.C.val_;
    val getDefaultGroup_ = _import "gdk_display_get_default_group" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
    val getDefaultScreen_ = _import "gdk_display_get_default_screen" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkScreenClass.C.notnull GdkScreenClass.C.p;
    val getDeviceManager_ = _import "gdk_display_get_device_manager" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkDeviceManagerClass.C.notnull GdkDeviceManagerClass.C.p;
    val getEvent_ = _import "gdk_display_get_event" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkEvent.C.notnull GdkEvent.C.p;
    val getMaximalCursorSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_maximal_cursor_size" :
              GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * FFI.UInt.C.ref_
               * FFI.UInt.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getNScreens_ = _import "gdk_display_get_n_screens" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Int.C.val_;
    val getName_ = _import "gdk_display_get_name" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getScreen_ = fn x1 & x2 => (_import "gdk_display_get_screen" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * FFI.Int.C.val_ -> GdkScreenClass.C.notnull GdkScreenClass.C.p;) (x1, x2)
    val hasPending_ = _import "gdk_display_has_pending" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "gdk_display_is_closed" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val notifyStartupComplete_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_notify_startup_complete" :
              GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val peekEvent_ = _import "gdk_display_peek_event" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> GdkEvent.C.notnull GdkEvent.C.p;
    val putEvent_ = fn x1 & x2 => (_import "gdk_display_put_event" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> unit;) (x1, x2)
    val requestSelectionNotification_ = fn x1 & x2 => (_import "gdk_display_request_selection_notification" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setDoubleClickDistance_ = fn x1 & x2 => (_import "gdk_display_set_double_click_distance" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val setDoubleClickTime_ = fn x1 & x2 => (_import "gdk_display_set_double_click_time" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p * FFI.UInt.C.val_ -> unit;) (x1, x2)
    val supportsClipboardPersistence_ = _import "gdk_display_supports_clipboard_persistence" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsComposite_ = _import "gdk_display_supports_composite" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsCursorAlpha_ = _import "gdk_display_supports_cursor_alpha" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsCursorColor_ = _import "gdk_display_supports_cursor_color" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsInputShapes_ = _import "gdk_display_supports_input_shapes" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsSelectionNotification_ = _import "gdk_display_supports_selection_notification" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val supportsShapes_ = _import "gdk_display_supports_shapes" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> FFI.Bool.C.val_;
    val sync_ = _import "gdk_display_sync" : GdkDisplayClass.C.notnull GdkDisplayClass.C.p -> unit;
    type 'a class = 'a GdkDisplayClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type 'a app_launch_context_class = 'a GdkAppLaunchContextClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a event_union = 'a GdkEvent.union
    type atom_t = GdkAtomRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkDisplayClass.C.fromPtr false) getDefault_ ()
    fun open' displayName = (Utf8.C.withPtr ---> GdkDisplayClass.C.fromPtr false) open_ displayName
    fun openDefaultLibgtkOnly () = (I ---> GdkDisplayClass.C.fromPtr false) openDefaultLibgtkOnly_ ()
    fun beep self = (GdkDisplayClass.C.withPtr ---> I) beep_ self
    fun close self = (GdkDisplayClass.C.withPtr ---> I) close_ self
    fun deviceIsGrabbed self device = (GdkDisplayClass.C.withPtr &&&> GdkDeviceClass.C.withPtr ---> FFI.Bool.C.fromVal) deviceIsGrabbed_ (self & device)
    fun flush self = (GdkDisplayClass.C.withPtr ---> I) flush_ self
    fun getAppLaunchContext self = (GdkDisplayClass.C.withPtr ---> GdkAppLaunchContextClass.C.fromPtr true) getAppLaunchContext_ self
    fun getDefaultCursorSize self = (GdkDisplayClass.C.withPtr ---> FFI.UInt.C.fromVal) getDefaultCursorSize_ self
    fun getDefaultGroup self = (GdkDisplayClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getDefaultGroup_ self
    fun getDefaultScreen self = (GdkDisplayClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getDefaultScreen_ self
    fun getDeviceManager self = (GdkDisplayClass.C.withPtr ---> GdkDeviceManagerClass.C.fromPtr false) getDeviceManager_ self
    fun getEvent self = (GdkDisplayClass.C.withPtr ---> GdkEvent.C.fromPtr true) getEvent_ self
    fun getMaximalCursorSize self =
      let
        val width
         & height
         & () =
          (
            GdkDisplayClass.C.withPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.UInt.C.withRefVal
             ---> FFI.UInt.C.fromVal
                   && FFI.UInt.C.fromVal
                   && I
          )
            getMaximalCursorSize_
            (
              self
               & FFI.UInt.null
               & FFI.UInt.null
            )
      in
        (width, height)
      end
    fun getNScreens self = (GdkDisplayClass.C.withPtr ---> FFI.Int.C.fromVal) getNScreens_ self
    fun getName self = (GdkDisplayClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getScreen self screenNum = (GdkDisplayClass.C.withPtr &&&> FFI.Int.C.withVal ---> GdkScreenClass.C.fromPtr false) getScreen_ (self & screenNum)
    fun hasPending self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun notifyStartupComplete self startupId = (GdkDisplayClass.C.withPtr &&&> Utf8.C.withPtr ---> I) notifyStartupComplete_ (self & startupId)
    fun peekEvent self = (GdkDisplayClass.C.withPtr ---> GdkEvent.C.fromPtr true) peekEvent_ self
    fun putEvent self event = (GdkDisplayClass.C.withPtr &&&> GdkEvent.C.withPtr ---> I) putEvent_ (self & event)
    fun requestSelectionNotification self selection = (GdkDisplayClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.C.fromVal) requestSelectionNotification_ (self & selection)
    fun setDoubleClickDistance self distance = (GdkDisplayClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setDoubleClickDistance_ (self & distance)
    fun setDoubleClickTime self msec = (GdkDisplayClass.C.withPtr &&&> FFI.UInt.C.withVal ---> I) setDoubleClickTime_ (self & msec)
    fun supportsClipboardPersistence self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsClipboardPersistence_ self
    fun supportsComposite self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsComposite_ self
    fun supportsCursorAlpha self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsCursorAlpha_ self
    fun supportsCursorColor self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsCursorColor_ self
    fun supportsInputShapes self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsInputShapes_ self
    fun supportsSelectionNotification self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsSelectionNotification_ self
    fun supportsShapes self = (GdkDisplayClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsShapes_ self
    fun sync self = (GdkDisplayClass.C.withPtr ---> I) sync_ self
    local
      open ClosureMarshal Signal
    in
      fun closedSig f = signal "closed" (get 0w1 boolean ---> ret_void) f
      fun openedSig f = signal "opened" (void ---> ret_void) f
    end
  end
