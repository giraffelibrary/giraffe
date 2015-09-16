signature G_I_REPOSITORY_TYPE_TAG =
  sig
    datatype t =
      VOID
    | BOOLEAN
    | INT_8
    | UINT_8
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF_8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
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
