structure GdkDisplay :>
  GDK_DISPLAY
    where type 'a class_t = 'a GdkDisplayClass.t
    where type 'a deviceclass_t = 'a GdkDeviceClass.t
    where type 'a applaunchcontextclass_t = 'a GdkAppLaunchContextClass.t
    where type 'a windowclass_t = 'a GdkWindowClass.t
    where type 'a devicemanagerclass_t = 'a GdkDeviceManagerClass.t
    where type 'a screenclass_t = 'a GdkScreenClass.t
    where type 'a event_t = 'a GdkEvent.t
    where type atomrecord_t = GdkAtomRecord.t =
  struct
    val getType_ = _import "gdk_display_get_type" : unit -> GObjectType.C.val_;
    val getDefault_ = _import "gdk_display_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val open_ = _import "mlton_gdk_display_open" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val openDefaultLibgtkOnly_ = _import "gdk_display_open_default_libgtk_only" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val beep_ = _import "gdk_display_beep" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val close_ = _import "gdk_display_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val deviceIsGrabbed_ = fn x1 & x2 => (_import "gdk_display_device_is_grabbed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val flush_ = _import "gdk_display_flush" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAppLaunchContext_ = _import "gdk_display_get_app_launch_context" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefaultCursorSize_ = _import "gdk_display_get_default_cursor_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.UInt32.C.val_;
    val getDefaultGroup_ = _import "gdk_display_get_default_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefaultScreen_ = _import "gdk_display_get_default_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDeviceManager_ = _import "gdk_display_get_device_manager" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getEvent_ = _import "gdk_display_get_event" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkEvent.C.notnull GdkEvent.C.p;
    val getMaximalCursorSize_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_display_get_maximal_cursor_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.C.ref_
               * FFI.UInt32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getNScreens_ = _import "gdk_display_get_n_screens" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getName_ = _import "gdk_display_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getScreen_ = fn x1 & x2 => (_import "gdk_display_get_screen" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val hasPending_ = _import "gdk_display_has_pending" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val isClosed_ = _import "gdk_display_is_closed" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val notifyStartupComplete_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gdk_display_notify_startup_complete" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val peekEvent_ = _import "gdk_display_peek_event" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkEvent.C.notnull GdkEvent.C.p;
    val putEvent_ = fn x1 & x2 => (_import "gdk_display_put_event" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkEvent.C.notnull GdkEvent.C.p -> unit;) (x1, x2)
    val requestSelectionNotification_ = fn x1 & x2 => (_import "gdk_display_request_selection_notification" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkAtomRecord.C.notnull GdkAtomRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val setDoubleClickDistance_ = fn x1 & x2 => (_import "gdk_display_set_double_click_distance" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val setDoubleClickTime_ = fn x1 & x2 => (_import "gdk_display_set_double_click_time" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val supportsClipboardPersistence_ = _import "gdk_display_supports_clipboard_persistence" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsComposite_ = _import "gdk_display_supports_composite" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsCursorAlpha_ = _import "gdk_display_supports_cursor_alpha" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsCursorColor_ = _import "gdk_display_supports_cursor_color" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsInputShapes_ = _import "gdk_display_supports_input_shapes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsSelectionNotification_ = _import "gdk_display_supports_selection_notification" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsShapes_ = _import "gdk_display_supports_shapes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val sync_ = _import "gdk_display_sync" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class_t = 'a GdkDisplayClass.t
    type 'a deviceclass_t = 'a GdkDeviceClass.t
    type 'a applaunchcontextclass_t = 'a GdkAppLaunchContextClass.t
    type 'a windowclass_t = 'a GdkWindowClass.t
    type 'a devicemanagerclass_t = 'a GdkDeviceManagerClass.t
    type 'a screenclass_t = 'a GdkScreenClass.t
    type 'a event_t = 'a GdkEvent.t
    type atomrecord_t = GdkAtomRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getDefault () = (I ---> GdkDisplayClass.C.fromPtr false) getDefault_ ()
    fun open' displayName = (FFI.String.C.withConstPtr ---> GdkDisplayClass.C.fromPtr false) open_ displayName
    fun openDefaultLibgtkOnly () = (I ---> GdkDisplayClass.C.fromPtr false) openDefaultLibgtkOnly_ ()
    fun beep self = (GObjectObjectClass.C.withPtr ---> I) beep_ self
    fun close self = (GObjectObjectClass.C.withPtr ---> I) close_ self
    fun deviceIsGrabbed self device = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) deviceIsGrabbed_ (self & device)
    fun flush self = (GObjectObjectClass.C.withPtr ---> I) flush_ self
    fun getAppLaunchContext self = (GObjectObjectClass.C.withPtr ---> GdkAppLaunchContextClass.C.fromPtr true) getAppLaunchContext_ self
    fun getDefaultCursorSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt32.C.fromVal) getDefaultCursorSize_ self
    fun getDefaultGroup self = (GObjectObjectClass.C.withPtr ---> GdkWindowClass.C.fromPtr false) getDefaultGroup_ self
    fun getDefaultScreen self = (GObjectObjectClass.C.withPtr ---> GdkScreenClass.C.fromPtr false) getDefaultScreen_ self
    fun getDeviceManager self = (GObjectObjectClass.C.withPtr ---> GdkDeviceManagerClass.C.fromPtr false) getDeviceManager_ self
    fun getEvent self = (GObjectObjectClass.C.withPtr ---> GdkEvent.C.fromPtr true) getEvent_ self
    fun getMaximalCursorSize self =
      let
        val width
         & height
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.UInt32.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && FFI.UInt32.C.fromVal
                   && I
          )
            getMaximalCursorSize_
            (
              self
               & 0
               & 0
            )
      in
        (width, height)
      end
    fun getNScreens self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNScreens_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getScreen self screenNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GdkScreenClass.C.fromPtr false) getScreen_ (self & screenNum)
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun notifyStartupComplete self startupId = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) notifyStartupComplete_ (self & startupId)
    fun peekEvent self = (GObjectObjectClass.C.withPtr ---> GdkEvent.C.fromPtr true) peekEvent_ self
    fun putEvent self event = (GObjectObjectClass.C.withPtr &&&> GdkEvent.C.withPtr ---> I) putEvent_ (self & event)
    fun requestSelectionNotification self selection = (GObjectObjectClass.C.withPtr &&&> GdkAtomRecord.C.withPtr ---> FFI.Bool.C.fromVal) requestSelectionNotification_ (self & selection)
    fun setDoubleClickDistance self distance = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setDoubleClickDistance_ (self & distance)
    fun setDoubleClickTime self msec = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) setDoubleClickTime_ (self & msec)
    fun supportsClipboardPersistence self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsClipboardPersistence_ self
    fun supportsComposite self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsComposite_ self
    fun supportsCursorAlpha self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsCursorAlpha_ self
    fun supportsCursorColor self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsCursorColor_ self
    fun supportsInputShapes self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsInputShapes_ self
    fun supportsSelectionNotification self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsSelectionNotification_ self
    fun supportsShapes self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsShapes_ self
    fun sync self = (GObjectObjectClass.C.withPtr ---> I) sync_ self
    local
      open ClosureMarshal Signal
    in
      fun closedSig f = signal "closed" (get 0w1 boolean ---> ret_void) f
      fun openedSig f = signal "opened" (void ---> ret_void) f
    end
  end
