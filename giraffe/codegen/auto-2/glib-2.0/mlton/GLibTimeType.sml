structure GLibTimeType :>
  sig
    include G_LIB_TIME_TYPE
  end =
  struct
    datatype t =
      STANDARD
    | DAYLIGHT
    | UNIVERSAL
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            STANDARD => f 0
          | DAYLIGHT => f 1
          | UNIVERSAL => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => STANDARD
          | 1 => DAYLIGHT
          | 2 => UNIVERSAL
          | n => raise Value n
      end
    val null = STANDARD
  end
