structure GioDBusMethodInvocation :>
  GIO_D_BUS_METHOD_INVOCATION
    where type 'a class_t = 'a GioDBusMethodInvocationClass.t
    where type 'a dbusconnectionclass_t = 'a GioDBusConnectionClass.t
    where type 'a dbusmessageclass_t = 'a GioDBusMessageClass.t
    where type dbusmethodinforecord_t = GioDBusMethodInfoRecord.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_method_invocation_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getConnection_ = call (load_sym libgio "g_dbus_method_invocation_get_connection") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getInterfaceName_ = call (load_sym libgio "g_dbus_method_invocation_get_interface_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getMessage_ = call (load_sym libgio "g_dbus_method_invocation_get_message") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getMethodInfo_ = call (load_sym libgio "g_dbus_method_invocation_get_method_info") (GObjectObjectClass.PolyML.PTR --> GioDBusMethodInfoRecord.PolyML.PTR)
      val getMethodName_ = call (load_sym libgio "g_dbus_method_invocation_get_method_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getObjectPath_ = call (load_sym libgio "g_dbus_method_invocation_get_object_path") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getParameters_ = call (load_sym libgio "g_dbus_method_invocation_get_parameters") (GObjectObjectClass.PolyML.PTR --> GLibVariantRecord.PolyML.PTR)
      val getSender_ = call (load_sym libgio "g_dbus_method_invocation_get_sender") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val returnDbusError_ =
        call (load_sym libgio "g_dbus_method_invocation_return_dbus_error")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val returnErrorLiteral_ =
        call (load_sym libgio "g_dbus_method_invocation_return_error_literal")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.UInt32.VAL
             &&> FFI.PolyML.Int32.VAL
             &&> FFI.PolyML.String.INPTR
             --> FFI.PolyML.VOID
          )
      val returnValue_ = call (load_sym libgio "g_dbus_method_invocation_return_value") (GObjectObjectClass.PolyML.PTR &&> GLibVariantRecord.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val returnValueWithUnixFdList_ =
        call (load_sym libgio "g_dbus_method_invocation_return_value_with_unix_fd_list")
          (
            GObjectObjectClass.PolyML.PTR
             &&> GLibVariantRecord.PolyML.OPTPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             --> FFI.PolyML.VOID
          )
    end
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
