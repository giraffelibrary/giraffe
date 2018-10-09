signature GIO_SOCKET_LISTENER_EVENT =
  sig
    datatype enum =
      BINDING
    | BOUND
    | LISTENING
    | LISTENED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
