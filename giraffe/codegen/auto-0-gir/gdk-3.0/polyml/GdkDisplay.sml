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
    where type 'a screen_class = 'a GdkScreenClass.class =
  struct
    structure GdkAtomRecordCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GdkAtomRecord.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GdkAtomRecordCVectorN = CVectorN(GdkAtomRecordCVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_display_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefault_ = call (getSymbol "gdk_display_get_default") (cVoid --> GdkDisplayClass.PolyML.cPtr)
      val open_ = call (getSymbol "gdk_display_open") (Utf8.PolyML.cInPtr --> GdkDisplayClass.PolyML.cPtr)
      val openDefaultLibgtkOnly_ = call (getSymbol "gdk_display_open_default_libgtk_only") (cVoid --> GdkDisplayClass.PolyML.cPtr)
      val beep_ = call (getSymbol "gdk_display_beep") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val close_ = call (getSymbol "gdk_display_close") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val deviceIsGrabbed_ = call (getSymbol "gdk_display_device_is_grabbed") (GdkDisplayClass.PolyML.cPtr &&> GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val flush_ = call (getSymbol "gdk_display_flush") (GdkDisplayClass.PolyML.cPtr --> cVoid)
      val getAppLaunchContext_ = call (getSymbol "gdk_display_get_app_launch_context") (GdkDisplayClass.PolyML.cPtr --> GdkAppLaunchContextClass.PolyML.cPtr)
      val getDefaultCursorSize_ = call (getSymbol "gdk_display_get_default_cursor_size") (GdkDisplayClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getDefaultGroup_ = call (getSymbol "gdk_display_get_default_group") (GdkDisplayClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getDefaultScreen_ = call (getSymbol "gdk_display_get_default_screen") (GdkDisplayClass.PolyML.cPtr --> GdkScreenClass.PolyML.cPtr)
      val getDeviceManager_ = call (getSymbol "gdk_display_get_device_manager") (GdkDisplayClass.PolyML.cPtr --> GdkDeviceManagerClass.PolyML.cPtr)
      val getEvent_ = call (getSymbol "gdk_display_get_event") (GdkDisplayClass.PolyML.cPtr --> GdkEvent.PolyML.cPtr)
      val getMaximalCursorSize_ =
        call (getSymbol "gdk_display_get_maximal_cursor_size")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GUInt.PolyML.cRef
             &&> GUInt.PolyML.cRef
             --> cVoid
          )
      val getNScreens_ = call (getSymbol "gdk_display_get_n_screens") (GdkDisplayClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getName_ = call (getSymbol "gdk_display_get_name") (GdkDisplayClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPointer_ =
        call (getSymbol "gdk_display_get_pointer")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> cVoid
          )
      val getScreen_ = call (getSymbol "gdk_display_get_screen") (GdkDisplayClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GdkScreenClass.PolyML.cPtr)
      val getWindowAtPointer_ =
        call (getSymbol "gdk_display_get_window_at_pointer")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GdkWindowClass.PolyML.cPtr
          )
      val hasPending_ = call (getSymbol "gdk_display_has_pending") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val isClosed_ = call (getSymbol "gdk_display_is_closed") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val keyboardUngrab_ = call (getSymbol "gdk_display_keyboard_ungrab") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val notifyStartupComplete_ = call (getSymbol "gdk_display_notify_startup_complete") (GdkDisplayClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val peekEvent_ = call (getSymbol "gdk_display_peek_event") (GdkDisplayClass.PolyML.cPtr --> GdkEvent.PolyML.cPtr)
      val pointerIsGrabbed_ = call (getSymbol "gdk_display_pointer_is_grabbed") (GdkDisplayClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val pointerUngrab_ = call (getSymbol "gdk_display_pointer_ungrab") (GdkDisplayClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val putEvent_ = call (getSymbol "gdk_display_put_event") (GdkDisplayClass.PolyML.cPtr &&> GdkEvent.PolyML.cPtr --> cVoid)
      val requestSelectionNotification_ = call (getSymbol "gdk_display_request_selection_notification") (GdkDisplayClass.PolyML.cPtr &&> GdkAtomRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val setDoubleClickDistance_ = call (getSymbol "gdk_display_set_double_click_distance") (GdkDisplayClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setDoubleClickTime_ = call (getSymbol "gdk_display_set_double_click_time") (GdkDisplayClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val storeClipboard_ =
        call (getSymbol "gdk_display_store_clipboard")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GdkAtomRecordCVectorN.PolyML.cInPtr
             &&> GInt.PolyML.cVal
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
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
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
    type 'a window_class = 'a GdkWindowClass.class
    type 'a screen_class = 'a GdkScreenClass.class
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
        val nTargets = LargeInt.fromInt (GdkAtomRecordCVectorN.length targets)
        val () =
          (
            GdkDisplayClass.FFI.withPtr
             &&&> GdkWindowClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GdkAtomRecordCVectorN.FFI.withPtr
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
      fun openedSig f = signal "opened" (void ---> ret_void) f
    end
  end
