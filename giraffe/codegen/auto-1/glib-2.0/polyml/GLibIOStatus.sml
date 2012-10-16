structure GLibIOStatus :>
  sig
    include G_LIB_I_O_STATUS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      ERROR
    | NORMAL
    | EOF
    | AGAIN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            ERROR => f 0
          | NORMAL => f 1
          | EOF => f 2
          | AGAIN => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => ERROR
          | 1 => NORMAL
          | 2 => EOF
          | 3 => AGAIN
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = ERROR
  end
