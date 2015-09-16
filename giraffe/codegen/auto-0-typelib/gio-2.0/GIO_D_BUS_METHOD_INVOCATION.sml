signature GIO_D_BUS_METHOD_INVOCATION =
  sig
    type 'a class_t
    type 'a d_bus_connection_class_t
    type 'a d_bus_message_class_t
    type d_bus_method_info_record_t
    type 'a unix_f_d_list_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getConnection : 'a class_t -> base d_bus_connection_class_t
    val getInterfaceName : 'a class_t -> string
    val getMessage : 'a class_t -> base d_bus_message_class_t
    val getMethodInfo : 'a class_t -> d_bus_method_info_record_t
    val getMethodName : 'a class_t -> string
    val getObjectPath : 'a class_t -> string
    val getParameters : 'a class_t -> GLib.VariantRecord.t
    val getSender : 'a class_t -> string
    val returnDbusError :
      'a class_t
       -> string
       -> string
       -> unit
    val returnErrorLiteral :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> string
       -> unit
    val returnValue :
      'a class_t
       -> GLib.VariantRecord.t option
       -> unit
    val returnValueWithUnixFdList :
      'a class_t
       -> GLib.VariantRecord.t option
       -> 'b unix_f_d_list_class_t option
       -> unit
  end
