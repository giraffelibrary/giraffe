structure GdkDevice :>
  GDK_DEVICE
    where type 'a class_t = 'a GdkDeviceClass.t
    where type grab_status_t = GdkGrabStatus.t
    where type 'a cursor_class_t = 'a GdkCursorClass.t
    where type event_mask_t = GdkEventMask.t
    where type grab_ownership_t = GdkGrabOwnership.t
    where type 'a window_class_t = 'a GdkWindowClass.t
    where type axis_use_t = GdkAxisUse.t
    where type modifier_type_t = GdkModifierType.t
    where type 'a screen_class_t = 'a GdkScreenClass.t
    where type 'a device_manager_class_t = 'a GdkDeviceManagerClass.t
    where type 'a display_class_t = 'a GdkDisplayClass.t
    where type input_mode_t = GdkInputMode.t
    where type input_source_t = GdkInputSource.t
    where type device_type_t = GdkDeviceType.t =
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
             &&> FFI.Bool.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getAssociatedDevice_ = call (load_sym libgdk "gdk_device_get_associated_device") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getAxisUse_ = call (load_sym libgdk "gdk_device_get_axis_use") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> GdkAxisUse.PolyML.VAL)
      val getDeviceType_ = call (load_sym libgdk "gdk_device_get_device_type") (GObjectObjectClass.PolyML.PTR --> GdkDeviceType.PolyML.VAL)
      val getDisplay_ = call (load_sym libgdk "gdk_device_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getHasCursor_ = call (load_sym libgdk "gdk_device_get_has_cursor") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getKey_ =
        call (load_sym libgdk "gdk_device_get_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.REF
             &&> GdkModifierType.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getMode_ = call (load_sym libgdk "gdk_device_get_mode") (GObjectObjectClass.PolyML.PTR --> GdkInputMode.PolyML.VAL)
      val getNAxes_ = call (load_sym libgdk "gdk_device_get_n_axes") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getNKeys_ = call (load_sym libgdk "gdk_device_get_n_keys") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getName_ = call (load_sym libgdk "gdk_device_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getPosition_ =
        call (load_sym libgdk "gdk_device_get_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.OUTREF
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> FFI.PolyML.VOID
          )
      val getSource_ = call (load_sym libgdk "gdk_device_get_source") (GObjectObjectClass.PolyML.PTR --> GdkInputSource.PolyML.VAL)
      val getWindowAtPosition_ =
        call (load_sym libgdk "gdk_device_get_window_at_position")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.REF
             &&> FFI.Int32.PolyML.REF
             --> GObjectObjectClass.PolyML.PTR
          )
      val grab_ =
        call (load_sym libgdk "gdk_device_grab")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> GdkGrabOwnership.PolyML.VAL
             &&> FFI.Bool.PolyML.VAL
             &&> GdkEventMask.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> FFI.UInt32.PolyML.VAL
             --> GdkGrabStatus.PolyML.VAL
          )
      val setAxisUse_ =
        call (load_sym libgdk "gdk_device_set_axis_use")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> GdkAxisUse.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setKey_ =
        call (load_sym libgdk "gdk_device_set_key")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.UInt32.PolyML.VAL
             &&> FFI.UInt32.PolyML.VAL
             &&> GdkModifierType.PolyML.VAL
             --> FFI.PolyML.VOID
          )
      val setMode_ = call (load_sym libgdk "gdk_device_set_mode") (GObjectObjectClass.PolyML.PTR &&> GdkInputMode.PolyML.VAL --> FFI.Bool.PolyML.VAL)
      val ungrab_ = call (load_sym libgdk "gdk_device_ungrab") (GObjectObjectClass.PolyML.PTR &&> FFI.UInt32.PolyML.VAL --> FFI.PolyML.VOID)
      val warp_ =
        call (load_sym libgdk "gdk_device_warp")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> FFI.Int32.PolyML.VAL
             --> FFI.PolyML.VOID
          )
    end
    type 'a class_t = 'a GdkDeviceClass.t
    type grab_status_t = GdkGrabStatus.t
    type 'a cursor_class_t = 'a GdkCursorClass.t
    type event_mask_t = GdkEventMask.t
    type grab_ownership_t = GdkGrabOwnership.t
    type 'a window_class_t = 'a GdkWindowClass.t
    type axis_use_t = GdkAxisUse.t
    type modifier_type_t = GdkModifierType.t
    type 'a screen_class_t = 'a GdkScreenClass.t
    type 'a device_manager_class_t = 'a GdkDeviceManagerClass.t
    type 'a display_class_t = 'a GdkDisplayClass.t
    type input_mode_t = GdkInputMode.t
    type input_source_t = GdkInputSource.t
    type device_type_t = GdkDeviceType.t
    type t = base class_t
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
