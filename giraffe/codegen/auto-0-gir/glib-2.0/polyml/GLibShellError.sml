structure GLibShellError :>
  sig
    include
      G_LIB_SHELL_ERROR
        where type error_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      BAD_QUOTING
    | EMPTY_STRING
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BAD_QUOTING => f 0
          | EMPTY_STRING => f 1
          | FAILED => f 2
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => BAD_QUOTING
          | 1 => EMPTY_STRING
          | 2 => FAILED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    exception Error of t
    type error_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-shell-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibShellError = GLibShellError.Error
