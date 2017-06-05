structure GLibOptionArg :> G_LIB_OPTION_ARG =
  struct
    datatype enum =
      NONE
    | STRING
    | INT
    | CALLBACK
    | FILENAME
    | STRING_ARRAY
    | FILENAME_ARRAY
    | DOUBLE
    | INT_64
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | STRING => 1
          | INT => 2
          | CALLBACK => 3
          | FILENAME => 4
          | STRING_ARRAY => 5
          | FILENAME_ARRAY => 6
          | DOUBLE => 7
          | INT_64 => 8
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
