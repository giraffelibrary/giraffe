structure GLibDateWeekday :> G_LIB_DATE_WEEKDAY =
  struct
    datatype enum =
      BAD_WEEKDAY
    | MONDAY
    | TUESDAY
    | WEDNESDAY
    | THURSDAY
    | FRIDAY
    | SATURDAY
    | SUNDAY
    structure Enum =
      Enum(
        type enum = enum
        val null = BAD_WEEKDAY
        val toInt =
          fn
            BAD_WEEKDAY => 0
          | MONDAY => 1
          | TUESDAY => 2
          | WEDNESDAY => 3
          | THURSDAY => 4
          | FRIDAY => 5
          | SATURDAY => 6
          | SUNDAY => 7
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => BAD_WEEKDAY
          | 1 => MONDAY
          | 2 => TUESDAY
          | 3 => WEDNESDAY
          | 4 => THURSDAY
          | 5 => FRIDAY
          | 6 => SATURDAY
          | 7 => SUNDAY
          | n => raise Value n
      )
    open Enum
  end
