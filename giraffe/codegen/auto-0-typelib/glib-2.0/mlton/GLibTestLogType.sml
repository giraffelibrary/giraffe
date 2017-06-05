structure GLibTestLogType :> G_LIB_TEST_LOG_TYPE =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | ERROR => 1
          | START_BINARY => 2
          | LIST_CASE => 3
          | SKIP_CASE => 4
          | START_CASE => 5
          | STOP_CASE => 6
          | MIN_RESULT => 7
          | MAX_RESULT => 8
          | MESSAGE => 9
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
