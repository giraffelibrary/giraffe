signature G_LIB_VARIANT_CLASS =
  sig
    datatype t =
      BOOLEAN
    | BYTE
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | HANDLE
    | DOUBLE
    | STRING
    | OBJECT_PATH
    | SIGNATURE
    | VARIANT
    | MAYBE
    | ARRAY
    | TUPLE
    | DICT_ENTRY
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
