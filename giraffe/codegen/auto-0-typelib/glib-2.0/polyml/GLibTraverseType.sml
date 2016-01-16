structure GLibTraverseType :>
  sig
    include G_LIB_TRAVERSE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      IN_ORDER
    | PRE_ORDER
    | POST_ORDER
    | LEVEL_ORDER
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            IN_ORDER => f 0
          | PRE_ORDER => f 1
          | POST_ORDER => f 2
          | LEVEL_ORDER => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => IN_ORDER
          | 1 => PRE_ORDER
          | 2 => POST_ORDER
          | 3 => LEVEL_ORDER
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = IN_ORDER
  end
