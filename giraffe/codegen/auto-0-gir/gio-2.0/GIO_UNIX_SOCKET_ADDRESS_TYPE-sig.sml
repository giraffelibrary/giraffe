signature GIO_UNIX_SOCKET_ADDRESS_TYPE =
  sig
    datatype enum =
      INVALID
    | ANONYMOUS
    | PATH
    | ABSTRACT
    | ABSTRACT_PADDED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end