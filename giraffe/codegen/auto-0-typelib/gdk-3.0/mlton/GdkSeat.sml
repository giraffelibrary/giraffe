structure GdkSeat :>
  GDK_SEAT
    where type 'a class = 'a GdkSeatClass.class
    where type seat_capabilities_t = GdkSeatCapabilities.t
    where type 'a device_class = 'a GdkDeviceClass.class
    where type 'a device_tool_class = 'a GdkDeviceToolClass.class
    where type 'a display_class = 'a GdkDisplayClass.class =
  struct
    val getType_ = _import "gdk_seat_get_type" : unit -> GObjectType.FFI.val_;
    val getCapabilities_ = _import "gdk_seat_get_capabilities" : GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p -> GdkSeatCapabilities.FFI.val_;
    val getDisplay_ = _import "gdk_seat_get_display" : GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p -> GdkDisplayClass.FFI.notnull GdkDisplayClass.FFI.p;
    val getKeyboard_ = _import "gdk_seat_get_keyboard" : GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p -> unit GdkDeviceClass.FFI.p;
    val getPointer_ = _import "gdk_seat_get_pointer" : GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p -> unit GdkDeviceClass.FFI.p;
    val ungrab_ = _import "gdk_seat_ungrab" : GdkSeatClass.FFI.notnull GdkSeatClass.FFI.p -> unit;
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
