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
    fun getHardwareId self = (GdkDeviceToolClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getHardwareId_ self
    fun getSerial self = (GdkDeviceToolClass.FFI.withPtr false ---> GUInt64.FFI.fromVal) getSerial_ self
    fun getToolType self = (GdkDeviceToolClass.FFI.withPtr false ---> GdkDeviceToolType.FFI.fromVal) getToolType_ self
    local
      open ValueAccessor
    in
      val axesProp =
        {
          name = "axes",
          gtype = fn () => C.gtype GdkAxisFlags.t (),
          get = fn x => fn () => C.get GdkAxisFlags.t x,
          set = ignore,
          init = fn x => C.set GdkAxisFlags.t x
        }
      val hardwareIdProp =
        {
          name = "hardware-id",
          gtype = fn () => C.gtype ulong (),
          get = fn x => fn () => C.get ulong x,
          set = ignore,
          init = fn x => C.set ulong x
        }
      val serialProp =
        {
          name = "serial",
          gtype = fn () => C.gtype ulong (),
          get = fn x => fn () => C.get ulong x,
          set = ignore,
          init = fn x => C.set ulong x
        }
      val toolTypeProp =
        {
          name = "tool-type",
          gtype = fn () => C.gtype GdkDeviceToolType.t (),
          get = fn x => fn () => C.get GdkDeviceToolType.t x,
          set = ignore,
          init = fn x => C.set GdkDeviceToolType.t x
        }
    end
  end
