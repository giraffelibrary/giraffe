structure GioIOErrorEnum :> GIO_I_O_ERROR_ENUM =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = FAILED
        val toInt =
          fn
            FAILED => 0
          | NOT_FOUND => 1
          | EXISTS => 2
          | IS_DIRECTORY => 3
          | NOT_DIRECTORY => 4
          | NOT_EMPTY => 5
          | NOT_REGULAR_FILE => 6
          | NOT_SYMBOLIC_LINK => 7
          | NOT_MOUNTABLE_FILE => 8
          | FILENAME_TOO_LONG => 9
          | INVALID_FILENAME => 10
          | TOO_MANY_LINKS => 11
          | NO_SPACE => 12
          | INVALID_ARGUMENT => 13
          | PERMISSION_DENIED => 14
          | NOT_SUPPORTED => 15
          | NOT_MOUNTED => 16
          | ALREADY_MOUNTED => 17
          | CLOSED => 18
          | CANCELLED => 19
          | PENDING => 20
          | READ_ONLY => 21
          | CANT_CREATE_BACKUP => 22
          | WRONG_ETAG => 23
          | TIMED_OUT => 24
          | WOULD_RECURSE => 25
          | BUSY => 26
          | WOULD_BLOCK => 27
          | HOST_NOT_FOUND => 28
          | WOULD_MERGE => 29
          | FAILED_HANDLED => 30
          | TOO_MANY_OPEN_FILES => 31
          | NOT_INITIALIZED => 32
          | ADDRESS_IN_USE => 33
          | PARTIAL_INPUT => 34
          | INVALID_DATA => 35
          | DBUS_ERROR => 36
          | HOST_UNREACHABLE => 37
          | NETWORK_UNREACHABLE => 38
          | CONNECTION_REFUSED => 39
          | PROXY_FAILED => 40
          | PROXY_AUTH_FAILED => 41
          | PROXY_NEED_AUTH => 42
          | PROXY_NOT_ALLOWED => 43
        exception Value of GInt.t
        val fromInt =
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
      )
    open Enum
    val getType_ = _import "g_io_error_enum_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-io-error-quark",
          FFI.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
exception GioIOErrorEnum = GioIOErrorEnum.Error
