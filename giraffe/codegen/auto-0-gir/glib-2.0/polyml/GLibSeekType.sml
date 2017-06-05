structure GLibSeekType :> G_LIB_SEEK_TYPE =
  struct
    datatype enum =
      CUR
    | SET
    | END
    structure Enum =
      Enum(
        type enum = enum
        val null = CUR
        val toInt =
          fn
            CUR => 0
          | SET => 1
          | END => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => CUR
          | 1 => SET
          | 2 => END
          | n => raise Value n
      )
    open Enum
  end
