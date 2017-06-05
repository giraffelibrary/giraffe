signature GIO_I_O_ERROR_ENUM =
  sig
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
    include
      ENUM
        where type t = enum
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
