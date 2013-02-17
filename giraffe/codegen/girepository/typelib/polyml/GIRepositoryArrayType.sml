structure GIRepositoryArrayType :>
  sig
    include G_I_REPOSITORY_ARRAY_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
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
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            C => f 0
          | ARRAY => f 1
          | PTR_ARRAY => f 2
          | BYTE_ARRAY => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
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
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end
