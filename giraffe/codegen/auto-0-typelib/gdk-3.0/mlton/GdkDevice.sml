structure GdkDevice :>
  GDK_DEVICE
    where type 'a class_t = 'a GdkDeviceClass.t
    where type grabstatus_t = GdkGrabStatus.t
    where type 'a cursorclass_t = 'a GdkCursorClass.t
    where type eventmask_t = GdkEventMask.t
    where type grabownership_t = GdkGrabOwnership.t
    where type 'a windowclass_t = 'a GdkWindowClass.t
    where type axisuse_t = GdkAxisUse.t
    where type modifiertype_t = GdkModifierType.t
    where type 'a screenclass_t = 'a GdkScreenClass.t
    where type 'a devicemanagerclass_t = 'a GdkDeviceManagerClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t
    where type inputmode_t = GdkInputMode.t
    where type inputsource_t = GdkInputSource.t
    where type devicetype_t = GdkDeviceType.t =
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
               * FFI.Bool.C.ref_
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getAssociatedDevice_ = _import "gdk_device_get_associated_device" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getAxisUse_ = fn x1 & x2 => (_import "gdk_device_get_axis_use" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> GdkAxisUse.C.val_;) (x1, x2)
    val getDeviceType_ = _import "gdk_device_get_device_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkDeviceType.C.val_;
    val getDisplay_ = _import "gdk_device_get_display" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getHasCursor_ = _import "gdk_device_get_has_cursor" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getKey_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_key" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    val getMode_ = _import "gdk_device_get_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkInputMode.C.val_;
    val getNAxes_ = _import "gdk_device_get_n_axes" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getNKeys_ = _import "gdk_device_get_n_keys" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getName_ = _import "gdk_device_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getPosition_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_get_position" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * (unit, GObjectObjectClass.C.notnull) GObjectObjectClass.C.r
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
    val getSource_ = _import "gdk_device_get_source" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GdkInputSource.C.val_;
    val getWindowAtPosition_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_device_get_window_at_position" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GdkGrabOwnership.C.val_
               * FFI.Bool.C.val_
               * GdkEventMask.C.val_
               * unit GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    val setMode_ = fn x1 & x2 => (_import "gdk_device_set_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GdkInputMode.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val ungrab_ = fn x1 & x2 => (_import "gdk_device_ungrab" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.UInt32.C.val_ -> unit;) (x1, x2)
    val warp_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gdk_device_warp" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
    type 'a class_t = 'a GdkDeviceClass.t
    type grabstatus_t = GdkGrabStatus.t
    type 'a cursorclass_t = 'a GdkCursorClass.t
    type eventmask_t = GdkEventMask.t
    type grabownership_t = GdkGrabOwnership.t
    type 'a windowclass_t = 'a GdkWindowClass.t
    type axisuse_t = GdkAxisUse.t
    type modifiertype_t = GdkModifierType.t
    type 'a screenclass_t = 'a GdkScreenClass.t
    type 'a devicemanagerclass_t = 'a GdkDeviceManagerClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type inputmode_t = GdkInputMode.t
    type inputsource_t = GdkInputSource.t
    type devicetype_t = GdkDeviceType.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun grabInfoLibgtkOnly display device =
      let
        val grabWindow
         & ownerEvents
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
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
    fun getAssociatedDevice self = (GObjectObjectClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getAssociatedDevice_ self
    fun getAxisUse self index = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> GdkAxisUse.C.fromVal) getAxisUse_ (self & index)
    fun getDeviceType self = (GObjectObjectClass.C.withPtr ---> GdkDeviceType.C.fromVal) getDeviceType_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getHasCursor self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getHasCursor_ self
    fun getKey self index =
      let
        val keyval
         & modifiers
         & retVal =
          (
            GObjectObjectClass.C.withPtr
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
    fun getMode self = (GObjectObjectClass.C.withPtr ---> GdkInputMode.C.fromVal) getMode_ self
    fun getNAxes self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNAxes_ self
    fun getNKeys self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getNKeys_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun getPosition self =
      let
        val screen
         & x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
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
    fun getSource self = (GObjectObjectClass.C.withPtr ---> GdkInputSource.C.fromVal) getSource_ self
    fun getWindowAtPosition self =
      let
        val winX
         & winY
         & retVal =
          (
            GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> GdkGrabOwnership.C.withVal
         &&&> FFI.Bool.C.withVal
         &&&> GdkEventMask.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
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
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
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
    fun setMode self mode = (GObjectObjectClass.C.withPtr &&&> GdkInputMode.C.withVal ---> FFI.Bool.C.fromVal) setMode_ (self & mode)
    fun ungrab self time = (GObjectObjectClass.C.withPtr &&&> FFI.UInt32.C.withVal ---> I) ungrab_ (self & time)
    fun warp self screen x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
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
