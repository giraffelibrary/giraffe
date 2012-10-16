signature G_LIB_CONVERT_ERROR =
  sig
    datatype t =
      NOCONVERSION
    | ILLEGALSEQUENCE
    | FAILED
    | PARTIALINPUT
    | BADURI
    | NOTABSOLUTEPATH
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
