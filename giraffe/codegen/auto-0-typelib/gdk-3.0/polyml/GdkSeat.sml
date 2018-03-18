structure GdkSeat :>
  GDK_SEAT
    where type 'a class = 'a GdkSeatClass.class
    where type seat_capabilities_t = GdkSeatCapabilities.t
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a device_tool_class = 'a GdkDeviceToolClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_seat_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getCapabilities_ = call (getSymbol "gdk_seat_get_capabilities") (GdkSeatClass.PolyML.cPtr --> GdkSeatCapabilities.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_seat_get_display") (GdkSeatClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cPtr)
      val getKeyboard_ = call (getSymbol "gdk_seat_get_keyboard") (GdkSeatClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cOptPtr)
      val getPointer_ = call (getSymbol "gdk_seat_get_pointer") (GdkSeatClass.PolyML.cPtr --> GdkDeviceClass.PolyML.cOptPtr)
      val ungrab_ = call (getSymbol "gdk_seat_ungrab") (GdkSeatClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GdkSeatClass.class
    type seat_capabilities_t = GdkSeatCapabilities.t
    type 'a device_class = 'a GdkDeviceClass.class
    type 'a device_tool_class = 'a GdkDeviceToolClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getCapabilities self = (GdkSeatClass.FFI.withPtr ---> GdkSeatCapabilities.FFI.fromVal) getCapabilities_ self
    fun getDisplay self = (GdkSeatClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromPtr false) getDisplay_ self
    fun getKeyboard self = (GdkSeatClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromOptPtr false) getKeyboard_ self
    fun getPointer self = (GdkSeatClass.FFI.withPtr ---> GdkDeviceClass.FFI.fromOptPtr false) getPointer_ self
    fun ungrab self = (GdkSeatClass.FFI.withPtr ---> I) ungrab_ self
    local
      open ClosureMarshal Signal
    in
      fun deviceAddedSig f = signal "device-added" (get 0w1 GdkDeviceClass.t ---> ret_void) f
      fun deviceRemovedSig f = signal "device-removed" (get 0w1 GdkDeviceClass.t ---> ret_void) f
      fun toolAddedSig f = signal "tool-added" (get 0w1 GdkDeviceToolClass.t ---> ret_void) f
      fun toolRemovedSig f = signal "tool-removed" (get 0w1 GdkDeviceToolClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          new = fn x => new "display" GdkDisplayClass.tOpt x
        }
    end
  end
