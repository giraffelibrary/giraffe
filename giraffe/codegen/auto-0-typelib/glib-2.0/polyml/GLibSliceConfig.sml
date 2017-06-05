structure GLibSliceConfig :> G_LIB_SLICE_CONFIG =
  struct
    datatype enum =
      ALWAYS_MALLOC
    | BYPASS_MAGAZINES
    | WORKING_SET_MSECS
    | COLOR_INCREMENT
    | CHUNK_SIZES
    | CONTENTION_COUNTER
    structure Enum =
      Enum(
        type enum = enum
        val null = ALWAYS_MALLOC
        val toInt =
          fn
            ALWAYS_MALLOC => 1
          | BYPASS_MAGAZINES => 2
          | WORKING_SET_MSECS => 3
          | COLOR_INCREMENT => 4
          | CHUNK_SIZES => 5
          | CONTENTION_COUNTER => 6
        exception Value of GInt32.t
        val fromInt =
          fn
            1 => ALWAYS_MALLOC
          | 2 => BYPASS_MAGAZINES
          | 3 => WORKING_SET_MSECS
          | 4 => COLOR_INCREMENT
          | 5 => CHUNK_SIZES
          | 6 => CONTENTION_COUNTER
          | n => raise Value n
      )
    open Enum
  end
