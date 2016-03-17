signature G_LIB_SHELL_ERROR =
  sig
    datatype t =
      BAD_QUOTING
    | EMPTY_STRING
    | FAILED
    exception Error of t
    type error_handler
    val handler : error_handler
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
