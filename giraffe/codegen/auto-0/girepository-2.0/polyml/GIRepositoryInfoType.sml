structure GIRepositoryInfoType :>
  sig
    include G_I_REPOSITORY_INFO_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
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
    | INVALID0
    | UNION
    | VALUE
    | SIGNAL
    | VFUNC
    | PROPERTY
    | FIELD
    | ARG
    | TYPE
    | UNRESOLVED
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | FUNCTION => f 1
          | CALLBACK => f 2
          | STRUCT => f 3
          | BOXED => f 4
          | ENUM => f 5
          | FLAGS => f 6
          | OBJECT => f 7
          | INTERFACE => f 8
          | CONSTANT => f 9
          | INVALID0 => f 10
          | UNION => f 11
          | VALUE => f 12
          | SIGNAL => f 13
          | VFUNC => f 14
          | PROPERTY => f 15
          | FIELD => f 16
          | ARG => f 17
          | TYPE => f 18
          | UNRESOLVED => f 19
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
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
          | 10 => INVALID0
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
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = INVALID
  end
