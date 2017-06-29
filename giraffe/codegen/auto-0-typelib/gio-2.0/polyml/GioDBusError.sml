structure GioDBusError :> GIO_D_BUS_ERROR =
  struct
    datatype enum =
      FAILED
    | NO_MEMORY
    | SERVICE_UNKNOWN
    | NAME_HAS_NO_OWNER
    | NO_REPLY
    | IO_ERROR
    | BAD_ADDRESS
    | NOT_SUPPORTED
    | LIMITS_EXCEEDED
    | ACCESS_DENIED
    | AUTH_FAILED
    | NO_SERVER
    | TIMEOUT
    | NO_NETWORK
    | ADDRESS_IN_USE
    | DISCONNECTED
    | INVALID_ARGS
    | FILE_NOT_FOUND
    | FILE_EXISTS
    | UNKNOWN_METHOD
    | TIMED_OUT
    | MATCH_RULE_NOT_FOUND
    | MATCH_RULE_INVALID
    | SPAWN_EXEC_FAILED
    | SPAWN_FORK_FAILED
    | SPAWN_CHILD_EXITED
    | SPAWN_CHILD_SIGNALED
    | SPAWN_FAILED
    | SPAWN_SETUP_FAILED
    | SPAWN_CONFIG_INVALID
    | SPAWN_SERVICE_INVALID
    | SPAWN_SERVICE_NOT_FOUND
    | SPAWN_PERMISSIONS_INVALID
    | SPAWN_FILE_INVALID
    | SPAWN_NO_MEMORY
    | UNIX_PROCESS_ID_UNKNOWN
    | INVALID_SIGNATURE
    | INVALID_FILE_CONTENT
    | SELINUX_SECURITY_CONTEXT_UNKNOWN
    | ADT_AUDIT_DATA_UNKNOWN
    | OBJECT_PATH_IN_USE
    structure Enum =
      Enum(
        type enum = enum
        val null = FAILED
        val toInt =
          fn
            FAILED => 0
          | NO_MEMORY => 1
          | SERVICE_UNKNOWN => 2
          | NAME_HAS_NO_OWNER => 3
          | NO_REPLY => 4
          | IO_ERROR => 5
          | BAD_ADDRESS => 6
          | NOT_SUPPORTED => 7
          | LIMITS_EXCEEDED => 8
          | ACCESS_DENIED => 9
          | AUTH_FAILED => 10
          | NO_SERVER => 11
          | TIMEOUT => 12
          | NO_NETWORK => 13
          | ADDRESS_IN_USE => 14
          | DISCONNECTED => 15
          | INVALID_ARGS => 16
          | FILE_NOT_FOUND => 17
          | FILE_EXISTS => 18
          | UNKNOWN_METHOD => 19
          | TIMED_OUT => 20
          | MATCH_RULE_NOT_FOUND => 21
          | MATCH_RULE_INVALID => 22
          | SPAWN_EXEC_FAILED => 23
          | SPAWN_FORK_FAILED => 24
          | SPAWN_CHILD_EXITED => 25
          | SPAWN_CHILD_SIGNALED => 26
          | SPAWN_FAILED => 27
          | SPAWN_SETUP_FAILED => 28
          | SPAWN_CONFIG_INVALID => 29
          | SPAWN_SERVICE_INVALID => 30
          | SPAWN_SERVICE_NOT_FOUND => 31
          | SPAWN_PERMISSIONS_INVALID => 32
          | SPAWN_FILE_INVALID => 33
          | SPAWN_NO_MEMORY => 34
          | UNIX_PROCESS_ID_UNKNOWN => 35
          | INVALID_SIGNATURE => 36
          | INVALID_FILE_CONTENT => 37
          | SELINUX_SECURITY_CONTEXT_UNKNOWN => 38
          | ADT_AUDIT_DATA_UNKNOWN => 39
          | OBJECT_PATH_IN_USE => 40
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FAILED
          | 1 => NO_MEMORY
          | 2 => SERVICE_UNKNOWN
          | 3 => NAME_HAS_NO_OWNER
          | 4 => NO_REPLY
          | 5 => IO_ERROR
          | 6 => BAD_ADDRESS
          | 7 => NOT_SUPPORTED
          | 8 => LIMITS_EXCEEDED
          | 9 => ACCESS_DENIED
          | 10 => AUTH_FAILED
          | 11 => NO_SERVER
          | 12 => TIMEOUT
          | 13 => NO_NETWORK
          | 14 => ADDRESS_IN_USE
          | 15 => DISCONNECTED
          | 16 => INVALID_ARGS
          | 17 => FILE_NOT_FOUND
          | 18 => FILE_EXISTS
          | 19 => UNKNOWN_METHOD
          | 20 => TIMED_OUT
          | 21 => MATCH_RULE_NOT_FOUND
          | 22 => MATCH_RULE_INVALID
          | 23 => SPAWN_EXEC_FAILED
          | 24 => SPAWN_FORK_FAILED
          | 25 => SPAWN_CHILD_EXITED
          | 26 => SPAWN_CHILD_SIGNALED
          | 27 => SPAWN_FAILED
          | 28 => SPAWN_SETUP_FAILED
          | 29 => SPAWN_CONFIG_INVALID
          | 30 => SPAWN_SERVICE_INVALID
          | 31 => SPAWN_SERVICE_NOT_FOUND
          | 32 => SPAWN_PERMISSIONS_INVALID
          | 33 => SPAWN_FILE_INVALID
          | 34 => SPAWN_NO_MEMORY
          | 35 => UNIX_PROCESS_ID_UNKNOWN
          | 36 => INVALID_SIGNATURE
          | 37 => INVALID_FILE_CONTENT
          | 38 => SELINUX_SECURITY_CONTEXT_UNKNOWN
          | 39 => ADT_AUDIT_DATA_UNKNOWN
          | 40 => OBJECT_PATH_IN_USE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_dbus_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
