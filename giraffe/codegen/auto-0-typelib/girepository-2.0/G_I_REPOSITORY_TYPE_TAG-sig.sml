signature G_I_REPOSITORY_TYPE_TAG =
  sig
    datatype enum =
      VOID
    | BOOLEAN
    | INT_8
    | UINT_8
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF_8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    include
      ENUM
        where type t = enum
  end
