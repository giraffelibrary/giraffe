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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_display_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (load_sym libgdk "gdk_display_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val open_ = call (load_sym libgdk "gdk_display_open") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val openDefaultLibgtkOnly_ = call (load_sym libgdk "gdk_display_open_default_libgtk_only") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val beep_ = call (load_sym libgdk "gdk_display_beep") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val close_ = call (load_sym libgdk "gdk_display_close") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deviceIsGrabbed_ = call (load_sym libgdk "gdk_display_device_is_grabbed") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val flush_ = call (load_sym libgdk "gdk_display_flush") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAppLaunchContext_ = call (load_sym libgdk "gdk_display_get_app_launch_context") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultCursorSize_ = call (load_sym libgdk "gdk_display_get_default_cursor_size") (GObjectObjectClass.PolyML.cPtr --> FFI.UInt32.PolyML.cVal)
      val getDefaultGroup_ = call (load_sym libgdk "gdk_display_get_default_group") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultScreen_ = call (load_sym libgdk "gdk_display_get_default_screen") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getDeviceManager_ = call (load_sym libgdk "gdk_display_get_device_manager") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getEvent_ = call (load_sym libgdk "gdk_display_get_event") (GObjectObjectClass.PolyML.cPtr --> GdkEvent.PolyML.cPtr)
      val getMaximalCursorSize_ =
        call (load_sym libgdk "gdk_display_get_maximal_cursor_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.UInt32.PolyML.cRef
             &&> FFI.UInt32.PolyML.cRef
             --> FFI.PolyML.cVoid
          )
      val getNScreens_ = call (load_sym libgdk "gdk_display_get_n_screens") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getName_ = call (load_sym libgdk "gdk_display_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getScreen_ = call (load_sym libgdk "gdk_display_get_screen") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int32.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val hasPending_ = call (load_sym libgdk "gdk_display_has_pending") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val isClosed_ = call (load_sym libgdk "gdk_display_is_closed") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val notifyStartupComplete_ = call (load_sym libgdk "gdk_display_notify_startup_complete") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val peekEvent_ = call (load_sym libgdk "gdk_display_peek_event") (GObjectObjectClass.PolyML.cPtr --> GdkEvent.PolyML.cPtr)
      val putEvent_ = call (load_sym libgdk "gdk_display_put_event") (GObjectObjectClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> FFI.PolyML.cVoid)
      val requestSelectionNotification_ = call (load_sym libgdk "gdk_display_request_selection_notification") (GObjectObjectClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setDoubleClickDistance_ = call (load_sym libgdk "gdk_display_set_double_click_distance") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDoubleClickTime_ = call (load_sym libgdk "gdk_display_set_double_click_time") (GObjectObjectClass.PolyML.cPtr &&> FFI.UInt32.PolyML.cVal --> FFI.PolyML.cVoid)
      val supportsClipboardPersistence_ = call (load_sym libgdk "gdk_display_supports_clipboard_persistence") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsComposite_ = call (load_sym libgdk "gdk_display_supports_composite") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsCursorAlpha_ = call (load_sym libgdk "gdk_display_supports_cursor_alpha") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsCursorColor_ = call (load_sym libgdk "gdk_display_supports_cursor_color") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsInputShapes_ = call (load_sym libgdk "gdk_display_supports_input_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsSelectionNotification_ = call (load_sym libgdk "gdk_display_supports_selection_notification") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsShapes_ = call (load_sym libgdk "gdk_display_supports_shapes") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val sync_ = call (load_sym libgdk "gdk_display_sync") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
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
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getScreen self screenNum = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> GdkScreenClass.C.fromPtr false) getScreen_ (self & screenNum)
    fun hasPending self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) hasPending_ self
    fun isClosed self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) isClosed_ self
    fun notifyStartupComplete self startupId = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) notifyStartupComplete_ (self & startupId)
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
