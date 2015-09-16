signature G_LIB_KEY_FILE_ERROR =
  sig
    datatype t =
      UNKNOWN_ENCODING
    | PARSE
    | NOT_FOUND
    | KEY_NOT_FOUND
    | GROUP_NOT_FOUND
    | INVALID_VALUE
    exception Error of t
    type error_record_handler
    val handler : error_record_handler
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
