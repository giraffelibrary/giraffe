structure GioIOErrorEnum :>
  sig
    include GIO_I_O_ERROR_ENUM
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      FAILED
    | NOT_FOUND
    | EXISTS
    | IS_DIRECTORY
    | NOT_DIRECTORY
    | NOT_EMPTY
    | NOT_REGULAR_FILE
    | NOT_SYMBOLIC_LINK
    | NOT_MOUNTABLE_FILE
    | FILENAME_TOO_LONG
    | INVALID_FILENAME
    | TOO_MANY_LINKS
    | NO_SPACE
    | INVALID_ARGUMENT
    | PERMISSION_DENIED
    | NOT_SUPPORTED
    | NOT_MOUNTED
    | ALREADY_MOUNTED
    | CLOSED
    | CANCELLED
    | PENDING
    | READ_ONLY
    | CANT_CREATE_BACKUP
    | WRONG_ETAG
    | TIMED_OUT
    | WOULD_RECURSE
    | BUSY
    | WOULD_BLOCK
    | HOST_NOT_FOUND
    | WOULD_MERGE
    | FAILED_HANDLED
    | TOO_MANY_OPEN_FILES
    | NOT_INITIALIZED
    | ADDRESS_IN_USE
    | PARTIAL_INPUT
    | INVALID_DATA
    | DBUS_ERROR
    | HOST_UNREACHABLE
    | NETWORK_UNREACHABLE
    | CONNECTION_REFUSED
    | PROXY_FAILED
    | PROXY_AUTH_FAILED
    | PROXY_NEED_AUTH
    | PROXY_NOT_ALLOWED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | NOT_FOUND => f 1
          | EXISTS => f 2
          | IS_DIRECTORY => f 3
          | NOT_DIRECTORY => f 4
          | NOT_EMPTY => f 5
          | NOT_REGULAR_FILE => f 6
          | NOT_SYMBOLIC_LINK => f 7
          | NOT_MOUNTABLE_FILE => f 8
          | FILENAME_TOO_LONG => f 9
          | INVALID_FILENAME => f 10
          | TOO_MANY_LINKS => f 11
          | NO_SPACE => f 12
          | INVALID_ARGUMENT => f 13
          | PERMISSION_DENIED => f 14
          | NOT_SUPPORTED => f 15
          | NOT_MOUNTED => f 16
          | ALREADY_MOUNTED => f 17
          | CLOSED => f 18
          | CANCELLED => f 19
          | PENDING => f 20
          | READ_ONLY => f 21
          | CANT_CREATE_BACKUP => f 22
          | WRONG_ETAG => f 23
          | TIMED_OUT => f 24
          | WOULD_RECURSE => f 25
          | BUSY => f 26
          | WOULD_BLOCK => f 27
          | HOST_NOT_FOUND => f 28
          | WOULD_MERGE => f 29
          | FAILED_HANDLED => f 30
          | TOO_MANY_OPEN_FILES => f 31
          | NOT_INITIALIZED => f 32
          | ADDRESS_IN_USE => f 33
          | PARTIAL_INPUT => f 34
          | INVALID_DATA => f 35
          | DBUS_ERROR => f 36
          | HOST_UNREACHABLE => f 37
          | NETWORK_UNREACHABLE => f 38
          | CONNECTION_REFUSED => f 39
          | PROXY_FAILED => f 40
          | PROXY_AUTH_FAILED => f 41
          | PROXY_NEED_AUTH => f 42
          | PROXY_NOT_ALLOWED => f 43
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => NOT_FOUND
          | 2 => EXISTS
          | 3 => IS_DIRECTORY
          | 4 => NOT_DIRECTORY
          | 5 => NOT_EMPTY
          | 6 => NOT_REGULAR_FILE
          | 7 => NOT_SYMBOLIC_LINK
          | 8 => NOT_MOUNTABLE_FILE
          | 9 => FILENAME_TOO_LONG
          | 10 => INVALID_FILENAME
          | 11 => TOO_MANY_LINKS
          | 12 => NO_SPACE
          | 13 => INVALID_ARGUMENT
          | 14 => PERMISSION_DENIED
          | 15 => NOT_SUPPORTED
          | 16 => NOT_MOUNTED
          | 17 => ALREADY_MOUNTED
          | 18 => CLOSED
          | 19 => CANCELLED
          | 20 => PENDING
          | 21 => READ_ONLY
          | 22 => CANT_CREATE_BACKUP
          | 23 => WRONG_ETAG
          | 24 => TIMED_OUT
          | 25 => WOULD_RECURSE
          | 26 => BUSY
          | 27 => WOULD_BLOCK
          | 28 => HOST_NOT_FOUND
          | 29 => WOULD_MERGE
          | 30 => FAILED_HANDLED
          | 31 => TOO_MANY_OPEN_FILES
          | 32 => NOT_INITIALIZED
          | 33 => ADDRESS_IN_USE
          | 34 => PARTIAL_INPUT
          | 35 => INVALID_DATA
          | 36 => DBUS_ERROR
          | 37 => HOST_UNREACHABLE
          | 38 => NETWORK_UNREACHABLE
          | 39 => CONNECTION_REFUSED
          | 40 => PROXY_FAILED
          | 41 => PROXY_AUTH_FAILED
          | 42 => PROXY_NEED_AUTH
          | 43 => PROXY_NOT_ALLOWED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_io_error_enum_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-io-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GioIOErrorEnum = GioIOErrorEnum.Error
