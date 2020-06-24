structure GioCredentialsType :> GIO_CREDENTIALS_TYPE =
  struct
    datatype enum =
      INVALID
    | LINUX_UCRED
    | FREEBSD_CMSGCRED
    | OPENBSD_SOCKPEERCRED
    | SOLARIS_UCRED
    | NETBSD_UNPCBID
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | LINUX_UCRED => 1
          | FREEBSD_CMSGCRED => 2
          | OPENBSD_SOCKPEERCRED => 3
          | SOLARIS_UCRED => 4
          | NETBSD_UNPCBID => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => LINUX_UCRED
          | 2 => FREEBSD_CMSGCRED
          | 3 => OPENBSD_SOCKPEERCRED
          | 4 => SOLARIS_UCRED
          | 5 => NETBSD_UNPCBID
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "g_credentials_type_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
