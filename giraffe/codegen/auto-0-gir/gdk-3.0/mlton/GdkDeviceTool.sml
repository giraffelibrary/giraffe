structure GdkDeviceTool :>
  GDK_DEVICE_TOOL
    where type 'a class = 'a GdkDeviceToolClass.class
    where type axis_flags_t = GdkAxisFlags.t
    where type device_tool_type_t = GdkDeviceToolType.t =
  struct
    val getType_ = _import "gdk_device_tool_get_type" : unit -> GObjectType.FFI.val_;
    val getHardwareId_ = _import "gdk_device_tool_get_hardware_id" : GdkDeviceToolClass.FFI.non_opt GdkDeviceToolClass.FFI.p -> GUInt64.FFI.val_;
    val getSerial_ = _import "gdk_device_tool_get_serial" : GdkDeviceToolClass.FFI.non_opt GdkDeviceToolClass.FFI.p -> GUInt64.FFI.val_;
    val getToolType_ = _import "gdk_device_tool_get_tool_type" : GdkDeviceToolClass.FFI.non_opt GdkDeviceToolClass.FFI.p -> GdkDeviceToolType.FFI.val_;
    type 'a class = 'a GdkDeviceToolClass.class
    type axis_flags_t = GdkAxisFlags.t
    type device_tool_type_t = GdkDeviceToolType.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getHardwareId self = (GdkDeviceToolClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getHardwareId_ self
    fun getSerial self = (GdkDeviceToolClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getSerial_ self
    fun getToolType self = (GdkDeviceToolClass.FFI.withPtr ---> GdkDeviceToolType.FFI.fromVal) getToolType_ self
    local
      open Property
    in
      val axesProp =
        {
          get = fn x => get "axes" GdkAxisFlags.t x,
          new = fn x => new "axes" GdkAxisFlags.t x
        }
      val hardwareIdProp =
        {
          get = fn x => get "hardware-id" uint64 x,
          new = fn x => new "hardware-id" uint64 x
        }
      val serialProp =
        {
          get = fn x => get "serial" uint64 x,
          new = fn x => new "serial" uint64 x
        }
      val toolTypeProp =
        {
          get = fn x => get "tool-type" GdkDeviceToolType.t x,
          new = fn x => new "tool-type" GdkDeviceToolType.t x
        }
    end
  end
