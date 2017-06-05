signature G_LIB_CHECKSUM_TYPE =
  sig
    datatype enum =
      MD_5
    | SHA_1
    | SHA_256
    include
      ENUM
        where type t = enum
  end
