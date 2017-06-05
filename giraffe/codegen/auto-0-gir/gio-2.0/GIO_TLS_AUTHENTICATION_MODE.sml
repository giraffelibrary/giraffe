signature GIO_TLS_AUTHENTICATION_MODE =
  sig
    datatype enum =
      NONE
    | REQUESTED
    | REQUIRED
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
