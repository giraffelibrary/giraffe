structure GdkDeviceManager :>
  GDK_DEVICE_MANAGER
    where type 'a class = 'a GdkDeviceManagerClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_device_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getClientPointer_ = call (load_sym libgdk "gdk_device_manager_get_client_pointer") (GdkDeviceManagerClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cPtr)
      val getDisplay_ = call (load_sym libgdk "gdk_device_manager_get_display") (GdkDeviceManagerClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
    end
    type 'a class = 'a GdkDeviceManagerClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getClientPointer self = (GdkDeviceManagerClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getClientPointer_ self
    fun getDisplay self = (GdkDeviceManagerClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
    local
      open ClosureMarshal Signal
    in
      fun deviceAddedSig f = signal "device-added" (get 0w1 GdkDeviceClass.t ---> ret_void) f
      fun deviceChangedSig f = signal "device-changed" (get 0w1 GdkDeviceClass.t ---> ret_void) f
      fun deviceRemovedSig f = signal "device-removed" (get 0w1 GdkDeviceClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          set = fn x => set "display" GdkDisplayClass.tOpt x
        }
    end
  end
