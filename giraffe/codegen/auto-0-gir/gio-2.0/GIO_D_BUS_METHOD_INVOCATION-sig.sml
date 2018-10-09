signature GIO_D_BUS_METHOD_INVOCATION =
  sig
    type 'a class
    type 'a d_bus_connection_class
    type 'a d_bus_message_class
    type d_bus_method_info_t
    type d_bus_property_info_t
    type 'a unix_f_d_list_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getConnection : 'a class -> base d_bus_connection_class
    val getInterfaceName : 'a class -> string
    val getMessage : 'a class -> base d_bus_message_class
    val getMethodInfo : 'a class -> d_bus_method_info_t
    val getMethodName : 'a class -> string
    val getObjectPath : 'a class -> string
    val getParameters : 'a class -> GLib.VariantRecord.t
    val getPropertyInfo : 'a class -> d_bus_property_info_t
    val getSender : 'a class -> string
    val returnDbusError :
      'a class
       -> string * string
       -> unit
    val returnErrorLiteral :
      'a class
       -> GLib.Quark.t
           * LargeInt.int
           * string
       -> unit
    val returnValue :
      'a class
       -> GLib.VariantRecord.t option
       -> unit
    val returnValueWithUnixFdList :
      'a class
       -> GLib.VariantRecord.t option * 'b unix_f_d_list_class option
       -> unit
  end
