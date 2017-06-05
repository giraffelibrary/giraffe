signature GIO_PASSWORD_SAVE =
  sig
    datatype enum =
      NEVER
    | FOR_SESSION
    | PERMANENTLY
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
