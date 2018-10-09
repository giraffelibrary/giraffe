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
    val axesProp :
      {
        get : 'a class -> axis_flags_t,
        new : axis_flags_t -> 'a class Property.t
      }
    val hardwareIdProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val serialProp :
      {
        get : 'a class -> LargeInt.int,
        new : LargeInt.int -> 'a class Property.t
      }
    val toolTypeProp :
      {
        get : 'a class -> device_tool_type_t,
        new : device_tool_type_t -> 'a class Property.t
      }
  end
