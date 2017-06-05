structure GLibDateMonth :> G_LIB_DATE_MONTH =
  struct
    datatype enum =
      BAD_MONTH
    | JANUARY
    | FEBRUARY
    | MARCH
    | APRIL
    | MAY
    | JUNE
    | JULY
    | AUGUST
    | SEPTEMBER
    | OCTOBER
    | NOVEMBER
    | DECEMBER
    structure Enum =
      Enum(
        type enum = enum
        val null = BAD_MONTH
        val toInt =
          fn
            BAD_MONTH => 0
          | JANUARY => 1
          | FEBRUARY => 2
          | MARCH => 3
          | APRIL => 4
          | MAY => 5
          | JUNE => 6
          | JULY => 7
          | AUGUST => 8
          | SEPTEMBER => 9
          | OCTOBER => 10
          | NOVEMBER => 11
          | DECEMBER => 12
        exception Value of GInt.t
        val fromInt =
          fn
            0 => BAD_MONTH
          | 1 => JANUARY
          | 2 => FEBRUARY
          | 3 => MARCH
          | 4 => APRIL
          | 5 => MAY
          | 6 => JUNE
          | 7 => JULY
          | 8 => AUGUST
          | 9 => SEPTEMBER
          | 10 => OCTOBER
          | 11 => NOVEMBER
          | 12 => DECEMBER
          | n => raise Value n
      )
    open Enum
  end
