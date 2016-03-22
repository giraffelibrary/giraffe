structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_dbus_method_invocation_get_type" : unit -> GObjectType.C.val_;
    val getConnection_ = _import "g_dbus_method_invocation_get_connection" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> GioDBusConnectionClass.C.notnull GioDBusConnectionClass.C.p;
    val getInterfaceName_ = _import "g_dbus_method_invocation_get_interface_name" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getMessage_ = _import "g_dbus_method_invocation_get_message" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> GioDBusMessageClass.C.notnull GioDBusMessageClass.C.p;
    val getMethodInfo_ = _import "g_dbus_method_invocation_get_method_info" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> GioDBusMethodInfoRecord.C.notnull GioDBusMethodInfoRecord.C.p;
    val getMethodName_ = _import "g_dbus_method_invocation_get_method_name" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getObjectPath_ = _import "g_dbus_method_invocation_get_object_path" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getParameters_ = _import "g_dbus_method_invocation_get_parameters" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getSender_ = _import "g_dbus_method_invocation_get_sender" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val returnDbusError_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_method_invocation_return_dbus_error" :
              GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val returnErrorLiteral_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_method_invocation_return_error_literal" :
              GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p
               * FFI.UInt32.C.val_
               * FFI.Int32.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val returnValue_ = fn x1 & x2 => (_import "g_dbus_method_invocation_return_value" : GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p * unit GLibVariantRecord.C.p -> unit;) (x1, x2)
    val returnValueWithUnixFdList_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_method_invocation_return_value_with_unix_fd_list" :
              GioDBusMethodInvocationClass.C.notnull GioDBusMethodInvocationClass.C.p
               * unit GLibVariantRecord.C.p
               * unit GioUnixFDListClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDBusMethodInvocationClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getConnection self = (GioDBusMethodInvocationClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getInterfaceName self = (GioDBusMethodInvocationClass.C.withPtr ---> Utf8.C.fromPtr false) getInterfaceName_ self
    fun getMessage self = (GioDBusMethodInvocationClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr false) getMessage_ self
    fun getMethodInfo self = (GioDBusMethodInvocationClass.C.withPtr ---> GioDBusMethodInfoRecord.C.fromPtr false) getMethodInfo_ self
    fun getMethodName self = (GioDBusMethodInvocationClass.C.withPtr ---> Utf8.C.fromPtr false) getMethodName_ self
    fun getObjectPath self = (GioDBusMethodInvocationClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    fun getParameters self = (GioDBusMethodInvocationClass.C.withPtr ---> GLibVariantRecord.C.fromPtr false) getParameters_ self
    fun getSender self = (GioDBusMethodInvocationClass.C.withPtr ---> Utf8.C.fromPtr false) getSender_ self
    fun returnDbusError self errorName errorMessage =
      (
        GioDBusMethodInvocationClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withPtr
         ---> I
      )
        returnDbusError_
        (
          self
           & errorName
           & errorMessage
        )
    fun returnErrorLiteral self domain code message =
      (
        GioDBusMethodInvocationClass.C.withPtr
         &&&> FFI.UInt32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> Utf8.C.withPtr
         ---> I
      )
        returnErrorLiteral_
        (
          self
           & domain
           & code
           & message
        )
    fun returnValue self parameters = (GioDBusMethodInvocationClass.C.withPtr &&&> GLibVariantRecord.C.withOptPtr ---> I) returnValue_ (self & parameters)
    fun returnValueWithUnixFdList self parameters fdList =
      (
        GioDBusMethodInvocationClass.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GioUnixFDListClass.C.withOptPtr
         ---> I
      )
        returnValueWithUnixFdList_
        (
          self
           & parameters
           & fdList
        )
  end
