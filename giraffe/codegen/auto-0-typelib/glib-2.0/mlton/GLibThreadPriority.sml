structure GLibThreadPriority :> G_LIB_THREAD_PRIORITY =
  struct
    datatype enum =
      LOW
    | NORMAL
    | HIGH
    | URGENT
    structure Enum =
      Enum(
        type enum = enum
        val null = LOW
        val toInt =
          fn
            LOW => 0
          | NORMAL => 1
          | HIGH => 2
          | URGENT => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => LOW
          | 1 => NORMAL
          | 2 => HIGH
          | 3 => URGENT
          | n => raise Value n
      )
    open Enum
  end
