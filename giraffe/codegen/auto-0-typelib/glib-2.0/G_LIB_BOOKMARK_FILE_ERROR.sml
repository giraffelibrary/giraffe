signature G_LIB_BOOKMARK_FILE_ERROR =
  sig
    datatype t =
      INVALID_URI
    | INVALID_VALUE
    | APP_NOT_REGISTERED
    | URI_NOT_FOUND
    | READ
    | UNKNOWN_ENCODING
    | WRITE
    | FILE_NOT_FOUND
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
