signature G_LIB_ERROR_TYPE =
  sig
    datatype t =
      UNKNOWN
    | UNEXPEOF
    | UNEXPEOFINSTRING
    | UNEXPEOFINCOMMENT
    | NONDIGITINCONST
    | DIGITRADIX
    | FLOATRADIX
    | FLOATMALFORMED
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
