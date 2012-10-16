signature G_LIB_I_O_ERROR =
  sig
    datatype t =
      NONE
    | AGAIN
    | INVAL
    | UNKNOWN
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
        exception Value of FFI.Enum.val_
      end
  end
