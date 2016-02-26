structure GIRepositoryRepositoryError :>
  sig
    include G_I_REPOSITORY_REPOSITORY_ERROR
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      TYPELIB_NOT_FOUND
    | NAMESPACE_MISMATCH
    | NAMESPACE_VERSION_CONFLICT
    | LIBRARY_NOT_FOUND
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            TYPELIB_NOT_FOUND => f 0
          | NAMESPACE_MISMATCH => f 1
          | NAMESPACE_VERSION_CONFLICT => f 2
          | LIBRARY_NOT_FOUND => f 3
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => TYPELIB_NOT_FOUND
          | 1 => NAMESPACE_MISMATCH
          | 2 => NAMESPACE_VERSION_CONFLICT
          | 3 => LIBRARY_NOT_FOUND
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = TYPELIB_NOT_FOUND
  end
