structure GioDBusError :>
  sig
    include GIO_D_BUS_ERROR
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
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
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | NO_MEMORY => f 1
          | SERVICE_UNKNOWN => f 2
          | NAME_HAS_NO_OWNER => f 3
          | NO_REPLY => f 4
          | IO_ERROR => f 5
          | BAD_ADDRESS => f 6
          | NOT_SUPPORTED => f 7
          | LIMITS_EXCEEDED => f 8
          | ACCESS_DENIED => f 9
          | AUTH_FAILED => f 10
          | NO_SERVER => f 11
          | TIMEOUT => f 12
          | NO_NETWORK => f 13
          | ADDRESS_IN_USE => f 14
          | DISCONNECTED => f 15
          | INVALID_ARGS => f 16
          | FILE_NOT_FOUND => f 17
          | FILE_EXISTS => f 18
          | UNKNOWN_METHOD => f 19
          | TIMED_OUT => f 20
          | MATCH_RULE_NOT_FOUND => f 21
          | MATCH_RULE_INVALID => f 22
          | SPAWN_EXEC_FAILED => f 23
          | SPAWN_FORK_FAILED => f 24
          | SPAWN_CHILD_EXITED => f 25
          | SPAWN_CHILD_SIGNALED => f 26
          | SPAWN_FAILED => f 27
          | SPAWN_SETUP_FAILED => f 28
          | SPAWN_CONFIG_INVALID => f 29
          | SPAWN_SERVICE_INVALID => f 30
          | SPAWN_SERVICE_NOT_FOUND => f 31
          | SPAWN_PERMISSIONS_INVALID => f 32
          | SPAWN_FILE_INVALID => f 33
          | SPAWN_NO_MEMORY => f 34
          | UNIX_PROCESS_ID_UNKNOWN => f 35
          | INVALID_SIGNATURE => f 36
          | INVALID_FILE_CONTENT => f 37
          | SELINUX_SECURITY_CONTEXT_UNKNOWN => f 38
          | ADT_AUDIT_DATA_UNKNOWN => f 39
          | OBJECT_PATH_IN_USE => f 40
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
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
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_dbus_error_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = FAILED
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
