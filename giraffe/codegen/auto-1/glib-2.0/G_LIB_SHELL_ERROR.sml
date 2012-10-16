signature G_LIB_SHELL_ERROR =
  sig
    datatype t =
      BADQUOTING
    | EMPTYSTRING
    | FAILED
    exception Error of t
    type errorrecord_handler
    val handler : errorrecord_handler
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
        exception Value of FFI.Enum.val_
      end
  end
