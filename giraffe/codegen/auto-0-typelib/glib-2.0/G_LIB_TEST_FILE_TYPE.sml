signature G_LIB_TEST_FILE_TYPE =
  sig
    datatype enum =
      DIST
    | BUILT
    include
      ENUM
        where type t = enum
  end
