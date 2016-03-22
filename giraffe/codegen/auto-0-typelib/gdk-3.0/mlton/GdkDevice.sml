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
    val getType_ = _import "gdk_device_get_type" : unit -> GObjectType.C.val_;
    val grabInfoLibgtkOnly_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_grab_info_libgtk_only" :
              GdkDisplayClass.C.notnull GdkDisplayClass.C.p
               * GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * (unit, GdkWindowClass.C.notnull) GdkWindowClass.C.r
               * FFI.Bool.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAssociatedDevice_ = _import "gdk_device_get_associated_device" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkDeviceClass.C.notnull GdkDeviceClass.C.p;
    val getAxisUse_ = fn x1 & x2 => (_import "gdk_device_get_axis_use" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p * FFI.UInt32.C.val_ -> GdkAxisUse.C.val_;) (x1, x2)
    val getDeviceType_ = _import "gdk_device_get_device_type" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkDeviceType.C.val_;
    val getDisplay_ = _import "gdk_device_get_display" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
    val getHasCursor_ = _import "gdk_device_get_has_cursor" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Bool.C.val_;
    val getKey_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_key" :
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.ref_
               * GdkModifierType.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getMode_ = _import "gdk_device_get_mode" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkInputMode.C.val_;
    val getNAxes_ = _import "gdk_device_get_n_axes" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Int32.C.val_;
    val getNKeys_ = _import "gdk_device_get_n_keys" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> FFI.Int32.C.val_;
    val getName_ = _import "gdk_device_get_name" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_position" :
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * (unit, GdkScreenClass.C.notnull) GdkScreenClass.C.r
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getSource_ = _import "gdk_device_get_source" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p -> GdkInputSource.C.val_;
    val getWindowAtPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_device_get_window_at_position" :
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> GdkWindowClass.C.notnull GdkWindowClass.C.p;
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
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkWindowClass.C.notnull GdkWindowClass.C.p
               * GdkGrabOwnership.C.val_
               * FFI.Bool.C.val_
               * GdkEventMask.C.val_
               * unit GdkCursorClass.C.p
               * FFI.UInt32.C.val_
               -> GdkGrabStatus.C.val_;
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
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.UInt32.C.val_
               * GdkAxisUse.C.val_
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
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * FFI.UInt32.C.val_
               * FFI.UInt32.C.val_
               * GdkModifierType.C.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setMode_ = fn x1 & x2 => (_import "gdk_device_set_mode" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p * GdkInputMode.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val ungrab_ = fn x1 & x2 => (_import "gdk_device_ungrab" : GdkDeviceClass.C.notnull GdkDeviceClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val warp_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_warp" :
              GdkDeviceClass.C.notnull GdkDeviceClass.C.p
               * GdkScreenClass.C.notnull GdkScreenClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun grabInfoLibgtkOnly display device =
      let
        val grabWindow
         & ownerEvents
         & retVal =
          (
            GdkDisplayClass.C.withPtr
             &&&> GdkDeviceClass.C.withPtr
             &&&> GdkWindowClass.C.withRefOptPtr
             &&&> FFI.Bool.C.withRefVal
             ---> GdkWindowClass.C.fromPtr false
                   && FFI.Bool.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            grabInfoLibgtkOnly_
            (
              display
               & device
               & NONE
               & FFI.Bool.null
            )
      in
        if retVal then SOME (grabWindow, ownerEvents) else NONE
      end
    fun getAssociatedDevice self = (GdkDeviceClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getAssociatedDevice_ self
    fun getAxisUse self index = (GdkDeviceClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GdkAxisUse.C.fromVal) getAxisUse_ (self & index)
    fun getDeviceType self = (GdkDeviceClass.C.withPtr ---> GdkDeviceType.C.fromVal) getDeviceType_ self
    fun getDisplay self = (GdkDeviceClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getHasCursor self = (GdkDeviceClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasCursor_ self
    fun getKey self index =
      let
        val keyval
         & modifiers
         & retVal =
          (
            GdkDeviceClass.C.withPtr
             &&&> FFI.UInt32.C.withVal
             &&&> FFI.UInt32.C.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.UInt32.C.fromVal
                   && GdkModifierType.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getKey_
            (
              self
               & index
               & FFI.UInt32.null
               & GdkModifierType.flags []
            )
      in
        if retVal then SOME (keyval, modifiers) else NONE
      end
    fun getMode self = (GdkDeviceClass.C.withPtr ---> GdkInputMode.C.fromVal) getMode_ self
    fun getNAxes self = (GdkDeviceClass.C.withPtr ---> FFI.Int32.C.fromVal) getNAxes_ self
    fun getNKeys self = (GdkDeviceClass.C.withPtr ---> FFI.Int32.C.fromVal) getNKeys_ self
    fun getName self = (GdkDeviceClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun getPosition self =
      let
        val screen
         & x
         & y
         & () =
          (
            GdkDeviceClass.C.withPtr
             &&&> GdkScreenClass.C.withRefOptPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> GdkScreenClass.C.fromPtr false
                   && FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && I
          )
            getPosition_
            (
              self
               & NONE
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          screen,
          x,
          y
        )
      end
    fun getSource self = (GdkDeviceClass.C.withPtr ---> GdkInputSource.C.fromVal) getSource_ self
    fun getWindowAtPosition self =
      let
        val winX
         & winY
         & retVal =
          (
            GdkDeviceClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && GdkWindowClass.C.fromPtr false
          )
            getWindowAtPosition_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        (
          retVal,
          winX,
          winY
        )
      end
    fun grab self window grabOwnership ownerEvents eventMask cursor time =
      (
        GdkDeviceClass.C.withPtr
         &&&> GdkWindowClass.C.withPtr
         &&&> GdkGrabOwnership.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GdkEventMask.C.withVal
         &&&> GdkCursorClass.C.withOptPtr
         &&&> FFI.UInt32.C.withVal
         ---> GdkGrabStatus.C.fromVal
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
    fun setAxisUse self index use =
      (
        GdkDeviceClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> GdkAxisUse.C.withVal
         ---> I
      )
        setAxisUse_
        (
          self
           & index
           & use
        )
    fun setKey self index keyval modifiers =
      (
        GdkDeviceClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.UInt32.C.withVal
         &&&> GdkModifierType.C.withVal
         ---> I
      )
        setKey_
        (
          self
           & index
           & keyval
           & modifiers
        )
    fun setMode self mode = (GdkDeviceClass.C.withPtr &&&> GdkInputMode.C.withVal ---> FFI.Bool.C.fromVal) setMode_ (self & mode)
    fun ungrab self time = (GdkDeviceClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) ungrab_ (self & time)
    fun warp self screen x y =
      (
        GdkDeviceClass.C.withPtr
         &&&> GdkScreenClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
