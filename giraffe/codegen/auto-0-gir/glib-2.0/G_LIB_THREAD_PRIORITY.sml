signature G_LIB_THREAD_PRIORITY =
  sig
    datatype enum =
      LOW
    | NORMAL
    | HIGH
    | URGENT
    include
      ENUM
        where type t = enum
  end
