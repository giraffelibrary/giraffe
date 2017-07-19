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
    where type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type input_mode_t = GdkInputMode.t
    where type input_source_t = GdkInputSource.t
    where type device_type_t = GdkDeviceType.t =
  struct
    val getType_ = _import "gdk_device_get_type" : unit -> GObjectType.FFI.val_;
    val grabInfoLibgtkOnly_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_grab_info_libgtk_only" :
              GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p
               * GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * (unit, GdkWindowClass.FFI.notnull) GdkWindowClass.FFI.r
               * GBool.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAssociatedDevice_ = _import "gdk_device_get_associated_device" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p;
    val getAxisUse_ = fn x1 & x2 => (_import "gdk_device_get_axis_use" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p * GUInt32.FFI.val_ -> GdkAxisUse.FFI.val_;) (x1, x2)
    val getDeviceType_ = _import "gdk_device_get_device_type" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkDeviceType.FFI.val_;
    val getDisplay_ = _import "gdk_device_get_display" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getHasCursor_ = _import "gdk_device_get_has_cursor" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GBool.FFI.val_;
    val getKey_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_key" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.ref_
               * GdkModifierType.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMode_ = _import "gdk_device_get_mode" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkInputMode.FFI.val_;
    val getNAxes_ = _import "gdk_device_get_n_axes" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GInt32.FFI.val_;
    val getNKeys_ = _import "gdk_device_get_n_keys" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GInt32.FFI.val_;
    val getName_ = _import "gdk_device_get_name" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_position" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * (unit, GdkScreenClass.FFI.notnull) GdkScreenClass.FFI.r
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSource_ = _import "gdk_device_get_source" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p -> GdkInputSource.FFI.val_;
    val getWindowAtPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_device_get_window_at_position" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val grab_ =
      fn
        x1
         & x2
         & x3
         & x4
         & x5
         & x6
         & x7 =>
          (
            _import "gdk_device_grab" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GdkWindowClass.FFI.notnull GdkWindowClass.FFI.p
               * GdkGrabOwnership.FFI.val_
               * GBool.FFI.val_
               * GdkEventMask.FFI.val_
               * unit GdkCursorClass.FFI.p
               * GUInt32.FFI.val_
               -> GdkGrabStatus.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val setAxisUse_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_device_set_axis_use" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GUInt32.FFI.val_
               * GdkAxisUse.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setKey_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_set_key" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GdkModifierType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMode_ = fn x1 & x2 => (_import "gdk_device_set_mode" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p * GdkInputMode.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val ungrab_ = fn x1 & x2 => (_import "gdk_device_ungrab" : GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val warp_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_warp" :
              GdkDeviceClass.FFI.notnull GdkDeviceClass.FFI.p
               * GdkScreenClass.FFI.notnull GdkScreenClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GdkDeviceClass.class
    type grab_status_t = GdkGrabStatus.t
    type 'a cursor_class = 'a GdkCursorClass.class
    type event_mask_t = GdkEventMask.t
    type grab_ownership_t = GdkGrabOwnership.t
    type 'a window_class = 'a GdkWindowClass.class
    type axis_use_t = GdkAxisUse.t
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class = 'a GdkScreenClass.class
    type 'a device_manager_class = 'a GdkDeviceManagerClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type input_mode_t = GdkInputMode.t
    type input_source_t = GdkInputSource.t
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
    fun getAxisUse self index = (GdkDeviceClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> GdkAxisUse.FFI.fromVal) getAxisUse_ (self & index)
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
             &&&> GUInt32.FFI.withVal
             &&&> GUInt32.FFI.withRefVal
             &&&> GdkModifierType.FFI.withRefVal
             ---> GUInt32.FFI.fromVal
                   && GdkModifierType.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getKey_
            (
              self
               & index
               & GUInt32.null
               & GdkModifierType.flags []
            )
      in
        if retVal then SOME (keyval, modifiers) else NONE
      end
    fun getMode self = (GdkDeviceClass.FFI.withPtr ---> GdkInputMode.FFI.fromVal) getMode_ self
    fun getNAxes self = (GdkDeviceClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNAxes_ self
    fun getNKeys self = (GdkDeviceClass.FFI.withPtr ---> GInt32.FFI.fromVal) getNKeys_ self
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
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GdkScreenClass.FFI.fromPtr false
                   && GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getPosition_
            (
              self
               & NONE
               & GInt32.null
               & GInt32.null
            )
      in
        (
          screen,
          x,
          y
        )
      end
    fun getSource self = (GdkDeviceClass.FFI.withPtr ---> GdkInputSource.FFI.fromVal) getSource_ self
    fun getWindowAtPosition self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.FFI.withPtr
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GdkWindowClass.FFI.fromPtr false
          )
            getWindowAtPosition_
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
         &&&> GUInt32.FFI.withVal
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
         &&&> GUInt32.FFI.withVal
         &&&> GUInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    end
    local
      open Property
    in
      val associatedDeviceProp = {get = fn x => get "associated-device" GdkDeviceClass.tOpt x}
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
      val typeProp =
        {
          get = fn x => get "type" GdkDeviceType.t x,
          set = fn x => set "type" GdkDeviceType.t x
        }
    end
  end
