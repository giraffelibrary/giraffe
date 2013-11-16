structure GIRepositoryNvokeError :>
  sig
    include G_I_REPOSITORY_NVOKE_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      FAILED
    | SYMBOLNOTFOUND
    | ARGUMENTMISMATCH
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            FAILED => f 0
          | SYMBOLNOTFOUND => f 1
          | ARGUMENTMISMATCH => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => FAILED
          | 1 => SYMBOLNOTFOUND
          | 2 => ARGUMENTMISMATCH
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-invoke-error-quark",
          C.fromVal,
          Error
        )
  end
exception GIRepositoryNvokeError = GIRepositoryNvokeError.Error
