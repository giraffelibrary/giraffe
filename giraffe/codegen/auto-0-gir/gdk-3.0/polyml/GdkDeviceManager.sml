structure GdkDeviceManager :>
  GDK_DEVICE_MANAGER
    where type 'a class_t = 'a GdkDeviceManagerClass.t
    where type 'a deviceclass_t = 'a GdkDeviceClass.t
    where type 'a displayclass_t = 'a GdkDisplayClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_device_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getClientPointer_ = call (load_sym libgdk "gdk_device_manager_get_client_pointer") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getDisplay_ = call (load_sym libgdk "gdk_device_manager_get_display") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
    type 'a class_t = 'a GdkDeviceManagerClass.t
    type 'a deviceclass_t = 'a GdkDeviceClass.t
    type 'a displayclass_t = 'a GdkDisplayClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getClientPointer self = (GObjectObjectClass.C.withPtr ---> GdkDeviceClass.C.fromPtr false) getClientPointer_ self
    fun getDisplay self = (GObjectObjectClass.C.withPtr ---> GdkDisplayClass.C.fromPtr false) getDisplay_ self
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
