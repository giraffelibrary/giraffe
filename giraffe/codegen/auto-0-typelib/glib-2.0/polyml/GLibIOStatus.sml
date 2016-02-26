structure GLibIOStatus :>
  sig
    include G_LIB_I_O_STATUS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ERROR => f 0
          | NORMAL => f 1
          | EOF => f 2
          | AGAIN => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = ERROR
  end
