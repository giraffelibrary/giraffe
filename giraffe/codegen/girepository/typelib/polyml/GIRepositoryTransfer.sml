structure GIRepositoryTransfer :>
  sig
    include G_I_REPOSITORY_TRANSFER
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct 
    datatype t =
      NOTHING
    | CONTAINER
    | EVERYTHING
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NOTHING => f 0
          | CONTAINER => f 1
          | EVERYTHING => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NOTHING
          | 1 => CONTAINER
          | 2 => EVERYTHING
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
  end