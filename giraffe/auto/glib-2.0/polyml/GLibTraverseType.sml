structure GLibTraverseType :>
  sig
    include G_LIB_TRAVERSE_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INORDER
    | PREORDER
    | POSTORDER
    | LEVELORDER
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INORDER => f 0
          | PREORDER => f 1
          | POSTORDER => f 2
          | LEVELORDER => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INORDER
          | 1 => PREORDER
          | 2 => POSTORDER
          | 3 => LEVELORDER
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = INORDER
  end