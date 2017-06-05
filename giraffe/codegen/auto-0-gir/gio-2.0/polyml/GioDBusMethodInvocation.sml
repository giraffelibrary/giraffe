structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class = 'a GioDBusMethodInvocationClass.class
    where type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    where type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    where type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_method_invocation_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getConnection_ = call (load_sym libgio "g_dbus_method_invocation_get_connection") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusConnectionClass.PolyML.cPtr)
      val getInterfaceName_ = call (load_sym libgio "g_dbus_method_invocation_get_interface_name") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessage_ = call (load_sym libgio "g_dbus_method_invocation_get_message") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusMessageClass.PolyML.cPtr)
      val getMethodInfo_ = call (load_sym libgio "g_dbus_method_invocation_get_method_info") (GioDBusMethodInvocationClass.PolyML.cPtr --> GioDBusMethodInfoRecord.PolyML.cPtr)
      val getMethodName_ = call (load_sym libgio "g_dbus_method_invocation_get_method_name") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_method_invocation_get_object_path") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameters_ = call (load_sym libgio "g_dbus_method_invocation_get_parameters") (GioDBusMethodInvocationClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getSender_ = call (load_sym libgio "g_dbus_method_invocation_get_sender") (GioDBusMethodInvocationClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val returnDbusError_ =
        call (load_sym libgio "g_dbus_method_invocation_return_dbus_error")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val returnErrorLiteral_ =
        call (load_sym libgio "g_dbus_method_invocation_return_error_literal")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> GLibQuark.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> PolyMLFFI.cVoid
          )
      val returnValue_ = call (load_sym libgio "g_dbus_method_invocation_return_value") (GioDBusMethodInvocationClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> PolyMLFFI.cVoid)
      val returnValueWithUnixFdList_ =
        call (load_sym libgio "g_dbus_method_invocation_return_value_with_unix_fd_list")
          (
            GioDBusMethodInvocationClass.PolyML.cPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GioUnixFDListClass.PolyML.cOptPtr
             --> PolyMLFFI.cVoid
          )
    end
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
    fun returnDbusError self errorName errorMessage =
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
    fun returnErrorLiteral self domain code message =
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
    fun returnValueWithUnixFdList self parameters fdList =
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
