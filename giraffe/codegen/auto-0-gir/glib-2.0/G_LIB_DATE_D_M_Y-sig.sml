signature G_LIB_DATE_D_M_Y =
  sig
    datatype enum =
      DAY
    | MONTH
    | YEAR
    include
      ENUM
        where type t = enum
  end
