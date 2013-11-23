structure GLibConvertError :>
  sig
    include
      G_LIB_CONVERT_ERROR
        where type errorrecord_handler = GLibErrorRecord.handler
  end =
  struct
    datatype t =
      NOCONVERSION
    | ILLEGALSEQUENCE
    | FAILED
    | PARTIALINPUT
    | BADURI
    | NOTABSOLUTEPATH
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NOCONVERSION => f 0
          | ILLEGALSEQUENCE => f 1
          | FAILED => f 2
          | PARTIALINPUT => f 3
          | BADURI => f 4
          | NOTABSOLUTEPATH => f 5
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NOCONVERSION
          | 1 => ILLEGALSEQUENCE
          | 2 => FAILED
          | 3 => PARTIALINPUT
          | 4 => BADURI
          | 5 => NOTABSOLUTEPATH
          | n => raise Value n
      end
    exception Error of t
    type errorrecord_handler = GLibErrorRecord.handler
    val handler =
      GLibErrorRecord.makeHandler
        (
          "g_convert_error",
          C.fromVal,
          Error
        )
  end
exception GLibConvertError = GLibConvertError.Error
