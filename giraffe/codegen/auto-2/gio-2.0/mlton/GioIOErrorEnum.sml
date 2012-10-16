structure GioIOErrorEnum :>
  sig
    include GIO_I_O_ERROR_ENUM
  end =
  struct
    datatype t =
      FAILED
    | NOTFOUND
    | EXISTS
    | ISDIRECTORY
    | NOTDIRECTORY
    | NOTEMPTY
    | NOTREGULARFILE
    | NOTSYMBOLICLINK
    | NOTMOUNTABLEFILE
    | FILENAMETOOLONG
    | INVALIDFILENAME
    | TOOMANYLINKS
    | NOSPACE
    | INVALIDARGUMENT
    | PERMISSIONDENIED
    | NOTSUPPORTED
    | NOTMOUNTED
    | ALREADYMOUNTED
    | CLOSED
    | CANCELLED
    | PENDING
    | READONLY
    | CANTCREATEBACKUP
    | WRONGETAG
    | TIMEDOUT
    | WOULDRECURSE
    | BUSY
    | WOULDBLOCK
    | HOSTNOTFOUND
    | WOULDMERGE
    | FAILEDHANDLED
    | TOOMANYOPENFILES
    | NOTINITIALIZED
    | ADDRESSINUSE
    | PARTIALINPUT
    | INVALIDDATA
    | DBUSERROR
    | HOSTUNREACHABLE
    | NETWORKUNREACHABLE
    | CONNECTIONREFUSED
    | PROXYFAILED
    | PROXYAUTHFAILED
    | PROXYNEEDAUTH
    | PROXYNOTALLOWED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            FAILED => f 0
          | NOTFOUND => f 1
          | EXISTS => f 2
          | ISDIRECTORY => f 3
          | NOTDIRECTORY => f 4
          | NOTEMPTY => f 5
          | NOTREGULARFILE => f 6
          | NOTSYMBOLICLINK => f 7
          | NOTMOUNTABLEFILE => f 8
          | FILENAMETOOLONG => f 9
          | INVALIDFILENAME => f 10
          | TOOMANYLINKS => f 11
          | NOSPACE => f 12
          | INVALIDARGUMENT => f 13
          | PERMISSIONDENIED => f 14
          | NOTSUPPORTED => f 15
          | NOTMOUNTED => f 16
          | ALREADYMOUNTED => f 17
          | CLOSED => f 18
          | CANCELLED => f 19
          | PENDING => f 20
          | READONLY => f 21
          | CANTCREATEBACKUP => f 22
          | WRONGETAG => f 23
          | TIMEDOUT => f 24
          | WOULDRECURSE => f 25
          | BUSY => f 26
          | WOULDBLOCK => f 27
          | HOSTNOTFOUND => f 28
          | WOULDMERGE => f 29
          | FAILEDHANDLED => f 30
          | TOOMANYOPENFILES => f 31
          | NOTINITIALIZED => f 32
          | ADDRESSINUSE => f 33
          | PARTIALINPUT => f 34
          | INVALIDDATA => f 35
          | DBUSERROR => f 36
          | HOSTUNREACHABLE => f 37
          | NETWORKUNREACHABLE => f 38
          | CONNECTIONREFUSED => f 39
          | PROXYFAILED => f 40
          | PROXYAUTHFAILED => f 41
          | PROXYNEEDAUTH => f 42
          | PROXYNOTALLOWED => f 43
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => NOTFOUND
          | 2 => EXISTS
          | 3 => ISDIRECTORY
          | 4 => NOTDIRECTORY
          | 5 => NOTEMPTY
          | 6 => NOTREGULARFILE
          | 7 => NOTSYMBOLICLINK
          | 8 => NOTMOUNTABLEFILE
          | 9 => FILENAMETOOLONG
          | 10 => INVALIDFILENAME
          | 11 => TOOMANYLINKS
          | 12 => NOSPACE
          | 13 => INVALIDARGUMENT
          | 14 => PERMISSIONDENIED
          | 15 => NOTSUPPORTED
          | 16 => NOTMOUNTED
          | 17 => ALREADYMOUNTED
          | 18 => CLOSED
          | 19 => CANCELLED
          | 20 => PENDING
          | 21 => READONLY
          | 22 => CANTCREATEBACKUP
          | 23 => WRONGETAG
          | 24 => TIMEDOUT
          | 25 => WOULDRECURSE
          | 26 => BUSY
          | 27 => WOULDBLOCK
          | 28 => HOSTNOTFOUND
          | 29 => WOULDMERGE
          | 30 => FAILEDHANDLED
          | 31 => TOOMANYOPENFILES
          | 32 => NOTINITIALIZED
          | 33 => ADDRESSINUSE
          | 34 => PARTIALINPUT
          | 35 => INVALIDDATA
          | 36 => DBUSERROR
          | 37 => HOSTUNREACHABLE
          | 38 => NETWORKUNREACHABLE
          | 39 => CONNECTIONREFUSED
          | 40 => PROXYFAILED
          | 41 => PROXYAUTHFAILED
          | 42 => PROXYNEEDAUTH
          | 43 => PROXYNOTALLOWED
          | n => raise Value n
      end
    val getType_ = _import "g_io_error_enum_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
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
