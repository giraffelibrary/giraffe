structure GIRepositoryInfoType :> G_I_REPOSITORY_INFO_TYPE =
  struct
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
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | FUNCTION => 1
          | CALLBACK => 2
          | STRUCT => 3
          | BOXED => 4
          | ENUM => 5
          | FLAGS => 6
          | OBJECT => 7
          | INTERFACE => 8
          | CONSTANT => 9
          | INVALID_0 => 10
          | UNION => 11
          | VALUE => 12
          | SIGNAL => 13
          | VFUNC => 14
          | PROPERTY => 15
          | FIELD => 16
          | ARG => 17
          | TYPE => 18
          | UNRESOLVED => 19
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => FUNCTION
          | 2 => CALLBACK
          | 3 => STRUCT
          | 4 => BOXED
          | 5 => ENUM
          | 6 => FLAGS
          | 7 => OBJECT
          | 8 => INTERFACE
          | 9 => CONSTANT
          | 10 => INVALID_0
          | 11 => UNION
          | 12 => VALUE
          | 13 => SIGNAL
          | 14 => VFUNC
          | 15 => PROPERTY
          | 16 => FIELD
          | 17 => ARG
          | 18 => TYPE
          | 19 => UNRESOLVED
          | n => raise Value n
      )
    open Enum
  end
