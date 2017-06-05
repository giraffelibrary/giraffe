signature GIO_TLS_DATABASE_LOOKUP_FLAGS =
  sig
    datatype enum =
      NONE
    | KEYPAIR
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
