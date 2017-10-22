signature G_LIB_TEST_LOG_TYPE =
  sig
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
    | START_SUITE
    | STOP_SUITE
    include
      ENUM
        where type t = enum
  end
