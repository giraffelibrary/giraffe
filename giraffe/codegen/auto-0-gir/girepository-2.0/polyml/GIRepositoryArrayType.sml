structure GIRepositoryArrayType :>
  sig
    include G_I_REPOSITORY_ARRAY_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            C => f 0
          | ARRAY => f 1
          | PTR_ARRAY => f 2
          | BYTE_ARRAY => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => C
          | 1 => ARRAY
          | 2 => PTR_ARRAY
          | 3 => BYTE_ARRAY
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = C
  end
