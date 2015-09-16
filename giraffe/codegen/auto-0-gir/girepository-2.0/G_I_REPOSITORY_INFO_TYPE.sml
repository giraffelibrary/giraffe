signature G_I_REPOSITORY_INFO_TYPE =
  sig
    datatype t =
      INVALID
    | FUNCTION
    | CALLBACK
    | STRUCT
    | BOXED
    | ENUM
    | FLAGS
    | OBJECT
    | INTERFACE
    | CONSTANT
    | INVALID_0
    | UNION
    | VALUE
    | SIGNAL
    | VFUNC
    | PROPERTY
    | FIELD
    | ARG
    | TYPE
    | UNRESOLVED
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
