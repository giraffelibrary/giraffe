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
      val getType_ = call (load_sym libgio "g_dbus_method_invocation_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val getConnection_ = call (load_sym libgio "g_dbus_method_invocation_get_connection") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getInterfaceName_ = call (load_sym libgio "g_dbus_method_invocation_get_interface_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getMessage_ = call (load_sym libgio "g_dbus_method_invocation_get_message") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getMethodInfo_ = call (load_sym libgio "g_dbus_method_invocation_get_method_info") (GObjectObjectClass.PolyML.cPtr --> GioDBusMethodInfoRecord.PolyML.cPtr)
      val getMethodName_ = call (load_sym libgio "g_dbus_method_invocation_get_method_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getObjectPath_ = call (load_sym libgio "g_dbus_method_invocation_get_object_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getParameters_ = call (load_sym libgio "g_dbus_method_invocation_get_parameters") (GObjectObjectClass.PolyML.cPtr --> GLibVariantRecord.PolyML.cPtr)
      val getSender_ = call (load_sym libgio "g_dbus_method_invocation_get_sender") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val returnDbusError_ =
        call (load_sym libgio "g_dbus_method_invocation_return_dbus_error")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val returnErrorLiteral_ =
        call (load_sym libgio "g_dbus_method_invocation_return_error_literal")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibQuark.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> FFI.PolyML.cVoid
          )
      val returnValue_ = call (load_sym libgio "g_dbus_method_invocation_return_value") (GObjectObjectClass.PolyML.cPtr &&> GLibVariantRecord.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val returnValueWithUnixFdList_ =
        call (load_sym libgio "g_dbus_method_invocation_return_value_with_unix_fd_list")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> GLibVariantRecord.PolyML.cOptPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             --> FFI.PolyML.cVoid
          )
    end
    type 'a class = 'a GioDBusMethodInvocationClass.class
    type 'a d_bus_connection_class = 'a GioDBusConnectionClass.class
    type 'a d_bus_message_class = 'a GioDBusMessageClass.class
    type d_bus_method_info_t = GioDBusMethodInfoRecord.t
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun getConnection self = (GObjectObjectClass.C.withPtr ---> GioDBusConnectionClass.C.fromPtr false) getConnection_ self
    fun getInterfaceName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getInterfaceName_ self
    fun getMessage self = (GObjectObjectClass.C.withPtr ---> GioDBusMessageClass.C.fromPtr false) getMessage_ self
    fun getMethodInfo self = (GObjectObjectClass.C.withPtr ---> GioDBusMethodInfoRecord.C.fromPtr false) getMethodInfo_ self
    fun getMethodName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getMethodName_ self
    fun getObjectPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getObjectPath_ self
    fun getParameters self = (GObjectObjectClass.C.withPtr ---> GLibVariantRecord.C.fromPtr false) getParameters_ self
    fun getSender self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getSender_ self
    fun returnDbusError self errorName errorMessage =
      (
        GObjectObjectClass.C.withPtr
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
        GObjectObjectClass.C.withPtr
         &&&> GLibQuark.C.withVal
         &&&> FFI.Int.C.withVal
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
