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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_device_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val grabInfoLibgtkOnly_ =
        call (load_sym libgdk "gdk_device_grab_info_libgtk_only")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.PolyML.Bool.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getAssociatedDevice_ = call (load_sym libgdk "gdk_device_get_associated_device") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAxisUse_ = call (load_sym libgdk "gdk_device_get_axis_use") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> GdkAxisUse.PolyML.VAL)
      val getDeviceType_ = call (load_sym libgdk "gdk_device_get_device_type") (GObjectObjectClass.PolyML.PTR --> GdkDeviceType.PolyML.VAL)
      val getDisplay_ = call (load_sym libgdk "gdk_device_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHasCursor_ = call (load_sym libgdk "gdk_device_get_has_cursor") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getKey_ =
        call (load_sym libgdk "gdk_device_get_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Word32.REF
             &&> GdkModifierType.PolyML.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getMode_ = call (load_sym libgdk "gdk_device_get_mode") (GObjectObjectClass.PolyML.PTR --> GdkInputMode.PolyML.VAL)
      val getNAxes_ = call (load_sym libgdk "gdk_device_get_n_axes") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getNKeys_ = call (load_sym libgdk "gdk_device_get_n_keys") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getName_ = call (load_sym libgdk "gdk_device_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getPosition_ =
        call (load_sym libgdk "gdk_device_get_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> FFI.PolyML.VOID
          )
      val getSource_ = call (load_sym libgdk "gdk_device_get_source") (GObjectObjectClass.PolyML.PTR --> GdkInputSource.PolyML.VAL)
      val getWindowAtPosition_ =
        call (load_sym libgdk "gdk_device_get_window_at_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.REF
             &&> FFI.PolyML.Int32.REF
             --> GObjectObjectClass.PolyML.PTR
          )
      val grab_ =
        call (load_sym libgdk "gdk_device_grab")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkGrabOwnership.PolyML.VAL
             &&> FFI.PolyML.Bool.VAL
             &&> GdkEventMask.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.PolyML.Word32.VAL
             --> GdkGrabStatus.PolyML.VAL
          )
      val setAxisUse_ =
        call (load_sym libgdk "gdk_device_set_axis_use")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> GdkAxisUse.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setKey_ =
        call (load_sym libgdk "gdk_device_set_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Word32.VAL
             &&> FFI.PolyML.Word32.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMode_ = call (load_sym libgdk "gdk_device_set_mode") (GObjectObjectClass.PolyML.PTR &&> GdkInputMode.PolyML.VAL --> FFI.PolyML.Bool.VAL)
      val ungrab_ = call (load_sym libgdk "gdk_device_ungrab") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Word32.VAL --> FFI.PolyML.VOID)
      val warp_ =
        call (load_sym libgdk "gdk_device_warp")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.Int32.VAL
             --> FFI.PolyML.VOID
          )
    end
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
             &&&> FFI.Bool.withRefVal
             ---> GdkWindowClass.C.fromPtr false
                   && FFI.Bool.fromVal
                   && FFI.Bool.fromVal
          )
            grabInfoLibgtkOnly_
            (
              display
               & device
               & NONE
               & false
            )
      in
        if retVal then SOME (grabWindow, ownerEvents) else NONE
      end
    fun getAssociatedDevice self = (GObjectObjectClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getAssociatedDevice_ self
    fun getAxisUse self index = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> GdkAxisUse.C.fromVal) getAxisUse_ (self & index)
    fun getDeviceType self = (GObjectObjectClass.C.withPtr ---> GdkDeviceType.C.fromVal) getDeviceType_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    fun getHasCursor self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getHasCursor_ self
    fun getKey self index =
      let
        val keyval
         & modifiers
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Word32.withVal
             &&&> FFI.Word32.withRefVal
             &&&> GdkModifierType.C.withRefVal
             ---> FFI.Word32.fromVal
                   && GdkModifierType.C.fromVal
                   && FFI.Bool.fromVal
          )
            getKey_
            (
              self
               & index
               & 0
               & GdkModifierType.flags []
            )
      in
        if retVal then SOME (keyval, modifiers) else NONE
      end
    fun getMode self = (GObjectObjectClass.C.withPtr ---> GdkInputMode.C.fromVal) getMode_ self
    fun getNAxes self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNAxes_ self
    fun getNKeys self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.fromVal) getNKeys_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun getPosition self =
      let
        val screen
         & x
         & y
         & () =
          (
            GObjectObjectClass.C.withPtr
             &&&> GObjectObjectClass.C.withRefOptPtr
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> GdkScreenClass.C.fromPtr false
                   && FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && I
          )
            getPosition_
            (
              self
               & NONE
               & 0
               & 0
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
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && GdkWindowClass.C.fromPtr false
          )
            getWindowAtPosition_
            (
              self
               & 0
               & 0
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
         &&&> FFI.Bool.withVal
         &&&> GdkEventMask.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> FFI.Word32.withVal
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
         &&&> FFI.Word32.withVal
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
         &&&> FFI.Word32.withVal
         &&&> FFI.Word32.withVal
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
    fun setMode self mode = (GObjectObjectClass.C.withPtr &&&> GdkInputMode.C.withVal ---> FFI.Bool.fromVal) setMode_ (self & mode)
    fun ungrab self time = (GObjectObjectClass.C.withPtr &&&> FFI.Word32.withVal ---> I) ungrab_ (self & time)
    fun warp self screen x y =
      (
        GObjectObjectClass.C.withPtr
         &&&> GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
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
