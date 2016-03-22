structure GdkDeviceManager :>
  GDK_DEVICE_MANAGER
    where type 'a class = 'a GdkDeviceManagerClass.class
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_device_manager_get_type" : unit -> GObjectType.C.val_;
    val getClientPointer_ = _import "gdk_device_manager_get_client_pointer" : GdkDeviceManagerClass.C.notnull GdkDeviceManagerClass.C.p -> GdkDeviceClass.C.notnull GdkDeviceClass.C.p;
    val getDisplay_ = _import "gdk_device_manager_get_display" : GdkDeviceManagerClass.C.notnull GdkDeviceManagerClass.C.p -> GdkDisplayClass.C.notnull GdkDisplayClass.C.p;
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
