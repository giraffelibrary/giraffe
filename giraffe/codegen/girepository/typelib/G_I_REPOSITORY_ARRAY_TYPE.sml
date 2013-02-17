signature G_I_REPOSITORY_ARRAY_TYPE =
  sig
    datatype t =
      C
    | ARRAY
    | PTR_ARRAY
    | BYTE_ARRAY
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
