structure GIRepositoryRepositoryError :>
  sig
    include G_I_REPOSITORY_REPOSITORY_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      TYPELIBNOTFOUND
    | NAMESPACEMISMATCH
    | NAMESPACEVERSIONCONFLICT
    | LIBRARYNOTFOUND
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            TYPELIBNOTFOUND => f 0
          | NAMESPACEMISMATCH => f 1
          | NAMESPACEVERSIONCONFLICT => f 2
          | LIBRARYNOTFOUND => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => TYPELIBNOTFOUND
          | 1 => NAMESPACEMISMATCH
          | 2 => NAMESPACEVERSIONCONFLICT
          | 3 => LIBRARYNOTFOUND
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = TYPELIBNOTFOUND
  end
