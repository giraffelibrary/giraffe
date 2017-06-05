signature G_LIB_DATE_MONTH =
  sig
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
    include
      ENUM
        where type t = enum
  end
