structure GLibTestLogType :>
  sig
    include G_LIB_TEST_LOG_TYPE
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
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
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
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
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
    val null = NONE
  end
