signature GIO_SOCKET_TYPE =
  sig
    datatype enum =
      INVALID
    | STREAM
    | DATAGRAM
    | SEQPACKET
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
