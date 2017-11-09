signature GIO_TLS_DATABASE_VERIFY_FLAGS =
  sig
    datatype enum =
      NONE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
