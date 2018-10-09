signature GIO_TLS_REHANDSHAKE_MODE =
  sig
    datatype enum =
      NEVER
    | SAFELY
    | UNSAFELY
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
