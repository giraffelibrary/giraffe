signature G_LIB_OPTION_ARG =
  sig
    datatype enum =
      NONE
    | STRING
    | INT
    | CALLBACK
    | FILENAME
    | STRING_ARRAY
    | FILENAME_ARRAY
    | DOUBLE
    | INT_64
    include
      ENUM
        where type t = enum
  end
