structure GLibDateDMY :> G_LIB_DATE_D_M_Y =
  struct
    datatype enum =
      DAY
    | MONTH
    | YEAR
    structure Enum =
      Enum(
        type enum = enum
        val null = DAY
        val toInt =
          fn
            DAY => 0
          | MONTH => 1
          | YEAR => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => DAY
          | 1 => MONTH
          | 2 => YEAR
          | n => raise Value n
      )
    open Enum
  end
