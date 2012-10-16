structure GLibTestLogType :>
  sig
    include G_LIB_TEST_LOG_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NONE
    | ERROR
    | STARTBINARY
    | LISTCASE
    | SKIPCASE
    | STARTCASE
    | STOPCASE
    | MINRESULT
    | MAXRESULT
    | MESSAGE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | ERROR => f 1
          | STARTBINARY => f 2
          | LISTCASE => f 3
          | SKIPCASE => f 4
          | STARTCASE => f 5
          | STOPCASE => f 6
          | MINRESULT => f 7
          | MAXRESULT => f 8
          | MESSAGE => f 9
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => ERROR
          | 2 => STARTBINARY
          | 3 => LISTCASE
          | 4 => SKIPCASE
          | 5 => STARTCASE
          | 6 => STOPCASE
          | 7 => MINRESULT
          | 8 => MAXRESULT
          | 9 => MESSAGE
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = NONE
  end
