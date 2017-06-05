structure GLibChecksumType :> G_LIB_CHECKSUM_TYPE =
  struct
    datatype enum =
      MD_5
    | SHA_1
    | SHA_256
    structure Enum =
      Enum(
        type enum = enum
        val null = MD_5
        val toInt =
          fn
            MD_5 => 0
          | SHA_1 => 1
          | SHA_256 => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => MD_5
          | 1 => SHA_1
          | 2 => SHA_256
          | n => raise Value n
      )
    open Enum
  end
