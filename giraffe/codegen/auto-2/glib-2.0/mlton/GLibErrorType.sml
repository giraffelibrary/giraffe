structure GLibErrorType :>
  sig
    include G_LIB_ERROR_TYPE
  end =
  struct
    datatype t =
      UNKNOWN
    | UNEXPEOF
    | UNEXPEOFINSTRING
    | UNEXPEOFINCOMMENT
    | NONDIGITINCONST
    | DIGITRADIX
    | FLOATRADIX
    | FLOATMALFORMED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | UNEXPEOF => f 1
          | UNEXPEOFINSTRING => f 2
          | UNEXPEOFINCOMMENT => f 3
          | NONDIGITINCONST => f 4
          | DIGITRADIX => f 5
          | FLOATRADIX => f 6
          | FLOATMALFORMED => f 7
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => UNEXPEOF
          | 2 => UNEXPEOFINSTRING
          | 3 => UNEXPEOFINCOMMENT
          | 4 => NONDIGITINCONST
          | 5 => DIGITRADIX
          | 6 => FLOATRADIX
          | 7 => FLOATMALFORMED
          | n => raise Value n
      end
    val null = UNKNOWN
  end
