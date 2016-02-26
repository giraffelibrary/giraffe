structure GLibIOError :>
  sig
    include G_LIB_I_O_ERROR
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NONE
    | AGAIN
    | INVAL
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONE => f 0
          | AGAIN => f 1
          | INVAL => f 2
          | UNKNOWN => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => AGAIN
          | 2 => INVAL
          | 3 => UNKNOWN
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = NONE
  end
