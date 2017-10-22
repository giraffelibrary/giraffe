structure GdkDevice :>
  GDK_DEVICE
    where type 'a class = 'a GdkDeviceClass.class
    where type grab_status_t = GdkGrabStatus.t
    where type 'a cursor_class = 'a GdkCursorClass.class
    where type event_mask_t = GdkEventMask.t
    where type grab_ownership_t = GdkGrabOwnership.t
    where type 'a window_class = 'a GdkWindowClass.class
    where type axis_use_t = GdkAxisUse.t
    where type modifier_type_t = GdkModifierType.t
    where type 'a screen_class = 'a GdkScreenClass.class
    where type axis_flags_t = GdkAxisFlags.t
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type input_mode_t = GdkInputMode.t
    where type input_source_t = GdkInputSource.t
    where type 'a seat_class = 'a GdkSeatClass.class
    where type 'a device_tool_class = 'a GdkDeviceToolClass.class
    where type device_type_t = GdkDeviceType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val grabInfoLibgtkOnly_ =
        call (getSymbol "gdk_device_grab_info_libgtk_only")
          (
            GdkDisplayClass.PolyML.cPtr
             &&> GdkDeviceClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cOutRef
             &&> GBool.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getAssociatedDevice_ = call (getSymbol "gdk_device_get_associated_device") (GdkDeviceClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cPtr)
      val getAxes_ = call (getSymbol "gdk_device_get_axes") (GdkDeviceClass.PolyML.cPtr --> GdkAxisFlags.PolyML.cVal)
      val getAxisUse_ = call (getSymbol "gdk_device_get_axis_use") (GdkDeviceClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> GdkAxisUse.PolyML.cVal)
      val getDeviceType_ = call (getSymbol "gdk_device_get_device_type") (GdkDeviceClass.PolyML.cPtr --> GdkDeviceType.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_device_get_display") (GdkDeviceClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getHasCursor_ = call (getSymbol "gdk_device_get_has_cursor") (GdkDeviceClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getKey_ =
        call (getSymbol "gdk_device_get_key")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cRef
             &&> GdkModifierType.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getLastEventWindow_ = call (getSymbol "gdk_device_get_last_event_window") (GdkDeviceClass.PolyML.cPtr --> GdkWindowClass.PolyML.cPtr)
      val getMode_ = call (getSymbol "gdk_device_get_mode") (GdkDeviceClass.PolyML.cPtr --> GdkInputMode.PolyML.cVal)
      val getNAxes_ = call (getSymbol "gdk_device_get_n_axes") (GdkDeviceClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getNKeys_ = call (getSymbol "gdk_device_get_n_keys") (GdkDeviceClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getName_ = call (getSymbol "gdk_device_get_name") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getPosition_ =
        call (getSymbol "gdk_device_get_position")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getPositionDouble_ =
        call (getSymbol "gdk_device_get_position_double")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cOutRef
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> cVoid
          )
      val getProductId_ = call (getSymbol "gdk_device_get_product_id") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getSeat_ = call (getSymbol "gdk_device_get_seat") (GdkDeviceClass.PolyML.cPtr --> GdkSeatClass.PolyML.cPtr)
      val getSource_ = call (getSymbol "gdk_device_get_source") (GdkDeviceClass.PolyML.cPtr --> GdkInputSource.PolyML.cVal)
      val getVendorId_ = call (getSymbol "gdk_device_get_vendor_id") (GdkDeviceClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getWindowAtPosition_ =
        call (getSymbol "gdk_device_get_window_at_position")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> GdkWindowClass.PolyML.cPtr
          )
      val getWindowAtPositionDouble_ =
        call (getSymbol "gdk_device_get_window_at_position_double")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GDouble.PolyML.cRef
             &&> GDouble.PolyML.cRef
             --> GdkWindowClass.PolyML.cPtr
          )
      val grab_ =
        call (getSymbol "gdk_device_grab")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkWindowClass.PolyML.cPtr
             &&> GdkGrabOwnership.PolyML.cVal
             &&> GBool.PolyML.cVal
             &&> GdkEventMask.PolyML.cVal
             &&> GdkCursorClass.PolyML.cOptPtr
             &&> GUInt32.PolyML.cVal
             --> GdkGrabStatus.PolyML.cVal
          )
      val setAxisUse_ =
        call (getSymbol "gdk_device_set_axis_use")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GdkAxisUse.PolyML.cVal
             --> cVoid
          )
      val setKey_ =
        call (getSymbol "gdk_device_set_key")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GdkModifierType.PolyML.cVal
             --> cVoid
          )
      val setMode_ = call (getSymbol "gdk_device_set_mode") (GdkDeviceClass.PolyML.cPtr &&> GdkInputMode.PolyML.cVal --> GBool.PolyML.cVal)
      val ungrab_ = call (getSymbol "gdk_device_ungrab") (GdkDeviceClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val warp_ =
        call (getSymbol "gdk_device_warp")
          (
            GdkDeviceClass.PolyML.cPtr
             &&> GdkScreenClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GdkDeviceClass.class
    type grab_status_t = GdkGrabStatus.t
    type 'a cursor_class = 'a GdkCursorClass.class
    type event_mask_t = GdkEventMask.t
    type grab_ownership_t = GdkGrabOwnership.t
    type 'a window_class = 'a GdkWindowClass.class
    type axis_use_t = GdkAxisUse.t
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class = 'a GdkScreenClass.class
    type axis_flags_t = GdkAxisFlags.t
    type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type input_mode_t = GdkInputMode.t
    type input_source_t = GdkInputSource.t
    type 'a seat_class = 'a GdkSeatClass.class
    type 'a device_tool_class = 'a GdkDeviceToolClass.class
    type device_type_t = GdkDeviceType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun grabInfoLibgtkOnly (display, device) =
      let
        val grabWindow
         & ownerEvents
         & retVal =
          (
            GdkDisplayClass.FFI.withPtr
             &&&> GdkDeviceClass.FFI.withPtr
             &&&> GdkWindowClass.FFI.withRefOptPtr
             &&&> GBool.FFI.withRefVal
             ---> GdkWindowClass.FFI.fromPtr false
                   && GBool.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            grabInfoLibgtkOnly_
            (
              display
               & device
               & NONE
               & GBool.null
            )
      in
        if retVal then SOME (grabWindow, ownerEvents) else NONE
      end
    fun getAssociatedDevice self = (GdkDeviceClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromPtr false) getAssociatedDevice_ self
    fun getAxes self = (GdkDeviceClass.FFI.withPtr ---> GdkAxisFlags.FFI.fromVal) getAxes_ self
    fun getAxisUse self index = (GdkDeviceClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> GdkAxisUse.FFI.fromVal) getAxisUse_ (self & index)
    fun getDeviceType self = (GdkDeviceClass.FFI.withPtr ---> GdkDeviceType.FFI.fromVal) getDeviceType_ self
    fun getDisplay self = (GdkDeviceClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getHasCursor self = (GdkDeviceClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasCursor_ self
    fun getKey self index =
      let
        val keyval
         & modifiers
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GUInt.FFI.withVal
             &&&> GUInt.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getKey_
            (
              self
               & index
               & GUInt.null
               & GdkModifierType.flags []
            )
      in
        if retVal then SOME (keyval, modifiers) else NONE
      end
    fun getLastEventWindow self = (GdkDeviceClass.FFI.withPtr ---> GdkWindowClass.FFI.fromPtr false) getLastEventWindow_ self
    fun getMode self = (GdkDeviceClass.FFI.withPtr ---> GdkInputMode.FFI.fromVal) getMode_ self
    fun getNAxes self = (GdkDeviceClass.FFI.withPtr ---> GInt.FFI.fromVal) getNAxes_ self
    fun getNKeys self = (GdkDeviceClass.FFI.withPtr ---> GInt.FFI.fromVal) getNKeys_ self
    fun getName self = (GdkDeviceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun getPosition self =
      let
        val screen
         & x
         & y
         & () =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GdkScreenClass.FFI.withRefOptPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & NONE
               & GInt.null
               & GInt.null
            )
      in
        (
          screen,
          x,
          y
        )
      end
    fun getPositionDouble self =
      let
        val screen
         & x
         & y
         & () =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GdkScreenClass.FFI.withRefOptPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && I
          )
            getPositionDouble_
            (
              self
               & NONE
               & GDouble.null
               & GDouble.null
            )
      in
        (
          screen,
          x,
          y
        )
      end
    fun getProductId self = (GdkDeviceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getProductId_ self
    fun getSeat self = (GdkDeviceClass.FFI.withPtr ---> GdkSeatClass.FFI.fromPtr false) getSeat_ self
    fun getSource self = (GdkDeviceClass.FFI.withPtr ---> GdkInputSource.FFI.fromVal) getSource_ self
    fun getVendorId self = (GdkDeviceClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getVendorId_ self
    fun getWindowAtPosition self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            getWindowAtPosition_
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
    fun getWindowAtPositionDouble self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GDouble.FFI.withRefVal
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal
                   && GDouble.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            getWindowAtPositionDouble_
            (
              self
               & GDouble.null
               & GDouble.null
            )
      in
        (
          retVal,
          winX,
          winY
        )
      end
    fun grab
      self
      (
        window,
        grabOwnership,
        ownerEvents,
        eventMask,
        cursor,
        time
      ) =
      (
        GdkDeviceClass.FFI.withPtr
         &&&> GdkWindowClass.FFI.withPtr
         &&&> GdkGrabOwnership.FFI.withVal
         &&&> GBool.FFI.withVal
         &&&> GdkEventMask.FFI.withVal
         &&&> GdkCursorClass.FFI.withOptPtr
         &&&> GUInt32.FFI.withVal
         ---> GdkGrabStatus.FFI.fromVal
      )
        grab_
        (
          self
           & window
           & grabOwnership
           & ownerEvents
           & eventMask
           & cursor
           & time
        )
    fun setAxisUse self (index, use) =
      (
        GdkDeviceClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GdkAxisUse.FFI.withVal
         ---> I
      )
        setAxisUse_
        (
          self
           & index
           & use
        )
    fun setKey
      self
      (
        index,
        keyval,
        modifiers
      ) =
      (
        GdkDeviceClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GdkModifierType.FFI.withVal
         ---> I
      )
        setKey_
        (
          self
           & index
           & keyval
           & modifiers
        )
    fun setMode self mode = (GdkDeviceClass.FFI.withPtr &&&> GdkInputMode.FFI.withVal ---> GBool.FFI.fromVal) setMode_ (self & mode)
    fun ungrab self time = (GdkDeviceClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) ungrab_ (self & time)
    fun warp
      self
      (
        screen,
        x,
        y
      ) =
      (
        GdkDeviceClass.FFI.withPtr
         &&&> GdkScreenClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        warp_
        (
          self
           & screen
           & x
           & y
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
      fun toolChangedSig f = signal "tool-changed" (get 0w1 GdkDeviceToolClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val associatedDeviceProp = {get = fn x => get "associated-device" GdkDeviceClass.tOpt x}
      val axesProp = {get = fn x => get "axes" GdkAxisFlags.t x}
      val deviceManagerProp =
        {
          get = fn x => get "device-manager" GdkDeviceManagerClass.tOpt x,
          set = fn x => set "device-manager" GdkDeviceManagerClass.tOpt x
        }
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          set = fn x => set "display" GdkDisplayClass.tOpt x
        }
      val hasCursorProp =
        {
          get = fn x => get "has-cursor" boolean x,
          set = fn x => set "has-cursor" boolean x
        }
      val inputModeProp =
        {
          get = fn x => get "input-mode" GdkInputMode.t x,
          set = fn x => set "input-mode" GdkInputMode.t x
        }
      val inputSourceProp =
        {
          get = fn x => get "input-source" GdkInputSource.t x,
          set = fn x => set "input-source" GdkInputSource.t x
        }
      val nAxesProp = {get = fn x => get "n-axes" uint x}
      val nameProp =
        {
          get = fn x => get "name" stringOpt x,
          set = fn x => set "name" stringOpt x
        }
      val numTouchesProp =
        {
          get = fn x => get "num-touches" uint x,
          set = fn x => set "num-touches" uint x
        }
      val productIdProp =
        {
          get = fn x => get "product-id" stringOpt x,
          set = fn x => set "product-id" stringOpt x
        }
      val seatProp =
        {
          get = fn x => get "seat" GdkSeatClass.tOpt x,
          set = fn x => set "seat" GdkSeatClass.tOpt x
        }
      val toolProp = {get = fn x => get "tool" GdkDeviceToolClass.tOpt x}
      val typeProp =
        {
          get = fn x => get "type" GdkDeviceType.t x,
          set = fn x => set "type" GdkDeviceType.t x
        }
      val vendorIdProp =
        {
          get = fn x => get "vendor-id" stringOpt x,
          set = fn x => set "vendor-id" stringOpt x
        }
    end
  end
