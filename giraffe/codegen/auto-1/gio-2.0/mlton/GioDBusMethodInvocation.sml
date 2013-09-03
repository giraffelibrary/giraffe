structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class_t = 'a GioDBusMethodInvocationClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type 'a dbusmessageclass_t = 'a GioDBusMessageClass.t
    where type dbusmethodinforecord_t = GioDBusMethodInfoRecord.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t =
  struct
    val getType_ = _import "g_dbus_method_invocation_get_type" : unit -> GObjectType.C.val_;
    val getConnection_ = _import "g_dbus_method_invocation_get_connection" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getInterfaceName_ = _import "g_dbus_method_invocation_get_interface_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getMessage_ = _import "g_dbus_method_invocation_get_message" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getMethodInfo_ = _import "g_dbus_method_invocation_get_method_info" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioDBusMethodInfoRecord.C.notnull GioDBusMethodInfoRecord.C.p;
    val getMethodName_ = _import "g_dbus_method_invocation_get_method_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getObjectPath_ = _import "g_dbus_method_invocation_get_object_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val getParameters_ = _import "g_dbus_method_invocation_get_parameters" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GLibVariantRecord.C.notnull GLibVariantRecord.C.p;
    val getSender_ = _import "g_dbus_method_invocation_get_sender" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.notnull FFI.String.out_p;
    val returnDbusError_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5) =>
          (
            _import "mlton_g_dbus_method_invocation_return_dbus_error" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.UInt32.val_
               * FFI.Int32.val_
               * cstring
               * unit CPointer.t
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val returnValue_ = fn x1 & x2 => (_import "g_dbus_method_invocation_return_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GLibVariantRecord.C.p -> unit;) (x1, x2)
    val returnValueWithUnixFdList_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_dbus_method_invocation_return_value_with_unix_fd_list" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * unit GLibVariantRecord.C.p
               * unit GObjectObjectClass.C.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a GioDBusMethodInvocationClass.t
    type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    type 'a dbusmessageclass_t = 'a GioDBusMessageClass.t
    type dbusmethodinforecord_t = GioDBusMethodInfoRecord.t
    type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getInterfaceName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getInterfaceName_ self
    fun getMessage self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr false) getMessage_ self
    fun getMethodInfo self = (GObjectObjectClass.C.withPtr ---> GioDBusMethodInfoRecord.C.fromPtr false) getMethodInfo_ self
    fun getMethodName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getMethodName_ self
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getObjectPath_ self
    fun getParameters self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr false) getParameters_ self
    fun getSender self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getSender_ self
    fun returnDbusError self errorName errorMessage =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstPtr
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.UInt32.withVal
         &&&> FFI.Int32.withVal
         &&&> FFI.String.withConstPtr
         ---> I
      )
        returnErrorLiteral_
        (
          self
           & domain
           & code
           & message
        )
    fun returnValue self parameters = (GObjectObjectClass.C.withPtr &&&> GLibVariantRecord.C.withOptPtr ---> I) returnValue_ (self & parameters)
    fun returnValueWithUnixFdList self parameters fdList =
      (
        GObjectObjectClass.C.withPtr
         &&&> GLibVariantRecord.C.withOptPtr
         &&&> GObjectObjectClass.C.withOptPtr
         ---> I
      )
        returnValueWithUnixFdList_
        (
          self
           & parameters
           & fdList
        )
  end
