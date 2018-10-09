signature G_LIB_SEEK_TYPE =
  sig
    datatype enum =
      CUR
    | SET
    | END
    include
      ENUM
        where type t = enum
  end
