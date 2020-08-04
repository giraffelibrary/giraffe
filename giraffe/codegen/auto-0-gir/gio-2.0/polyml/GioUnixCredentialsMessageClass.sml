structure GioUnixCredentialsMessageClass :>
  GIO_UNIX_CREDENTIALS_MESSAGE_CLASS
    where type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    where type C.opt = GioSocketControlMessageClass.C.opt
    where type C.non_opt = GioSocketControlMessageClass.C.non_opt
    where type 'a C.p = 'a GioSocketControlMessageClass.C.p =
  struct
    type 'a socket_control_message_class = 'a GioSocketControlMessageClass.class
    open GioSocketControlMessageClass
    type 'a unix_credentials_message = unit
    type 'a class = 'a unix_credentials_message class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_credentials_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
