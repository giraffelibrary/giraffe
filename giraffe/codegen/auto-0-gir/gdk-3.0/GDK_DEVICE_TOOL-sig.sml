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
    val axesProp : ('a class, unit -> axis_flags_t, unit, axis_flags_t -> unit) Property.t
    val hardwareIdProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val serialProp : ('a class, unit -> LargeInt.int, unit, LargeInt.int -> unit) Property.t
    val toolTypeProp : ('a class, unit -> device_tool_type_t, unit, device_tool_type_t -> unit) Property.t
  end
