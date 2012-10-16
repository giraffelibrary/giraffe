signature G_LIB_VARIANT_CLASS =
  sig
    datatype t =
      BOOLEAN
    | BYTE
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | HANDLE
    | DOUBLE
    | STRING
    | OBJECTPATH
    | SIGNATURE
    | VARIANT
    | MAYBE
    | ARRAY
    | TUPLE
    | DICTENTRY
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
