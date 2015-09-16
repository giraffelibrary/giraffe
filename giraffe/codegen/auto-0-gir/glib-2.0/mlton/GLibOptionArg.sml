structure GLibOptionArg :>
  sig
    include G_LIB_OPTION_ARG
  end =
  struct
    datatype t =
      NONE
    | STRING
    | INT
    | CALLBACK
    | FILENAME
    | STRING_ARRAY
    | FILENAME_ARRAY
    | DOUBLE
    | INT_64
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONE => f 0
          | STRING => f 1
          | INT => f 2
          | CALLBACK => f 3
          | FILENAME => f 4
          | STRING_ARRAY => f 5
          | FILENAME_ARRAY => f 6
          | DOUBLE => f 7
          | INT_64 => f 8
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => STRING
          | 2 => INT
          | 3 => CALLBACK
          | 4 => FILENAME
          | 5 => STRING_ARRAY
          | 6 => FILENAME_ARRAY
          | 7 => DOUBLE
          | 8 => INT_64
          | n => raise Value n
      end
    val null = NONE
  end
