signature G_LIB_ERROR_TYPE =
  sig
    datatype t =
      UNKNOWN
    | UNEXP_EOF
    | UNEXP_EOF_IN_STRING
    | UNEXP_EOF_IN_COMMENT
    | NON_DIGIT_IN_CONST
    | DIGIT_RADIX
    | FLOAT_RADIX
    | FLOAT_MALFORMED
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
