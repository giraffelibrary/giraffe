structure GLibOptionError :>
  sig
    include
      G_LIB_OPTION_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      UNKNOWNOPTION
    | BADVALUE
    | FAILED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWNOPTION => f 0
          | BADVALUE => f 1
          | FAILED => f 2
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWNOPTION
          | 1 => BADVALUE
          | 2 => FAILED
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g-option-context-error-quark",
          C.fromVal,
          Error
        )
  end
exception GLibOptionError = GLibOptionError.Error
