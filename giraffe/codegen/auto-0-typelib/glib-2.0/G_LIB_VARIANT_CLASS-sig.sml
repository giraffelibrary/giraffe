signature G_LIB_VARIANT_CLASS =
  sig
    datatype enum =
      BOOLEAN
    | BYTE
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | HANDLE
    | DOUBLE
    | STRING
    | OBJECT_PATH
    | SIGNATURE
    | VARIANT
    | MAYBE
    | ARRAY
    | TUPLE
    | DICT_ENTRY
    include
      ENUM
        where type t = enum
  end
