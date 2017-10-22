signature GDK_DEVICE_TOOL =
  sig
    type 'a class
    type axis_flags_t
    type device_tool_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getHardwareId : 'a class -> LargeInt.int
    val getSerial : 'a class -> LargeInt.int
    val getToolType : 'a class -> device_tool_type_t
    val axesProp : ('a class, axis_flags_t, axis_flags_t) Property.readwrite
    val hardwareIdProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val serialProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val toolTypeProp : ('a class, device_tool_type_t, device_tool_type_t) Property.readwrite
  end
