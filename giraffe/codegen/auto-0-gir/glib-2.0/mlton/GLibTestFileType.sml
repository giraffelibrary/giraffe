structure GLibTestFileType :> G_LIB_TEST_FILE_TYPE =
  struct
    datatype enum =
      DIST
    | BUILT
    structure Enum =
      Enum(
        type enum = enum
        val null = DIST
        val toInt =
          fn
            DIST => 0
          | BUILT => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => DIST
          | 1 => BUILT
          | n => raise Value n
      )
    open Enum
  end
