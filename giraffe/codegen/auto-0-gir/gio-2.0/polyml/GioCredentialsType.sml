structure GioCredentialsType :> GIO_CREDENTIALS_TYPE =
  struct
    datatype enum =
      INVALID
    | LINUX_UCRED
    | FREEBSD_CMSGCRED
    | OPENBSD_SOCKPEERCRED
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
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => LINUX_UCRED
          | 2 => FREEBSD_CMSGCRED
          | 3 => OPENBSD_SOCKPEERCRED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_credentials_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
