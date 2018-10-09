signature G_LIB_SLICE_CONFIG =
  sig
    datatype enum =
      ALWAYS_MALLOC
    | BYPASS_MAGAZINES
    | WORKING_SET_MSECS
    | COLOR_INCREMENT
    | CHUNK_SIZES
    | CONTENTION_COUNTER
    include
      ENUM
        where type t = enum
  end
