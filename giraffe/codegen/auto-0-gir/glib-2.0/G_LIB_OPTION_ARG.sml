signature G_LIB_OPTION_ARG =
  sig
    datatype t =
      NONE
    | STRING
    | INT
    | CALLBACK
    | FILENAME
    | STRING_ARRAY
    | FILENAME_ARRAY
    | DOUBLE
    | INT_64
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
