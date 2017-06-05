signature GIO_SOCKET_MSG_FLAGS =
  sig
    datatype enum =
      NONE
    | OOB
    | PEEK
    | DONTROUTE
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
