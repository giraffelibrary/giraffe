structure GdkDeviceManager :>
  GDK_DEVICE_MANAGER
    where type 'a class = 'a GdkDeviceManagerClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getClientPointer_ = call (getSymbol "gdk_device_manager_get_client_pointer") (GdkDeviceManagerClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cPtr)
      val getDisplay_ = call (getSymbol "gdk_device_manager_get_display") (GdkDeviceManagerClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cOptPtr)
    end
    type 'a class = 'a GdkDeviceManagerClass.class
    type 'a device_class = 'a GdkDeviceClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getClientPointer self = (GdkDeviceManagerClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromPtr false) getClientPointer_ self
    fun getDisplay self = (GdkDeviceManagerClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromOptPtr false) getDisplay_ self
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
