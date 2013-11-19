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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getDefault_ = call (load_sym libgdk "gdk_display_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val open_ = call (load_sym libgdk "gdk_display_open") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val openDefaultLibgtkOnly_ = call (load_sym libgdk "gdk_display_open_default_libgtk_only") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val beep_ = call (load_sym libgdk "gdk_display_beep") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val close_ = call (load_sym libgdk "gdk_display_close") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deviceIsGrabbed_ = call (load_sym libgdk "gdk_display_device_is_grabbed") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val flush_ = call (load_sym libgdk "gdk_display_flush") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAppLaunchContext_ = call (load_sym libgdk "gdk_display_get_app_launch_context") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDefaultCursorSize_ = call (load_sym libgdk "gdk_display_get_default_cursor_size") (GObjectObjectClass.PolyML.PTR --> FFI.UInt32.PolyML.VAL)
      val getDefaultGroup_ = call (load_sym libgdk "gdk_display_get_default_group") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDefaultScreen_ = call (load_sym libgdk "gdk_display_get_default_screen") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDeviceManager_ = call (load_sym libgdk "gdk_display_get_device_manager") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getEvent_ = call (load_sym libgdk "gdk_display_get_event") (GObjectObjectClass.PolyML.PTR --> GdkEvent.PolyML.PTR)
      val getMaximalCursorSize_ =
        call (load_sym libgdk "gdk_display_get_maximal_cursor_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.UInt32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getNScreens_ = call (load_sym libgdk "gdk_display_get_n_screens") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getName_ = call (load_sym libgdk "gdk_display_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getScreen_ = call (load_sym libgdk "gdk_display_get_screen") (GObjectObjectClass.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val hasPending_ = call (load_sym libgdk "gdk_display_has_pending") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val isClosed_ = call (load_sym libgdk "gdk_display_is_closed") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val notifyStartupComplete_ = call (load_sym libgdk "gdk_display_notify_startup_complete") (GObjectObjectClass.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val peekEvent_ = call (load_sym libgdk "gdk_display_peek_event") (GObjectObjectClass.PolyML.PTR --> GdkEvent.PolyML.PTR)
      val putEvent_ = call (load_sym libgdk "gdk_display_put_event") (GObjectObjectClass.PolyML.PTR &&> GdkEvent.PolyML.PTR --> FFI.PolyML.VOID)
      val requestSelectionNotification_ = call (load_sym libgdk "gdk_display_request_selection_notification") (GObjectObjectClass.PolyML.PTR &&> GdkAtomRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val setDoubleClickDistance_ = call (load_sym libgdk "gdk_display_set_double_click_distance") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val setDoubleClickTime_ = call (load_sym libgdk "gdk_display_set_double_click_time") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val supportsClipboardPersistence_ = call (load_sym libgdk "gdk_display_supports_clipboard_persistence") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsComposite_ = call (load_sym libgdk "gdk_display_supports_composite") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsCursorAlpha_ = call (load_sym libgdk "gdk_display_supports_cursor_alpha") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsCursorColor_ = call (load_sym libgdk "gdk_display_supports_cursor_color") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsInputShapes_ = call (load_sym libgdk "gdk_display_supports_input_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsSelectionNotification_ = call (load_sym libgdk "gdk_display_supports_selection_notification") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsShapes_ = call (load_sym libgdk "gdk_display_supports_shapes") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val sync_ = call (load_sym libgdk "gdk_display_sync") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
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
               & FFI.UInt32.null
               & FFI.UInt32.null
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
