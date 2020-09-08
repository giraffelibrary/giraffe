structure GdkDeviceTool :>
  GDK_DEVICE_TOOL
    where type 'a class = 'a GdkDeviceToolClass.class
    where type axis_flags_t = GdkAxisFlags.t
    where type device_tool_type_t = GdkDeviceToolType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_device_tool_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getHardwareId_ = call (getSymbol "gdk_device_tool_get_hardware_id") (GdkDeviceToolClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getSerial_ = call (getSymbol "gdk_device_tool_get_serial") (GdkDeviceToolClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val getToolType_ = call (getSymbol "gdk_device_tool_get_tool_type") (GdkDeviceToolClass.PolyML.cPtr --> GdkDeviceToolType.PolyML.cVal)
    end
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
