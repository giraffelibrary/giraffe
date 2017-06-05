structure GLibTimeType :> G_LIB_TIME_TYPE =
  struct
    datatype enum =
      STANDARD
    | DAYLIGHT
    | UNIVERSAL
    structure Enum =
      Enum(
        type enum = enum
        val null = STANDARD
        val toInt =
          fn
            STANDARD => 0
          | DAYLIGHT => 1
          | UNIVERSAL => 2
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => STANDARD
          | 1 => DAYLIGHT
          | 2 => UNIVERSAL
          | n => raise Value n
      )
    open Enum
  end
