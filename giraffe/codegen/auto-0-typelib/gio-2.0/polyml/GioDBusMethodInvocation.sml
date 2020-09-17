structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_method_invocation_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getConnection_ = call (getSymbol "g_dbus_method_invocation_get_connection") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getInterfaceName_ = call (getSymbol "g_dbus_method_invocation_get_interface_name") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessage_ = call (getSymbol "g_dbus_method_invocation_get_message") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusMessageClass.PolyML.cPtr)
      val getMethodInfo_ = call (getSymbol "g_dbus_method_invocation_get_method_info") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusMethodInfoRecord.PolyML.cPtr)
      val getMethodName_ = call (getSymbol "g_dbus_method_invocation_get_method_name") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectPath_ = call (getSymbol "g_dbus_method_invocation_get_object_path") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameters_ = call (getSymbol "g_dbus_method_invocation_get_parameters") (GioDBusMethodInvocationClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getPropertyInfo_ = call (getSymbol "g_dbus_method_invocation_get_property_info") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusPropertyInfoRecord.PolyML.cPtr)
      val getSender_ = call (getSymbol "g_dbus_method_invocation_get_sender") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val returnDbusError_ =
        call (getSymbol "g_dbus_method_invocation_return_dbus_error")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val returnErrorLiteral_ =
        call (getSymbol "g_dbus_method_invocation_return_error_literal")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val returnValue_ = call (getSymbol "g_dbus_method_invocation_return_value") (GioDBusMethodInvocationClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> cVoid)
      val returnValueWithUnixFdList_ =
        call (getSymbol "g_dbus_method_invocation_return_value_with_unix_fd_list")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioUnixFDListClass.PolyML.cOptPtr
             --> cVoid
          )
    end
    type 'a class = 'a GioDBusMethodInvocationClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type d_bus_property_info_t = GioDBusPropertyInfoRecord.t
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getConnection self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> GioDBusConnectionClass.FFI.fromPtr false) getConnection_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getInterfaceName self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getInterfaceName_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getMessage self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> GioDBusMessageClass.FFI.fromPtr false) getMessage_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getMethodInfo self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> GioDBusMethodInfoRecord.FFI.fromPtr false) getMethodInfo_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getMethodName self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMethodName_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getObjectPath self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getObjectPath_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getParameters self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> GLibVariantRecord.FFI.fromPtr false) getParameters_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getPropertyInfo self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> GioDBusPropertyInfoRecord.FFI.fromPtr false) getPropertyInfo_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun getSender self = (GioDBusMethodInvocationClass.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getSender_ self before GioDBusMethodInvocationClass.FFI.touchPtr self
    fun returnDbusError self (errorName, errorMessage) =
      (
        GioDBusMethodInvocationClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
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
        GioDBusMethodInvocationClass.FFI.withPtr false
         &&&> GUInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        returnErrorLiteral_
        (
          self
           & domain
           & code
           & message
        )
    fun returnValue self parameters = (GioDBusMethodInvocationClass.FFI.withPtr false &&&> GLibVariantRecord.FFI.withOptPtr false ---> I) returnValue_ (self & parameters)
    fun returnValueWithUnixFdList self (parameters, fdList) =
      (
        GioDBusMethodInvocationClass.FFI.withPtr false
         &&&> GLibVariantRecord.FFI.withOptPtr false
         &&&> GioUnixFDListClass.FFI.withOptPtr false
         ---> I
      )
        returnValueWithUnixFdList_
        (
          self
           & parameters
           & fdList
        )
  end
