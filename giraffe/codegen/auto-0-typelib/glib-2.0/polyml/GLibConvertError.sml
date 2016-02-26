structure GLibConvertError :>
  sig
    include
      G_LIB_CONVERT_ERROR
        where type error_record_handler = GLibErrorRecord.handler
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NO_CONVERSION
    | ILLEGAL_SEQUENCE
    | FAILED
    | PARTIAL_INPUT
    | BAD_URI
    | NOT_ABSOLUTE_PATH
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NO_CONVERSION => f 0
          | ILLEGAL_SEQUENCE => f 1
          | FAILED => f 2
          | PARTIAL_INPUT => f 3
          | BAD_URI => f 4
          | NOT_ABSOLUTE_PATH => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NO_CONVERSION
          | 1 => ILLEGAL_SEQUENCE
          | 2 => FAILED
          | 3 => PARTIAL_INPUT
          | 4 => BAD_URI
          | 5 => NOT_ABSOLUTE_PATH
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    exception Error of t
    type error_record_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_convert_error",
          C.fromVal,
          Error
        )
  end
exception GLibConvertError = GLibConvertError.Error
