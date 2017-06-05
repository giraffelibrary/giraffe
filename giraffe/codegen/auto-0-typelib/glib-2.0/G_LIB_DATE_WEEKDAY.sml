signature G_LIB_DATE_WEEKDAY =
  sig
    datatype enum =
      BAD_WEEKDAY
    | MONDAY
    | TUESDAY
    | WEDNESDAY
    | THURSDAY
    | FRIDAY
    | SATURDAY
    | SUNDAY
    include
      ENUM
        where type t = enum
  end
