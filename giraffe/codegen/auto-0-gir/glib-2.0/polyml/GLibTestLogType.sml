structure GLibTestLogType :>
  sig
    include G_LIB_TEST_LOG_TYPE
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NONE
    | ERROR
    | START_BINARY
    | LIST_CASE
    | SKIP_CASE
    | START_CASE
    | STOP_CASE
    | MIN_RESULT
    | MAX_RESULT
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
          | START_BINARY => f 2
          | LIST_CASE => f 3
          | SKIP_CASE => f 4
          | START_CASE => f 5
          | STOP_CASE => f 6
          | MIN_RESULT => f 7
          | MAX_RESULT => f 8
          | MESSAGE => f 9
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => ERROR
          | 2 => START_BINARY
          | 3 => LIST_CASE
          | 4 => SKIP_CASE
          | 5 => START_CASE
          | 6 => STOP_CASE
          | 7 => MIN_RESULT
          | 8 => MAX_RESULT
          | 9 => MESSAGE
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = NONE
  end
