signature GIO_FILE_ATTRIBUTE_TYPE =
  sig
    datatype enum =
      INVALID
    | STRING
    | BYTE_STRING
    | BOOLEAN
    | UINT_32
    | INT_32
    | UINT_64
    | INT_64
    | OBJECT
    | STRINGV
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
