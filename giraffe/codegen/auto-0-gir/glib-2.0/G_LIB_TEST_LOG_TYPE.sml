signature G_LIB_TEST_LOG_TYPE =
  sig
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
    val null : t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
