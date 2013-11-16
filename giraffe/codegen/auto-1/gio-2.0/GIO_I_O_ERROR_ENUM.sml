signature GIO_I_O_ERROR_ENUM =
  sig
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
    exception Error of t
    val handler : GLib.ErrorRecord.handler
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
