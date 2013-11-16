signature GIO_D_BUS_METHOD_INVOCATION =
  sig
    type 'a class_t
    type 'a unixfdlistclass_t
    type dbusmethodinforecord_t
    type 'a dbusmessageclass_t
    type 'a dbusconnectionclass_t
    val getType : unit -> GObject.Type.t
    val getConnection : 'a class_t -> base dbusconnectionclass_t
    val getInterfaceName : 'a class_t -> string
    val getMessage : 'a class_t -> base dbusmessageclass_t
    val getMethodInfo : 'a class_t -> dbusmethodinforecord_t
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
       -> 'b unixfdlistclass_t option
       -> unit
  end
