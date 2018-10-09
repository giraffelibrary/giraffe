signature G_LIB_TIME_TYPE =
  sig
    datatype enum =
      STANDARD
    | DAYLIGHT
    | UNIVERSAL
    include
      ENUM
        where type t = enum
  end
