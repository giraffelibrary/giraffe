signature G_I_REPOSITORY_INFO_TYPE =
  sig
    datatype enum =
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
    include
      ENUM
        where type t = enum
  end
