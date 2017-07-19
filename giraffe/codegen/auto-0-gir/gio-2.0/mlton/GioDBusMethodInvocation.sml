structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_dbus_method_invocation_get_type" : unit -> GObjectType.FFI.val_;
    val getConnection_ = _import "g_dbus_method_invocation_get_connection" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> GioDBusConnectionClass.FFI.notnull GioDBusConnectionClass.FFI.p;
    val getInterfaceName_ = _import "g_dbus_method_invocation_get_interface_name" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getMessage_ = _import "g_dbus_method_invocation_get_message" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> GioDBusMessageClass.FFI.notnull GioDBusMessageClass.FFI.p;
    val getMethodInfo_ = _import "g_dbus_method_invocation_get_method_info" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> GioDBusMethodInfoRecord.FFI.notnull GioDBusMethodInfoRecord.FFI.p;
    val getMethodName_ = _import "g_dbus_method_invocation_get_method_name" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getObjectPath_ = _import "g_dbus_method_invocation_get_object_path" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getParameters_ = _import "g_dbus_method_invocation_get_parameters" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> GLibVariantRecord.FFI.notnull GLibVariantRecord.FFI.p;
    val getSender_ = _import "g_dbus_method_invocation_get_sender" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val returnDbusError_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_method_invocation_return_dbus_error" :
              GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p
               * GLibQuark.FFI.val_
               * GInt.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val returnValue_ = fn x1 & x2 => (_import "g_dbus_method_invocation_return_value" : GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p * unit GLibVariantRecord.FFI.p -> unit;) (x1, x2)
    val returnValueWithUnixFdList_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_method_invocation_return_value_with_unix_fd_list" :
              GioDBusMethodInvocationClass.FFI.notnull GioDBusMethodInvocationClass.FFI.p
               * unit GLibVariantRecord.FFI.p
               * unit GioUnixFDListClass.FFI.p
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getConnection self = (GioDBusMethodInvocationClass.FFI.withPtr ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self
    fun getInterfaceName self = (GioDBusMethodInvocationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getInterfaceName_ self
    fun getMessage self = (GioDBusMethodInvocationClass.FFI.withPtr ---> GioDBusMessageClass.FFI.fromPtr false) getMessage_ self
    fun getMethodInfo self = (GioDBusMethodInvocationClass.FFI.withPtr ---> GioDBusMethodInfoRecord.FFI.fromPtr false) getMethodInfo_ self
    fun getMethodName self = (GioDBusMethodInvocationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMethodName_ self
    fun getObjectPath self = (GioDBusMethodInvocationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getObjectPath_ self
    fun getParameters self = (GioDBusMethodInvocationClass.FFI.withPtr ---> GLibVariantRecord.FFI.fromPtr false) getParameters_ self
    fun getSender self = (GioDBusMethodInvocationClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getSender_ self
    fun returnDbusError self (errorName, errorMessage) =
      (
        GioDBusMethodInvocationClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        returnDbusError_
        (
          self
           & errorName
           & errorMessage
        )
    fun returnErrorLiteral
      self
      (
        domain,
        code,
        message
      ) =
      (
        GioDBusMethodInvocationClass.FFI.withPtr
         &&&> GLibQuark.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        returnErrorLiteral_
        (
          self
           & domain
           & code
           & message
        )
    fun returnValue self parameters = (GioDBusMethodInvocationClass.FFI.withPtr &&&> GLibVariantRecord.FFI.withOptPtr ---> I) returnValue_ (self & parameters)
    fun returnValueWithUnixFdList self (parameters, fdList) =
      (
        GioDBusMethodInvocationClass.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         &&&> GioUnixFDListClass.FFI.withOptPtr
         ---> I
      )
        returnValueWithUnixFdList_
        (
          self
           & parameters
           & fdList
        )
  end
