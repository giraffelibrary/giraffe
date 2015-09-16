signature G_LIB_SLICE_CONFIG =
  sig
    datatype t =
      ALWAYS_MALLOC
    | BYPASS_MAGAZINES
    | WORKING_SET_MSECS
    | COLOR_INCREMENT
    | CHUNK_SIZES
    | CONTENTION_COUNTER
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
