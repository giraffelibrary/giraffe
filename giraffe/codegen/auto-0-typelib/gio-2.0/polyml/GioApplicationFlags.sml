structure GioApplicationFlags :> GIO_APPLICATION_FLAGS =
  struct
    val FLAGS_NONE = 0w0
    val IS_SERVICE = 0w1
    val IS_LAUNCHER = 0w2
    val HANDLES_OPEN = 0w4
    val HANDLES_COMMAND_LINE = 0w8
    val SEND_ENVIRONMENT = 0w16
    val NON_UNIQUE = 0w32
    val allFlags =
      [
        FLAGS_NONE,
        IS_SERVICE,
        IS_LAUNCHER,
        HANDLES_OPEN,
        HANDLES_COMMAND_LINE,
        SEND_ENVIRONMENT,
        NON_UNIQUE
      ]
    structure Flags =
      Flags(
        val allFlags = allFlags
      )
    open Flags
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_application_flags_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_flags") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_flags") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
