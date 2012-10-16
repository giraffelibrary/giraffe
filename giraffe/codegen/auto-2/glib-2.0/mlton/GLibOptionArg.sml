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
    | STRINGARRAY
    | FILENAMEARRAY
    | DOUBLE
    | INT64
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NONE => f 0
          | STRING => f 1
          | INT => f 2
          | CALLBACK => f 3
          | FILENAME => f 4
          | STRINGARRAY => f 5
          | FILENAMEARRAY => f 6
          | DOUBLE => f 7
          | INT64 => f 8
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => STRING
          | 2 => INT
          | 3 => CALLBACK
          | 4 => FILENAME
          | 5 => STRINGARRAY
          | 6 => FILENAMEARRAY
          | 7 => DOUBLE
          | 8 => INT64
          | n => raise Value n
      end
    val null = NONE
  end
